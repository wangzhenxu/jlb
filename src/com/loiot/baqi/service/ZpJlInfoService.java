package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.ZpJlInfoDao;
import com.loiot.baqi.service.ZpJlInfoService;
import com.loiot.baqi.pojo.ZpJlInfo;

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
	
}
