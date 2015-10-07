package com.loiot.baqi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.constant.DictionaryUtil;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.ZpCompanyJobInfoDao;
import com.loiot.baqi.dao.ZpJlInfoDao;
import com.loiot.baqi.dao.ZpJobMatchingInfoDao;
import com.loiot.baqi.dao.ZpJobMatchingKeysDao;
import com.loiot.baqi.service.ZpJobMatchingInfoService;
import com.loiot.baqi.status.JobMatchType;
import com.loiot.baqi.status.MatchKeywordType;
import com.loiot.baqi.utils.RegexpUtils;
import com.loiot.baqi.pojo.ZpCompanyJobDemandKeys;
import com.loiot.baqi.pojo.ZpCompanyJobInfo;
import com.loiot.baqi.pojo.ZpJlInfo;
import com.loiot.baqi.pojo.ZpJlJobLevels;
import com.loiot.baqi.pojo.ZpJobMatchingInfo;
import com.loiot.baqi.pojo.ZpJobMatchingKeys;
import com.loiot.commons.utils.DateUtil;

/**
 * 职位匹配信息 逻辑类。
 * 
 * @author  wangzx 
 * @creation 2015-10-03
 */
@Service("zpJobMatchingInfoService")
@Transactional
public class ZpJobMatchingInfoService{
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpJobMatchingInfoDao zpJobMatchingInfoDao;
    
   /* @Resource
   	private ZpCompanyInfoDao zpCompanyInfoDao;*/
    
    @Resource
	private ZpCompanyJobInfoDao zpCompanyJobInfoDao;
    
    @Resource
   	private ZpJlInfoDao zpJlInfoDao;
    
    @Resource
	private ZpJobMatchingKeysDao zpJobMatchingKeysDao;
	
	
	 /**
     * 查询 职位匹配信息列表分页
     * 
     * @param name 职位匹配信息名称
     * @param pageIndex 页索引
     * @return
     */
    public Pager<ZpJobMatchingInfo> queryZpJobMatchingInfoListPage(HashMap<String,Object> pMap, int pageIndex)throws Exception {

        // 查询职位匹配信息列表总条数
        int totalResults = zpJobMatchingInfoDao.getZpJobMatchingInfoListCount(pMap);

        // 构造一个分页器
        Pager<ZpJobMatchingInfo> pager = new Pager<ZpJobMatchingInfo>(totalResults, pageIndex);

        // 查询职位匹配信息列表
        List<ZpJobMatchingInfo> zpJobMatchingInfoList = zpJobMatchingInfoDao.queryZpJobMatchingInfoList(pMap, pager.getSkipResults(),
                pager.getMaxResults());
        pager.setData(zpJobMatchingInfoList);
        return pager;
    }
	
	 /**
     * 添加 职位匹配信息
     * 
     * @param p 参数对象
     */
    public ZpJobMatchingInfo addZpJobMatchingInfo(ZpJobMatchingInfo p)throws Exception {
       return  zpJobMatchingInfoDao.addZpJobMatchingInfo(p);
    }
    
    /**
     * 修改 职位匹配信息
     * 
     * @param p 参数对象
     */
    public void updateZpJobMatchingInfo(ZpJobMatchingInfo p)throws Exception {
        zpJobMatchingInfoDao.updateZpJobMatchingInfo(p);
    }
    
    /**
     * 删除  职位匹配信息
     * 
     * @param id 主键
     */
    public void deleteZpJobMatchingInfo(java.lang.Long id)throws Exception {
        zpJobMatchingInfoDao.deleteZpJobMatchingInfo(id);
    }
    
    /**
     * 删除  职位匹配信息
     * 
     * @param id 主键
     */
    public void deleteZpJobMatchingInfo(ZpJobMatchingInfo p)throws Exception {
        zpJobMatchingInfoDao.deleteZpJobMatchingInfo(p);
    }
    
    /**
     * 获得  职位匹配信息
     * 
     * @param id 职位匹配信息Id
     * 
     * @return 返回与ID匹配的职位匹配信息
     */
    public ZpJobMatchingInfo getZpJobMatchingInfoById(java.lang.Long id)throws Exception {
        return  zpJobMatchingInfoDao.getZpJobMatchingInfoById(id);
    }
    
    /**
     * 获得  职位匹配信息
     * 
     * @param name 职位匹配信息名称
     * 
     * @return 返回与NAME匹配的职位匹配信息
     */
    public ZpJobMatchingInfo getZpJobMatchingInfoByName(String name)throws Exception {
        return  zpJobMatchingInfoDao.getZpJobMatchingInfoByName(name);
    }
    
