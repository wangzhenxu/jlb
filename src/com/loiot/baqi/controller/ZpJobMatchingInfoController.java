package com.loiot.baqi.controller;

import java.util.*;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.dao.*;
import com.loiot.baqi.service.*;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.timeloit.pojo.Account;

/**
 * 职位匹配信息 处理器。
 * ZpJobMatchingInfo
 * @author  wangzx 
 * @creation 2015-10-03
 */


@Controller
@RequestMapping(value = "/zpJobMatchingInfo")
public class ZpJobMatchingInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "职位匹配信息已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpJobMatchingInfoService zpJobMatchingInfoService;
	
	/*@Resource
	private ZpCompanyInfoService zpCompanyInfoService;
	
	@Resource
	private ZpCompanyJobInfoService zpCompanyJobInfoService;*/
	
	private ZpJobMatchingInfo zpJobMatchingInfo;
	
	
	
	

	/**
     * 跳转  职位匹配信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/matchCheck")
    @ResponseBody
    public Object matchBeforeCheck(@RequestParam(value = "jlId") Long jlId,
    	 ModelMap model) {
    	HashMap<String,Object> pMap = new HashMap<String, Object>();
    	pMap.put("jobId", jlId);
    	try {
			int count = this.zpJobMatchingInfoService.getZpJobMatchingInfoListCount(pMap);
			if(count>0){
				return this.NAME_EXIST;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return AjaxResponse.FAILED;
		}
		return AjaxResponse.OK;
    	//return "/jobMatchInfo/jobMatchInfo_list";
    }
    /**
     * 跳转  职位匹配信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/match")
    public Object match(@RequestParam(value = "jlId") Long jlId,
    	 ModelMap model) {
    	//List<ZpJobMatchingInfo> list;
		try {
			 zpJobMatchingInfoService.matchJob(jlId);
			//model.put("matchList", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "redirect:/zpJobMatchingInfo/list.action?jobId="+jlId;
    }
    
	
	/**
     * 跳转  职位匹配信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    	ZpJobMatchingInfo p, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
    	pMap.put("jobId", p.getJobId());
        Pager<ZpJobMatchingInfo> pager = zpJobMatchingInfoService.queryZpJobMatchingInfoListPage(pMap, pageIndex);
        model.put("pager", pager);
        //model.put("name", name);
        return "/jobMatchInfo/jobMatchInfo_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpJobMatchingInfo(ModelMap model) {
        
        return "/jobMatchInfo/jobMatchInfo_add";
    }

    /**
     * 添加  职位匹配信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpJobMatchingInfo(ZpJobMatchingInfo p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
        	/*HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("name", p.getName());
        	int result=zpJobMatchingInfoService.getZpJobMatchingInfoListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}*/
        	p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());
    		zpJobMatchingInfoService.addZpJobMatchingInfo(p);
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
    public String toEditZpJobMatchingInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpJobMatchingInfoService.getZpJobMatchingInfoById(id));
        return "/jobMatchInfo/jobMatchInfo_edit";
    }

    /**
     * 更新 职位匹配信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpJobMatchingInfo(ZpJobMatchingInfo p,HttpSession session,HttpServletRequest request) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    	/*if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=zpJobMatchingInfoService.getZpJobMatchingInfoListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}*/
        zpJobMatchingInfoService.updateZpJobMatchingInfo(p);
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
    public String toViewZpJobMatchingInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpJobMatchingInfoService.getZpJobMatchingInfoById(id));
        return "/jobMatchInfo/jobMatchInfo_view";
    }

    /**
     * 删除  职位匹配信息
     * 
     * @param id ZpJobMatchingInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpJobMatchingInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpJobMatchingInfoService.deleteZpJobMatchingInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/jobMatchInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  职位匹配信息
     * 
     * @param id ZpJobMatchingInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpJobMatchingInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpJobMatchingInfo p = new ZpJobMatchingInfo();
        	//p.setZpJobMatchingInfoId(id);
			zpJobMatchingInfoService.deleteZpJobMatchingInfo(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
