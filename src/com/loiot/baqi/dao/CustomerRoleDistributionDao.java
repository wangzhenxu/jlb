package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.CustomerRoleDistribution;


/**
 * 可分配角色 访问层。
 * 
 * @author  wangzx 
 * @creation 2013-11-07
 */
@Repository("customerRoleDistributionDao")
public class CustomerRoleDistributionDao extends SqlSessionDaoSupport{
    
    /**
     * 添加 可分配角色
     * 
     * @param p 参数对象
     */
    public void addCustomerRoleDistribution(CustomerRoleDistribution p) {
        this.getSqlSession().insert("CustomerRoleDistribution.addCustomerRoleDistribution", p);
    }
    
    /**
     * 修改 可分配角色
     * 
     * @param p 参数对象
     */
    public void updateCustomerRoleDistribution(CustomerRoleDistribution p) {
        this.getSqlSession().update("CustomerRoleDistribution.updateCustomerRoleDistribution", p);
    }
    
    /**
     * 删除  可分配角色
     * 
     * @param id 主键
     */
    public void deleteCustomerRoleDistribution(java.lang.Long id) {
        getSqlSession().delete("CustomerRoleDistribution.deleteCustomerRoleDistribution", id);
    }
    
    /**
     * 删除  可分配角色
     * 
     * @param id 主键
     */
    public void deleteCustomerRoleDistribution(CustomerRoleDistribution p) {
        getSqlSession().delete("CustomerRoleDistribution.deleteCustomerRoleDistribution", p);
    }
    
    /**
     * 获得  可分配角色
     * 
     * @param id 可分配角色Id
     * 
     * @return 返回与ID匹配的可分配角色
     */
    public CustomerRoleDistribution getCustomerRoleDistributionById(java.lang.Long id) {
        return (CustomerRoleDistribution) getSqlSession().selectOne("CustomerRoleDistribution.getCustomerRoleDistributionById", id);
    }
    
    /**
     * 获得  可分配角色
     * 
     * @param name 可分配角色名称
     * 
     * @return 返回与NAME匹配的可分配角色
     */
    public CustomerRoleDistribution getCustomerRoleDistributionByName(String name) {
        return null;
        //return (CustomerRoleDistribution) getSqlSession().selectOne("CustomerRoleDistribution.getCustomerRoleDistributionByName", name);
    }
    
    
    
    /**
     * 查询  可分配角色列表条数
     * 
     * @param name 可分配角色名称
     * @return 可分配角色列表条数
     */
    
    public int getCustomerRoleDistributionListCount(String name) {
        
        Map<String, Object> params = new HashMap<String, Object>();
        if (!StringUtils.isEmpty(name)) {
            params.put("name", name);
        }
        return (Integer) getSqlSession().selectOne("CustomerRoleDistribution.getCustomerRoleDistributionListCount", params);
    }

    /**
     * 查询 可分配角色列表
     * 
     * @param name 可分配角色名称
     * @param skipResults 跳过的记录数
     * @param maxResults 最大的记录数
     * @return 可分配角色列表
     */
    public List<CustomerRoleDistribution> queryCustomerRoleDistributionList(String name, int skipResults, int maxResults) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("skipResults", skipResults);
        params.put("maxResults", maxResults);
        if (!StringUtils.isEmpty(name)) {
            params.put("name", name);
        }

        return getSqlSession().selectList("CustomerRoleDistribution.queryCustomerRoleDistributionList", params);
    }
    
    
   /**
    * 查询可分配角色
    * @param params
    * @return
    */
    public CustomerRoleDistribution queryCustomerRoleDistributionList(Map<String,Object> params) {
        return (CustomerRoleDistribution) getSqlSession().selectOne("CustomerRoleDistribution.queryCustomerRoleDistributionList", params);
    }
    
    /**
     * 查询 可分配角色列表
     * 
     * @return 可分配角色列表
     */
    public List<CustomerRoleDistribution> queryCustomerRoleDistributionList(HashMap<String,Object> params) {
        return getSqlSession().selectList("CustomerRoleDistribution.queryCustomerRoleDistributionList",params);
    }
    
    /**
     * 查询 可分配角色列表
     * 
     * @return 可分配角色列表
     */
    public List<CustomerRoleDistribution> queryCustomerRoleDistributionList(CustomerRoleDistribution p) {
        return getSqlSession().selectList("CustomerRoleDistribution.queryCustomerRoleDistributionList",p);
    }
    
    
    
    

}
