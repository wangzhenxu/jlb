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
 * 职位匹配关键字 处理器。
 * ZpJobMatchingKeys
 * @author  wangzx 
 * @creation 2015-10-06
 */


@Controller
@RequestMapping(value = "/zpJobMatchingKeys")
public class ZpJobMatchingKeysController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "职位匹配关键字已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpJobMatchingKeysService zpJobMatchingKeysService;
	
	private ZpJobMatchingKeys zpJobMatchingKeys;
	
	/**
     * 跳转  职位匹配关键字列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    	ZpJobMatchingKeys p, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
        Pager<ZpJobMatchingKeys> pager = zpJobMatchingKeysService.queryZpJobMatchingKeysListPage(pMap, pageIndex);
        model.put("pager", pager);
        //model.put("name", name);
        return "/JobMatchkeys/JobMatchkeys_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpJobMatchingKeys(ModelMap model) {
        
        return "/JobMatchkeys/JobMatchkeys_add";
    }

    /**
     * 添加  职位匹配关键字
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpJobMatchingKeys(ZpJobMatchingKeys p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("name", p.getName());
        	int result=zpJobMatchingKeysService.getZpJobMatchingKeysListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());
    		zpJobMatchingKeysService.addZpJobMatchingKeys(p);
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
    public String toEditZpJobMatchingKeys(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpJobMatchingKeysService.getZpJobMatchingKeysById(id));
        return "/JobMatchkeys/JobMatchkeys_edit";
    }

    /**
     * 更新 职位匹配关键字
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpJobMatchingKeys(ZpJobMatchingKeys p,HttpSession session,HttpServletRequest request) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=zpJobMatchingKeysService.getZpJobMatchingKeysListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        zpJobMatchingKeysService.updateZpJobMatchingKeys(p);
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
    public String toViewZpJobMatchingKeys(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpJobMatchingKeysService.getZpJobMatchingKeysById(id));
        return "/JobMatchkeys/JobMatchkeys_view";
    }

    /**
     * 删除  职位匹配关键字
     * 
     * @param id ZpJobMatchingKeysID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpJobMatchingKeys(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpJobMatchingKeysService.deleteZpJobMatchingKeys(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/JobMatchkeys/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  职位匹配关键字
     * 
     * @param id ZpJobMatchingKeysID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpJobMatchingKeys(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpJobMatchingKeys p = new ZpJobMatchingKeys();
        	//p.setZpJobMatchingKeysId(id);
			zpJobMatchingKeysService.deleteZpJobMatchingKeys(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
