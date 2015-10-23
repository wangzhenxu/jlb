package com.loiot.baqi.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.loiot.baqi.constant.Const;
import com.timeloit.pojo.Account;

public class UserSessionUtils {
	public static Account getAccount(){
		Subject subject = SecurityUtils.getSubject();
    	Account account =(Account)subject.getSession().getAttribute(Const.SESSION_USER_KEY);
    	return account;
	} 
	
	public static Integer getAccountType(){
		Subject subject = SecurityUtils.getSubject();
    	Account account =(Account)subject.getSession().getAttribute(Const.SESSION_USER_KEY);
    	return account.getType();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
