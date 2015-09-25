package com.loiot.baqi.constant;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.loiot.baqi.pojo.ZpDictionaryInfo;
import com.loiot.baqi.status.DictionaryType;
import com.loiot.baqi.utils.IndexInfoSingleTon;
/**
 * 招聘字典 类
 * @author Administrator
 *
 */
public class DictionaryUtil {
	
	public static List<ZpDictionaryInfo> getTypes(int type){
		Map<String,List> maps = IndexInfoSingleTon.getInstance().getIndexInfoMap();
		List<ZpDictionaryInfo> dictList= maps.get(Const.SESSION_DICTIONARYS_KEY);
		List<ZpDictionaryInfo> newList = new ArrayList<ZpDictionaryInfo>();
		for(ZpDictionaryInfo dic : dictList){
			if(dic.getType()!=null && dic.getType()==type){
				newList.add(dic);
			}
		}
		return newList;
	}
	
	public static String getName(int code){
		Map<String,List> maps = IndexInfoSingleTon.getInstance().getIndexInfoMap();
		List<ZpDictionaryInfo> dictList= maps.get(Const.SESSION_DICTIONARYS_KEY);
		String name ="";
		for(ZpDictionaryInfo dic : dictList){
			if(dic.getType()==DictionaryType.SALARY_REQUIRE.getCode()){
				name=dic.getName();
			}
		}
		return name;
	}
	
	public static List<ZpDictionaryInfo> getRegexpList(){
		List<ZpDictionaryInfo> newList = new ArrayList<ZpDictionaryInfo>();
		Map<String,List> maps = IndexInfoSingleTon.getInstance().getIndexInfoMap();
		List<ZpDictionaryInfo> dictList= maps.get(Const.SESSION_DICTIONARYS_KEY);
		String name ="";
		for(ZpDictionaryInfo dic : dictList){
			if(dic.getType()==DictionaryType.RESUME_REGEXP.getCode()){
				newList.add(dic);
			}
		}
		return newList;
	}
	
	public static Long getCode(int type,String name){
		Map<String,List> maps = IndexInfoSingleTon.getInstance().getIndexInfoMap();
		List<ZpDictionaryInfo> dictList= maps.get(Const.SESSION_DICTIONARYS_KEY);
		for(ZpDictionaryInfo dic : dictList){
			if(dic.getType()==type || dic.getName().equals(name)){
				return dic.getDictionaryId();
			}
		}
		return null;
	}
}
