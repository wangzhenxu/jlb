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
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;

/**
 * 字典信息 处理器。
 * ZpDictionaryInfo
 * @author  wangzx 
 * @creation 2015-09-19
 */


@Controller
@RequestMapping(value = "/zpDictionaryInfo")
public class ZpDictionaryInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "字典信息已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpDictionaryInfoService zpDictionaryInfoService;
	
	private ZpDictionaryInfo zpDictionaryInfo;
	
	/**
     * 跳转  字典信息列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
            @RequestParam(value = "name", defaultValue = "") String name, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
        Pager<ZpDictionaryInfo> pager = zpDictionaryInfoService.queryZpDictionaryInfoListPage(pMap, pageIndex);
        model.put("pager", pager);
        model.put("name", name);
        return "/zpDictionaryInfo/zpDictionaryInfo_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpDictionaryInfo(ModelMap model) {
        
        return "/zpDictionaryInfo/zpDictionaryInfo_add";
    }

    /**
     * 添加  字典信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpDictionaryInfo(ZpDictionaryInfo p,HttpSession session) {
    	try {
            //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	//pMap.put("name", p.getName);
        	int result=zpDictionaryInfoService.getZpDictionaryInfoListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
    		zpDictionaryInfoService.addZpDictionaryInfo(p);
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
    public String toEditZpDictionaryInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p",  zpDictionaryInfoService.getZpDictionaryInfoById(id));
        return "/zpDictionaryInfo/zpDictionaryInfo_edit";
    }

    /**
     * 更新 字典信息
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpDictionaryInfo(ZpDictionaryInfo p,HttpSession session) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    	//如果前端，没有改变编号，就不用验证
    	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	//pMap.put("name", p.getName);
	    	int result=zpDictionaryInfoService.getZpDictionaryInfoListCount(pMap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        zpDictionaryInfoService.updateZpDictionaryInfo(p);
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
    public String toViewZpDictionaryInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model)throws Exception {
        model.put("p", zpDictionaryInfoService.getZpDictionaryInfoById(id));
        return "/zpDictionaryInfo/zpDictionaryInfo_view";
    }

    /**
     * 删除  字典信息
     * 
     * @param id ZpDictionaryInfoID
     */
    @RequestMapping(value = "/delete")
    public String deleteZpDictionaryInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request)throws Exception {
    	zpDictionaryInfoService.deleteZpDictionaryInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpDictionaryInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  字典信息
     * 
     * @param id ZpDictionaryInfoID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDeleteZpDictionaryInfo(@RequestParam(value = "id", required = true) java.lang.Long id) {
    	try {
    		ZpDictionaryInfo p = new ZpDictionaryInfo();
        	//p.setZpDictionaryInfo(id);
			zpDictionaryInfoService.deleteZpDictionaryInfo(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
