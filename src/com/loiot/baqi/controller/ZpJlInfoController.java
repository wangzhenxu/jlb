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
            @RequestParam(value = "name", defaultValue = "") String name, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
        Pager<ZpJlInfo> pager = zpJlInfoService.queryZpJlInfoListPage(pMap, pageIndex);
        model.put("pager", pager);
        model.put("name", name);
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
    		/*//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	//pMap.put("name", p.getName);
        	int result=zpJlInfoService.getZpJlInfoListCount(pMap);
        	if(result>0){
		        //return NAME_EXIST;
			}*/
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
        model.put("p",  zpJlInfoService.getZpJlInfoById(id));
        return "/zpJlInfo/zpJlInfo_edit";
    }

    /**
     * 更新 简历信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpJlInfo(ZpJlInfo p,HttpSession session) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	//pMap.put("name", p.getName);
	    	int result=zpJlInfoService.getZpJlInfoListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        zpJlInfoService.updateZpJlInfo(p);
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
        model.put("p", zpJlInfoService.getZpJlInfoById(id));
        return "/zpJlInfo/zpJlInfo_view";
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
        ZpJlInfo bi = this.zpJlInfoService.paseWord(f,file,fi.getName());
        System.out.println(bi);
        AjaxResponse result = AjaxResponse.OK(bi);
    	/*if(f.getSize()>1048576){
    		return "/product/maxUploadExceeded";
    	}else  
    		return "/product/UploadSuccess";*/
        return result;
    }
    

}
