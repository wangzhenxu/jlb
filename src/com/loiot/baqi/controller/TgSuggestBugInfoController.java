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
import com.loiot.baqi.constant.DictionaryUtil;
import com.loiot.baqi.constant.URLConst;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.loiot.baqi.status.AccountType;
import com.loiot.baqi.status.DictionaryType;
import com.loiot.baqi.status.ProjectType;
import com.loiot.baqi.status.tgsystem.SuggestType;
import com.loiot.commons.message.util.JsonUtil;
import com.timeloit.pojo.Account;
import com.loiot.baqi.utils.ClientInfo;
import com.loiot.baqi.utils.UserSessionUtils;


/**
 * 建议 处理器。
 * TgSuggestBugInfo
 * @author  wangzx 
 * @creation 2015-12-24
 */


@Controller
@RequestMapping(value = "/tgSuggestBugInfo")
public class TgSuggestBugInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "建议已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private TgSuggestBugInfoService tgSuggestBugInfoService;
	
	private TgSuggestBugInfo tgSuggestBugInfo;
	
	private HashMap<String,Object> pmap = new HashMap<String,Object>();
	
	/**
     * 跳转  建议列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	TgSuggestBugInfo p, ModelMap model)throws Exception {
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	paramMap.put("qtype", "like");
    	//用户数据过滤
    	/*
    	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
    		paramMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	}*/
        Pager<TgSuggestBugInfo> pager = tgSuggestBugInfoService.queryTgSuggestBugInfoListPage(paramMap , pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        return "/suggestInfo/suggestInfo_list";
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
    		}else
    		if(String.valueOf(val).length()>0){
        		model.put(String.valueOf(key), val);
    		}
		}
		return newParamMap;
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddTgSuggestBugInfo(ModelMap model) {
        
        return "/suggestInfo/suggestInfo_add";
    }

    /**
     * 添加  建议
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addTgSuggestBugInfo(TgSuggestBugInfo p,HttpSession session,HttpServletRequest request) {
    	try {
    		
    		String sugTitle = request.getParameter("sug_title");
    		String sugContent = request.getParameter("sug_content");
    		Integer sugType = Integer.parseInt(request.getParameter("sug_type"));
    		p.setTitle(sugTitle);
    		p.setContent(sugContent);
    		p.setSugType(sugType);
    		String retUrl = request.getHeader("Referer");
    		p.setAddress("北京");
    		p.setCurrentUrl(retUrl);
    		p.setProjectType((int)ProjectType.JLB.getCode());
    		p.setInPerson(UserSessionUtils.getAccount().getAccountId());
    		p.setAccountType(UserSessionUtils.getAccountType());
    		p.setInTime(new Date());
    		Long operationType=null;
    		if(sugType.intValue() ==(int)SuggestType.SUGGEST.getCode()){
    			operationType = DictionaryUtil.getCode((int)DictionaryType.SUGGEST_OPERATOR_STATUS.getCode(), "未操作");
    		}else 
    		if(sugType.intValue() ==(int)SuggestType.BUG.getCode()){
    			operationType = DictionaryUtil.getCode((int)DictionaryType.BUG_OPERATOR_STATUS.getCode(), "未操作");
    		}
    		p.setOperationType(operationType);
    		
    		//客户端信息
    		ClientInfo cinfo = new ClientInfo(request.getHeader("user-agent"));    		
    		p.setAgent(cinfo.getExplorerName()+" "+cinfo.getExplorerVer());
    		p.setUserOs(cinfo.getOSName()+" " + cinfo.getOSVer());
    		
    		tgSuggestBugInfoService.addTgSuggestBugInfo(p);
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
    public String toEditTgSuggestBugInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        //model.put("p", tgSuggestBugInfoService.getTgSuggestBugInfoById(id));
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	model.put("pid",  id);
        return "/suggestInfo/suggestInfo_add";
    }

    /**
     * 更新 建议
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editTgSuggestBugInfo(TgSuggestBugInfo p,HttpSession session,HttpServletRequest request) {
    	/*try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//如果前端，没有改变编号，就不用验证
        	String onlyName=request.getParameter("onlyName");
        	if(!StringUtils.isBlank(onlyName) &&  !p.getName().equals(onlyName)){
	    	//验证唯一性
        	pmap.clear();
        	pmap.put("name", p.getName());
	    	int result=tgSuggestBugInfoService.getTgSuggestBugInfoListCount(pmap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        tgSuggestBugInfoService.updateTgSuggestBugInfo(p);
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
    public String toViewTgSuggestBugInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	//model.put("p", tgSuggestBugInfoService.getTgSuggestBugInfoById(id));
    	 model.put("pid",  id);
    	return "/suggestInfo/suggestInfo_add";
    }

    /**
     * 删除  建议
     * 
     * @param id TgSuggestBugInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteTgSuggestBugInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	tgSuggestBugInfoService.deleteTgSuggestBugInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/tgSuggestBugInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  建议
     * 
     * @param id TgSuggestBugInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    @ResponseBody
    public Object ajaxDeleteTgSuggestBugInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		TgSuggestBugInfo p = new TgSuggestBugInfo();
        	p.setSuggestId(id);
			tgSuggestBugInfoService.deleteTgSuggestBugInfo(p);
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
    	TgSuggestBugInfo p=null;
     	//用户数据过滤
     	/*if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
     		  p = tgSuggestBugInfoService.getTgSuggestBugInfoById(id, UserSessionUtils.getAccount().getAccountId());
     	} else {
   		      p = tgSuggestBugInfoService.getTgSuggestBugInfoById(id);
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
    	TgSuggestBugInfo p = new TgSuggestBugInfo();
    	p.setSuggestId(id);
    	//p.setIsDelete(isDelete);
    	tgSuggestBugInfoService.updateTgSuggestBugInfo(p);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/tgSuggestBugInfo/"), s.length());
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
    	int result=tgSuggestBugInfoService.getTgSuggestBugInfoListCount(pmap);
    	if(result>0){
	        return NAME_EXIST;
		}
    	return AjaxResponse.OK(null);
    }
    

}
