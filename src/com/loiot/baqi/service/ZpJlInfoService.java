package com.loiot.baqi.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.constant.DictionaryUtil;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.ZpJlInfoDao;
import com.loiot.baqi.service.ZpJlInfoService;
import com.loiot.baqi.status.DictionaryType;
import com.loiot.baqi.status.ResumeMatchingRegexpType;
import com.loiot.baqi.utils.IdcardUtils;
import com.loiot.baqi.utils.JLBUtils;
import com.loiot.baqi.utils.RegexpUtils;
import com.loiot.baqi.utils.WordUtils;
import com.loiot.baqi.pojo.ZpDictionaryInfo;
import com.loiot.baqi.pojo.ZpJlInfo;
import com.loiot.commons.utils.DateUtil;

/**
 * 简历信息 逻辑类。
 * 
 * @author  wangzx 
 * @creation 2015-09-19
 */
@Service("zpJlInfoService")
@Transactional
public class ZpJlInfoService{
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpJlInfoDao zpJlInfoDao;
	
	
	 /**
     * 查询 简历信息列表分页
     * 
     * @param name 简历信息名称
     * @param pageIndex 页索引
     * @return
     */
    public Pager<ZpJlInfo> queryZpJlInfoListPage(HashMap<String,Object> pMap, int pageIndex)throws Exception {

        // 查询简历信息列表总条数
        int totalResults = zpJlInfoDao.getZpJlInfoListCount(pMap);

        // 构造一个分页器
        Pager<ZpJlInfo> pager = new Pager<ZpJlInfo>(totalResults, pageIndex);

        // 查询简历信息列表
        List<ZpJlInfo> zpJlInfoList = zpJlInfoDao.queryZpJlInfoList(pMap, pager.getSkipResults(),
                pager.getMaxResults());
        pager.setData(zpJlInfoList);
        return pager;
    }
	
	 /**
     * 添加 简历信息
     * 
     * @param p 参数对象
     */
    public void addZpJlInfo(ZpJlInfo p)throws Exception {
        zpJlInfoDao.addZpJlInfo(p);
    }
    
    /**
     * 修改 简历信息
     * 
     * @param p 参数对象
     */
    public void updateZpJlInfo(ZpJlInfo p)throws Exception {
        zpJlInfoDao.updateZpJlInfo(p);
    }
    
    /**
     * 删除  简历信息
     * 
     * @param id 主键
     */
    public void deleteZpJlInfo(java.lang.Long id)throws Exception {
        zpJlInfoDao.deleteZpJlInfo(id);
    }
    
    /**
     * 删除  简历信息
     * 
     * @param id 主键
     */
    public void deleteZpJlInfo(ZpJlInfo p)throws Exception {
        zpJlInfoDao.deleteZpJlInfo(p);
    }
    
    /**
     * 获得  简历信息
     * 
     * @param id 简历信息Id
     * 
     * @return 返回与ID匹配的简历信息
     */
    public ZpJlInfo getZpJlInfoById(java.lang.Long id)throws Exception {
        return  zpJlInfoDao.getZpJlInfoById(id);
    }
    
    /**
     * 获得  简历信息
     * 
     * @param name 简历信息名称
     * 
     * @return 返回与NAME匹配的简历信息
     */
    public ZpJlInfo getZpJlInfoByName(String name)throws Exception {
        return  zpJlInfoDao.getZpJlInfoByName(name);
    }
    
    /**
     * 查询 简历信息列表
     * @return 简历信息列表
     */
    public List<ZpJlInfo> queryZpJlInfoList(HashMap<String,Object> pMap)throws Exception {
        return  zpJlInfoDao.queryZpJlInfoList(pMap);
    }
    
    /**
     * 查询 简历信息列表
     * @return 简历信息列表
     */
    public List<ZpJlInfo> queryZpJlInfoList(ZpJlInfo p)throws Exception {
        return  zpJlInfoDao.queryZpJlInfoList(p);
    }
    
    /**
     * 查询  简历信息列表条数
     * 
     * @param name 简历信息名称
     * @return 简历信息列表条数
     */
    
    public int getZpJlInfoListCount(HashMap<String,Object> pMap)throws Exception {
        return  zpJlInfoDao.getZpJlInfoListCount(pMap);
    }
    
    
    public ZpJlInfo paseWord(File file,String fileName) throws Exception{
			String txt = WordUtils.getWordText(file.getPath(),fileName);
			System.out.println("text:" + txt);
			ZpJlInfo zp = this.regxWordKeyword(txt);
		  return zp;
    }
    
