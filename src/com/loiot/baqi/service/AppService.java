package com.loiot.baqi.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.FtlUtil;
import com.loiot.baqi.controller.request.AppRequesthandler;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.AppDao;
import com.loiot.baqi.dao.AppLogDao;
import com.loiot.commons.message.site.SiteLetterClient;
import com.loiot.commons.message.site.SiteLetterVo;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.Tag;
import com.timeloit.pojo.app.ActionType;
import com.timeloit.pojo.app.App;
import com.timeloit.pojo.app.AppLog;
import com.timeloit.pojo.app.AppType;
import com.timeloit.pojo.app.AuditStatus;
import com.timeloit.pojo.app.DeployStatus;
import com.timeloit.pojo.status.AlertActionType;

@Transactional
@Service("appService")
public class AppService {
    @Resource
    private AppDao appDao;
    
    @Resource
    private AppLogDao appLogDao;
	
    @Resource
    private SiteLetterClient siteLetterClient;
    /**查询审核操作的相关列表
     * @param app
     * @param pageIndex
     * @return
     */
    public Pager<App> getAuditAppList(App app, int pageIndex,int queryType) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        if(queryType==0){
        	hashMap.put("audit_status", AuditStatus.FIRST_AUDITING.getCode());
        }else if(queryType==1){
        	hashMap.put("audit_status", AuditStatus.SECOND_AUDITING.getCode());
        }else if(queryType==2){
        	hashMap.put("audit_status", AuditStatus.AUDIT_PASS.getCode());
        }
        
