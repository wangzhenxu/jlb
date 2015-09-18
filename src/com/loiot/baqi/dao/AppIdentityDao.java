package com.loiot.baqi.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.app.AppIdentity;

/**
 * 身份验证数据层
 * 
 * @author sujinbo
 */
@Repository("appIdentityDao")
public class AppIdentityDao extends SqlSessionDaoSupport {
  
	/**
	 * 得到身份验证信息
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public AppIdentity getAppIdentity(Long userId) {
		return (AppIdentity) getSqlSession().selectOne("AppIdentity.getIdentity", userId);
	}

}
