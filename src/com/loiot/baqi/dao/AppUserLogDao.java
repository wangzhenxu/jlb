/*
 * Timeloit.com Inc.
 * Copyright (c) 2012 时代凌宇物联网数据平台. All Rights Reserved
 */
package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 应用用户日志数据访问层
 * 
 */
@Repository("appUserLogDao")
public class AppUserLogDao extends SqlSessionDaoSupport {

	/**
	 * 得到数据统计
	 * @param hashMap
	 * @return
	 * @author sujinbo
	 */
	public List<Map<String, Object>> getAppUserLogList(
			HashMap<String, Object> hashMap) {
		return (List<Map<String, Object>>) getSqlSession().selectList("AppUserLog.getAppUserLogList", hashMap);
	}

}
