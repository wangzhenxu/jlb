package com.loiot.baqi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.CustomerRoleDistributionService;
import com.loiot.baqi.service.CustomerRoleService;
import com.loiot.baqi.service.ProjectService;
import com.timeloit.pojo.CustomerRole;
import com.timeloit.pojo.CustomerRoleDistribution;
import com.timeloit.pojo.Project;

/**
 * 角色处理器。
 * 
 * @author zhengrj
 * 
 */
@Controller
@RequestMapping(value = "/customer/account/role")
public class CustomerRoleController {

    public static final AjaxResponse ROLE_NAME_IS_EMPTY = new AjaxResponse(-100201, "请您输入角色名称");
    public static final AjaxResponse ROLE_PERMISSION_LIST_IS_EMPTY = new AjaxResponse(-100202, "请您选择角色权限");
    
    public static final AjaxResponse COSTOMER_ACCOUNT_EXIST = new AjaxResponse(-100203, "该角色已经分配了客户帐号，请先将客户帐号删除");


    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 角色业务逻辑
     */
    @Resource
    private CustomerRoleService customerRoleService;
    
    /**
     * 可分配角色 逻辑
     */
    @Resource
    private CustomerRoleDistributionService customerRoleDistributionService;
    
    /**
     * 项目业务逻辑
     */
    @Resource
    private ProjectService projectService;
    

    /**
     * 跳转角色列表页
     * 
     * @return 登陆模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi",required=false, defaultValue = "0") int pageIndex,
            @RequestParam(value = "projectId",required=false) Long projectId, ModelMap model) {

        // 查询角色
        Pager<CustomerRole> pager = customerRoleService.getRoleListPage(projectId, pageIndex);
        List<Project> plist = projectService.getProjectAllList();
        model.put("plist", plist);
        
        model.put("pager", pager);
        model.put("projectId", projectId);
        model.put("menuClass", "customerAccountRole");
        return "/customer/role/role_list";
    }

    /**
     * 删除角色
     * 
     * @param roleId 角色ID
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam(value = "roleId", required = true) Long roleId,HttpServletResponse response) {
        if(this.customerRoleService.customerAccountIsExist(roleId)) {
            return this.COSTOMER_ACCOUNT_EXIST;
        }

        // 删除角色和权限
        customerRoleService.deleteRole(roleId);
        return AjaxResponse.OK;
        //return "redirect:/customer/account/role/list.action";
    }

    @RequestMapping(value = "/view")
    public String viewRole(@RequestParam(value = "roleId", required = true) Long roleId) {
        return null;
    }

    /**
     * 保存角色,当角色ID存在时，进行更新。当角色ID不存在时，进行新增。
     * 
     * @param role 角色
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public Object save(CustomerRole role) {

        // 当角色名称为空时
        if (StringUtils.isEmpty(role.getRoleName())) {
            log.debug("role name is empty.");
            return ROLE_NAME_IS_EMPTY;
        }

        // 当权限列表为空时
        if (CollectionUtils.isEmpty(role.getPermissionList())) {
            log.debug("role permission list is empty.");
            return ROLE_PERMISSION_LIST_IS_EMPTY;
        }

        if (role.getRoleId() != null) {
            // 修改角色
            customerRoleService.updateRole(role);
        } else {
            // 插入数据
            customerRoleService.addRole(role);
        }
        
        return AjaxResponse.OK;
    }

    /**
     * 获得角色
     * 
     * @param roleId 角色ID
     * @return
     */
    @RequestMapping(value = "/get")
    @ResponseBody
    public Object get(@RequestParam(value = "roleId", required = true) Long roleId) {

        // 当角色ID为空时
        if (roleId == null) {
            log.debug("role id is empty.");
            return AjaxResponse.SYSTEM_BUSY;
        }

        // 获得角色
        CustomerRole role = customerRoleService.getRole(roleId);

        if (role != null) {
            return AjaxResponse.OK(role);
        } else {
            return AjaxResponse.SYSTEM_BUSY;
        }
    }
    
    /**
     * 获取 可分配角色
     * @param roleId 角色ID
     * @return
     */
    @RequestMapping(value = "/getRoleDistribution")
    @ResponseBody
    public Object getRoleDistribution(HttpServletRequest request,
            @RequestParam(value = "roleId", required = true) Long roleId,
            @RequestParam(value = "projectId", required = true) Long projectId)throws Exception {
          Map<String,Object> map =new HashMap<String,Object>(); 
          //所有角色列表
          List<CustomerRole> roleList = this.customerRoleService.getRoleListByPro(projectId, roleId);
          
          //当前角色可分配的角色列表
          CustomerRoleDistribution p = new CustomerRoleDistribution();
          p.setManageRoleId(roleId);
          List<CustomerRoleDistribution> distrList = this.customerRoleDistributionService.queryCustomerRoleDistributionList(p);
          
          
          for(CustomerRole r: roleList){
              for(CustomerRoleDistribution d : distrList) {
                  if(r.getRoleId()==d.getHaveRoleId()) {
                      r.setIsChecked("yes");
                  }
              }
          }
          map.put("roleList", roleList);
          map.put("roleId", roleId);
          return map;
    }
    /**
     * 更新 可分配角色
     * @param roleId 角色ID
     * @return
     */
    @RequestMapping(value = "/saveRoleDistribution")
    @ResponseBody
    public Object saveRoleDistribution(HttpServletRequest request,
            @RequestParam(value = "roleId", required = true) Long manageRoleId
            
            )throws Exception {
            String addRoleIdList [] = request.getParameterValues("addRoleIdList");
            try{
                this.customerRoleDistributionService.addCustomerRoleDistribution(manageRoleId, addRoleIdList);
                return AjaxResponse.OK; 
            }catch(Exception e){
                return AjaxResponse.FAILED;
            }
        
    }
    
   
    
}