        hashMap.put("app_name", "".equals(app.getAppName())?null:app.getAppName().trim());
        hashMap.put("platform_type", app.getPlatformType());
        hashMap.put("ati_id", app.getAtiId());
        hashMap.put("platform_str", "".equals(app.getPlatformStr())?null:app.getPlatformStr());
        int totalResults = appDao.getAuditAppCount(hashMap);
        Pager<App> pager = new Pager<App>(totalResults, pageIndex);
        hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        List<App> AuditAppList = appDao.getAuditAppList(hashMap);
        pager.setData(AuditAppList);
        return pager;
    }
    
    /**更改审核状态
     * @param map
     */
    public void updateAppAuditStatus(Map<String, Object> map,AppLog appLog) {
    	Short type= (Short) map.get("audit_status");
    	map.put("last_time", new Date());
    	//初审通过更新类型
    	if(3==type){
    		appDao.updateApptype(map);
    	}
    	
    	appDao.updateAppAuditStatus(map);
    	//记录操作
    	appLog.setOperator("管理员");
    	appLog.setOperateTime(new Date());
    	appLog.setAction(type==2?ActionType.FIRSTREJECT.getTitle():type==3?ActionType.FIRSTPASS.getTitle():type==4?ActionType.SECONDREJECT.getTitle():ActionType.SECONDPASS.getTitle());
    	appLog.setActionType(type==2?ActionType.FIRSTREJECT.getCode():type==3?ActionType.FIRSTPASS.getCode():type==4?ActionType.SECONDREJECT.getCode():ActionType.SECONDPASS.getCode());
    	appLog.setStatus(type==2?ActionType.FIRSTREJECT.getStatus():type==3?ActionType.FIRSTPASS.getStatus():type==4?ActionType.SECONDREJECT.getStatus():ActionType.SECONDPASS.getStatus());
    	appDao.addAppLog(appLog);
    	
    	
    }
 	
 	/**删除应用
 	 * @param appId
 	 */
 	public void deleteApp(long appId) {
 		App app=appDao.getAppById(appId);
 		appDao.deleteApp(app);
 	}
 	

	/**更改发布状态
	 * @param map
	 */
	public void updateAppDeployStatus(Map<String, Object> map,AppLog appLog) {
		short state=(Short) map.get("deploy_status");
		map.put("last_time", new Date());
		appDao.updateAppDeployStatus(map);
			appLog.setOperator("管理员");
	    	appLog.setOperateTime(new Date());
	    	appLog.setAction(state==DeployStatus.PUBLISHING.getCode()?ActionType.DEPLOY.getTitle():ActionType.UNDEPLOY.getTitle());
	    	appLog.setActionType(state==DeployStatus.PUBLISHING.getCode()?ActionType.DEPLOY.getCode():ActionType.UNDEPLOY.getCode());
	    	appLog.setStatus(state==DeployStatus.PUBLISHING.getCode()?ActionType.DEPLOY.getStatus():ActionType.UNDEPLOY.getStatus());
	    	appDao.addAppLog(appLog);
	}
	
	
	/**更新应用类型
	 * @param map
	 */
	public void updateApptype(Map<String, Object> map) {
		appDao.updateApptype(map);
	}
	
	/**获取应用类型列表
	 * @return
	 */
	public List<AppType> getAppType() {
		return appDao.getAppType();
    }
	
	/**更改身份认证完整度
	 * @param map
	 */
	public void updateIdentitycompleteStatus(Map<String, Object> map) {
		appDao.updateIdentitycompleteStatus(map);
	}
	
	/**更改应用完整度
	 * @param map
	 */
	public void updateAppcompleteStatus(Map<String, Object> map) {
		appDao.updateAppcompleteStatus(map);
	}
	
	/**
	 * 查询应用列表
	 * @param map
	 * @return
	 */
	public Pager<App> getAppList(App app, int pageIndex,String auditStatus,String deployStatus) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("app_name", "".equals(app.getAppName())?null:app.getAppName().trim());
        hashMap.put("platform_type", app.getPlatformType());
        hashMap.put("platform_str", "".equals(app.getPlatformStr())?null:app.getPlatformStr());
        String[] auditStatusArray=StringUtil.isEmpty(auditStatus)?null:auditStatus.split(",");
        String[] deployStatusArray=StringUtil.isEmpty(deployStatus)?null:deployStatus.split(",");
        hashMap.put("auditStatusArray", auditStatusArray);
        hashMap.put("deployStatusArray", deployStatusArray);
        int totalResults = appDao.getAppCount(hashMap);
        Pager<App> pager = new Pager<App>(totalResults, pageIndex);
        hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        List<App> AppList = appDao.getAppList(hashMap);
        pager.setData(AppList);
        return pager;
    }
	
	/**
	 * 查询应用总数
	 * @param map
	 * @return
	 */
	public Integer getAppCount(Map<String, Object> map) {
        return (Integer) appDao.getAppCount(map);
    }
	
	/**
	 * 通过Appid查询对应的日志
	 * @param map
	 * @return
	 */
	public List<AppLog> getAppLogByAppId(long appId) {
        return  appLogDao.getAppLogs(appId);
    }
	
	/**
	 * 修改应用
	 * @param appRequesthandler
	 * @param smallImgFile
	 * @param bigImgFile
	 * @throws IllegalUserException 
	 */
	public void updateApp(AppRequesthandler appRequesthandler, MultipartFile smallImgFile, MultipartFile bigImgFile){
		App app = appRequesthandler.getApp();
		app.setLastTime(new Date());
		List<String> fileTypes = new ArrayList<String>();
		fileTypes.add("jpg");
		fileTypes.add("jpeg");
		fileTypes.add("bmp");
		fileTypes.add("gif");
		fileTypes.add("png");
		if (StringUtil.isNotEmpty(smallImgFile.getOriginalFilename())) {
			File smallImg = this.getFile(smallImgFile, ApplicationConst.APP_UPLOAD_PIC_PATH + "/small_icon", fileTypes, String.valueOf(app.getAppId()));
			if (null == smallImg || null == smallImg.getName() || "".equals(smallImg.getName())) {
				app.setSmallIcon(null);
			} else {
				app.setSmallIcon("/small_icon/" + smallImg.getName());
			}
		}
		
		if(StringUtil.isNotEmpty(bigImgFile.getOriginalFilename())){
			File bigImg = this.getFile(bigImgFile, ApplicationConst.APP_UPLOAD_PIC_PATH + "/large_icon", fileTypes, String.valueOf(app.getAppId()));
			if (null == bigImg || null == bigImg.getName() || "".equals(bigImg.getName())) {
				app.setLargeIcon(null);
			} else {
				app.setLargeIcon("/large_icon/" + bigImg.getName());
			}
		}
		app.setCompleteStatus(1);
		appDao.updateApp(appRequesthandler.getApp());	//更新应用
		
		updateTags(appRequesthandler.getTag(), app.getAppId());	//更新标签tags
		
		
		AppLog appLog = new AppLog();
		appLog.setAppId(app.getAppId());
		appLog.setOperator("管理员");
		appLog.setOperateTime(new Date());
		appLog.setAction(ActionType.MODIFY.getTitle());
		appLog.setStatus(ActionType.MODIFY.getStatus());
		appLog.setActionType(ActionType.MODIFY.getCode());
		appDao.addAppLog(appLog);
	}
	
	private File getFile(MultipartFile imgFile, String desDir, List<String> fileTypes, String reName) {
		String fileName = imgFile.getOriginalFilename();
		// 获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		// 对扩展名进行小写转换
		ext = ext.toLowerCase();
		File file = null;
		if (fileTypes.contains(ext)) { // 如果扩展名属于允许上传的类型，则创建文件
			File desdir = new File(desDir);
			if (!desdir.exists()) {
				desdir.mkdir();
			}
			file = new File(desdir, reName + "." + ext);
			file.deleteOnExit();
			try {
				imgFile.transferTo(file); // 保存上传的文件
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return file;
	}
	
	/**
	 * 添加应用标签
	 * 
	 * @param tag
	 * @param productId
	 */
	private void updateTags(Tag tag, long appId) {

		appDao.deleteTag_Map(appId);	//删除原有标签tags映射
		
		Long tagindex[] = addTag(tag);	//添加标签返回影响的ID集合
		
		addApp_Tag_Map(appId, tagindex);	//添加产品和标签的映射表
	}
	
	/**
	 * 批量添加标签，以逗号分隔
	 * 
	 * @param tag
	 *            标签集合字符串
	 * @return 影响的ID列[]
	 */
	private Long[] addTag(Tag tag) {
		Long[] index = null;
		if (null != tag.getTagWord() && !"".equals(tag.getTagWord().trim())) {
			if (tag.getTagWord().indexOf(",") > 0 || tag.getTagWord().indexOf("，") > 0 || tag.getTagWord().indexOf("\r") > 0 || tag.getTagWord().indexOf("\n") > 0 || tag.getTagWord().indexOf("、") > 0 || tag.getTagWord().indexOf(" ") > 0) {
				String tag_word[] = tag.getTagWord().split(",| |，|\r|\n|、");
				List<Long> list = new ArrayList<Long>();
				for (int i = 0; i < tag_word.length; i++) {
					if (null != tag_word[i] && !"".equals(tag_word[i])) {
						Long tag_id = appDao.getTagIdByTagWord(tag_word[i].trim());
						if (null != tag_id && tag_id > 0) {
							list.add(tag_id);
						} else {
							Tag temp = new Tag();
							temp.setTagWord(tag_word[i].trim());
							list.add(appDao.addTag(temp));
						}
					}
				}
				index = list.toArray(new Long[list.size()]);
			} else {
				index = new Long[1];
				Long tag_id = appDao.getTagIdByTagWord(tag.getTagWord());
				if (null != tag_id && tag_id > 0) {
					index[0] = tag_id;
				} else {
					index[0] = appDao.addTag(tag);
				}

			}
		}
		return index;
	}
	
	/**
	 * 添加应用和标签映射表
	 * 
	 * @param appindex
	 *            产品ID
	 * @param tagindex
	 *            标签ID
	 */
	private void addApp_Tag_Map(long appindex, Long tagindex[]) {
		for (int i = 0; null != tagindex && i < tagindex.length; i++) {
			HashMap<String, Long> maps = new HashMap<String, Long>();
			maps.put("app_id", appindex);
			maps.put("tag_id", tagindex[i]);
			appDao.addApp_Tag_Map(maps);
		}
	}
	
	
	/**驳回发送站内信
	 * @param hashMap
	 * @param appLog
	 */
	public void sendMassage(HashMap<String, Object> hashMap,AppLog appLog){
		SiteLetterVo siteLetter = new SiteLetterVo();
		siteLetter.setUserId((Long) hashMap.get("user_id"));
		siteLetter.setSender("系统管理员");
		siteLetter.setSubject("审核通知");
		Map<String, Object> letterMap = new HashMap<String, Object>();
		letterMap.put("RefuseCode", appLog.getRefuseCode());
		letterMap.put("reason",appLog.getComments());
    	letterMap.put("url", "http://www.loiot.com/app/toupdateidentity.do");
		letterMap.put("url1", "http://www.loiot.com//app/getappbyid.do?appId="+appLog.getAppId()+"&&pageType=2");
		siteLetter.setContent(FtlUtil.getInstance().getContent("refIdentityProduct.ftl", letterMap));
		siteLetter.setActionType(AlertActionType.APP_MESSAGE.getCode());
		siteLetter.setCreateTime(new Date());
		siteLetter.setIsRead((short) 0);
		siteLetterClient.send(siteLetter);
	}
	
	/**上线通知
	 * @param hashMap
	 * @param appLog
	 */
	public void sendMassageOnline(Long user_Id,String appName){
		SiteLetterVo siteLetter = new SiteLetterVo();
		siteLetter.setUserId(user_Id);
		siteLetter.setSender("系统管理员");
		siteLetter.setSubject("上线通知");
		Map<String, Object> letterMap = new HashMap<String, Object>();
		letterMap.put("appName",appName);
		siteLetter.setActionType(AlertActionType.APP_MESSAGE.getCode());
		siteLetter.setContent(FtlUtil.getInstance().getContent("pass.ftl", letterMap));
		siteLetter.setCreateTime(new Date());
		siteLetter.setIsRead((short) 0);
		siteLetterClient.send(siteLetter);
	}
}
