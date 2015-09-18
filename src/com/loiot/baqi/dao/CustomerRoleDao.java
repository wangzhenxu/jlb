package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.CustomerRole;


/**
 * 账号数据访问层。
 * 
 * @author zhengrj
 */
@Repository("customerRoleDao")
public class CustomerRoleDao extends SqlSessionDaoSupport {

    /**
     * 查询角色列表条数
     * 
     * @param roleName 角色名
     * @return 角色列表
     */
    public int getRoleListCount(Long projectId) {

        Map<String, Object> params = new HashMap<String, Object>();
        if (projectId!=null) {
            params.put("projectId", projectId);
        }

        return (Integer) getSqlSession().selectOne("CustomerRole.getRoleListCount", params);
    }

    /**
     * 查询角色列表
     * 
     * @param roleName 角色名
     * @param skipResults 跳过的记录数
     * @param maxResults 最大的记录数
     * @return 角色列表
     */
    public List<CustomerRole> getRoleList(Long projectId, int skipResults, int maxResults) {

        Map<String, Object> params = new HashMap<String, Object>();
        if (projectId!=null) {
            params.put("projectId", projectId);
        }

        return getSqlSession().selectList("CustomerRole.getRoleList", params, new RowBounds(skipResults, maxResults));
    }
    
    /**
     * 查询角色by项目
     * @param projectId
     * @return
     */
    public List<CustomerRole> getRoleListByPro(Long projectId,Long roleId,List roleIds) {
        Map<String, Object> params = new HashMap<String, Object>();
        if(projectId!=null) {
            params.put("projectId", projectId);
        }
        if(roleId!=null) {
            params.put("nroleId", roleId);
        }
        if(roleIds!=null && roleIds.size()>0 ) {
            params.put("roleIds", roleIds);
        }

        return getSqlSession().selectList("CustomerRole.getRoleListByPro", params);
    }

    /**
     * 添加权限
     * 
     * @param roleId 角色ID
     * @param permissionId 权限ID
     */
    public void addPermission(Long roleId, Long permissionId) {

        Map<String, Long> params = new HashMap<String, Long>();
        params.put("roleId", roleId);
        params.put("permissionId", permissionId);
        
        getSqlSession().insert("CustomerRole.addPermission", params);
    }

    /**
     * 添加角色
     * 
     * @param role 角色
     * @return 返回新增角色的ID
     */
    public CustomerRole addRole(CustomerRole role) {
        getSqlSession().insert("CustomerRole.addRole", role);
        return role;
    }

    /**
     * 删除角色
     * 
     * @param roleId 角色ID
     */
    public void deleteRole(Long roleId) {
        getSqlSession().delete("CustomerRole.deleteRole", roleId);
    }

    /**
     * 删除权限
     * 
     * @param roleId 角色ID
     */
    public void deletePermission(Long roleId) {
        getSqlSession().delete("CustomerRole.deletePermission", roleId);
    }

    /**
     * 获得角色
     * 
     * @param roleId 角色ID
     * @return 返回与ID匹配的角色
     */
    public CustomerRole getRoleById(Long roleId) {
        return (CustomerRole) getSqlSession().selectOne("CustomerRole.getRoleById", roleId);
    }
    
    /**
     * 获得角色
     * 
     * @param roleId 角色ID
     * @return 返回与ID匹配的角色
     */
    public CustomerRole getSimpleRole(HashMap map) {
        return (CustomerRole) getSqlSession().selectOne("CustomerRole.getRoleListByPro", map);
    }
    
    public CustomerRole getCustomerRole(Long customerRoleId) {
        // TODO Auto-generated method stub
        return (CustomerRole)getSqlSession().selectOne("CustomerRole.getCustomerRole", customerRoleId);
    }
    
    public List<CustomerRole> getCustomerRoleList(long projectId) {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("CustomerRole.getCustomerRoleList",projectId);
    }
    
    public List<CustomerRole> getProjectRoleByCode(String code) {
        // TODO Auto-generated method stub
        return (List<CustomerRole>)getSqlSession().selectList("CustomerRole.getProjectRoleByCode",code);
    }
    
    public void updateParentRole(Map<String,Object> param) {
         getSqlSession().update("CustomerRole.updateParentRole",param);
    }
    
    
    
   
}
