
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
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.loiot.commons.message.util.JsonUtil;
import com.timeloit.pojo.Account;

/**
 * 简历扩展信息 处理器。
 * ZpJlExpandInfo
 * @author  wangzx 
 * @creation 2015-10-23
 */


@Controller
@RequestMapping(value = "/zpJlExpandInfo")
public class ZpJlExpandInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "简历扩展信息已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpJlExpandInfoService zpJlExpandInfoService;
	
	private ZpJlExpandInfo zpJlExpandInfo;
	
	/**
     * 跳转  简历扩展信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	ZpJlExpandInfo p, ModelMap model)throws Exception {
    	
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	paramMap.put("qtype", "like");
        Pager<ZpJlExpandInfo> pager = zpJlExpandInfoService.queryZpJlExpandInfoListPage(paramMap , pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        return "/jlExpandInfo/jlExpandInfo_list";
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
    public String toAddZpJlExpandInfo(ModelMap model) {
        
        return "/jlExpandInfo/jlExpandInfo_add";
    }

    /**
     * 添加  简历扩展信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpJlExpandInfo(ZpJlExpandInfo p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		/*//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("name", p.getName());
        	int result=zpJlExpandInfoService.getZpJlExpandInfoListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());*/
    		zpJlExpandInfoService.addZpJlExpandInfo(p);
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
    public String toEditZpJlExpandInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        //model.put("p", zpJlExpandInfoService.getZpJlExpandInfoById(id));
    	model.put("pid",  id);
        return "/jlExpandInfo/jlExpandInfo_add";
    }

    /**
     * 更新 简历扩展信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpJlExpandInfo(ZpJlExpandInfo p,HttpSession session,HttpServletRequest request) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//如果前端，没有改变编号，就不用验证
        	String onlyName=request.getParameter("onlyName");
        	/*if(!StringUtils.isBlank(onlyName) &&  !p.getName().equals(onlyName)){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=zpJlExpandInfoService.getZpJlExpandInfoListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}*/
        zpJlExpandInfoService.updateZpJlExpandInfo(p);
    	} catch (Exception e) {
			  e.printStackTrace();
			  return AjaxResponse.FAILED;
		}
        return AjaxResponse.OK;
    }

    /**
     * 跳转到查看页面
     * 
     * @return
     */
    @RequestMapping(value = "/toView")
    public String toViewZpJlExpandInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        //model.put("p", zpJlExpandInfoService.getZpJlExpandInfoById(id));
    	 model.put("pid",  id);
    	return "/jlExpandInfo/jlExpandInfo_add";
    }

    /**
     * 删除  简历扩展信息
     * 
     * @param id ZpJlExpandInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpJlExpandInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpJlExpandInfoService.deleteZpJlExpandInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpJlExpandInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  简历扩展信息
     * 
     * @param id ZpJlExpandInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    @ResponseBody
    public Object ajaxDeleteZpJlExpandInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpJlExpandInfo p = new ZpJlExpandInfo();
        	p.setJlExpandId(id);
			zpJlExpandInfoService.deleteZpJlExpandInfo(p);
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
    	ZpJlExpandInfo p = zpJlExpandInfoService.getZpJlExpandInfoById(id);
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
    	ZpJlExpandInfo p = new ZpJlExpandInfo();
    	p.setJlExpandId(id);
    	//p.setIsDelete(isDelete);
    	zpJlExpandInfoService.updateZpJlExpandInfo(p);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpJlExpandInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    

}
