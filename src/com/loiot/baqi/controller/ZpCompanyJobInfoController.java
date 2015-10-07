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
import com.loiot.baqi.constant.DictionaryUtil;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.Account;

/**
 * 公司职位 处理器。
 * ZpCompanyJobInfo
 * @author  wangzx 
 * @creation 2015-09-30
 */


@Controller
@RequestMapping(value = "/zpCompanyJobInfo")
public class ZpCompanyJobInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "公司职位已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpCompanyJobInfoService zpCompanyJobInfoService;
    
    @Resource
	private ZpCompanyInfoService zpCompanyInfoService;
	
	private ZpCompanyJobInfo zpCompanyJobInfo;
	
	/**
     * 跳转  公司职位列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    	ZpCompanyJobInfo p, ModelMap model,HttpServletRequest request)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
    	pMap.put("name", p.getName());
    	pMap.put("typeId", p.getTypeId());
    	pMap.put("jobPositionLevelId", p.getJobPositionLevelId());
    	pMap.put("expectedYearMoneyStart", p.getExpectedYearMoneyStart());
    	pMap.put("expectedYearMoneyEnd", p.getExpectedYearMoneyEnd());
    	pMap.put("workTermStart", p.getWorkTermStart());
    	pMap.put("workTermEnd", p.getWorkTermEnd());
    	
    	//String expectedYearMoney=request.getParameter("expectedYearMoney");
		/*if(!StringUtil.isBlank(expectedYearMoney)){
			ZpDictionaryInfo dicB=DictionaryUtil.getBean(Long.parseLong(expectedYearMoney));
	    	pMap.put("expectedYearMoneyStart", Double.parseDouble(dicB.getValue().split(",")[0]));
	    	pMap.put("expectedYearMoneyEnd", Double.parseDouble(dicB.getValue().split(",")[1]));
		}*/
    	//pMap.put("qtype", p.getExpectedYearMoney());
    	
        Pager<ZpCompanyJobInfo> pager = zpCompanyJobInfoService.queryZpCompanyJobInfoListPage(pMap, pageIndex);
        model.put("pager", pager);
        model.put("name", p.getName());
        model.put("typeId", p.getTypeId());
        model.put("jobPositionLevelId", p.getJobPositionLevelId());
        model.put("expectedYearMoneyStart", p.getExpectedYearMoneyStart());
        model.put("expectedYearMoneyEnd", p.getExpectedYearMoneyEnd());
        model.put("workTermStart", p.getWorkTermStart());
        model.put("workTermEnd", p.getWorkTermEnd());
        return "/companyJob/companyJob_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpCompanyJobInfo(@RequestParam(value = "companyId", required = true) java.lang.Long companyId,ModelMap model) {
    	  try {
    		 ZpCompanyInfo company = zpCompanyInfoService.getZpCompanyInfoById(companyId);
			model.put("company",company  );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "/companyJob/companyJob_add";
    }

    /**
     * 添加  公司职位
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpCompanyJobInfo(ZpCompanyJobInfo p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
            p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());
    		zpCompanyJobInfoService.addZpCompanyJobInfo(p);
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
    public String toEditZpCompanyJobInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpCompanyJobInfoService.getZpCompanyJobInfoById(id));
        return "/companyJob/companyJob_edit";
    }

    /**
     * 更新 公司职位
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpCompanyJobInfo(ZpCompanyJobInfo p,HttpSession session,HttpServletRequest request) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=zpCompanyJobInfoService.getZpCompanyJobInfoListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        zpCompanyJobInfoService.updateZpCompanyJobInfo(p);
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
    public String toViewZpCompanyJobInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpCompanyJobInfoService.getZpCompanyJobInfoById(id));
        return "/companyJob/companyJob_view";
    }

    /**
     * 删除  公司职位
     * 
     * @param id ZpCompanyJobInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpCompanyJobInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpCompanyJobInfoService.deleteZpCompanyJobInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/companyJob/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  公司职位
     * 
     * @param id ZpCompanyJobInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpCompanyJobInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpCompanyJobInfo p = new ZpCompanyJobInfo();
        	//p.setZpCompanyJobInfo(id);
			zpCompanyJobInfoService.deleteZpCompanyJobInfo(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