    /**
     * 查询 职位匹配信息列表
     * @return 职位匹配信息列表
     */
    public List<ZpJobMatchingInfo> queryZpJobMatchingInfoList(HashMap<String,Object> pMap)throws Exception {
        return  zpJobMatchingInfoDao.queryZpJobMatchingInfoList(pMap);
    }
    
    /**
     * 查询 职位匹配信息列表
     * @return 职位匹配信息列表
     */
    public List<ZpJobMatchingInfo> queryZpJobMatchingInfoList(ZpJobMatchingInfo p)throws Exception {
        return  zpJobMatchingInfoDao.queryZpJobMatchingInfoList(p);
    }
    
    /**
     * 查询  职位匹配信息列表条数
     * 
     * @param name 职位匹配信息名称
     * @return 职位匹配信息列表条数
     */
    
    public int getZpJobMatchingInfoListCount(HashMap<String,Object> pMap)throws Exception {
        return  zpJobMatchingInfoDao.getZpJobMatchingInfoListCount(pMap);
    }
    
    /**
     * 如果有匹配的记录职位信息就删除掉
     * @param jlId
     * @throws Exception 
     */
    public void batchDeleteMatchRecod(Long jlId) throws Exception{
    	ZpJobMatchingInfo  p = new ZpJobMatchingInfo();
    	p.setJlId(jlId);
    	zpJobMatchingInfoDao.deleteZpJobMatchingInfo(p);
    }
    
    
    public void matchJob(Long jlId) throws Exception{
    	//强制删除匹配信息
    	batchDeleteMatchRecod(jlId);
    	//以下匹配职位信息
    	ZpJlInfo jl = zpJlInfoDao.getZpJlInfoById(jlId);
    	HashMap<String, Object> pMap  = new  HashMap<String, Object>();
    	//pMap.put("typeId", jl.getJobPositionId());
    	
    	if(jl.getZpJlJobLevels()!=null){
    		List<Long> ids = getIds(jl.getZpJlJobLevels());
    		pMap.put("ids",ids);
    	}
    	List<ZpCompanyJobInfo> JobList = this.zpCompanyJobInfoDao.queryZpCompanyJobInfoList(pMap);
    	 matchJob(jl, JobList);
    }
    
    
    /**
     * 查询id集合
     * @return
     */
    public List<Long> getIds(List<ZpJlJobLevels> list) {
    	List<Long> idsList = null;
        if(list!=null && list.size()>0) {
        	idsList = new ArrayList<Long>();
        	for (ZpJlJobLevels b : list) {
            	idsList.add(b.getJobLevelId());
            }
        }
        return idsList;
    }
    
    
    
    public void matchJob(ZpJlInfo jl,List<ZpCompanyJobInfo> JobList) throws Exception{
    	ZpJobMatchingInfo matchBean = null;

    	for(ZpCompanyJobInfo job : JobList){
    		matchBean = new ZpJobMatchingInfo();
        	matchBean.setJobId(job.getJobId());
        	matchBean.setJlId(jl.getJlId());
    		//性别
    		if(job.getSex()!=null){
    			matchBean.setSexStatus((int)JobMatchType.UNMATCH.getCode());
    			if(jl.getSex()!=null && job.getSex() == jl.getSex()){
    				matchBean.setSexStatus((int)JobMatchType.ALREADY_MATCH.getCode());
    			}
    		}

    		//职位级别
    		if(job.getJobPositionLevelId()!=null){
    			matchBean.setJobPositionLevelIdStatus((int)JobMatchType.UNMATCH.getCode());
    			if(jl.getJobPositionLevelId()!=null && job.getJobPositionLevelId() == jl.getJobPositionLevelId()){
    				matchBean.setJobPositionLevelIdStatus((int)JobMatchType.ALREADY_MATCH.getCode());
    			}
    		}
    		//学历
    		if(job.getEducationId()!=null){
    			String jobEdStr = DictionaryUtil.getBean(job.getEducationId()).getValue();
				matchBean.setEducationIdStatus((int)JobMatchType.UNMATCH.getCode());
				if(jl.getEducationId()!=null){
					String jlEdStr = DictionaryUtil.getBean(jl.getEducationId()).getValue();
	    			if(Integer.parseInt(jobEdStr)<=Integer.parseInt(jlEdStr)){
	    				matchBean.setEducationIdStatus((int)JobMatchType.ALREADY_MATCH.getCode());
	    			}
				}
    		}
    		//婚否
    		if(job.getMaritalId()!=null){
				matchBean.setMaritalIdStatus((int)JobMatchType.UNMATCH.getCode());
    			if(jl.getMaritalId()!=null && job.getMaritalId()== jl.getMaritalId()){
    				matchBean.setMaritalIdStatus((int)JobMatchType.ALREADY_MATCH.getCode());
    			}
    		}
    		//匹配工作年限
    		this.matchWorkYear(matchBean,job,jl);
    		
    		// 匹配薪水
    		this.matchExpectedYearMoney(matchBean, job, jl);
    		
    		//匹配年龄
    		this.matchAgeRange(matchBean, job, jl);
    		
    		//匹配专业
    		if(!StringUtils.isBlank(job.getTopSpecialty())){
				matchBean.setTopSpecialtyStatus((int)JobMatchType.UNMATCH.getCode());
    			if(!StringUtils.isBlank(jl.getTopSpecialty()) && jl.getTopSpecialty().indexOf(job.getTopSpecialty() )!=-1){
    				matchBean.setTopSpecialtyStatus((int)JobMatchType.ALREADY_MATCH.getCode());
    			}
    		}
    		
    		//匹配职位关键字
    		if(job.getKeys()!=null) {
    			dealMatchKeys(job.getKeys(),jl, matchBean);
    		}
    	
    		//matchBean.setJobPositionIdStatus((int)JobMatchType.NO_SETTING_CONDITION.getCode());
    		
    	
    		//保存匹配结果
    		this.zpJobMatchingInfoDao.addZpJobMatchingInfo(matchBean);
    		//newList.add(matchBean);
    	}
    	
    	//System.out.println("matchBean:" + matchBean.getJobStarttimeStatus());
    	//System.out.println("matchBean:" + matchBean);
    	//HashMap<String,Object> pMap = new HashMap<String, Object>();
    	//pMap.put("jobId", matchBean.getJobId());		
    	//return this.queryZpJobMatchingInfoList(pMap);
    }
    