    public String getJlRegexp(String regType){
    	 List<ZpDictionaryInfo> regexpList = DictionaryUtil.getRegexpList();
    	 for(ZpDictionaryInfo zi :regexpList){
    		 if(zi.getName().equals(regType)){
    			return zi.getValue(); 
    		 }
    	 }
    	return "";
    }
    
    
    public  ZpJlInfo regxWordKeyword(String content) throws Exception{
    	ZpJlInfo bean = new ZpJlInfo();
    	Matcher matcher=null;
    	String regexpStr=null;
    	List<String> matchs =null;
    	int count=0;
    	String matcherString="";
    	String idcard = "exits";
    	String birthdate="exits";
    	RegexpUtils instance = RegexpUtils.getInstance();
    	
    	
    	
    	matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.ID_CARD_REGEXP.getTitle()), content);
    	//身份证
    	if(matchs.size()==1){
    		matcherString=matchs.get(0);
    		bean.setIdentityCard(matcherString);
    		String sex = IdcardUtils.getGenderByIdCard(matcherString);
    		int age = IdcardUtils.getAgeByIdCard(matcherString);
    		bean.setSex(DictionaryUtil.getCode(DictionaryType.SEX.getCode(), sex));
    		Date new2 = DateUtil.addYear(new Date(), -age);
    		bean.setBirthday(new2);
    	} else {
    		idcard="noExits";
    	}
    	//身份证不存在
    	if(idcard.equals("noExits")){
    		//性别
    		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.SEX_REGEXP.getTitle()), content);
    		if(matchs.size()==1){
    			matcherString=matchs.get(0);
        		bean.setSex(DictionaryUtil.getCode(DictionaryType.SEX.getCode(), matcherString));
    		}
    		
    		// 出生日期
    		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.BIRTHDATE_REGEXP.getTitle()), content);
    		if(matchs.size()==1){
    			matcherString=matchs.get(0);
    			String new1=JLBUtils.dealbirthday(matcherString);
    			Date new2 = DateUtil.toDate(new1);
        		bean.setBirthday(new2);
    		}
    	}
    	
    	//年龄
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.AGE_REGEXP.getTitle()), content);
		if(matchs.size()==1 && bean.getBirthday()==null){
			matcherString=matchs.get(0);
			int ageInt = Integer.parseInt(matcherString);
			Date new2 = DateUtil.addYear(new Date(), -ageInt);
			bean.setBirthday(new2);
		}
    	//姓名
    	matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.NAME_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
			bean.setName(matcherString);
		}
    	//邮箱
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.EMAIL_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
    		bean.setEmal(matcherString);
		}
		
		//手机
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.PHONE_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
    		bean.setPhone(matcherString);
		}
		//最高学校
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.SCHOOLTAG_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
    		bean.setSchoolTag(matcherString);
    		if(matcherString.equals("大学")){
    			Long v = DictionaryUtil.getCode(DictionaryType.EDUCATION.getCode(),JLBUtils.dealDeEducation(matcherString));
    			bean.setEducationId(v);
    		}
		}
		if(bean.getEducationId()==null){
			//学历
			matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.TOP_SCHOOLTAG_REGEXP.getTitle()), content);
			if(matchs.size()>0){
				matcherString=matchs.get(0);
				Long v = DictionaryUtil.getCode(DictionaryType.EDUCATION.getCode(),JLBUtils.dealDeEducation(matcherString));
				bean.setEducationId(v);
			}
		}
		
		//婚否
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.MARITAL_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
    		bean.setMaritalId(DictionaryUtil.getCode(DictionaryType.IS_MARRY.getCode(), matcherString));
		}
		//英语等级 (11)
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.ENGLISH_LEVEL_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
			Long v = DictionaryUtil.getCode(DictionaryType.ENGLISH_LEVEL.getCode(),JLBUtils.englishLevel(matcherString));
			bean.setEnglishLevelId(v);
		}
		//专业
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.TOP_SPECIALTY_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
    		bean.setTopSpecialty(matcherString);
		}
		//工作年限
		matchs = instance.matchGroupB(getJlRegexp(ResumeMatchingRegexpType.JOB_WORK_TERM_REGEXP.getTitle()), content);
		if(matchs.size()==1){
			matcherString=matchs.get(0);
			int new1 = Integer.parseInt(matcherString);
			Date new2 = DateUtil.addYear(new Date(), -new1);
    		bean.setJobStartTime(new2);
		}
		return bean;
	}
	
}
