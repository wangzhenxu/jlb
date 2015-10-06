package com.loiot.baqi.utils;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.loiot.baqi.pojo.ZpCompanyJobInfo;
import com.loiot.baqi.pojo.ZpJlInfo;
import com.loiot.baqi.status.JobMatchType;


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
	
	
	public static String  dealYearMoney(Long money){
		String str = "";
		if(money!=null) {
			str=String.valueOf(money/10000);
		}
		return str;
	}
	
	public static String dealWordTerm(Integer start, Integer end ){
		String str="";
		if(start==null && end==null){
			str = "无";
		} else 
		if(start!=null && end==null){
			str = start+"年以上";
		} else
		if(start==null && end!=null){
			str = end+"年以下";
		}
		else
		if(start!=null && end!=null){
			str = start+"-" +end +"年";
		}
		return str;
	}
	
	
	public static void testmoney(){
		ZpJlInfo jl = new ZpJlInfo();
		jl.setSalaryRequireId(2l);
	   
		ZpCompanyJobInfo job = new ZpCompanyJobInfo();
		//job.setExpectedYearMoneyStart(14000d);
		//job.setExpectedYearMoneyEnd(19000d);
		
		Double moneyS = job.getExpectedYearMoneyStart();
		Double moneyE = job.getExpectedYearMoneyEnd();
		String  startMatchFlag ="";
		String  endMatchFlag="";
		String resultMatchFlag="";
		if(moneyS!=null){
			Double jlMoneyS=  15000d;
			if(jlMoneyS!=null){
				 startMatchFlag="nomatch";
				 if(moneyS<=jlMoneyS){
					 startMatchFlag="match";
				 } else {
					 startMatchFlag="nomatch";
				 }
			}
		}
		
		if(moneyE!=null){
			Double jlMoneyE= 20000d;
			if(jlMoneyE!=null){
				endMatchFlag="nomatch";
				 if(moneyE>=jlMoneyE){
					 endMatchFlag="match";
				 } else {
					 endMatchFlag="nomatch";
				 }
			}
		}
		
		if(moneyS!=null && moneyE!=null){
			if(startMatchFlag.equals("match") &&  endMatchFlag.equals("match")){
				resultMatchFlag="match"; 
			} else {
				resultMatchFlag="nomatch";
			}
		}else
		if(moneyS!=null){
			if(startMatchFlag.equals("match")){
				resultMatchFlag="match"; 
			}else {
				resultMatchFlag="nomatch";
			}
		}else
		if(moneyE!=null){
			if(endMatchFlag.equals("match")){
				resultMatchFlag="match"; 
			}else {
				resultMatchFlag="nomatch";
			}
		}
		
	  System.out.println("startMatchFlag:" + startMatchFlag);
	  System.out.println("endMatchFlag:" + endMatchFlag);
	  System.out.println("resultMatchFlag:" + resultMatchFlag);

		
		
		
	}
	
	public static void main(String args[]) {
		
		//System.out.println(JLBUtils.dealYearMoney(500l));;
		JLBUtils.testmoney();
	}
	
	
	
	

}
