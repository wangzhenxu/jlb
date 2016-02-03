package com.loiot.baqi.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.service.*;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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
import com.loiot.baqi.status.RecommendFlowType;
import com.loiot.commons.message.util.JsonUtil;
import com.timeloit.pojo.Account;
import com.loiot.baqi.utils.HttpRequest;
import com.loiot.baqi.utils.UserSessionUtils;


/**
 * 将职位信息和企业信息导出给用户 处理器。
 * ZpRecommendFlowInfo
 * @author  wangzx 
 * @creation 2015-11-20
 */


@Controller
@RequestMapping(value = "/zpRecommendExportInfo")
public class ZpRecommendExportController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "推荐流程已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
	private ZpCompanyJobInfoService zpCompanyJobInfoService;
    
    @Resource
	private ZpCompanyInfoService zpCompanyInfoService;
	private HashMap<String,Object> pmap = new HashMap<String,Object>();
	
    
    /**
     * 显示职位，企业，礼品信息
     * 
     * @return
     */
    @RequestMapping(value = "/show")
    public String show(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model,HttpServletRequest request)throws Exception {
    	ZpCompanyJobInfo companyJob = this.zpCompanyJobInfoService.getZpCompanyJobInfoById(id);
    	ZpCompanyInfo company = this.zpCompanyInfoService.getZpCompanyInfoById(companyJob.getCompanyId());
    	model.put("j", companyJob);
    	model.put("c", company);
    	String basePath = "http://"+request.getHeader("Host");
    	
    	model.put("basePath", basePath);
    	return "/recommendflow/interview";
    }
    
    
    /**
     * 跳转到导出界面
     * 
     * @return
     */
    @RequestMapping(value = "/export")
    public String export(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model,HttpServletResponse response,HttpServletRequest request)throws Exception {
    	String host = "http://"+request.getHeader("Host");
    	String responseContent=HttpRequest.sendGet(host+"/zpRecommendExportInfo/show.action","id="+id);
    	ZpCompanyJobInfo companyJob = this.zpCompanyJobInfoService.getZpCompanyJobInfoById(id);
    	writeFile(response, companyJob.getCompanyName()+"_"+companyJob.getName()+".html", responseContent, "text/html");
    	return null;
    }
    
    
    public void writeFile(HttpServletResponse response,String fileName,String content,String contentType ) throws IOException{
    	response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename="+ java.net.URLEncoder.encode(fileName, "UTF-8"));
        //response.setContentType("application/msword;charset=UTF-8");
        response.setContentType("application/pdf;charset=UTF-8");
        // 解决ie6下，保存错误问题
        response.setHeader("Pragma", "public");
        response.setHeader("Cache-Control", "public");
        IOUtils.write(content.getBytes("UTF-8"), response.getOutputStream());
        
    }
    
    
    
    

}
