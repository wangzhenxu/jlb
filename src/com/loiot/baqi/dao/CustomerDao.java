package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.Account;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.CustomerAccount;

/**
 * 客户数据访问层。
 * 
 * @author wangzx
 */
@Repository("customerDao")
public class CustomerDao extends SqlSessionDaoSupport {

	/**
	 * 获取客户信息
	 * 
	 * @param customerId
	 *            客户编号
	 * @return
	 */
	public Customer getCustomInfo(Long customerId) {
		HashMap map = new HashMap();
		map.put("customerId", customerId);
		return (Customer) this.getSqlSession().selectOne(
				"Customer.queryCustomInfo", map);
	}

	/**
	 * 查询客户信息
	 * 
	 * @param c
	 *            客户信息
	 */
	public List<Customer> queryCustomInfo(String name, int skipResults,
			int maxResults) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("skipResults", skipResults);
		params.put("maxResults", maxResults);
		if (!StringUtils.isEmpty(name)) {
			params.put("name", name);
		}
		return this.getSqlSession().selectList("Customer.queryCustomInfo",
				params);
	}

	/**
	 * 客户名称
	 * 
	 * @param name
	 * @return
	 */
	public int getCustomerListCount(String name) {

		Map<String, Object> params = new HashMap<String, Object>();
		if (!StringUtils.isEmpty(name)) {
			params.put("name", name);
		}

		return (Integer) getSqlSession().selectOne(
				"Customer.getCustomerListCount", params);
	}

	/**
	 * 添加客户信息
	 * 
	 * @param c
	 *            客户信息
	 */
	public Customer addCustomerInfo(Customer c) {
		this.getSqlSession().insert("Customer.addCustomerInfo", c);
		return c;
	}

	/**
	 * 添加客户帐号信息
	 * 
	 * @param c
	 *            客户帐号信息
	 */
	public void addCustomerAccountInfo(CustomerAccount c) {
		this.getSqlSession().insert("Customer.addCustomerAccountInfo", c);
	}

	/**
	 * 更新客户信息
	 * 
	 * @param c
	 *            客户信息
	 */
	public void updateCustomerInfo(Customer c) {
		this.getSqlSession().update("Customer.updateCustomerInfo", c);
	}

	/**
	 * 检测客户帐号是否存在
	 * 
	 * @param name
	 *            客户名称
	 * @return
	 */
	public boolean checkCustomNameExist(String name) {
		Map map = new HashMap();
		map.put("name", name);
		Integer o = (Integer) this.getSqlSession().selectOne(
				"Customer.checkCustomNameExist", map);
		if (o == 0)
			return false;
		else
			return true;
	}

	/**
	 * 检测客户帐号是否有效
	 * 
	 * @param name
	 *            帐号名称
	 * @return
	 */
	public boolean checkAccountExist(String name) {
		Map map = new HashMap();
		map.put("caName", name);
		Integer o = (Integer) this.getSqlSession().selectOne(
				"Customer.checkAccountExist", map);
		if (o == 0)
			return false;
		else
			return true;
	}

	public void deleteCustomerInfo(String[] customerIdArr) {
		// TODO Auto-generated method stub
		this.getSqlSession().update("Customer.deleteCustomerInfo",
				customerIdArr);
	}

	public boolean checkCustomNameExist(Customer c) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("name", c.getCustomerName());
		map.put("customerId", c.getCustomerId());
		Integer o = (Integer) this.getSqlSession().selectOne(
				"Customer.checkCustomNameExist", map);
		if (o == 0)
			return false;
		else
			return true;
	}

}
