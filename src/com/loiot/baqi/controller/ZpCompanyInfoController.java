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
import com.loiot.commons.utils.DateUtil;
import com.timeloit.pojo.Account;

/**
 * 公司信息 处理器。
 * ZpCompanyInfo
 * @author  wangzx 
 * @creation 2015-09-29
 */


@Controller
@RequestMapping(value = "/zpCompanyInfo")
public class ZpCompanyInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "公司信息已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpCompanyInfoService zpCompanyInfoService;
	
	private ZpCompanyInfo zpCompanyInfo;
	
	/**
     * 跳转  公司信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		ZpCompanyInfo p, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
    	pMap.put("name", p.getName());
    	pMap.put("scaleId", p.getScaleId());
    	pMap.put("financingLevelId", p.getFinancingLevelId());
    	pMap.put("industryId", p.getIndustryId());
    	pMap.put("companyNature", p.getCompanyNature());


        Pager<ZpCompanyInfo> pager = zpCompanyInfoService.queryZpCompanyInfoListPage(pMap, pageIndex);
        model.put("pager", pager);
        model.put("name", p.getName());
        model.put("scaleId", p.getScaleId());
    	pMap.put("financingLevelId", p.getFinancingLevelId());
    	model.put("industryId", p.getIndustryId());
    	model.put("companyNature", p.getCompanyNature());
        return "/companyInfo/companyInfo_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpCompanyInfo(ModelMap model) {
        
        return "/companyInfo/companyInfo_add";
    }

    /**
     * 添加  公司信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpCompanyInfo(ZpCompanyInfo p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("name", p.getName());
        	int result=zpCompanyInfoService.getZpCompanyInfoListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	p.setRegtime(DateUtil.toDate(request.getParameter("regtime2")));
        	p.setInPerson(account.getUsername());
        	p.setLastUpdateTime(new Date());
    		zpCompanyInfoService.addZpCompanyInfo(p);
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
    public String toEditZpCompanyInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpCompanyInfoService.getZpCompanyInfoById(id));
        return "/companyInfo/companyInfo_edit";
    }

    /**
     * 更新 公司信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpCompanyInfo(ZpCompanyInfo p,HttpSession session,HttpServletRequest request) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=zpCompanyInfoService.getZpCompanyInfoListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        zpCompanyInfoService.updateZpCompanyInfo(p);
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
    public String toViewZpCompanyInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpCompanyInfoService.getZpCompanyInfoById(id));
        return "/companyInfo/companyInfo_view";
    }

    /**
     * 删除  公司信息
     * 
     * @param id ZpCompanyInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpCompanyInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpCompanyInfoService.deleteZpCompanyInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpCompanyInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  公司信息
     * 
     * @param id ZpCompanyInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpCompanyInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpCompanyInfo p = new ZpCompanyInfo();
//        	p.setZpCompanyInfo(id);
			zpCompanyInfoService.deleteZpCompanyInfo(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}