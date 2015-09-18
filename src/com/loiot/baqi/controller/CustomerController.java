package com.loiot.baqi.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.CustomerService;
import com.loiot.baqi.service.ProductService;
import com.loiot.baqi.service.ProjectService;
import com.loiot.commons.utils.EncryptUtil;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.CustomerAccount;
import com.timeloit.pojo.CustomerRole;
import com.timeloit.pojo.Product;
import com.timeloit.pojo.Project;
import com.timeloit.pojo.ProjectRest;

/**
 * 客户用户处理器。
 * 
 * @author wangzx
 * 
 */
@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

	public static final AjaxResponse ACCOUNT_NAME_EXIST = new AjaxResponse(
			-100, "管理客户登录名称已存在");
	public static final AjaxResponse CUSTOMER_NAME_EXIST = new AjaxResponse(
			-101, "客户名称已存在");

	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 后台用户业务逻辑
	 */
	@Resource
	private CustomerService customerService;
	/**
	 * 产品业务逻辑
	 */
	@Resource
	private ProductService productService;
	/**
	 * 项目业务逻辑
	 */
	@Resource
	private ProjectService projectService;
	
	
	/**
	 * 跳转客户用户列表页
	 * 
	 * 
	 */
	@RequestMapping(value = "/list")
	public String list(
			@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
			@RequestParam(value = "customerName", defaultValue = "") String name,
			ModelMap model) {

		Pager<Customer> pager = this.customerService.getCustomerListPage(name,
				pageIndex);
		model.put("pager", pager);
		model.put("customerName", name);
		model.put("menuClass", "customerManage");
		return "/customer/list";
	}

	/**
	 * 跳转到添加客户页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toAdd")
	public String toAddCustomer(ModelMap model) {
		model.put("menuClass", "customerManage");
		List<Project> projects = projectService.getAllList();
		List<Product> sceneProducts = productService
				.getProductList(Const.PRODUCT_SCENE);
		List<Product> nodeProducts = productService
				.getProductList(Const.PRODUCT_NODE);
		model.put("sceneProducts", sceneProducts);
		model.put("nodeProducts", nodeProducts);
		model.put("projects", projects);
		//默认为普通项目的项目角色
		List<CustomerRole> projectRoleList = projectService.getProjectRoleByCode(Const.COMMON_PROJECT);
		model.put("projectRoleList", projectRoleList);
		return "/customer/add";
	}

	/**
	 * 添加客户
	 * 
	 * @param account
	 *            账户
	 * @return ajax响应
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public Object add(Customer customer, CustomerAccount account,
			ProjectRest projectRest,String projectCode) {
		// 检查帐号是否有效
		if (this.customerService.checkAccountExist(account.getCaName())) {
			return this.ACCOUNT_NAME_EXIST;
		}
		// 检测客户名称是否有效
		if (this.customerService.checkCustomNameExist(customer
				.getCustomerName())) {
			return this.CUSTOMER_NAME_EXIST;
		}
		try{
			this.customerService.addCustomer(customer,account,projectRest,projectCode);
		}catch(Exception e){
			log.error(e.getMessage());
			return new AjaxResponse(-1,e.getMessage());
		}
		
//		 添加成功
		return AjaxResponse.OK;
	}

	/**
	 * 跳转到编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toEdit")
	public String toEditCustomer(
			@RequestParam(value = "customerId", required = true) Long customerId,
			ModelMap model) {
		Customer c = this.customerService.getCustomInfo(customerId);
		model.put("c", c);
		model.put("menuClass", "customerManage");

		List<Project> projects = projectService.getAllList();
		List<Product> sceneProducts = productService
				.getProductList(Const.PRODUCT_SCENE);
		List<Product> nodeProducts = productService
				.getProductList(Const.PRODUCT_NODE);
		List<CustomerRole> projectRoleList = projectService.getProjectRole(c
				.getProject().getProjectId());
		model.put("projectRoleList", projectRoleList);
		model.put("sceneProducts", sceneProducts);
		model.put("nodeProducts", nodeProducts);
		model.put("projects", projects);
		return "/customer/edit";
	}

	/**
	 * 更新客户
	 * 
	 * @param account
	 *            账户
	 * @return ajax响应
	 */
	@RequestMapping(value = "/edit")
	@ResponseBody
	public Object edit(Customer c, CustomerAccount account,
			ProjectRest projectRest,String projectCode) {
		// 检测客户名称是否有效
		if (this.customerService.checkCustomNameExist(c)) {
			return this.CUSTOMER_NAME_EXIST;
		}
		this.customerService.updateCustomerInfo(c);
//修改customer_account表信息
		if(account.getCaPassword()!=null && account.getCaPassword().length()>0){
			account.setPasswordTxt(account.getCaPassword());
			account.setCaPassword(EncryptUtil.md5Hex(account.getCaPassword()));
		}
		 customerService.updateAccount(account);
//		 当项目为餐饮时，修改project_rest表
		 if(projectCode.equals(Const.REST_PROJECT)){
			 projectService.updateProjectRest(projectRest);
		 }else{//删除project_rest表中的信息
			 projectService.delProjectRest(c.getCustomerId());
		 }
		
		return AjaxResponse.OK;
	}

	/**
	 * 跳转到查看页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/detail")
	public String toViewAccount(
			@RequestParam(value = "customerId", required = true) Long customerId,
			ModelMap model) {
		Customer c = this.customerService.getCustomInfo(customerId);
		model.put("c", c);
		model.put("menuClass", "customerManage");

		if (c.getProjectRest() != null) {
			Product sceneProduct = productService
					.getProductInfo_Class_TagById(c.getProjectRest()
							.getSceneProductId());
			Product nodeProduct = productService.getProductInfo_Class_TagById(c
					.getProjectRest().getNodeProductId());
			model.put("sceneProduct", sceneProduct);
			model.put("nodeProduct", nodeProduct);

			CustomerRole customerRole = customerService.getCustomerRole(c
					.getCustomerAccount().getCustomerRoleId());
			model.put("customerRole", customerRole);
		}

		return "/customer/detail";
	}

	/**
	 * 删除客户
	 * 
	 * @param accountId
	 *            后台账号ID
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public AjaxResponse delete(
			HttpServletRequest request,
			@RequestParam(value = "customerIds", required = true) String customerIds) {
		String[] customerIdArr = customerIds.split(",");
		this.customerService.deleteCustomerInfo(customerIdArr);
		return AjaxResponse.OK;
	}
}
