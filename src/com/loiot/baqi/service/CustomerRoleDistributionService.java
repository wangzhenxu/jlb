package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.*;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.*;
import com.loiot.baqi.service.*;
import com.timeloit.pojo.CustomerRole;
import com.timeloit.pojo.CustomerRoleDistribution;


/**
 * 可分配角色 逻辑类。
 * 
 * @author  wangzx 
 * @creation 2013-11-07
 */
@Service("customerRoleDistributionService")
@Transactional
public class CustomerRoleDistributionService{
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private CustomerRoleDistributionDao customerRoleDistributionDao;
    
    @Resource
    private CustomerRoleDao customerRoleDao;
	
	
	 /**
     * 查询 可分配角色列表分页
     * 
     * @param name 可分配角色名称
     * @param pageIndex 页索引
     * @return
     */
    public Pager<CustomerRoleDistribution> queryCustomerRoleDistributionListPage(String name, int pageIndex) {

        // 查询可分配角色列表总条数
        int totalResults = customerRoleDistributionDao.getCustomerRoleDistributionListCount(name);

        // 构造一个分页器
        Pager<CustomerRoleDistribution> pager = new Pager<CustomerRoleDistribution>(totalResults, pageIndex);

        // 查询可分配角色列表
        List<CustomerRoleDistribution> customerRoleDistributionList = customerRoleDistributionDao.queryCustomerRoleDistributionList(name, pager.getSkipResults(),
                pager.getMaxResults());
        pager.setData(customerRoleDistributionList);
        return pager;
    }
	
	 /**
     * 添加 可分配角色
     * 
     * @param p 参数对象
     */
    public void addCustomerRoleDistribution(Long manageRoleId,String addRoleIdList[]) {
       
     /*   HashMap<String,Object> params0 = new HashMap<String,Object>();
        params0.put("manageRoleId", manageRoleId);
        List<CustomerRoleDistribution> listAll = this.customerRoleDistributionDao.queryCustomerRoleDistributionList(params0);
        if(listAll!=null && listAll.size()==0) {
            listAll=null;
        }
        if(addRoleIdList==null && listAll==null){
            return;
        } 
            List delRoleIdList = new ArrayList();
            List addRoleIdList2 = new ArrayList();
            //全部取消所有角色
            if(addRoleIdList==null) 
            {
                for( CustomerRoleDistribution p : listAll) 
                {
                    delRoleIdList.add(p.getHaveRoleId());
                }
                this.delParentId(delRoleIdList, manageRoleId);
            }
            //还没有分配过角色   并且 有可添加的角色
            if(listAll==null)
            {
                for(String roleId: addRoleIdList)
                {
                    addRoleIdList2.add(Long.valueOf(roleId));
                }
                this.addParentId(addRoleIdList2, manageRoleId);
            }  */
            
         
            /*for( String roleId:addRoleIdList) {
                for(CustomerRoleDistribution p : listAll) {
                    if(Long.parseLong(String.valueOf(p.getHaveRoleId()))==Long.parseLong(roleId)){
                        addRoleIdList2.add(Long.valueOf(roleId));
                    }
                }
            }
            
            
            for( CustomerRoleDistribution p : listAll) {
                for(String roleId:addRoleIdList) {
                    if(Long.parseLong(String.valueOf(p.getHaveRoleId()))==Long.parseLong(roleId)){
                        delRoleIdList.add(Long.valueOf(roleId));
                    }
                }
            }*/
        
        
        //删除原来的角色权限
        CustomerRoleDistribution p = new CustomerRoleDistribution();
        p.setManageRoleId(manageRoleId);
        
        this.customerRoleDistributionDao.deleteCustomerRoleDistribution(p);
        
        if(addRoleIdList!=null) 
        {
            for(int i=0;i<addRoleIdList.length;i++) 
            {
                String haveRoleId = addRoleIdList[i];
                p=new CustomerRoleDistribution();
                p.setHaveRoleId(Long.parseLong(haveRoleId));
                p.setManageRoleId(manageRoleId);
                customerRoleDistributionDao.addCustomerRoleDistribution(p);
            }
        }
       
    }
    