    /**
     * 匹配工作年限
     * @param matchBean
     * @param job
     * @param jl
     */
    public void matchWorkYear(ZpJobMatchingInfo matchBean,ZpCompanyJobInfo job,ZpJlInfo jl){
    	//工作年限
		if((job.getWorkTermStart()!=null || job.getWorkTermEnd()!=null) && jl.getJobStartTime()!=null) {
			Integer startY = job.getWorkTermStart();
			Integer endY = job.getWorkTermEnd();
			String jlStartTimeStr = DateUtil.toString(jl.getJobStartTime(), DateUtil.DEFAULT_SHORT_FORMAT);
			int diffYear = DateUtil.compareDate(jlStartTimeStr, null, 2); 
			String  startMatchFlag ="";
			String  endMatchFlag ="";
			if(startY!=null && diffYear>=startY){
				startMatchFlag="match";
				System.out.println("startY:" + startY + "diffYear:" + diffYear );
			} else {
				startMatchFlag="nomatch";
				System.out.println(" no match startY:" + startY + "diffYear:" + diffYear );
			}
			if(endY!=null && diffYear<=endY){
				endMatchFlag="match";
			} else {
				endMatchFlag="nomatch";
				System.out.println(" no match endY:" + endY + "diffYear:" + diffYear );
			}
			
			if(startY!=null && endY!=null){
				if(startMatchFlag.equals("match") &&  endMatchFlag.equals("match")){
					matchBean.setJobStarttimeStatus((int)JobMatchType.ALREADY_MATCH.getCode());
				} else {
					matchBean.setJobStarttimeStatus((int)JobMatchType.UNMATCH.getCode());
				}
			}else
			if(startY!=null){
				if(startMatchFlag.equals("match")){
					matchBean.setJobStarttimeStatus((int)JobMatchType.ALREADY_MATCH.getCode());
				}else {
					matchBean.setJobStarttimeStatus((int)JobMatchType.UNMATCH.getCode());
				}
			}else
			if(endY!=null){
				if(endMatchFlag.equals("match")){
					matchBean.setJobStarttimeStatus((int)JobMatchType.ALREADY_MATCH.getCode());
				}else {
					matchBean.setJobStarttimeStatus((int)JobMatchType.UNMATCH.getCode());
				}
			}
		}
    }
    
