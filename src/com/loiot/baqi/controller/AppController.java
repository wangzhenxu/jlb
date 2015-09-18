package com.loiot.baqi.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.AppService;
import com.timeloit.pojo.app.App;
import com.timeloit.pojo.app.AppLog;
import com.timeloit.pojo.app.AppType;
import com.timeloit.pojo.app.AuditStatus;
import com.timeloit.pojo.app.DeployStatus;

/**
 * @author ZhangBo
 * 
 */
@Controller
@RequestMapping(value = "/app")
public class AppController {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private AppService appService;


    /**
     * 应用审核列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/auditapplist",method={RequestMethod.GET,RequestMethod.POST})
    public String getProClassList(ModelMap model,App app,@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "app_name", defaultValue = "") String app_name,
    		@RequestParam(value = "platform_type", defaultValue ="-1") int platform_type,
    		@RequestParam(value = "ati_id", defaultValue = "0") long ati_id,
    		@RequestParam(value = "platform_str", defaultValue = "") String platform_str,
    		@RequestParam(value = "query_type", defaultValue = "0") Integer query_type) throws Exception {
    	app.setAppName(app_name);
    	app.setPlatformType(platform_type);
    	app.setAtiId(ati_id);
    	app.setPlatformStr(platform_str);
        Pager<App>   pager= appService.getAuditAppList(app, pageIndex, query_type);
        List<AppType> appTypes=appService.getAppType();
        model.put("appTypes", appTypes);
        model.put("pager", pager);
        model.put("app_name", app_name);
        model.put("platform_type", platform_type);
        model.put("ati_id", ati_id);
        model.put("platform_str", platform_str);
        model.put("query_type", null==query_type?0:query_type);
        model.put("menuClass", "appAudit");
        return "/app/auditAppList";
    }

    /**初审通过
     * @param appid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/Initialapp",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object Initialapp(@RequestParam(value = "appId", defaultValue = "") long appId,
    		@RequestParam(value = "atiId", defaultValue = "") long atiId) throws Exception {
    	HashMap<String, Object> hashMap=new HashMap<String, Object>();
    	AppLog appLog=new AppLog();
    	appLog.setAppId(appId);
    	hashMap.put("app_id", appId);
    	hashMap.put("audit_status", AuditStatus.SECOND_AUDITING.getCode());
    	hashMap.put("ati_id", atiId);
    	appService.updateAppAuditStatus(hashMap,appLog);
        return AjaxResponse.OK;
    }
    
    /**初审驳回
     * @param appid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/firstreject",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object firstReject(AppLog appLog) throws Exception {
    	HashMap<String, Object> hashMap=new HashMap<String, Object>();
    	hashMap.put("app_id", appLog.getAppId());
    	hashMap.put("audit_status",AuditStatus.FIRST_AUDIT_FAIL.getCode() );
    	hashMap.put("user_id", Long.valueOf(appLog.getOperator()));
    	if(appLog.getRefuseCode().indexOf("1")>-1){
    		hashMap.put("complete_status", 0);
    		appService.updateIdentitycompleteStatus(hashMap);
    	}
    	if(appLog.getRefuseCode().indexOf("2")>-1){
    		hashMap.put("complete_status", 0);
    		appService.updateAppcompleteStatus(hashMap);
    	}
    	appService.updateAppAuditStatus(hashMap,appLog);
    	appService.sendMassage(hashMap, appLog);
        return AjaxResponse.OK;
    }
    
    
    /**复审通过
     * @param appid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/recheck",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object reCheck(AppLog appLog) throws Exception {
    	HashMap<String, Object> hashMap=new HashMap<String, Object>();
    	hashMap.put("app_id", appLog.getAppId());
    	hashMap.put("audit_status", AuditStatus.AUDIT_PASS.getCode());
    	appService.updateAppAuditStatus(hashMap,appLog);
        return AjaxResponse.OK;
    }
    
    /**复审驳回
     * @param appid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/recheckreject",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object reCheckReject(AppLog appLog) throws Exception {
    	HashMap<String, Object> hashMap=new HashMap<String, Object>();
    	hashMap.put("app_id", appLog.getAppId());
    	hashMap.put("audit_status",AuditStatus.SECOND_AUDIT_FAIL.getCode());
    	appService.updateAppAuditStatus(hashMap,appLog);
        return AjaxResponse.OK;
    }
    
    /**删除应用
     * @param appid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deleteapp",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object deleteApp(@RequestParam(value = "appid", defaultValue = "") long appid) throws Exception {
    	appService.deleteApp(appid);
        return AjaxResponse.OK;
    }
    
    /**发布上线
     * @param appid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateappdeploystatus",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object updateAppDeployStatus(AppLog appLog) throws Exception {
    	HashMap<String, Object> hashMap=new HashMap<String, Object>();
    	long user_Id=Long.valueOf(appLog.getOperator());
    	String appName=appLog.getAction();
    	hashMap.put("app_id", appLog.getAppId());
    	hashMap.put("deploy_status",DeployStatus.PUBLISHING.getCode());
    	appService.updateAppDeployStatus(hashMap,appLog);
    	appService.sendMassageOnline(user_Id,appName);
        return AjaxResponse.OK;
    }
    
    /**
     * 应用列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getAppList",method={RequestMethod.GET,RequestMethod.POST})
    public String getAppList(ModelMap model,App app,@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "app_name", defaultValue = "") String app_name,
    		@RequestParam(value = "platform_type", defaultValue ="-1") int platform_type,
    		@RequestParam(value = "audit_status", defaultValue = "") String audit_status,
    		@RequestParam(value = "platform_str", defaultValue = "") String platform_str,
    		@RequestParam(value = "deploy_status", defaultValue = "") String deploy_status) throws Exception {
    	app.setAppName(app_name);
    	app.setPlatformType(platform_type);
    	app.setPlatformStr(platform_str);
        Pager<App>   pager= appService.getAppList(app, pageIndex,audit_status,deploy_status);
        List<AppType> appTypes=appService.getAppType();
        model.put("appTypes", appTypes);
        model.put("pager", pager);
        model.put("app_name", app_name);
        model.put("platform_type", platform_type);
        model.put("audit_status", audit_status);
        model.put("platform_str", platform_str);
        model.put("deploy_status", deploy_status);
        model.put("menuClass", "appView");
        return "/app/getAppList";
    }
    
    /**
     *  日志列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getAppLog",method={RequestMethod.GET,RequestMethod.POST})
    public String getAppLog(ModelMap model,@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "appId", defaultValue = "") long appId) throws Exception {
    	List<AppLog> appLogs=appService.getAppLogByAppId(appId);
        model.put("appLogs", appLogs);
        return "/app/getAppLog";
    }
    
    
}
