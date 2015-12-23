package com.loiot.baqi.controller;

import java.io.File;
import java.io.IOException;
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
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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
import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.constant.DictionaryUtil;
import com.loiot.baqi.constant.URLConst;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.loiot.baqi.status.AccountType;
import com.loiot.baqi.status.DictionaryType;
import com.loiot.baqi.status.JlAuditType;
import com.loiot.baqi.status.PauseStartType;
import com.loiot.baqi.utils.OSSUtils;
import com.loiot.baqi.utils.UserSessionUtils;
import com.loiot.baqi.utils.WordUtils;
import com.loiot.baqi.vo.JlAuditPersonList;
import com.loiot.commons.utils.DateUtil;
import com.loiot.commons.utils.FileUtil;
import com.loiot.commons.utils.JsonUtil;
import com.loiot.commons.utils.StringUtil;
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
    
    private HashMap<String,Object> pmap = new HashMap<String,Object>();
    
    
    /**
     * 后台用户业务逻辑
     */
    @Resource
    private AccountService accountService;
	
	private ZpJlInfo zpJlInfo;
	 @Resource
	private ZpJlExpandInfoService zpJlExpandInfoService;
	
	
	/**
     * 跳转  简历信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	ZpJlInfo p, ModelMap model)throws Exception {
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	if(paramMap.get("hellpPersonId")!=null){
    		paramMap.put("hellpPersonIdT",paramMap.get("hellpPersonId") );
    		paramMap.remove("hellpPersonId");
    	}
    	paramMap.put("qtype", "like");
    	//用户数据过滤
    	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ||  UserSessionUtils.getAccountType()==AccountType.TECHICAL_AUDIT.getCode()){
    		paramMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	}
        Pager<ZpJlInfo> pager = zpJlInfoService.queryZpJlInfoListPage(paramMap, pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        
        return "/zpJlInfo/zpJlInfo_list";
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
    public Object addZpJlInfo(ZpJlInfo p,HttpSession session,HttpServletRequest request,@RequestParam(value="ui-upload-input") CommonsMultipartFile file 
    		) {
    	try {
    		
    		p.setInTime(new Date());
    		if(p.getHellpPersonId()!=null && p.getHellpPersonId()!=0){
    			p.setInPerson(p.getHellpPersonId());
    		}else {
        		p.setInPerson(UserSessionUtils.getAccount().getAccountId());
    		}
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
    		//验证唯一性
    		if(!this.validateUnique(p.getEmal(),p.getPhone(),null)){
            	return this.NAME_EXIST;
            }
    		
         	if(UserSessionUtils.getAccountType()!=AccountType.ADMIN.getCode() ){
         		pmap.put("startTimeT", DateUtil.getCurrDateStartTime(new Date()));
            	pmap.put("endTimeT", DateUtil.getCurrDateEndTime(new Date()));
            	pmap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
            	pmap.put("jobPositionId", p.getJobPositionId());
            	int count = this.zpJlInfoService.getZpJlInfoListCount(pmap);
            	if(count>=3){
            	    return new AjaxResponse(-2, "每个职位最多上传3个优质简历");
            	}    		
         	}
    		
    		
    		
  		    this.genNewFile(p);
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
    //将临时文件，存储
    public void genNewFile(ZpJlInfo p) throws Exception{
    	 String jlFilePath = p.getJlFilePath();
    	 String filePath = jlFilePath.substring(jlFilePath.lastIndexOf("."));
		 String jobPositionName = DictionaryUtil.getName(p.getJobPositionId());
		 //文件名称（姓名+职位）
		 String fileName = p.getName()+"-" +jobPositionName+"-00"+new Random().nextInt(9)+ filePath;
		 Date currDate = new Date();
		 //文件目录
		 String newFileDir ="/jl/"+jobPositionName+"/"+DateUtil.getYear(currDate)+
				 "/"+DateUtil.getMonth(currDate)+"/"+DateUtil.getDay(currDate)+"/"+fileName;
				 ;
	   // String fileContent = FileUtil.readFileToString();
	    String jlContent = WordUtils.getWordText(ApplicationConst.UPLOAD_JL_PATH+jlFilePath, ApplicationConst.UPLOAD_JL_PATH+jlFilePath);
	    p.setJlContent(jlContent);
	    //FileUtil.copyFile(ApplicationConst.UPLOAD_JL_PATH+jlFilePath,ApplicationConst.UPLOAD_JL_PATH+newFileDir );
	    p.setJlFilePath(newFileDir.substring(1));
	    OSSUtils.uploadFile(newFileDir.substring(1), ApplicationConst.UPLOAD_JL_PATH+jlFilePath,fileName);
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
    		if(!this.validateUnique(null,p.getPhone(),null)){
            	return this.NAME_EXIST;
            }
    	}
    	
    	if((!StringUtils.isBlank(p.getEmal()) &&  !p.getEmal().equals(onlyName))  ){
    		//验证唯一性
    		if(!this.validateUnique(p.getEmal(),null,null)){
            	return this.NAME_EXIST;
            }
    	}
    	if(UserSessionUtils.getAccountType()!=AccountType.ADMIN.getCode() ){
     		pmap.put("startTimeT", DateUtil.getCurrDateStartTime(new Date()));
        	pmap.put("endTimeT", DateUtil.getCurrDateEndTime(new Date()));
        	pmap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
        	pmap.put("jobPositionId", p.getJobPositionId());
        	int count = this.zpJlInfoService.getZpJlInfoListCount(pmap);
        	if(count>=3){
        	    return new AjaxResponse(-2, "每个职位最多上传3个优质简历");
        	}    		
     	}
    	//修改简历文件
    	if(!StringUtil.isBlank(p.getJlFilePath())){
    		String oldFilePath = request.getParameter("oldFilePath");
    		OSSUtils.deleteObject(oldFilePath);
    		this.genNewFile(p);
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
    public Object paseWord(@RequestParam(value="ui-upload-input") CommonsMultipartFile file  ,HttpServletResponse response,HttpServletRequest request) throws Exception {
    	//response.setContentType("text/plain");
    	DiskFileItem fi = (DiskFileItem)file.getFileItem();
        File f = fi.getStoreLocation();
        // TODO
        ZpJlInfo bi=null;
        try {
        	  bi = this.zpJlInfoService.paseWord(f,file,fi.getName());
		} catch (java.lang.ClassNotFoundException e) {
			e.printStackTrace();
			// TODO: handle exception
			return new AjaxResponse(-2, "无法解析此文档，请自行转换word2003格式");
		} catch(java.io.IOException e){
			e.printStackTrace();
			return new AjaxResponse(-2, "无法解析此文档，请自行转换word2003格式");
		}
        //修改时需要验证（如果有简历id，代表修改）
        String jlId = request.getParameter("jlId");
        if(!this.validateUnique(bi.getEmal(),bi.getPhone(),!StringUtil.isBlank(jlId) ? Long.parseLong(jlId) : null )){
        	return this.NAME_EXIST;
        }
        
        AjaxResponse result = AjaxResponse.OK(bi);
    	/*if(f.getSize()>1048576){
    		return "/product/maxUploadExceeded";
    	}else  
    		return "/product/UploadSuccess";*/
        return result;
    }
    
    private File saveFile(String fileName,File uploadFile){
    	// TODO
    	return null;
    }
    
    /**
     * ajax 根据id查询实体bean
     * @return
     */
    @RequestMapping(value = "/getById")
    @ResponseBody
    public Object ajaxGetById(@RequestParam(value = "id", required = true) java.lang.Long id)throws Exception {
    	 ZpJlInfo p=null;
    	//用户数据过滤
     	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ||  UserSessionUtils.getAccountType()==AccountType.TECHICAL_AUDIT.getCode()){
    		  p = zpJlInfoService.getZpJlInfoById(id, UserSessionUtils.getAccount().getAccountId());
    	} else {
  		      p = zpJlInfoService.getZpJlInfoById(id);
    	}
    	if(p==null){
    		return AjaxResponse.NOEXITS;
    	}
    	String content =p.getJlContent();
    	
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
    public boolean  validateUnique(String email,String iphone,Long jlId) throws Exception{
    	
    	boolean b = true;
    	if(email ==null && iphone==null){
    		return b;
    	}
    	//验证 手机号 和邮箱
        HashMap<String,Object> pMap = new HashMap<String,Object>();
        pMap.put("qtype","uniqueValidate");
        
        if(jlId!=null){
        	 pMap.put("notId",jlId);
        }
        pMap.put("phoneT",iphone);
        pMap.put("emalT",email);
        int count = zpJlInfoService.getZpJlInfoListCount(pMap);
        if(count>0){
        	b=false;
        }
        return b;
    }
    
    /**
     * 获取审核人
     * 
     * @param id 
     */
    @RequestMapping(value = "/getAuditPersons")
    @ResponseBody
    public Object getAuditPersons(@RequestParam(value = "jobPositionId", required = true) java.lang.Long jobPositionId,
    		HttpServletRequest request)throws Exception {
    		HashMap<String,Object> pMap = new HashMap<String,Object>();
    		pMap.put("auditPositionId",jobPositionId);
    		pMap.put("type", AccountType.TECHICAL_AUDIT.getCode());
    		pMap.put("isDelete",PauseStartType.START.getCode() );
    		pMap.put("isAcceptAudit", DictionaryUtil.getCode(DictionaryType.ACCEPT_AUDIT.getCode(), "start"));

    		List<Account> accoutList = accountService.queryAccountList(pMap);
    		List<JlAuditPersonList> apList = this.zpJlExpandInfoService.auditPersonStatistics(accoutList);
    	    return AjaxResponse.OK(apList);
    }
    
    /**
     * 分配审核人
     * 
     * @param id 
     */
    @RequestMapping(value = "/assignAuditPerson")
    @ResponseBody
    public Object assignAuditPerson(@RequestParam(value = "jlIds", required = true) String jlIds,
    		@RequestParam(value = "auditPerson", required = true)java.lang.Long auditPerson
    		){
    	try {
    	    List<String> ids = StringUtil.splitToString(jlIds, ",");
    	    for(String id :ids){
    	    	ZpJlInfo fp = this.zpJlInfoService.getZpJlInfoById(Long.parseLong(id));
    	    	if(fp.getJlExpandId()!=null){
    	    		ZpJlExpandInfo exp = new ZpJlExpandInfo();
        	    	exp.setJlExpandId(fp.getJlExpandId());
        	    	exp.setJlId(Long.parseLong(id));
        	    	exp.setTechnicianAuditPerson(auditPerson);
        	    	exp.setTechnicianAuditTime(new Date());
        	    	exp.setAuditTypeId((int)JlAuditType.WAIT_AUDIT.getCode());
    			    zpJlExpandInfoService.updateZpJlExpandInfo(exp);
    	    	}
    	    	
    	    }
    	   } catch (Exception e) {
    		    e.printStackTrace();
       	    	return AjaxResponse.FAILED;
    	   }
    	    return AjaxResponse.OK(null);
    }
    
    
    /**
     * 跳转  技术评审列表
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/auditList")
    public String auditList(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	ZpJlInfo p, ModelMap model)throws Exception {
    	
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	paramMap.put("qtype", "like");
    	//用户数据过滤
    	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
    		paramMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	} else if(UserSessionUtils.getAccountType()==AccountType.TECHICAL_AUDIT.getCode()){
    		paramMap.put("technicianAuditPerson", UserSessionUtils.getAccount().getAccountId());
    		//paramMap.put("auditTypeId", JlAuditType.WAIT_AUDIT.getCode());
    	}
        Pager<ZpJlInfo> pager = zpJlInfoService.queryZpJlInfoListPage(paramMap, pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        
        return "/zpJlInfo/zpJlAudit_list";
    }
    
    /**
     * 跳转到编辑页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAuditJlDetail")
    public String toJlDetail(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap=new HashMap<String,Object>();
    	//用户数据过滤
    	if(UserSessionUtils.getAccountType()==AccountType.ADMIN.getCode() ){
    	} else 
    	if(UserSessionUtils.getAccountType()==AccountType.TECHICAL_AUDIT.getCode() ){
        	pMap.put("technicianAuditPerson", UserSessionUtils.getAccount().getAccountId());
    	} else
    	if(UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() || UserSessionUtils.getAccountType()==AccountType.HR.getCode()  ){
           pMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	}
		pMap.put("jlId", id);
		List<ZpJlInfo> list = this.zpJlInfoService.queryZpJlInfoList(pMap);
		if(list.size()>0){
			ZpJlInfo jl = list.get(0);
			model.put("p",list.get(0));
		}
        return "/zpJlInfo/auditJl_detail";
    }
    
    
    /**
     * 评审完成
     * 
     * @return
     */
    @RequestMapping(value = "/auditOk")
    public String auditOk(@RequestParam(value = "jlId",required = true) java.lang.Long jlId,
    		@RequestParam(value = "auditTypeId",required = true) java.lang.Long auditTypeId,
    		ModelMap model)throws Exception {
    	if(jlId==null || auditTypeId==null){
    		return URLConst.ERROR_URL;
    	}
    	pmap.clear();
    	pmap.put("jlId", jlId);
    	pmap.put("qtype", "one");
    	pmap.put("auditTypeId", auditTypeId);
    	
    	//技术评审
    	if(UserSessionUtils.getAccountType()==AccountType.TECHICAL_AUDIT.getCode() ){
    		pmap.put("technicianAuditPerson", UserSessionUtils.getAccount().getAccountId());
    		this.zpJlExpandInfoService.updateZpJlExpandInfo(pmap);
    	}else 
    	//管理员
    	if(UserSessionUtils.getAccountType()==AccountType.ADMIN.getCode() ){
    		pmap.put("technicianAuditPerson", UserSessionUtils.getAccount().getAccountId());
    		this.zpJlExpandInfoService.updateZpJlExpandInfo(pmap);
    	}
    	return "redirect:/zpJlInfo/auditList.action";
    }
    
    /**
     * 分配审核人
     * 
     * @param id 
     * @throws Exception 
     */
    @RequestMapping(value = "/checkJlCount")
    @ResponseBody
    public Object checkJlCount() throws Exception{
    	pmap.clear();
    	pmap.put("startTimeT", DateUtil.getCurrDateStartTime(new Date()));
    	pmap.put("endTimeT", DateUtil.getCurrDateEndTime(new Date()));
    	pmap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	int count = this.zpJlInfoService.getZpJlInfoListCount(pmap);
    	if(count>=5){
    	    return new AjaxResponse(-2, "每天最多可以上传5个优质简历");
    	}
    	return AjaxResponse.OK(null);
    }
    
    
    
    
    
}
