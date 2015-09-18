package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.rest.RestStore;

/**
 * rest_store访问层。
 * 
 * @author yanjg
 */
@Repository("restStoreDao")
public class RestStoreDao extends SqlSessionDaoSupport {

	/**
	 * 获取满足条件的记录数
	 * @param caId 
	 * 
	 * @param restName
	 * @param restCode
	 * @return
	 */
	public int getReststoreListCount(Long caId, String restName, String restCode) {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		if (!StringUtils.isEmpty(restName)) {
			paraMap.put("name", restName);
		}
		if (!StringUtils.isEmpty(restName)) {
			paraMap.put("code", restName);
		}
		paraMap.put("caId", caId);
		return (Integer) getSqlSession().selectOne(
				"RestStore.getReststoreListCount", paraMap);
	}

	public List<RestStore> getReststoreList(Long caId, String restName, String restCode,
			int skipResults, int maxResults) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("skipResults", skipResults);
		params.put("maxResults", maxResults);
		params.put("caId", caId);
		if (!StringUtils.isEmpty(restName)) {
			params.put("name", restName);
		}
		if (!StringUtils.isEmpty(restCode)) {
			params.put("code", restCode);
		}

		return (List<RestStore>) getSqlSession().selectList(
				"RestStore.getReststoreList", params);
	}

	public boolean isLegal(RestStore restStore) {
		// TODO Auto-generated method stub
		RestStore tmpObj=(RestStore)getSqlSession().selectOne("RestStore.isLegal",restStore);
		if(tmpObj==null){
			return true;
		}
		return false;
	}

	public void addRestStore(RestStore restStore) {
		// TODO Auto-generated method stub
		getSqlSession().insert("RestStore.addRestStore",restStore);
	}

	public RestStore getReststore(Long rsId) {
		// TODO Auto-generated method stub
		return (RestStore)getSqlSession().selectOne("RestStore.getReststore",rsId);
	}

	/**
	 * 
	 * @param restStore
	 */
	public void update(RestStore restStore) {
		// TODO Auto-generated method stub
		getSqlSession().update("RestStore.update",restStore);
	}

	public void delRestStore(String[] rsIdArr) {
		// TODO Auto-generated method stub
		getSqlSession().delete("RestStore.delRestStore", rsIdArr);
	}

	public RestStore getReststoreBycaid(Long caId) {
		// TODO Auto-generated method stub
		return (RestStore)getSqlSession().selectOne("RestStore.getReststoreBycaid",caId);
	}

}
