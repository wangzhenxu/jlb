package com.loiot.baqi.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.AppDao;
import com.loiot.baqi.dao.AppIdentityDao;
import com.loiot.baqi.dao.AppLogDao;
import com.loiot.baqi.dao.AppMaintenanceLogDao;
import com.loiot.baqi.dao.AppUserLogDao;
import com.loiot.commons.utils.DateUtil;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.app.App;
import com.timeloit.pojo.app.AppIdentity;
import com.timeloit.pojo.app.AppLog;
import com.timeloit.pojo.app.AppMaintenanceLog;

/**
 * 应用查看
 * @author sujinbo
 *
 */
@Transactional
@Service("appViewService")
public class AppViewService {
	
	@Resource
	private AppDao appDao;
	
	@Resource
	private AppLogDao appLogDao;
	
	@Resource
	private AppIdentityDao appIdentityDao;
	
	@Resource
	private AppMaintenanceLogDao appMaintenanceLogDao;
	
	@Resource
	private AppUserLogDao appUserLogDao;
	/**
	 * 根据应用ID获得应用信息
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public App getAppByID(long appId){
		App app = appDao.getAppById(appId);
		return app;
	}
	
	/**
	 * 根据应用ID获得日志信息
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<AppLog> getAppLogs(long appId){
		return appLogDao.getAppLogs(appId);
	}
	
	/**
	 * 根据应用ID获得分页日志信息
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public Pager<AppLog> getAppLogsList(long appId,int pageIndex){
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		int totalResults = appLogDao.getAppLogsCount(appId);
		Pager<AppLog> pager = new Pager<AppLog>(totalResults, pageIndex);
		pager.setPageSize(5);
		hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        hashMap.put("appId", appId);
        List<AppLog> AuditAppList = appLogDao.getAppLogsPage(hashMap);
        pager.setData(AuditAppList);
		return pager;
	}
	
	/**
	 * 根据应用ID获得所有测试用户名称
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<String> getTesterNames(long appId){
		return appDao.getTesterNames(appId);
	}
	
	/**
	 * 根据应用ID获得所有标签tags
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<String> getTags(long appId){
		return appDao.getTags(appId);
	}
	
	/**
	 * 得到身份验证信息
	 * @param userId
	 * @return
	 * @author sujinbo
	 */
	public AppIdentity getIdentity(long userId){
		return appIdentityDao.getAppIdentity(userId);
	}
	
	/**
	 * 得到运营日志
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<AppMaintenanceLog> getMaintenanceLogs(long appId){
		return appMaintenanceLogDao.getAppMaintenanceLogs(appId);
	}
	
	/**
	 * 根据应用ID获得分页的运营日志信息
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public Pager<AppMaintenanceLog> getMaintenanceLogsList(long appId,int pageIndex){
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		int totalResults = appMaintenanceLogDao.getAppMaintenanceLogsCount(appId);
		Pager<AppMaintenanceLog> pager = new Pager<AppMaintenanceLog>(totalResults, pageIndex);
		pager.setPageSize(5);
		hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        hashMap.put("appId", appId);
        List<AppMaintenanceLog> AppMaintenanceLogList = appMaintenanceLogDao.getAppMaintenanceLogsPage(hashMap);
        pager.setData(AppMaintenanceLogList);
		return pager;
	}
	
	/**
	 * 得到应用的维护者姓名
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public String getMaintenanceName(long appId){
		return appDao.getMaintenanceName(appId);
	}
	
	/**
	 * 得到数据统计结果
	 * @param appId
	 * @param appUserLogType
	 * @param groupType
	 * @param startTime
	 * @param endTime
	 * @return
	 * @author sujinbo
	 */
	public List<Map<String,Object>> getAppUserLogList(Long appId, int appUserLogType,
			int groupType,String startTime,String endTime) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		startTime = StringUtil.isBlankToDefault(startTime, DateUtil.toString(DateUtil.addDays(DateUtil.getNow(),-7), DateUtil.DEFAULT_LONG_FORMAT));
		endTime = StringUtil.isBlankToDefault(endTime, DateUtil.toString(DateUtil.getNow(),DateUtil.DEFAULT_LONG_FORMAT));
		hashMap.put("appId", appId);
		hashMap.put("appUserLogType", appUserLogType);
		hashMap.put("groupType", groupType);
		hashMap.put("startTime", startTime);
		hashMap.put("endTime", endTime);
		List<Map<String,Object>> resultList = appUserLogDao.getAppUserLogList(hashMap);
		Map tempMap = new HashMap();
		for(int i=0;i<resultList.size();i++){
			tempMap.put(resultList.get(i).get("operationDate"), resultList.get(i).get("count"));
		}
		List<Map<String,Object>> returnList = new ArrayList<Map<String,Object>>();
		Date startDate = DateUtil.toDate(startTime, DateUtil.DEFAULT_SHORT_FORMAT);
		Date endDate = DateUtil.toDate(endTime, DateUtil.DEFAULT_SHORT_FORMAT);
		if(groupType==1){		//按日分组
			while(startDate.before(DateUtil.addDays(endDate,1))){
				Map resultMap = new HashMap<String, Object>();
				String operationDateStr = DateUtil.toString(startDate, "yyyy-MM -dd ");
				resultMap.put("operationDate", operationDateStr);
				resultMap.put("count", null==tempMap.get(operationDateStr)?0:tempMap.get(operationDateStr));
				startDate = DateUtil.addDays(startDate, 1);
				returnList.add(resultMap);
			}
		}else{
			while(startDate.before(DateUtil.addMonth(endDate,1))){
				Map resultMap = new HashMap<String, Object>();
				String operationDateStr = DateUtil.toString(startDate, "yyyy-MM ");
				resultMap.put("operationDate", operationDateStr);
				resultMap.put("count", null==tempMap.get(operationDateStr)?0:tempMap.get(operationDateStr));
				startDate = DateUtil.addMonth(startDate, 1);
				returnList.add(resultMap);
			}
		}
		return returnList;
	}
}
