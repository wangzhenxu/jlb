package com.loiot.baqi.constant;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.loiot.baqi.pojo.ZpDictionaryInfo;
import com.loiot.baqi.utils.IndexInfoSingleTon;
/**
 * 招聘字典 类
 * @author Administrator
 *
 */
public class DictionaryUtil {
	
	public static List<ZpDictionaryInfo> getTypes(int type){
		List<ZpDictionaryInfo> newList = new ArrayList<ZpDictionaryInfo>();
		Map<String,List> maps = IndexInfoSingleTon.getInstance().getIndexInfoMap();
		List<ZpDictionaryInfo> dictList= maps.get(Const.SESSION_DICTIONARYS_KEY);
		for(ZpDictionaryInfo dic : dictList){
			if(dic.getType()!=null && dic.getType()==type){
				newList.add(dic);
			}
		}
		return newList;
	}
}
