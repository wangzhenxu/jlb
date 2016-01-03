package com.loiot.baqi.controller;

import java.util.*;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.service.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.constant.URLConst;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.loiot.baqi.status.AccountType;
import com.loiot.commons.message.util.JsonUtil;
import com.timeloit.pojo.Account;
import com.loiot.baqi.utils.UserSessionUtils;


/**
 * 任务 处理器。
 * TaskScheduleJob
 * @author  wangzx 
 * @creation 2015-11-14
 */


@Controller
@RequestMapping(value = "/taskScheduleJob")
public class TaskScheduleJobController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "任务已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private TaskScheduleJobService taskScheduleJobService;
	
	private TaskScheduleJob taskScheduleJob;
	
	private HashMap<String,Object> pmap = new HashMap<String,Object>();
	
	/**
     * 跳转  任务列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	TaskScheduleJob p, ModelMap model)throws Exception {
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	paramMap.put("qtype", "like");
    	//用户数据过滤
    	/*
    	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
    		paramMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	}*/
        Pager<TaskScheduleJob> pager = taskScheduleJobService.queryTaskScheduleJobListPage(paramMap , pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        return "/task/task_list";
    }
    
    /**
     * 获取查询条件
     * @param jsonParam
     * @param model
     * @return
     */
    public HashMap<String,Object> getParaMap(String jsonParam,ModelMap model){
    	HashMap<String,Object> newParamMap = newParamMap =  new HashMap<String,Object>();
    	 HashMap<String,Object> paramMap =JsonUtil.toObject(jsonParam, HashMap.class);
		Iterator iter = paramMap.entrySet().iterator();
		while (iter.hasNext()) {
		Map.Entry entry = (Map.Entry) iter.next();
    		Object key = entry.getKey();
    		Object val = entry.getValue();
    		if(key.toString().equals("name")){
    			newParamMap.put("nameT", val);
    		}else{
    			newParamMap.put(String.valueOf(key), val);
    		}
    		model.put(String.valueOf(key), val);
		}
		return newParamMap;
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddTaskScheduleJob(ModelMap model) {
        
        return "/task/task_add";
    }

    /**
     * 添加  任务
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addTaskScheduleJob(TaskScheduleJob p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
            pmap.clear();
           // pmap.put("name", p.getName());
        	int result=taskScheduleJobService.getTaskScheduleJobListCount(pmap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	/*p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());*/
    		taskScheduleJobService.addTaskScheduleJob(p);
    		// 添加成功
    		return AjaxResponse.OK;
    	}
        catch (Exception e) {
			e.printStackTrace();
			 //失败
	        return AjaxResponse.FAILED;
		}
       
    }

    /**
     * 跳转到编辑页面
     * 
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public String toEditTaskScheduleJob(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        //model.put("p", taskScheduleJobService.getTaskScheduleJobById(id));
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	model.put("pid",  id);
        return "/task/task_add";
    }

    /**
     * 更新 任务
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editTaskScheduleJob(TaskScheduleJob p,HttpSession session,HttpServletRequest request) {
    	/*try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//如果前端，没有改变编号，就不用验证
        	String onlyName=request.getParameter("onlyName");
        	if(!StringUtils.isBlank(onlyName) &&  !p.getName().equals(onlyName)){
	    	//验证唯一性
        	pmap.clear();
        	pmap.put("name", p.getName());
	    	int result=taskScheduleJobService.getTaskScheduleJobListCount(pmap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        taskScheduleJobService.updateTaskScheduleJob(p);
    	} catch (Exception e) {
			  e.printStackTrace();
			  return AjaxResponse.FAILED;
		}*/
        return AjaxResponse.OK;
    }

    /**
     * 跳转到查看页面
     * 
     * @return
     */
    @RequestMapping(value = "/toView")
    public String toViewTaskScheduleJob(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	//model.put("p", taskScheduleJobService.getTaskScheduleJobById(id));
    	 model.put("pid",  id);
    	return "/task/task_add";
    }

    /**
     * 删除  任务
     * 
     * @param id TaskScheduleJobID
     */
    @RequestMapping(value = "/delete")
    public String deleteTaskScheduleJob(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	taskScheduleJobService.deleteTaskScheduleJob(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/taskScheduleJob/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  任务
     * 
     * @param id TaskScheduleJobID
     */
    @RequestMapping(value = "/ajaxDelete")
    @ResponseBody
    public Object ajaxDeleteTaskScheduleJob(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		TaskScheduleJob p = new TaskScheduleJob();
        	p.setJobId(id);
			taskScheduleJobService.deleteTaskScheduleJob(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }
    
    /**
     * ajax 根据id查询实体bean
     * @return
     */
    @RequestMapping(value = "/getById")
    @ResponseBody
    public Object ajaxGetById(@RequestParam(value = "id", required = true) java.lang.Long id)throws Exception {
    	TaskScheduleJob p=null;
     	//用户数据过滤
     	/*if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
     		  p = taskScheduleJobService.getTaskScheduleJobById(id, UserSessionUtils.getAccount().getAccountId());
     	} else {
   		      p = taskScheduleJobService.getTaskScheduleJobById(id);
     	}*/
     	if(p==null){
     		return AjaxResponse.NOEXITS;
     	}
    	return AjaxResponse.OK(p);
    }
    
    /**
     * 更新 （停用、启用状态）
     * 
     * @param id 
     */
    @RequestMapping(value = "/modifyDeleteStatus")
    public String modifyDeleteStatus(@RequestParam(value = "id", required = true) java.lang.Long id,
    		@RequestParam(value = "deleteStatus", required = true) java.lang.Integer isDelete,
    		HttpServletRequest request)throws Exception {
    	TaskScheduleJob p = new TaskScheduleJob();
    	p.setJobId(id);
    	//p.setIsDelete(isDelete);
    	taskScheduleJobService.updateTaskScheduleJob(p);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/taskScheduleJob/"), s.length());
        return "redirect:"+redirectStr;
    }
    

}
