package com.loiot.baqi.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.commons.message.email.EmailClient;
import com.loiot.baqi.commons.message.email.SimpleEmailVo;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.timeloit.pojo.Account;

/**
 * hr(人力资源hr) 处理器。
 * ZpHrInfo
 * @author  wangzx 
 * @creation 2015-09-03
 */


@Controller
@RequestMapping(value = "/zpHrInfo")
public class ZpHrInfoController {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "hr(人力资源hr)已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpHrInfoService zpHrInfoService;
    
    @Resource
	private ZpEmalTemplateService zpEmalTemplateService;
	
	private ZpHrInfo zpHrInfo;
	
    @Autowired
    private EmailClient emailClient;
	
	/**
     * 跳转  hr(人力资源hr)列表页
     * 
     * @return 模板位置
	 * @throws Exception 
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
            @RequestParam(value = "qqName",defaultValue="") String qqName,
            @RequestParam(value = "qqNumber",defaultValue="") String qqNumber,
            @RequestParam(value = "sendStatus",defaultValue="") String sendStatus,
            ModelMap model) throws Exception {
        HashMap<String,Object> pMap = new HashMap<String,Object>();
        if(qqName.length()>0)
        pMap.put("qqName", qqName);
        if(qqNumber.length()>0)
        pMap.put("qqNumber", qqNumber);
        pMap.put("sendStatus", sendStatus);
        
        pMap.put("qtype", "like");
        Pager<ZpHrInfo> pager = zpHrInfoService.queryZpHrInfoListPage(pMap, pageIndex);
        model.put("pager", pager);
        model.put("qqName", qqName);
        model.put("qqNumber", qqNumber);
        model.put("sendStatus", sendStatus);
        
        //查询模版
        pMap.clear();
        pMap.put("qtype", "hr");
        Pager<ZpEmalTemplate> templateListPage=zpEmalTemplateService.queryZpEmalTemplateListPage(pMap, 0);
        model.put("templateListPage",templateListPage);
        if(templateListPage.getData()!=null && templateListPage.getData().size()>0){
            model.put("templateSubject",templateListPage.getData().get(0).getTemplateSubject());
            model.put("templateContent",templateListPage.getData().get(0).getTemplateContent());
        }
        return "/zpHrInfo/zpHrInfo_list";
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAddZpHrInfo(ModelMap model) {
        
        return "/zpHrInfo/zpHrInfo_add";
    }

    /**
     * 添加  hr(人力资源hr)
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object addZpHrInfo(ZpHrInfo p,HttpSession session) {
        try {
        	//验证唯一性
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("qqNumber", p.getQqNumber());
        	int result=zpHrInfoService.getZpHrInfoListCount(pMap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	// 获得账号
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
            p.setInPerson(account.getAccountId());
            p.setInTime(new Date());
        	zpHrInfoService.addZpHrInfo(p);
		} catch (Exception e) {
			e.printStackTrace();
			 //失败
	        return AjaxResponse.FAILED;
			
		}
        // 添加成功
        return AjaxResponse.OK;
    }

    /**
     * 跳转到编辑页面
     * 
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/toEdit")
    public String toEditZpHrInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model) throws Exception {
        model.put("p",  zpHrInfoService.getZpHrInfoById(id));
        return "/zpHrInfo/zpHrInfo_edit";
    }

    /**
     * 更新 hr(人力资源hr)
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object editZpHrInfo(ZpHrInfo p) {
        try {
        	zpHrInfoService.updateZpHrInfo(p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			  return AjaxResponse.FAILED;
		}
        return AjaxResponse.OK;
    }

    /**
     * 跳转到查看页面
     * 
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/toView")
    public String toViewZpHrInfo(@RequestParam(value = "id", required = true) java.lang.Long id, ModelMap model) throws Exception {
        model.put("p", zpHrInfoService.getZpHrInfoById(id));
        return "/zpHrInfo/zpHrInfo_view";
    }

    /**
     * 删除  hr(人力资源hr)
     * 
     * @param id ZpHrInfoID
     * @throws Exception 
     */
    @RequestMapping(value = "/delete")
    public String deleteZpHrInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request) throws Exception {
        zpHrInfoService.deleteZpHrInfo(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/zpHrInfo/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * 删除  hr(人力资源hr)
     * 
     * @param id ZpHrInfoID
     * @throws Exception 
     */
    @RequestMapping(value = "/ajaxDelete")
    @ResponseBody
    public Object ajaxDeleteZpHrInfo(@RequestParam(value = "id", required = true) java.lang.Long id,HttpServletRequest request) {
        try {
        	ZpHrInfo p = new ZpHrInfo();
        	p.setHrId(id);
			zpHrInfoService.deleteZpHrInfo(p);
			return AjaxResponse.OK;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return AjaxResponse.FAILED;
		}
    }
    
    /**
     * 发送邮件
     * 
     * @param id ZpHrInfoID
     * @throws Exception 
     * @throws Exception 
     */
    @RequestMapping(value = "/sendMail")
    @ResponseBody
    public Object sendMail(HttpServletRequest request) throws Exception {
    	String ids[] = request.getParameter("ids").split(",");
    	for(int i=0;i<ids.length;i++){
    		String hrId = ids[i];
    		ZpHrInfo o = new ZpHrInfo();
    		o.setHrId(Long.parseLong(hrId));
    		o.setLastSendTime(new Date());
    		o.setSendStatus(1);
    		//zpHrInfoService.updateZpHrInfo(o);
    	}
    	
    	final String templateSubject=request.getParameter("templateSubject");
    	final String desc=request.getParameter("desc");

    	  new Thread(){
              @Override
              public void run() {
                  SimpleEmailVo vo = new SimpleEmailVo();
                  vo.setContent(desc);
                  vo.addEmail("zkq001003@163.com");
                  vo.addEmail("273035735@qq.com");
                  vo.setTitle(templateSubject);
                  emailClient.send(vo);
              }
              
          }.start();
    	
    	
    	
    	return AjaxResponse.OK;
    }
    
    

}
