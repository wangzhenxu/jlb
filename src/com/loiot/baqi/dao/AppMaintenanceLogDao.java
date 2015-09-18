package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.app.AppLog;
import com.timeloit.pojo.app.AppMaintenanceLog;

/**
 * 运营日志数据层
 * 
 * @author sujinbo
 */
@Repository("appMaintenanceLogDao")
public class AppMaintenanceLogDao extends SqlSessionDaoSupport {
  
	/**
	 * 得到应用的所有运营日志
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<AppMaintenanceLog> getAppMaintenanceLogs(Long appId) {
		return (List<AppMaintenanceLog>) getSqlSession().selectList("AppMaintenanceLog.getAppMaintenanceLogs", appId);
	}
	
	/**
	 * 分页得到运营日志
	 * @param hashMap
	 * @return
	 * @author sujinbo
	 */
	public List<AppMaintenanceLog> getAppMaintenanceLogsPage(Map hashMap) {
		return (List<AppMaintenanceLog>) getSqlSession().selectList("AppMaintenanceLog.getAppMaintenanceLogsPage", hashMap);
	}

	
	/**
	 * 查询运营日志总数
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public Integer getAppMaintenanceLogsCount(Long appId) {
        return (Integer) getSqlSession().selectOne("AppMaintenanceLog.AppMaintenanceLogsCount",appId);
    }
}
