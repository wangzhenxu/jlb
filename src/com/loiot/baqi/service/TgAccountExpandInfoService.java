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
import com.loiot.baqi.dao.TgAccountExpandInfoDao;
import com.loiot.baqi.pojo.TgAccountExpandInfo;


/**
 * 用户扩展信息 逻辑类。
 * 
 * @author  wangzx 
 * @creation 2015-10-21
 */
@Service("tgAccountExpandInfoService")
@Transactional
public class TgAccountExpandInfoService{
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private TgAccountExpandInfoDao tgAccountExpandInfoDao;
	
	
	 /**
     * 查询 用户扩展信息列表分页
     * 
     * @param name 用户扩展信息名称
     * @param pageIndex 页索引
     * @return
     */
    public Pager<TgAccountExpandInfo> queryAccountExpandInfoListPage(HashMap<String,Object> pMap, int pageIndex)throws Exception {

        // 查询用户扩展信息列表总条数
        int totalResults = tgAccountExpandInfoDao.getAccountExpandInfoListCount(pMap);

        // 构造一个分页器
        Pager<TgAccountExpandInfo> pager = new Pager<TgAccountExpandInfo>(totalResults, pageIndex);

        // 查询用户扩展信息列表
        List<TgAccountExpandInfo> accountExpandInfoList = tgAccountExpandInfoDao.queryAccountExpandInfoList(pMap, pager.getSkipResults(),
                pager.getMaxResults());
        pager.setData(accountExpandInfoList);
        return pager;
    }
	
	 /**
     * 添加 用户扩展信息
     * 
     * @param p 参数对象
     */
    public TgAccountExpandInfo addAccountExpandInfo(TgAccountExpandInfo p)throws Exception {
       return  tgAccountExpandInfoDao.addAccountExpandInfo(p);
    }
    
    /**
     * 修改 用户扩展信息
     * 
     * @param p 参数对象
     */
    public void updateAccountExpandInfo(TgAccountExpandInfo p)throws Exception {
        tgAccountExpandInfoDao.updateAccountExpandInfo(p);
    }
    
    /**
     * 删除  用户扩展信息
     * 
     * @param id 主键
     */
    public void deleteAccountExpandInfo(java.lang.Long id)throws Exception {
        tgAccountExpandInfoDao.deleteAccountExpandInfo(id);
    }
    
    /**
     * 删除  用户扩展信息
     * 
     * @param id 主键
     */
    public void deleteAccountExpandInfo(TgAccountExpandInfo p)throws Exception {
        tgAccountExpandInfoDao.deleteAccountExpandInfo(p);
    }
    
    /**
     * 获得  用户扩展信息
     * 
     * @param id 用户扩展信息Id
     * 
     * @return 返回与ID匹配的用户扩展信息
     */
    public TgAccountExpandInfo getAccountExpandInfoById(java.lang.Long id)throws Exception {
        return  tgAccountExpandInfoDao.getAccountExpandInfoById(id);
    }
    
    /**
     * 获得  用户扩展信息
     * 
     * @param name 用户扩展信息名称
     * 
     * @return 返回与NAME匹配的用户扩展信息
     */
    public TgAccountExpandInfo getAccountExpandInfoByName(String name)throws Exception {
        return  tgAccountExpandInfoDao.getAccountExpandInfoByName(name);
    }
    
    /**
     * 查询 用户扩展信息列表
     * @return 用户扩展信息列表
     */
    public List<TgAccountExpandInfo> queryAccountExpandInfoList(HashMap<String,Object> pMap)throws Exception {
        return  tgAccountExpandInfoDao.queryAccountExpandInfoList(pMap);
    }
    
    /**
     * 查询 用户扩展信息列表
     * @return 用户扩展信息列表
     */
    public List<TgAccountExpandInfo> queryAccountExpandInfoList(TgAccountExpandInfo p)throws Exception {
        return  tgAccountExpandInfoDao.queryAccountExpandInfoList(p);
    }
    
    /**
     * 查询  用户扩展信息列表条数
     * 
     * @param name 用户扩展信息名称
     * @return 用户扩展信息列表条数
     */
    
    public int getAccountExpandInfoListCount(HashMap<String,Object> pMap)throws Exception {
        return  tgAccountExpandInfoDao.getAccountExpandInfoListCount(pMap);
    }
    
    /**
     * 查询id集合
     * @return
     */
    public List<Long> getIds(List<TgAccountExpandInfo> list) {
    	List<Long> idsList = null;
        if(list!=null && list.size()>0) {
        	idsList = new ArrayList<Long>();
        	for (TgAccountExpandInfo b : list) {
            	idsList.add(null);
            }
        }
        return idsList;
    }
}
