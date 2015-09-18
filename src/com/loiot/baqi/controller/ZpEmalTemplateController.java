package com.loiot.baqi.controller;

import java.util.*;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.dao.*;
import com.loiot.baqi.service.*;
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
 * 邮件模版 处理器。
 * ZpEmalTemplate
 * @author  wangzx 
 * @creation 2015-09-04
 */


@Controller
@RequestMapping(value = "/zpEmalTemplate")
public class ZpEmalTemplateController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "邮件模版已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpEmalTemplateService zpEmalTemplateService;
	
	private ZpEmalTemplate zpEmalTemplate;
	
	/**
     * 跳转  邮件模版列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
            @RequestParam(value = "name", defaultValue = "") String name, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
        Pager<ZpEmalTemplate> pager = zpEmalTemplateService.queryZpEmalTemplateListPage(pMap, pageIndex);
        model.put("pager", pager);
        model.put("name", name);
        return "/zpEmalTemplate/zpEmalTemplate_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpEmalTemplate(ModelMap model) {
        
        return "/zpEmalTemplate/zpEmalTemplate_add";
    }

    /**
     * 添加  邮件模版
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpEmalTemplate(ZpEmalTemplate p) {
    	try {
    		//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	//pMap.put("name", p.getName);
        	int result=zpEmalTemplateService.getZpEmalTemplateListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
    		zpEmalTemplateService.addZpEmalTemplate(p);
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
    public String toEditZpEmalTemplate(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpEmalTemplateService.getZpEmalTemplateById(id));
        return "/zpEmalTemplate/zpEmalTemplate_edit";
    }

    /**
     * 更新 邮件模版
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpEmalTemplate(ZpEmalTemplate p,HttpSession session) {
    	try {
    		// 获得账号
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		p.setUpdateTime(new Date());
    		p.setAccountName(account.getAccountId());
    		zpEmalTemplateService.updateZpEmalTemplate(p);
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
    public String toViewZpEmalTemplate(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpEmalTemplateService.getZpEmalTemplateById(id));
        return "/zpEmalTemplate/zpEmalTemplate_view";
    }

    /**
     * 删除  邮件模版
     * 
     * @param id ZpEmalTemplateID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpEmalTemplate(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpEmalTemplateService.deleteZpEmalTemplate(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpEmalTemplate/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  邮件模版
     * 
     * @param id ZpEmalTemplateID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpEmalTemplate(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpEmalTemplate p = new ZpEmalTemplate();
        	//p.setZpEmalTemplate(id);
			zpEmalTemplateService.deleteZpEmalTemplate(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
