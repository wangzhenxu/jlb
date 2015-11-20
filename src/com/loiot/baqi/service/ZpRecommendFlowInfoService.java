package com.loiot.baqi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.ZpRecommendFlowInfoDao;
import com.loiot.baqi.service.ZpRecommendFlowInfoService;
import com.loiot.baqi.pojo.ZpRecommendFlowInfo;
import com.loiot.baqi.pojo.ZpJlJobLevels;


/**
 * 推荐流程 逻辑类。
 * 
 * @author  wangzx 
 * @creation 2015-11-20
 */
@Service("zpRecommendFlowInfoService")
@Transactional
public class ZpRecommendFlowInfoService{
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ZpRecommendFlowInfoDao zpRecommendFlowInfoDao;
	
	
	 /**
     * 查询 推荐流程列表分页
     * 
     * @param name 推荐流程名称
     * @param pageIndex 页索引
     * @return
     */
    public Pager<ZpRecommendFlowInfo> queryZpRecommendFlowInfoListPage(HashMap<String,Object> pMap, int pageIndex)throws Exception {

        // 查询推荐流程列表总条数
        int totalResults = zpRecommendFlowInfoDao.getZpRecommendFlowInfoListCount(pMap);

        // 构造一个分页器
        Pager<ZpRecommendFlowInfo> pager = new Pager<ZpRecommendFlowInfo>(totalResults, pageIndex);

        // 查询推荐流程列表
        List<ZpRecommendFlowInfo> zpRecommendFlowInfoList = zpRecommendFlowInfoDao.queryZpRecommendFlowInfoList(pMap, pager.getSkipResults(),
                pager.getMaxResults());
        pager.setData(zpRecommendFlowInfoList);
        return pager;
    }
    
    
    
    
    /**
     * 查询 推荐流程（假）分页
     * 
     * @param name 推荐流程名称
     * @param pageIndex 页索引
     * @return
     */
    public Pager<ZpRecommendFlowInfo> queryFlasePageList(HashMap<String,Object> pMap, int pageIndex)throws Exception {
    	//假分页
    	Pager<ZpRecommendFlowInfo> pager = this.setPkList(pMap,pageIndex);
    	List<ZpRecommendFlowInfo> zpRecommendFlowInfoList = zpRecommendFlowInfoDao.queryZpRecommendFlowInfoList(pMap);
        pager.setData(zpRecommendFlowInfoList);
        return pager;
    }
    
    /**
     * 设置 假分页id集合到Map中
     * @param pMap
     * @param pageIndex
     * @return
     * @throws Exception
     */
    public Pager<ZpRecommendFlowInfo> setPkList(HashMap<String,Object> pMap,int pageIndex) throws Exception{
    	  // 查询职位匹配信息列表总条数
        List<ZpRecommendFlowInfo> list = zpRecommendFlowInfoDao.queryZpRecommendFlowInfoList(pMap);
        // 构造一个分页器
        Pager<ZpRecommendFlowInfo> pager = new Pager<ZpRecommendFlowInfo>(list.size(), pageIndex, 5,list);
        List<ZpRecommendFlowInfo> idsList = pager.getCurrentPageData();
        List<Long> ids =this.getIds(idsList);
        pMap.put("ids", ids);
        return pager;
    }
	
	 /**
     * 添加 推荐流程
     * 
     * @param p 参数对象
     */
    public ZpRecommendFlowInfo addZpRecommendFlowInfo(ZpRecommendFlowInfo p)throws Exception {
       return  zpRecommendFlowInfoDao.addZpRecommendFlowInfo(p);
    }
    
    /**
     * 修改 推荐流程
     * 
     * @param p 参数对象
     */
    public void updateZpRecommendFlowInfo(ZpRecommendFlowInfo p)throws Exception {
        zpRecommendFlowInfoDao.updateZpRecommendFlowInfo(p);
    }
    
