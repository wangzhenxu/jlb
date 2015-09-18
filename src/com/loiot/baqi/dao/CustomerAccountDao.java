package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.CustomerAccount;

/**
 * 客户账号数据访问层。
 * 
 * @author yanjg
 */
@Repository("customerAccountDao")
public class CustomerAccountDao extends SqlSessionDaoSupport {

  public void deleteCustomerAccount(String[] customerIdArr) {
	// TODO Auto-generated method stub
	this.getSqlSession().delete("CustomerAccount.deleteCustomerAccount",customerIdArr);
}

public void updateAccount(CustomerAccount account) {
	// TODO Auto-generated method stub
	this.getSqlSession().update("CustomerAccount.updateAccount", account);
}

public List<CustomerAccount> getSimpleCustomerAccount(Map<String,Object> param) {
    return this.getSqlSession().selectList("CustomerAccount.getCustomerAccount", param);
}
}
