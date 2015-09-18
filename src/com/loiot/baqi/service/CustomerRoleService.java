package com.loiot.baqi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.CustomerAccountDao;
import com.loiot.baqi.dao.CustomerRoleDao;
import com.loiot.baqi.dao.CustomerRoleDistributionDao;
import com.timeloit.pojo.CustomerAccount;
import com.timeloit.pojo.CustomerPermission;
import com.timeloit.pojo.CustomerRole;
import com.timeloit.pojo.CustomerRoleDistribution;

/**
 * 角色业务逻辑类
 * 
 * @author zhengrj
 * 
 */
@Service("customerRoleService")
public class CustomerRoleService {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 角色数据访问接口
     */
    @Resource
    private CustomerRoleDao customerRoleDao;
    @Resource
    private CustomerRoleDistributionDao customerRoleDistributionDao;
    
    @Resource
    private CustomerAccountDao customerAccountDao;

    /**
     * 添加角色
     * 
     * @param role 角色
     */
    public void addRole(CustomerRole role) {

        // 打印role信息
        log.debug("role [{}]", role);

        // 添加角色
        customerRoleDao.addRole(role);

        // 增加角色权限
        for (CustomerPermission permission : role.getPermissionList()) {
            customerRoleDao.addPermission(role.getRoleId(), permission.getPermissionId());
        }
    }

    /**
     * 修改角色
     * 
     * @param role 角色
     */
    public void updateRole(CustomerRole role) {

        // 打印role信息
        log.debug("role [{}]", role);

        // 删除旧权限
        customerRoleDao.deletePermission(role.getRoleId());
        
        //跟新项目类型
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("roleId",role.getRoleId() );
        params.put("projectId",role.getProjectId());
        params.put("roleName",role.getRoleName());
        customerRoleDao.updateParentRole(params);

        // 增加新权限
        for (CustomerPermission permission : role.getPermissionList()) {
            customerRoleDao.addPermission(role.getRoleId(), permission.getPermissionId());
        }
    }

    /**
     * 查询角色列表分页
     * 
     * @param roleName 角色名
     * @param pageIndex 页索引
     * @return
     */
    public Pager<CustomerRole> getRoleListPage(Long projectId, int pageIndex) {

        // 查询角色列表总条数
        int totalResults = customerRoleDao.getRoleListCount(projectId);

        // 构造一个分页器
        Pager<CustomerRole> pager = new Pager<CustomerRole>(totalResults, pageIndex);

        // 查询角色列表
        List<CustomerRole> roleList = customerRoleDao.getRoleList(projectId, pager.getSkipResults(), pager.getMaxResults());
        pager.setData(roleList);

        return pager;
    }

    /**
     * 获得所有角色
     * 
     * @return 角色列表
     */
    public List<CustomerRole> getRoleListAll() {
        return customerRoleDao.getRoleList(null, 0, Integer.MAX_VALUE);
    }

    /**
     * 获得角色
     * 
     * @param roleId 角色ID
     * @return 返回与ID匹配的角色
     */
    public CustomerRole getRole(Long roleId) {
        return customerRoleDao.getRoleById(roleId);
    }

    /**
     * 删除角色
     * 
     * @param roleId
     */
    public void deleteRole(Long roleId) {

        // 删除权限
        customerRoleDao.deletePermission(roleId);
        
        CustomerRoleDistribution b = new CustomerRoleDistribution();
        b.setManageRoleId(roleId);
        customerRoleDistributionDao.deleteCustomerRoleDistribution(b);

        // 删除角色
        customerRoleDao.deleteRole(roleId);
    }
    
    /**
     * 查询角色by项目
     * @param projectId
     * @return
     */
    public List<CustomerRole> getRoleListByPro(Long projectId,Long roleId) {
     
      HashMap<String,Object> map =new HashMap<String,Object>();
      map.put("roleId", roleId);
      CustomerRole nroleId = this.customerRoleDao.getSimpleRole(map);
      List roleIdList  = new ArrayList();
      if(nroleId!=null && nroleId.getParentRoleId()!=null) {
          String rr [] = nroleId.getParentRoleId().split(",");
          for(String mroleId : rr){
              if(mroleId.length()>0) {
                  roleIdList.add(mroleId);
              }
          }
      }
      //=
       return customerRoleDao.getRoleListByPro(projectId,roleId,roleIdList);
    }
    
    /**
     * 根据帐号查询角色是否存在
     * @param projectId
     * @return
     */
    public boolean customerAccountIsExist(Long roleId) {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("roleId", roleId);
        List<CustomerAccount> list = customerAccountDao.getSimpleCustomerAccount(param);
        if(list!=null && list.size()>0) {
            return true;
        } 
        return false;
      
    }
    
    
    
    

}
