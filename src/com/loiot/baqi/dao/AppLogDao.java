package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.app.AppLog;

/**
 * 应用日志数据层
 * 
 * @author sujinbo
 */
@Repository("appLogDao")
public class AppLogDao extends SqlSessionDaoSupport {
  
	/**
	 * 得到所有应用日志
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<AppLog> getAppLogs(Long appId) {
		return (List<AppLog>) getSqlSession().selectList("AppLog.getAppLogs", appId);
	}

	/**
	 * 分页得到应用日志
	 * @param hashMap
	 * @return
	 * @author sujinbo
	 */
	public List<AppLog> getAppLogsPage(Map hashMap) {
		return (List<AppLog>) getSqlSession().selectList("AppLog.getAppLogsPage", hashMap);
	}

	
	/**
	 * 查询操作日志总数
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public Integer getAppLogsCount(Long appId) {
        return (Integer) getSqlSession().selectOne("AppLog.selectAppLogsCount",appId);
    }

}
