package com.loiot.baqi.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		if (subject.isPermitted("productClass:list")) {
			// 产品分类
			return "redirect:/product/class/list.action";
		} else if (subject.isPermitted("product:list")) {
			// 产品管理
			return "redirect:/product/management/list.action";
		} else if (subject.isPermitted("sn:list")) {
			// 序列号管理
			return "redirect:/product/serialnumber/list.action";
		} else if (subject.isPermitted("user:list")) {
			// 网站用户
			return "redirect:/user/list.action";
		} else if (subject.isPermitted("role:list")) {
			// 后台角色
			return "redirect:/account/role/list.action";
		} else if (subject.isPermitted("account:list")) {
			// 后台账号
			return "redirect:/account/list.action";
		}
		else if (subject.isPermitted("customer:list")) {
            //客户帐号
            return "redirect:/customer/list.action";
        }
		else {
			// 什么角色都没有就到密码修改，一般没有这个情况
			return "redirect:/password.action";
		}
	    
	}
}
