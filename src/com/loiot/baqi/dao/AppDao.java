package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.loiot.commons.cache.aop.Mempojo;
import com.timeloit.pojo.Tag;
import com.timeloit.pojo.app.App;
import com.timeloit.pojo.app.AppLog;
import com.timeloit.pojo.app.AppType;

/**
 * 应用管理数据访问层
 * 
 * @author sujinbo
 */
@Repository("appDao")
public class AppDao extends SqlSessionDaoSupport {
  
	/**
	 * 获得应用数据。
	 * 
	 * @param appId
	 *            应用Id
	 * @return 返回应用数据.
	 */
	public App getAppById(long appId) {
		return (App) getSqlSession().selectOne("App.getAppById", appId);
	}
	
	/**
	 * 获得应用的所有测试用户名称
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<String> getTesterNames(long appId){
		return getSqlSession().selectList("App.getTesterNames", appId);
	}

	/**
	 * 查询审核操作的相关列表
	 * @param map
	 * @return
	 */
	public List<App> getAuditAppList(Map<String, Object> map) {
        return getSqlSession().selectList("App.selectAuditAppList",map);
    }
	
	/**
	 * 查询审核操作总数
	 * @param map
	 * @return
	 */
	public Integer getAuditAppCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("App.selectAuditAppCount",map);
    }
	
	
	/**修改应用状态
	 * @param map
	 */
	@Mempojo
	public App updateAppAuditStatus(Map<String, Object> map) {
       getSqlSession().update("App.updateAppAuditStatus",map);
       return getAppById((Long) map.get("app_id"));
    }
	
	
	/**更改发布状态
	 * @param map
	 * @return 
	 */
	@Mempojo
	public App updateAppDeployStatus(Map<String, Object> map) {
	   getSqlSession().update("App.updateAppDeployStatus",map);
	   return getAppById((Long) map.get("app_id"));
	    }
	
	
	/**删除应用
	 * @param appId
	 */
	@Mempojo
	public void deleteApp(App app) {
	       getSqlSession().update("App.deleteApp",app.getAppId());
	}
	
	/**记录操作
	 * @param appLog
	 */
	public void addAppLog(AppLog appLog) {
	       getSqlSession().insert("App.addAppLog",appLog);
	}
	
	/**更新应用类型
	 * @param map
	 * @return 
	 */
	@Mempojo
	public App updateApptype(Map<String, Object> map) {
	       getSqlSession().update("App.updateAppType",map);
	       return getAppById((Long) map.get("app_id"));
	}
	
	/**获取应用类型列表
	 * @return
	 */
	public List<AppType> getAppType() {
        return getSqlSession().selectList("App.selectAppType");
    }
	
	/**
	 * 获得应用的所有测试用户名称
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public List<String> getTags(long appId){
		return getSqlSession().selectList("App.getTags", appId);
	}
	
	/**
	 * 获得应用的维护者名称
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	public String getMaintenanceName(long appId){
		return getSqlSession().selectOne("App.getMaintenanceName",appId)==null?"空":getSqlSession().selectOne("App.getMaintenanceName",appId).toString();
	}
	
	/**更改身份认证完整度
	 * @param map
	 */
	public void updateIdentitycompleteStatus(Map<String, Object> map) {
	       getSqlSession().update("App.updateIdentitycompleteStatus",map);
	}
	
	/**更改应用完整度
	 * @param map
	 */
	public void updateAppcompleteStatus(Map<String, Object> map) {
	       getSqlSession().update("App.updateAppcompleteStatus",map);
	}
	
	
	
	/**
	 * 查询上线应用列表
	 * @param map
	 * @return
	 */
	public List<App> getDisplayAppList(Map<String, Object> map) {
        return getSqlSession().selectList("App.selectDisplayAppList",map);
    }
	
	/**
	 * 查询上线应用总数
	 * @param map
	 * @return
	 */
	public Integer getDisplayAppCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("App.selectDisplayAppCount",map);
    }
	
	
	/**
	 * 查询应用列表
	 * @param map
	 * @return
	 */
	public List<App> getAppList(Map<String, Object> map) {
        return getSqlSession().selectList("App.selectAppList",map);
    }
	
	/**
	 * 查询应用总数
	 * @param map
	 * @return
	 */
	public Integer getAppCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("App.selectAppCount",map);
    }
	
	/**
	 * 更新应用数据。
	 * 
	 * @param app应用信息
	 */
	@Mempojo
	public App updateApp(App app) {
		getSqlSession().update("App.updateApp", app);
		return getAppById(app.getAppId());
	}
	
	/**
	 * 查询标签ID
	 * 
	 * @param tagWord
	 * @return
	 */
	public Long getTagIdByTagWord(String tagWord) {
		return (Long) getSqlSession().selectOne("App.getTagIdByTagWord", tagWord);
	}
	
	/**
	 * 添加产品标签
	 * 
	 * @param tag
	 * @return
	 */
	public long addTag(Tag tag) {
		getSqlSession().insert("App.addTag", tag);
		return tag.getTagId();
	}

	/**
	 * 添加产品标签映射
	 * 
	 * @param map
	 * @return
	 */
	public long addApp_Tag_Map(Map<String, Long> map) {
		return getSqlSession().insert("App.addApp_Tag_Map", map);
	}

	/**
	 * 删除产品映射
	 * 
	 * @param AppId
	 * @return
	 */
	public long deleteTag_Map(long AppId) {
		return getSqlSession().delete("App.deleteTag_Map", AppId);
	}
}
