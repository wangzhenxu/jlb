package com.loiot.baqi.controller;

import java.util.*;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.dao.*;
import com.loiot.baqi.service.*;

import java.util.Date;
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
import com.loiot.baqi.status.JlAuditType;
import com.loiot.commons.message.util.JsonUtil;
import com.timeloit.pojo.Account;
import com.loiot.baqi.utils.UserSessionUtils;


/**
 * 推荐流程 处理器。
 * ZpRecommendFlowInfo
 * @author  wangzx 
 * @creation 2015-11-20
 */


@Controller
@RequestMapping(value = "/zpRecommendFlowInfo")
public class ZpRecommendFlowInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "推荐流程已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpRecommendFlowInfoService zpRecommendFlowInfoService;
	
	private ZpRecommendFlowInfo zpRecommendFlowInfo;
	
	@Resource
	private ZpJobMatchingInfoService zpJobMatchingInfoService;
	
	private HashMap<String,Object> pmap = new HashMap<String,Object>();
	
	/**
     * 跳转  推荐流程列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	ZpRecommendFlowInfo p, ModelMap model)throws Exception {
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	paramMap.put("qtype", "like");
    	//用户数据过滤
    	/*
    	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
    		paramMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	}*/
        Pager<ZpRecommendFlowInfo> pager = zpRecommendFlowInfoService.queryZpRecommendFlowInfoListPage(paramMap , pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        return "/recommendflow/recommendflow_list";
    }
    
    /**
     * 跳转  企业对接列表
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/companyInterfaceList")
    public String companyInterfaceList(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	ZpRecommendFlowInfo p, ModelMap model)throws Exception {
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	paramMap.put("qtype", "like");
    	//用户数据过滤
    	/*
    	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
    		paramMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	}*/
        Pager<ZpRecommendFlowInfo> pager = zpRecommendFlowInfoService.queryZpRecommendFlowInfoListPage(paramMap , pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        return "/companyInterface/companyInterface_list";
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
    public String toAddZpRecommendFlowInfo(ModelMap model) {
        
        return "/recommendflow/recommendflow_add";
    }

    /**
     * 添加  推荐流程
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpRecommendFlowInfo(ZpRecommendFlowInfo p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
            pmap.clear();
            //pmap.put("name", p.getName());
        	int result=zpRecommendFlowInfoService.getZpRecommendFlowInfoListCount(pmap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	//p.setInDatetime(new Date());
    		//p.setInPerson(account.getUsername());
    		zpRecommendFlowInfoService.addZpRecommendFlowInfo(p);
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
     * 添加  推荐流程
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/addAudit")
    @ResponseBody
    public Object addAudit(ZpRecommendFlowInfo p,HttpSession session,HttpServletRequest request) {
    	try {
           if(UserSessionUtils.getAccount().getType()==AccountType.TECHICAL_AUDIT.getCode()){
        	   pmap.clear();
        	   pmap.put("matchId", p.getMatchId());
        	   pmap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
        	   int count =this.zpJobMatchingInfoService.getZpJobMatchingInfoListCount(pmap);
               if(count!=1){
            	   return AjaxResponse.ILLEGAL_OPERATER;
               }
           }
           
           if(UserSessionUtils.getAccount().getType()==AccountType.TECHICAL_AUDIT.getCode() || UserSessionUtils.getAccount().getType()==AccountType.ADMIN.getCode()){
        	   ZpRecommendFlowInfo newP = new ZpRecommendFlowInfo();
        	   newP.setMatchId(p.getMatchId());
       		   newP.setTechnicianAuditTime(new Date());
       		   newP.setTechnicianAuditContent(p.getTechnicianAuditContent());
       		   newP.setTechnicianAuditStatus((int)JlAuditType.AUDIT_OK.getCode());
       		   newP.setTechnicianAuditPerson(UserSessionUtils.getAccount().getAccountId());
       		   newP.setJlId(p.getJlId());
       		   newP.setCompanyJobId(p.getCompanyJobId());
       		   this.zpRecommendFlowInfoService.addZpRecommendFlowInfo(newP);
           }
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
    public String toEditZpRecommendFlowInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        //model.put("p", zpRecommendFlowInfoService.getZpRecommendFlowInfoById(id));
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	model.put("pid",  id);
        return "/recommendflow/recommendflow_add";
    }

    /**
     * 更新 推荐流程
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpRecommendFlowInfo(ZpRecommendFlowInfo p,HttpSession session,HttpServletRequest request) {
    	/*try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//如果前端，没有改变编号，就不用验证
        	String onlyName=request.getParameter("onlyName");
        	if(!StringUtils.isBlank(onlyName) &&  !p.getName().equals(onlyName)){
	    	//验证唯一性
        	pmap.clear();
        	pmap.put("name", p.getName());
	    	int result=zpRecommendFlowInfoService.getZpRecommendFlowInfoListCount(pmap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    		int a=0;
    	}
        zpRecommendFlowInfoService.updateZpRecommendFlowInfo(p);
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
    public String toViewZpRecommendFlowInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	//model.put("p", zpRecommendFlowInfoService.getZpRecommendFlowInfoById(id));
    	 model.put("pid",  id);
    	return "/recommendflow/recommendflow_add";
    }

    /**
     * 删除  推荐流程
     * 
     * @param id ZpRecommendFlowInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpRecommendFlowInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpRecommendFlowInfoService.deleteZpRecommendFlowInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpRecommendFlowInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  推荐流程
     * 
     * @param id ZpRecommendFlowInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    @ResponseBody
    public Object ajaxDeleteZpRecommendFlowInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpRecommendFlowInfo p = new ZpRecommendFlowInfo();
        	p.setAuditId(id);
			zpRecommendFlowInfoService.deleteZpRecommendFlowInfo(p);
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
    	ZpRecommendFlowInfo p=null;
     	//用户数据过滤
     	/*if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
     		  p = zpRecommendFlowInfoService.getZpRecommendFlowInfoById(id, UserSessionUtils.getAccount().getAccountId());
     	} else {
   		      p = zpRecommendFlowInfoService.getZpRecommendFlowInfoById(id);
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
    	ZpRecommendFlowInfo p = new ZpRecommendFlowInfo();
    	p.setAuditId(id);
    	//p.setIsDelete(isDelete);
    	zpRecommendFlowInfoService.updateZpRecommendFlowInfo(p);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpRecommendFlowInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * 查询，名称是否存在，验证唯一性
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/checkNameExits")
    @ResponseBody
    public Object checkNameExits(@RequestParam(value = "name", required = true) java.lang.String name,
    		@RequestParam(value = "oldname",required = false) java.lang.String oldName,
    		@RequestParam(value = "flag", required = true) String flag
    		) throws Exception
    {
    	//验证唯一性
    	pmap.clear();
    	pmap.put("name", name);
    	if("edit".equals(flag) && oldName.equals(name)){
        	return AjaxResponse.OK(null);
    	} 
    	zpRecommendFlowInfoService.getZpRecommendFlowInfoListCount(pmap);
    	int result =0;
    	if(result>0){
	        return NAME_EXIST;
		}
    	return AjaxResponse.OK(null);
    }
    

}
