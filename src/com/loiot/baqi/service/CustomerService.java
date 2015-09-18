package com.loiot.baqi.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClientException;

import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.CustomerAccountDao;
import com.loiot.baqi.dao.CustomerDao;
import com.loiot.baqi.dao.CustomerRoleDao;
import com.loiot.baqi.dao.ProjectRestDao;
import com.loiot.commons.utils.EncryptUtil;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.CustomerAccount;
import com.timeloit.pojo.CustomerRole;
import com.timeloit.pojo.ProjectRest;

/**
 * 客户业务逻辑类
 * 
 * @author wangzx
 * 
 */
@Service("customerService")
public class CustomerService {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	@Resource
	UserService userService;
	@Resource
	ProjectService projectService;
	@Resource
	SceneService sceneService;
	@Resource
	private CustomerDao customerDao;
	@Resource
	private CustomerAccountDao customerAccountDao;
	@Resource
	private CustomerRoleDao customerRoleDao;
	@Resource
	private ProjectRestDao projectRestDao;

	/**
	 * 获取客户角色列表
	 * 
	 * @param customerName
	 * @param pageIndex
	 * @return
	 */
	public List<CustomerRole> getCustomerRoleList(long projectId) {
		return customerRoleDao.getCustomerRoleList(projectId);
	}

	public Pager<Customer> getCustomerListPage(String customerName,
			int pageIndex) {

		// 查询客户列表总条数
		int totalResults = this.customerDao.getCustomerListCount(customerName);

		// 构造一个分页器
		Pager<Customer> pager = new Pager<Customer>(totalResults, pageIndex);

		// 查询客户列表
		List<Customer> customerList = this.customerDao.queryCustomInfo(
				customerName, pager.getSkipResults(), pager.getMaxResults());
		pager.setData(customerList);

		return pager;
	}

	// 检查改账户名称是否重复
	public boolean checkCustomNameExist(Customer c) {
		// TODO Auto-generated method stub
		return this.customerDao.checkCustomNameExist(c);
	}

	/**
	 * 检测客户帐号是否存在
	 * 
	 * @param name
	 *            客户名称
	 * @return
	 */
	public boolean checkCustomNameExist(String name) {
		return this.customerDao.checkCustomNameExist(name);
	}

	/**
	 * 检测客户帐号是否有效
	 * 
	 * @param name
	 *            帐号名称
	 * @return
	 */
	public boolean checkAccountExist(String name) {
		return this.customerDao.checkAccountExist(name);
	}

	/**
	 * 添加客户信息
	 * 
	 * @param c
	 *            客户信息
	 */
	public void addCustomerInfo(Customer c, CustomerAccount ca) {
		ca.setIsMain(1);
		Customer newC = this.customerDao.addCustomerInfo(c);
		ca.setCustomerId(newC.getCustomerId());
		ca.setPasswordTxt(ca.getCaPassword());
		ca.setCaPassword(EncryptUtil.md5Hex(ca.getCaPassword()));
		
		this.customerDao.addCustomerAccountInfo(ca);
	}

	/**
	 * 更新客户信息
	 * 
	 * @param c
	 *            客户信息
	 */
	public void updateCustomerInfo(Customer c) {
		this.customerDao.updateCustomerInfo(c);
	}

	/**
	 * 获取客户信息
	 * 
	 * @param customerId
	 *            客户编号
	 * @return
	 */
	public Customer getCustomInfo(Long customerId) {
		return this.customerDao.getCustomInfo(customerId);
	}

	/**
	 * 批量删除客户信息
	 * 
	 * @param customerIdArr
	 */
	public void deleteCustomerInfo(String[] customerIdArr) {
		// TODO Auto-generated method stub
		// 删除客户信息
		customerDao.deleteCustomerInfo(customerIdArr);
		// 删除客户账号信息
		customerAccountDao.deleteCustomerAccount(customerIdArr);
		// 删除project_rest信息
		projectRestDao.deleteProjectRest(customerIdArr);

	}

	/**
	 * 根据角色ID来查询角色
	 * 
	 * @param customerRoleId
	 * @return
	 */
	public CustomerRole getCustomerRole(Long customerRoleId) {
		// TODO Auto-generated method stub
		return customerRoleDao.getCustomerRole(customerRoleId);
	}

	/**
	 * 修改customer_account表信息
	 * 
	 * @param account
	 */
	public void updateAccount(CustomerAccount account) {
		// TODO Auto-generated method stub
		customerAccountDao.updateAccount(account);
	}

	/**
	 * 创建账户，及场景
	 * 
	 * @param projectCode
	 * @param projectRest
	 * @param account
	 * @param customer
	 */
	@Transactional
	public void addCustomer(Customer customer, CustomerAccount account,
			ProjectRest projectRest, String projectCode) throws RestClientException, RuntimeException{
		// TODO Auto-generated method stub
		addCustomerInfo(customer, account);

		// 根据客户账号来创建相应的瓦岗账号
		userService.addUser(account, projectRest);

		// 如果不是普通项目，添加项目附加信息
		if (projectCode != null && projectCode.equals("CYXM")) {
			projectRest.setCustomerId(customer.getCustomerId());
			projectService.saveProjectRest(projectRest);
			// 如果是单店的话，创建场景
			String loginName = account.getCaName() + "_" + account.getCaId();
			if (projectRest.getMerchantType().intValue() == 1) {
				sceneService.createScene(account, loginName, projectRest,customer.getCustomerName());
			}

		}
	}

}
