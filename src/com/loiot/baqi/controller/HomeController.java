package com.loiot.baqi.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loiot.baqi.status.AccountType;
import com.loiot.baqi.utils.UserSessionUtils;

/**
 * 欢迎页处理器。
 * 
 * @author zhengrj
 * 
 */
@Controller
public class HomeController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 跳转欢迎页
	 * 
	 * @return 首页模板位置
	 */
	@RequestMapping(value = "/welcome")
	public String welcome() {
		Subject subject = SecurityUtils.getSubject();
		
		//没有补充个人信息
		if(StringUtils.isBlank(UserSessionUtils.getAccount().getIphone()) && UserSessionUtils.getAccountType()!=AccountType.ADMIN.getCode()){
			return "redirect:/accountExpandInfo/toEdit.action?id="+UserSessionUtils.getAccount().getExpandId();
		}else
		if (subject.isPermitted("zpJlInfo:list")) {
			//简历管理
            return "redirect:/zpJlInfo/list.action";
		} else if (subject.isPermitted("zpCompanyInfo:list")) {
			//客户管理
			return "redirect:/zpCompanyInfo/list.action";
		}else if (subject.isPermitted("zpCompanyJobInfo:list")) {
			//职位管理
			return "redirect:/zpCompanyJobInfo/list.action";
		}else if (subject.isPermitted("zpJobMatchingInfo:list")) {
			//职位匹配
			return "redirect:/zpJobMatchingInfo/list.action";
		} else if (subject.isPermitted("role:list")) {
			// 后台角色
			return "redirect:/account/role/list.action";
		} else if (subject.isPermitted("account:list")) {
			// 后台账号
			return "redirect:/account/list.action";
		}
		else if (subject.isPermitted("zpJlInfo:auditList")) {
			// 评审管理
			return "redirect:/account/list.action";
		}
		else if (subject.isPermitted("companyInterface:list")) {
			// 企业对接管理
			return "redirect:/zpRecommendFlowInfo/companyInterfaceList.action";
		}
		else if (subject.isPermitted("headhunterInterface:list")) {
			// 猎头对接管理
			return "redirect:/zpRecommendFlowInfo/headhunterInterfaceList.action";
		}else if (subject.isPermitted("zpRecommendFlowInfo:list")) {
			// 流程管理
			return "redirect:/zpRecommendFlowInfo/list.action";
		}
		else {
			// 什么角色都没有就到密码修改，一般没有这个情况
			return "redirect:/password.action";
		}
	}
}
