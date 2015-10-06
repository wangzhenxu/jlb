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
 * 简历职位级别列表 处理器。
 * ZpJlJobLevels
 * @author  wangzx 
 * @creation 2015-10-05
 */


@Controller
@RequestMapping(value = "/zpJlJobLevels")
public class ZpJlJobLevelsController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "简历职位级别列表已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpJlJobLevelsService zpJlJobLevelsService;
	
	private ZpJlJobLevels zpJlJobLevels;
	
	/**
     * 跳转  简历职位级别列表列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    	ZpJlJobLevels p, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
        Pager<ZpJlJobLevels> pager = zpJlJobLevelsService.queryZpJlJobLevelsListPage(pMap, pageIndex);
        model.put("pager", pager);
        //model.put("name", name);
        return "/jlJobLevels/jlJobLevels_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpJlJobLevels(ModelMap model) {
        
        return "/jlJobLevels/jlJobLevels_add";
    }

    /**
     * 添加  简历职位级别列表
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpJlJobLevels(ZpJlJobLevels p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		/*//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("name", p.getName());
        	int result=zpJlJobLevelsService.getZpJlJobLevelsListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());*/
    		zpJlJobLevelsService.addZpJlJobLevels(p);
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
    public String toEditZpJlJobLevels(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpJlJobLevelsService.getZpJlJobLevelsById(id));
        return "/jlJobLevels/jlJobLevels_edit";
    }

    /**
     * 更新 简历职位级别列表
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpJlJobLevels(ZpJlJobLevels p,HttpSession session,HttpServletRequest request) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    /*	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=zpJlJobLevelsService.getZpJlJobLevelsListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}*/
        zpJlJobLevelsService.updateZpJlJobLevels(p);
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
    public String toViewZpJlJobLevels(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpJlJobLevelsService.getZpJlJobLevelsById(id));
        return "/jlJobLevels/jlJobLevels_view";
    }

    /**
     * 删除  简历职位级别列表
     * 
     * @param id ZpJlJobLevelsID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpJlJobLevels(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpJlJobLevelsService.deleteZpJlJobLevels(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/jlJobLevels/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  简历职位级别列表
     * 
     * @param id ZpJlJobLevelsID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpJlJobLevels(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpJlJobLevels p = new ZpJlJobLevels();
        	//p.setZpJlJobLevelsId(id);
			zpJlJobLevelsService.deleteZpJlJobLevels(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
