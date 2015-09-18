package com.loiot.baqi.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.loiot.baqi.controller.request.AppRequesthandler;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.exception.IllegalAppException;
import com.loiot.baqi.service.AppDisplayService;
import com.loiot.baqi.service.AppService;
import com.loiot.baqi.service.AppViewService;
import com.timeloit.pojo.app.App;
import com.timeloit.pojo.app.AppLog;
import com.timeloit.pojo.app.AppType;
import com.timeloit.pojo.app.DeployStatus;

/**
 * @author ZhangBo
 * 
 */
@Controller
@RequestMapping(value = "/app")
public class AppDisplayController {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private AppDisplayService appDisplayService;
    @Resource
    private AppService appService;
    @Resource
    private AppViewService appViewService;
    /**
     * 应用审核列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getDisplayList",method={RequestMethod.GET,RequestMethod.POST})
    public String getDisplayList(ModelMap model,App app,@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "app_name", defaultValue = "") String app_name,
    		@RequestParam(value = "platform_type", defaultValue ="-1") int platform_type,
    		@RequestParam(value = "ati_id", defaultValue = "0") long ati_id,
    		@RequestParam(value = "platform_str", defaultValue = "") String platform_str) throws Exception {
    	app.setAppName(app_name);
    	app.setPlatformType(platform_type);
    	app.setAtiId(ati_id);
    	app.setPlatformStr(platform_str);
        Pager<App>   pager= appDisplayService.getDisplayAppList(app, pageIndex);
        List<AppType> appTypes=appService.getAppType();
        HashMap<Long, String> appTypeMap=appDisplayService.getAppTypeMap(appTypes);
        model.put("appTypeMap", appTypeMap);
        model.put("appTypes", appTypes);
        model.put("pager", pager);
        model.put("app_name", app_name);
        model.put("platform_type", platform_type);
        model.put("ati_id", ati_id);
        model.put("platform_str", platform_str);
        model.put("menuClass", "appPublish");
        return "/app/getDisplayList";
    }
    
    /**取消发布
     * @param appid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cancelAppDeploy",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Object cancelAppDeploy(AppLog appLog) throws Exception {
    	HashMap<String, Object> hashMap=new HashMap<String, Object>();
    	hashMap.put("app_id", appLog.getAppId());
    	hashMap.put("deploy_status",DeployStatus.UNPUBLISH.getCode());
    	appService.updateAppDeployStatus(hashMap,appLog);
        return AjaxResponse.OK;
    }
    
    /**
	 * 跳转到应用修改页面
	 * @param model
	 * @param appId
	 * @param menuClass
	 * @return
	 * @author sujinbo
     * @throws IllegalAppException 
	 */
	@RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
	public String toUpdate(Model model, 
			@RequestParam(value = "appId") Long appId,
			@RequestParam(value = "menuClass",defaultValue = "editPassword") String menuClass) throws IllegalAppException{
		App app = appViewService.getAppByID(appId);		//应用信息
		if(null==app){
			throw new IllegalAppException(2,"whe");
		}
		model.addAttribute("app", app);
		List<AppLog> appLogList = appViewService.getAppLogs(appId);	//日志信息
		model.addAttribute("appLogList",appLogList);
		List<String> tagsList = appViewService.getTags(appId);	//得到所有标签tags
		model.addAttribute("tagsList", tagsList);
		List<AppType> appTypes=appService.getAppType();		//应用分类
		model.addAttribute("appTypes", appTypes);
		model.addAttribute("menuClass", menuClass);		//菜单栏
		return "app/update";
	}
	
	/**
	 * 修改应用
	 * 
	 * @param modelMap
	 * @param appRequesthandler
	 * @param smallImgFile
	 * @param bigImgFile
	 * @return
	 * @throws IllegalUserException 
	 */
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST }, value = "/updateapp")
	public String updateapp(ModelMap modelMap, AppRequesthandler appRequesthandler, @RequestParam(value = "spic") MultipartFile smallImgFile, @RequestParam(value = "bpic") MultipartFile bigImgFile) {
		appService.updateApp(appRequesthandler, smallImgFile, bigImgFile);
		return "redirect:/app/getDisplayList.action";
	}
	
//	/**验证图片大小
//     * @param imgFile
//     * @return
//     */
//    @RequestMapping(value="/checkSmallImage",method={RequestMethod.GET,RequestMethod.POST})
//    @ResponseBody
//    public Object checkSmallImage(@RequestParam(value="spic") MultipartFile imgFile) {
//    	if(imgFile.getSize()>1048576){
//    		return new AjaxResponse(-100,"图片过大,实际大小为："+imgFile.getSize());
//    	}else{
//    		return AjaxResponse.OK;
//    	}
//    }

	/**验证图片大小
     * @param imgFile
     * @return
     */
    @RequestMapping(value="/checkSmallImage",method={RequestMethod.GET,RequestMethod.POST})
    public String checkSmallImage(@RequestParam(value="spic") MultipartFile imgFile) {
    	if(imgFile.getSize()>1048576){
    		return "app/big";
    	}else{
    		return "app/ok";
    	}
    }
	
//    /**验证图片大小
//     * @param imgFile
//     * @return
//     */
//    @RequestMapping(value = "/checkBigImage",method={RequestMethod.GET,RequestMethod.POST})
//    @ResponseBody
//    public Object checkBigImage(@RequestParam(value="bpic") MultipartFile imgFile) {
//    	if(imgFile.getSize()>1048576){
//    		return new AjaxResponse(-100,"图片过大,实际大小为："+imgFile.getSize());
//    	}else{
//    		return AjaxResponse.OK;
//    	}
//    }
    /**验证图片大小
     * @param imgFile
     * @return
     */
    @RequestMapping(value = "/checkBigImage",method={RequestMethod.GET,RequestMethod.POST})
    public String checkBigImage(@RequestParam(value="bpic") MultipartFile imgFile) {
    	if(imgFile.getSize()>1048576){
    		return "app/big";
    	}else{
    		return "app/ok";
    	}
    }
}
