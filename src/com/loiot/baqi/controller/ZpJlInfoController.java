package com.loiot.baqi.controller;

import java.io.File;
import java.util.*;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.dao.*;
import com.loiot.baqi.service.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.loiot.commons.utils.DateUtil;
import com.loiot.commons.utils.JsonUtil;
import com.timeloit.pojo.Account;

/**
 * 简历信息 处理器。
 * ZpJlInfo
 * @author  wangzx 
 * @creation 2015-09-19
 */


@Controller
@RequestMapping(value = "/zpJlInfo")
public class ZpJlInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "简历信息已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpJlInfoService zpJlInfoService;
	
	private ZpJlInfo zpJlInfo;
	
	/**
     * 跳转  简历信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	ZpJlInfo p, ModelMap model)throws Exception {
    	HashMap<String,Object> paramMap = new HashMap<String,Object>();
		paramMap =JsonUtil.toObject(jsonParam, HashMap.class);
		Iterator iter = paramMap.entrySet().iterator();
		while (iter.hasNext()) {
		Map.Entry entry = (Map.Entry) iter.next();
    		Object key = entry.getKey();
    		Object val = entry.getValue();
    		model.put(String.valueOf(key), val);
		}
    	paramMap.put("qtype", "like");

        Pager<ZpJlInfo> pager = zpJlInfoService.queryZpJlInfoListPage(paramMap, pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        return "/zpJlInfo/zpJlInfo_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpJlInfo(ModelMap model) {
        
        return "/zpJlInfo/zpJlInfo_add";
    }

    /**
     * 添加  简历信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpJlInfo(ZpJlInfo p,HttpSession session,HttpServletRequest request) {
    	try {
    		System.out.println(p);
    		Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		p.setInTime(new Date());
    		p.setInPersion(account.getUsername());
    		String jobStartTimeT = request.getParameter("jobStartTimeT");
    		if(!StringUtils.isBlank(jobStartTimeT)){
    			Date jobStartTime =DateUtil.toDate(jobStartTimeT+"-01");
        		p.setJobStartTime(jobStartTime);
    		}
    		String birthdayT = request.getParameter("birthdayT");
    		if(!StringUtils.isBlank(birthdayT)){
    			Date birthday =DateUtil.toDate(birthdayT+"-01");
        		p.setBirthday(birthday);
    		}
    		//职位列表
    		String jobPositionLevelIds = request.getParameter("jobPositionLevelIds");
    		/*DiskFileItem fi = (DiskFileItem)file.getFileItem(); 
            File f = fi.getStoreLocation();*/
    		//验证唯一性
    		if(!this.validateUnique(p.getEmal(),p.getPhone())){
            	return this.NAME_EXIST;
            }
    		zpJlInfoService.addZpJlInfo(p,jobPositionLevelIds);
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
    public String toEditZpJlInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        //model.put("p",  zpJlInfoService.getZpJlInfoById(id));
    	model.put("pid",  id);
        return "/zpJlInfo/zpJlInfo_add";
    }

    /**
     * 更新 简历信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpJlInfo(ZpJlInfo p,HttpSession session,HttpServletRequest request) {
    	try {
    	//email	
		String onlyName=request.getParameter("onlyName");
		String phoneT=request.getParameter("phoneT");
    	if((!StringUtils.isBlank(phoneT) &&  !p.getPhone().equals(phoneT))  ){
    		//验证唯一性
    		if(!this.validateUnique(null,p.getPhone())){
            	return this.NAME_EXIST;
            }
    	}
    	
    	if((!StringUtils.isBlank(p.getEmal()) &&  !p.getEmal().equals(onlyName))  ){
    		//验证唯一性
    		if(!this.validateUnique(p.getEmal(),null)){
            	return this.NAME_EXIST;
            }
    	}
    	
    	
    		
    		//职位列表
		String jobPositionLevelIds = request.getParameter("jobPositionLevelIds");
        zpJlInfoService.updateZpJlInfo(p,jobPositionLevelIds);
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
    public String toViewZpJlInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        //model.put("p", zpJlInfoService.getZpJlInfoById(id));
    	model.put("pid",  id);
    	return "/zpJlInfo/zpJlInfo_add";
    }

    /**
     * 删除  简历信息
     * 
     * @param id ZpJlInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpJlInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpJlInfoService.deleteZpJlInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpJlInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  简历信息
     * 
     * @param id ZpJlInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpJlInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpJlInfo p = new ZpJlInfo();
        	//p.setZpJlInfo(id);
			zpJlInfoService.deleteZpJlInfo(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }
    
    /**验证图片大小
     * @param imgFile
     * @return
     * @throws Exception 
     */
    @RequestMapping(method={RequestMethod.GET,RequestMethod.POST},value="/paseWord")
    @ResponseBody
    public Object paseWord(@RequestParam(value="ui-upload-input") CommonsMultipartFile file  ,HttpServletResponse response) throws Exception {
    	//response.setContentType("text/plain");
    	DiskFileItem fi = (DiskFileItem)file.getFileItem();
        File f = fi.getStoreLocation();
        ZpJlInfo bi=null;
        try {
        	  bi = this.zpJlInfoService.paseWord(f,file,fi.getName());
		} catch (java.lang.ClassNotFoundException e) {
			// TODO: handle exception
			return new AjaxResponse(-2, "无法解析此文档，请自行转换word2003格式");
		} catch(java.io.IOException e){
			return new AjaxResponse(-2, "无法解析此文档，请自行转换word2003格式");
		}
       
        if(!this.validateUnique(bi.getEmal(),bi.getPhone())){
        	return this.NAME_EXIST;
        }
        
        
        System.out.println(bi);
        AjaxResponse result = AjaxResponse.OK(bi);
    	/*if(f.getSize()>1048576){
    		return "/product/maxUploadExceeded";
    	}else  
    		return "/product/UploadSuccess";*/
        return result;
    }
    
    /**
     * ajax 根据id查询实体bean
     * @return
     */
    @RequestMapping(value = "/getById")
    @ResponseBody
    public Object ajaxGetById(@RequestParam(value = "id", required = true) java.lang.Long id)throws Exception {
    	ZpJlInfo p = zpJlInfoService.getZpJlInfoById(id);
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
    	ZpJlInfo p = new ZpJlInfo();
    	p.setJlId(id);
    	zpJlInfoService.updateZpJlInfo(p,null);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpJlInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * 验证 手机号 和邮箱是否存在
     * @param bi
     * @return
     * @throws Exception
     */
    public boolean  validateUnique(String email,String iphone) throws Exception{
    	
    	boolean b = true;
    	if(email ==null && iphone==null){
    		return b;
    	}
    	//验证 手机号 和邮箱
        HashMap<String,Object> pMap = new HashMap<String,Object>();
        pMap.put("qtype","uniqueValidate");
       
        pMap.put("phoneT",iphone);
        pMap.put("emalT",email);
        int count = zpJlInfoService.getZpJlInfoListCount(pMap);
        if(count>0){
        	b=false;
        }
        return b;
    }
}