    /**
     * 匹配薪水
     * @param matchBean
     * @param job
     * @param jl
     */
    public void matchExpectedYearMoney(ZpJobMatchingInfo matchBean,ZpCompanyJobInfo job,ZpJlInfo jl){
		Double moneyS = job.getExpectedYearMoneyStart();
		Double moneyE = job.getExpectedYearMoneyEnd();
		String  startMatchFlag ="";
		String  endMatchFlag="";
		String resultMatchFlag="";
		if(moneyS!=null){
			Long jlMoneyS= jl.getSalaryRequireId();
			if(jlMoneyS!=null){
				 double jlm = Double.parseDouble(DictionaryUtil.getBean(jlMoneyS).getValue().split(",")[0]);
				 startMatchFlag="nomatch";
				 if(moneyS<=jlm){
					 startMatchFlag="match";
				 }
			}
		}
		
		if(moneyE!=null){
			Long jlMoneyE= jl.getSalaryRequireId();
			if(jlMoneyE!=null){
				endMatchFlag="nomatch";
				 double jlm = Double.parseDouble(DictionaryUtil.getBean(jlMoneyE).getValue().split(",")[1]);
				 if(moneyE>=jlm){
					 endMatchFlag="match";
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
		if(resultMatchFlag.equals("match")){
			matchBean.setSalaryRequireIdStatus((int)JobMatchType.ALREADY_MATCH.getCode());
		} else
		if(resultMatchFlag.equals("nomatch")){
			matchBean.setSalaryRequireIdStatus((int)JobMatchType.UNMATCH.getCode());
		}	
    }
    
    /**
     * 匹配年龄范围
     * @param matchBean
     * @param job
     * @param jl
     */
    public void matchAgeRange(ZpJobMatchingInfo matchBean,ZpCompanyJobInfo job,ZpJlInfo jl){
    	Integer ageS = job.getAgeStart();
		Integer ageE = job.getAgeEnd();
		String  startMatchFlag ="";
		String  endMatchFlag="";
		String resultMatchFlag="";
		if(ageS!=null){
			if(jl.getBirthday()!=null){
				String jlBirthdayStr = DateUtil.toString(jl.getBirthday(), DateUtil.DEFAULT_SHORT_FORMAT);
				Integer diffYear = DateUtil.compareDate(jlBirthdayStr, null, 2); 
				 startMatchFlag="nomatch";
				 if(ageS<=diffYear){
					 startMatchFlag="match";
				 }
			}
		}
		
		if(ageE!=null){
			if(jl.getBirthday()!=null){
				String jlBirthdayStr = DateUtil.toString(jl.getBirthday(), DateUtil.DEFAULT_SHORT_FORMAT);
				Integer diffYear = DateUtil.compareDate(jlBirthdayStr, null, 2); 
				endMatchFlag="nomatch";
				 if(ageE>=diffYear){
					 endMatchFlag="match";
				 } 
			}
		}
		
		if(ageS!=null && ageE!=null){
			if(startMatchFlag.equals("match") &&  endMatchFlag.equals("match")){
				resultMatchFlag="match"; 
			} else {
				resultMatchFlag="nomatch";
			}
		}else
		if(ageS!=null){
			if(startMatchFlag.equals("match")){
				resultMatchFlag="match"; 
			}else {
				resultMatchFlag="nomatch";
			}
		}else
		if(ageE!=null){
			if(endMatchFlag.equals("match")){
				resultMatchFlag="match"; 
			}else {
				resultMatchFlag="nomatch";
			}
		}
		
		if(resultMatchFlag.equals("match")){
			matchBean.setBirthdayStatus((int)JobMatchType.ALREADY_MATCH.getCode());
		} else
		if(resultMatchFlag.equals("nomatch")){
			matchBean.setBirthdayStatus((int)JobMatchType.UNMATCH.getCode());
		}	
    }
    
    //处理匹配关键字
    public void dealMatchKeys(List<ZpCompanyJobDemandKeys> keys,ZpJlInfo jl,ZpJobMatchingInfo matchBean) throws Exception{
    	matchBean.setKeywordCount(keys.size());
    	
    	int matchCount = 0;
    	if(jl.getJlContent()!=null && jl.getJlContent().length()>0){
    		for(ZpCompanyJobDemandKeys key : keys){
        		boolean b = RegexpUtils.getInstance().isExitsKeyword(key.getKeyword(),jl.getJlContent());
        		ZpJobMatchingKeys jmk = new ZpJobMatchingKeys();
        		jmk.setJlId(jl.getJlId());
        		jmk.setJobId(key.getJobId());
        		jmk.setKeyword(key.getKeyword());
        		if(b){
        			matchCount++;
        			jmk.setIsMatch((int)MatchKeywordType.ALREADY_MATCH.getCode());
        		} else {
        			jmk.setIsMatch((int)MatchKeywordType.UNMATCH.getCode());
        		}
        		zpJobMatchingKeysDao.addZpJobMatchingKeys(jmk);
        	}
    	}
    	matchBean.setKeywordMatchCount(matchCount);
    	//匹配比率
    	int f = 100/keys.size()*matchCount;
    	matchBean.setKeywordPercent(Double.parseDouble(String.valueOf(f)));
    	
    }
	
}