    /**
     * 修改 推荐流程
     * 
     * @param p 参数对象
     */
    public void updateZpRecommendFlowInfo(HashMap<String,Object> pMap)throws Exception {
        zpRecommendFlowInfoDao.updateZpRecommendFlowInfo(pMap);
    }
    
    /**
     * 删除  推荐流程
     * 
     * @param id 主键
     */
    public void deleteZpRecommendFlowInfo(java.lang.Long id)throws Exception {
        zpRecommendFlowInfoDao.deleteZpRecommendFlowInfo(id);
    }
    
    /**
     * 删除  推荐流程
     * 
     * @param id 主键
     */
    public void deleteZpRecommendFlowInfo(ZpRecommendFlowInfo p)throws Exception {
        zpRecommendFlowInfoDao.deleteZpRecommendFlowInfo(p);
    }
    
    /**
     * 获得  推荐流程
     * 
     * @param id 推荐流程Id
     * 
     * @return 返回与ID匹配的推荐流程
     */
    public ZpRecommendFlowInfo getZpRecommendFlowInfoById(java.lang.Long id)throws Exception {
        return  zpRecommendFlowInfoDao.getZpRecommendFlowInfoById(id);
    }
    
    /**
     * 获得  推荐流程
     * 
     * @param id 推荐流程Id
     * 
     * @return 返回与ID匹配的推荐流程
     */
    public ZpRecommendFlowInfo getZpRecommendFlowInfoById(java.lang.Long id,Long accountId)throws Exception {
        return  zpRecommendFlowInfoDao.getZpRecommendFlowInfoById(id,accountId);
    }
    
    
    /**
     * 获得  推荐流程
     * 
     * @param id 推荐流程Id
     * 
     */
    public ZpRecommendFlowInfo getZpRecommendFlowInfo(HashMap<String,Object> pMap)throws Exception {
    	return (ZpRecommendFlowInfo) zpRecommendFlowInfoDao.getZpRecommendFlowInfo(pMap);
    }
    /**
     * 获得  推荐流程
     * 
     * @param name 推荐流程名称
     * 
     * @return 返回与NAME匹配的推荐流程
     */
    public ZpRecommendFlowInfo getZpRecommendFlowInfoByName(String name)throws Exception {
        return  zpRecommendFlowInfoDao.getZpRecommendFlowInfoByName(name);
    }
    
    /**
     * 查询 推荐流程列表
     * @return 推荐流程列表
     */
    public List<ZpRecommendFlowInfo> queryZpRecommendFlowInfoList(HashMap<String,Object> pMap)throws Exception {
        return  zpRecommendFlowInfoDao.queryZpRecommendFlowInfoList(pMap);
    }
    
    /**
     * 查询 推荐流程列表
     * @return 推荐流程列表
     */
    public List<ZpRecommendFlowInfo> queryZpRecommendFlowInfoList(ZpRecommendFlowInfo p)throws Exception {
        return  zpRecommendFlowInfoDao.queryZpRecommendFlowInfoList(p);
    }
    
    /**
     * 查询  推荐流程列表条数
     * 
     * @param name 推荐流程名称
     * @return 推荐流程列表条数
     */
    
    public int getZpRecommendFlowInfoListCount(HashMap<String,Object> pMap)throws Exception {
        return  zpRecommendFlowInfoDao.getZpRecommendFlowInfoListCount(pMap);
    }
    
    /**
     * 查询id集合
     * @return
     */
    public List<Long> getIds(List<ZpRecommendFlowInfo> list) {
    	List<Long> idsList = null;
        if(list!=null && list.size()>0) {
        	idsList = new ArrayList<Long>();
        	for (ZpRecommendFlowInfo b : list) {
            	idsList.add(null);
            }
        }
        return idsList;
    }
    
    /**
     * 统计 推荐流程列表
     * 
     * @return 推荐流程列表
     */
    public List<HashMap<String,Object>> statisticsZpRecommendFlowInfoInfo(HashMap<String, Object> pMap )throws Exception {
    	return  zpRecommendFlowInfoDao.statisticsZpRecommendFlowInfoInfo(pMap);
    }
}
