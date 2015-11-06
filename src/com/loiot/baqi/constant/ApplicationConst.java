package com.loiot.baqi.constant;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

/**
 * 公用静态常量
 * @author FrancisJin
 * @since 2012-01-14
 */
public class ApplicationConst {
	
	/**
	 * 项目相关参数
	 */
	private static ResourceBundle appBundle = PropertyResourceBundle.getBundle("conf/application");
	
    /**
     * 简历上传路径
     */
    public static final String UPLOAD_JL_PATH=appBundle.getString("jl.uplad.path");
    /**
     * 简历访问地址
     */
    public static final String UPLOAD_JL_URL=appBundle.getString("jl.uplad.url");
    
    /**
     * 允许关键字数量
     */
    public static final int ALLOW_JOB_KEYWORD_SIZE=Integer.parseInt(appBundle.getString("company.job.keyword.size"));
    
    
    

	public static void main(String args[]){
      // System.out.println(appBundle.getString("product.upload.pic.path"));
	    
	  String s =   "http://m2.loiot.com/customer/list.action";
	 System.out.println(s.substring(s.indexOf("/customer/"), s.length()));

	}
}
