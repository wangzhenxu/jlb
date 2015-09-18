package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.AppDao;
import com.timeloit.pojo.app.App;
import com.timeloit.pojo.app.AppType;

@Transactional
@Service("appDisplayService")
public class AppDisplayService {
	@Resource
	private AppDao appDao;

	/**
	 * 查询上线应用列表
	 * 
	 * @param app
	 * @param pageIndex
	 * @return
	 */
	public Pager<App> getDisplayAppList(App app, int pageIndex) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("app_name", "".equals(app.getAppName()) ? null : app
				.getAppName().trim());
		hashMap.put("platform_type", app.getPlatformType());
		hashMap.put("ati_id", app.getAtiId());
		hashMap.put("platform_str", "".equals(app.getPlatformStr()) ? null
				: app.getPlatformStr());
		int totalResults = appDao.getDisplayAppCount(hashMap);
		Pager<App> pager = new Pager<App>(totalResults, pageIndex);
		hashMap.put("skipResults", pager.getSkipResults());
		hashMap.put("maxResults", pager.getMaxResults());
		List<App> DisplayAppList = appDao.getDisplayAppList(hashMap);
		pager.setData(DisplayAppList);
		return pager;
	}

	/**
	 * 通过应用类型获取对应的Map
	 * 
	 * @param appTypes
	 * @return
	 */
	public HashMap<Long, String> getAppTypeMap(List<AppType> appTypes) {
		HashMap<Long, String> hashMap = new HashMap<Long, String>();
		for (AppType appType : appTypes) {
			hashMap.put(appType.getAtiId(), appType.getTypeName());
		}
		return hashMap;

	}
}
