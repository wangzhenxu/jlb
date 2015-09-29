package com.loiot.baqi.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexpUtils {
	
	/*public static Matcher  getMatcher(String regexp ,String str){
		Pattern p = Pattern.compile(regexp);
		Matcher matcher = p.matcher(str);
		return matcher;
		
	}*/
	
	
 public List<String[]> matchGroup(String regexp, String data) {  
	 	System.out.println("regexp:"+regexp);
        Pattern p = Pattern.compile(regexp);  
        Matcher matcher = p.matcher(data);
        List<String[]> list = new ArrayList<String[]>();
        int j=0;
        while (matcher.find()) {
        	String args[] = new String[10];
            int length = matcher.groupCount();
            for (int i = 1; i < length + 1; i++) { 
            	System.out.println("j="+j+" 匹配数据：" + matcher.group(i));
            	args[i-1] = matcher.group(i);
            }
            j++;
            list.add(args); 
        }
        return list;  
    } 
 
 public List<String> matchGroupB(String regexp, String data) {  
	 	//System.out.println("regexp:"+regexp);
     Pattern p = Pattern.compile(regexp);  
     Matcher matcher = p.matcher(data);
     List<String> list = new ArrayList<String>();
     int j=0;
     while (matcher.find()) {
    	 if(!list.contains(matcher.group("vv")))
         list.add(matcher.group("vv")); 
     }
     if(list.size()>1){
 	 	System.out.println("cont >1 regexp:"+regexp);
     }
     return list;  
 } 
 
    private static RegexpUtils ru = null;  
    //单太模式  
    public static RegexpUtils getInstance() {  
        if (ru == null) {  
            ru = new RegexpUtils() {  
            };  
        }  
        return ru;  
    }
    
    public static void main(String[] args) {  
    	RegexpUtils ru = RegexpUtils.getInstance();  
        String regexp = "(\\d{3}).(\\d{3}).(\\d{2})";  
        String data = "ldap://444.555.66.152:389/  ldap://111.222.33.152:389/  ";  
        System.out.println("" + ru.matchGroup(regexp, data).size());  
    }  

}
