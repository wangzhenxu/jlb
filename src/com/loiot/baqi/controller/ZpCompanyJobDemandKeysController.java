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
 * 公司职位要求关键字 处理器。
 * ZpCompanyJobDemandKeys
 * @author  wangzx 
 * @creation 2015-10-06
 */


@Controller
@RequestMapping(value = "/zpCompanyJobDemandKeys")
public class ZpCompanyJobDemandKeysController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "公司职位要求关键字已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpCompanyJobDemandKeysService zpCompanyJobDemandKeysService;
	
	private ZpCompanyJobDemandKeys zpCompanyJobDemandKeys;
	
	/**
     * 跳转  公司职位要求关键字列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    	ZpCompanyJobDemandKeys p, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
        Pager<ZpCompanyJobDemandKeys> pager = zpCompanyJobDemandKeysService.queryZpCompanyJobDemandKeysListPage(pMap, pageIndex);
        model.put("pager", pager);
        //model.put("name", name);
        return "/companyJobkeys/companyJobkeys_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpCompanyJobDemandKeys(ModelMap model) {
        
        return "/companyJobkeys/companyJobkeys_add";
    }

    /**
     * 添加  公司职位要求关键字
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpCompanyJobDemandKeys(ZpCompanyJobDemandKeys p,HttpSession session,HttpServletRequest request) {
    	try {
           /* Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("name", p.getName());
        	int result=zpCompanyJobDemandKeysService.getZpCompanyJobDemandKeysListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());*/
    		zpCompanyJobDemandKeysService.addZpCompanyJobDemandKeys(p);
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
    public String toEditZpCompanyJobDemandKeys(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpCompanyJobDemandKeysService.getZpCompanyJobDemandKeysById(id));
        return "/companyJobkeys/companyJobkeys_edit";
    }

    /**
     * 更新 公司职位要求关键字
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpCompanyJobDemandKeys(ZpCompanyJobDemandKeys p,HttpSession session,HttpServletRequest request) {
    	try {
       /* // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=zpCompanyJobDemandKeysService.getZpCompanyJobDemandKeysListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}*/
        zpCompanyJobDemandKeysService.updateZpCompanyJobDemandKeys(p);
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
    public String toViewZpCompanyJobDemandKeys(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpCompanyJobDemandKeysService.getZpCompanyJobDemandKeysById(id));
        return "/companyJobkeys/companyJobkeys_view";
    }

    /**
     * 删除  公司职位要求关键字
     * 
     * @param id ZpCompanyJobDemandKeysID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpCompanyJobDemandKeys(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpCompanyJobDemandKeysService.deleteZpCompanyJobDemandKeys(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/companyJobkeys/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  公司职位要求关键字
     * 
     * @param id ZpCompanyJobDemandKeysID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpCompanyJobDemandKeys(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpCompanyJobDemandKeys p = new ZpCompanyJobDemandKeys();
        	//p.setZpCompanyJobDemandKeysId(id);
			zpCompanyJobDemandKeysService.deleteZpCompanyJobDemandKeys(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
