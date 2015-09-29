package com.loiot.baqi.utils;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class JLBUtils {
	
	public static String dealDeEducation(String str){
		if(str!=null && "大专".equals(str))
		str="专科";
		str=str.replace(" ", "");
		return str;
	}
	
	public static String dealbirthday(String str){
		 str= str.replace("年", "-").replace("月", "-").replace("/", "-").replace(".", "-").replace("\\", "-");
		 str=str+"-01";
		 return str;
	}
	
	public static String englishLevel(String str){
		if(str!=null && ("英语四级".equals(str) || "CET-4".equalsIgnoreCase(str)))
	    str="四级";
		if(str!=null && ("英语六级".equals(str) || "CET-6".equalsIgnoreCase(str)))
	    str="六级";
		if(str!=null && ("英语八级".equals(str) || "CET-8".equalsIgnoreCase(str)))
		str="八级";
		return str;
	}
	

}
