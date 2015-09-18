package com.loiot.baqi.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.exception.IllegalAppException;
import com.loiot.baqi.service.AppViewService;
import com.loiot.baqi.service.UserService;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.User;
import com.timeloit.pojo.app.App;
import com.timeloit.pojo.app.AppIdentity;
import com.timeloit.pojo.app.AppLog;
import com.timeloit.pojo.app.AppMaintenanceLog;
import com.timeloit.pojo.app.AppUserLogType;

/**
 * 应用查看
 * 
 * @author sujinbo
 * 
 */
@Controller
@RequestMapping(value = "/app")
public class AppViewController {
	
	@Resource
    private AppViewService appViewService;
	@Resource
    private UserService userService;
	
	/**
	 * 应用查看
	 * @param appId
	 * @return
	 * @author sujinbo
	 * @throws IllegalAppException 
	 */
	@RequestMapping(value = "/check",method = RequestMethod.GET)
	public String check(Model model, 
			@RequestParam(value = "appId") Long appId,
			@RequestParam(value = "appUserLogType", defaultValue = "0") int appUserLogType,
			@RequestParam(value = "groupType", defaultValue = "1") int groupType,
			@RequestParam(value = "startTime", required=false) String startTime,
			@RequestParam(value = "endTime",required=false) String endTime,
			@RequestParam(value = "menuClass",defaultValue = "editPassword") String menuClass) throws IllegalAppException{
		App app = appViewService.getAppByID(appId);		//应用信息
		if(null==app){
			throw new IllegalAppException(1,"app");
		}
		model.addAttribute("app", app);
		List<AppLog> appLogList = appViewService.getAppLogs(appId);	//日志信息
		model.addAttribute("appLogList",appLogList);
		User user=userService.getUserinfoById(app.getUserId());
//		String coderName = appViewService.getCoderName(appId);	//开发者名称
		model.addAttribute("coderName", StringUtil.isBlankToDefault(user.getRealName(),user.getLoginName()));
		List<String> testerNameList = appViewService.getTesterNames(appId);	//所有测试用户名称
		model.addAttribute("testerNameList", testerNameList);
		List<String> tagsList = appViewService.getTags(appId);	//得到所有标签tags
		model.addAttribute("tagsList", tagsList);
		model.addAttribute("dataList", appViewService.getAppUserLogList(appId,appUserLogType,groupType,startTime,endTime));
		model.addAttribute("appUserLogType", AppUserLogType.get(appUserLogType).getTitle());
		model.addAttribute("menuClass", menuClass);
		return "app/check";
	}
	
	/**
	 * 查看操作日志
	 * @param model
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	@RequestMapping(value = "/logCheck",method = RequestMethod.GET)
	public String logCheck(Model model, 
			@RequestParam(value = "appId") Long appId, 
			@RequestParam(value = "pi", defaultValue = "0") int pageIndex){
        Pager<AppLog>   pager= appViewService.getAppLogsList(appId, pageIndex);
		model.addAttribute("pager",pager);
		model.addAttribute("appId", appId);
		return "app/logCheck";
	}

	/**
	 * 身份认证
	 * @param model
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	@RequestMapping(value = "/identityCheck",method = RequestMethod.GET)
	public String identityCheck(Model model, @RequestParam(value = "appId") Long appId,@RequestParam(value = "userId") Long userId){

		App app = appViewService.getAppByID(appId);		//应用信息
//		User user=userService.getUserinfoById(app.getUserId());
//		String coderName = appViewService.getCoderName(appId);	//开发者名称
//		model.addAttribute("coderName", user.getRealName());
		boolean isUser = userService.getUserinfoById(app.getUserId()).getUserType()==0?true:false;
		AppIdentity ai = appViewService.getIdentity(userId);
		model.addAttribute("appIdentity",ai);
		model.addAttribute("isUser",isUser);
		return "app/identityCheck";
	}
	
	/**
	 * 得到运营日志-分页
	 * @param model
	 * @param appId
	 * @return
	 * @author sujinbo
	 */
	@RequestMapping(value = "/maintenanceLogCheck",method = RequestMethod.GET)
	public String MaintenancelogCheck(Model model, 
			@RequestParam(value = "appId") Long appId, 
			@RequestParam(value = "pi", defaultValue = "0") int pageIndex){
		Pager<AppMaintenanceLog>   pager= appViewService.getMaintenanceLogsList(appId, pageIndex);
		model.addAttribute("pager",pager);
		String maintenanceName = appViewService.getMaintenanceName(appId).toString();
		model.addAttribute("maintenanceName", maintenanceName);
		model.addAttribute("appId", appId);
		return "app/maintenanceLogCheck";
	}
	
	/**
	 * ajax请求数据
	 * @param modelMap
	 * @param appId
	 * @param appUserLogType	数据类型
	 * @param groupType		分组依据1按日分组显示
	 * 								2按月分组显示
	 * @param startTime
	 * @param endTime
	 * @return
	 * @author sujinbo
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/getAppUserLogList")
	public String getAppUserLogList(Model model,
			@RequestParam(value = "appId") Long appId,
			@RequestParam(value = "appUserLogType", defaultValue = "0") int appUserLogType,
			@RequestParam(value = "groupType", defaultValue = "1") int groupType,
			@RequestParam(value = "startTime") String startTime,
			@RequestParam(value = "endTime") String endTime) {
		model.addAttribute("dataList", appViewService.getAppUserLogList(appId,appUserLogType,groupType,startTime,endTime));
		model.addAttribute("appUserLogType", AppUserLogType.get(appUserLogType).getTitle());
		return "app/data";
	}
	
}