    /**
     * 修改 可分配角色
     * 
     * @param p 参数对象
     */
    public void updateCustomerRoleDistribution(CustomerRoleDistribution p) {
        customerRoleDistributionDao.updateCustomerRoleDistribution(p);
    }
    
    /**
     * 删除  可分配角色
     * 
     * @param id 主键
     */
    public void deleteCustomerRoleDistribution(java.lang.Long id) {
        customerRoleDistributionDao.deleteCustomerRoleDistribution(id);
    }
    
    /**
     * 删除  可分配角色
     * 
     * @param id 主键
     */
    public void deleteCustomerRoleDistribution(CustomerRoleDistribution p) {
        customerRoleDistributionDao.deleteCustomerRoleDistribution(p);
    }
    
    /**
     * 获得  可分配角色
     * 
     * @param id 可分配角色Id
     * 
     * @return 返回与ID匹配的可分配角色
     */
    public CustomerRoleDistribution getCustomerRoleDistributionById(java.lang.Long id) {
        return  customerRoleDistributionDao.getCustomerRoleDistributionById(id);
    }
    
    /**
     * 获得  可分配角色
     * 
     * @param name 可分配角色名称
     * 
     * @return 返回与NAME匹配的可分配角色
     */
    public CustomerRoleDistribution getCustomerRoleDistributionByName(String name) {
        return  customerRoleDistributionDao.getCustomerRoleDistributionByName(name);
    }
    
    /**
     * 查询 可分配角色列表
     * @return 可分配角色列表
     */
    public List<CustomerRoleDistribution> queryCustomerRoleDistributionList() {
        return  customerRoleDistributionDao.queryCustomerRoleDistributionList(new HashMap<String,Object>());
    }
    
    /**
     * 查询 可分配角色列表
     * 
     * @return 可分配角色列表
     */
    public List<CustomerRoleDistribution> queryCustomerRoleDistributionList(CustomerRoleDistribution p) {
        return  customerRoleDistributionDao.queryCustomerRoleDistributionList(p);
    }
    
    public void delParentId(List delRoleIdList,Long manageRoleId){
        for(int i=0;i<delRoleIdList.size();i++) {
            long haveRoleId =(Long)delRoleIdList.get(i);
            
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("manageRoleId", manageRoleId);
            params.put("haveRoleId", haveRoleId);
            CustomerRoleDistribution crd = this.customerRoleDistributionDao.queryCustomerRoleDistributionList(params);
             if(crd!=null) 
             {
                 HashMap<String,Object> map =new HashMap<String,Object>();
                 map.put("roleId", manageRoleId);
                 CustomerRole nroleId = this.customerRoleDao.getSimpleRole(map);
                 if(nroleId!=null && nroleId.getParentRoleId()!=null && nroleId.getParentRoleId().length()>0) {
                     Map<String, Object> params2 = new HashMap<String, Object>();
                     if(nroleId!=null && nroleId.getParentRoleId()!=null && nroleId.getParentRoleId().length()>0) {
                         params2.put("noParentRoleId", nroleId.getParentRoleId());
                         customerRoleDao.updateParentRole(params2);
                     } 
                 }
             }
           }
        
    }
    
    
    
    
    
    public void addParentId(List addRoleIdList2,Long manageRoleId){
        for(int i=0;i<addRoleIdList2.size();i++) 
        {
            long haveRoleId =(Long)addRoleIdList2.get(i);
            HashMap<String,Object> map =new HashMap<String,Object>();
            map.put("roleId", manageRoleId);
            CustomerRole nroleId = this.customerRoleDao.getSimpleRole(map);
            Map<String, Object> params2 = new HashMap<String, Object>();
            params2.put("roleId", haveRoleId);
            if(nroleId!=null && nroleId.getParentRoleId()!=null && nroleId.getParentRoleId().length()>0) {
                params2.put("parentRoleId", nroleId.getParentRoleId()+","+String.valueOf(manageRoleId));
            } else {
                params2.put("parentRoleId", String.valueOf(manageRoleId));
            }
            customerRoleDao.updateParentRole(params2);
        }
        
    }
   
	
}
