package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.CmsSolutionDao;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.CmsSolution;
import com.timeloit.pojo.CmsSolutionProductMap;

/**
 * 系统管理Service
 * @author wangzx $Id$
 *
 */
@Transactional
@Service("cmsSolutionService")
public class CmsSolutionService {
    @Resource
    private CmsSolutionDao cmsSolutionDao;
   
    
    
    
    /**
     * 查询系统信息
     * @param map
     * @return
     */
    public  Pager<CmsSolution> getSolutionListByCondtion(String name,Long cscId,int pageIndex) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("name", StringUtil.isBlank(name) ? null : name.trim());
        hashMap.put("cscId", cscId==0 ? null : cscId);
        int totalResults = cmsSolutionDao.getSolutionListCount(hashMap);
        Pager<CmsSolution> pager = new Pager<CmsSolution>(totalResults, pageIndex);
        hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        List<CmsSolution> productClazzs=cmsSolutionDao.getSolutionListByCondtion(hashMap);
        pager.setData(productClazzs);
        return pager;
    }
    /**
     * 查询一个系统信息
     * @param map
     * @return
     */
    public CmsSolution getSolution_One(Long csId) {
        return cmsSolutionDao.getSolution_One(csId);
    }
    /**
     * 添加系统
     * @param name
     * @return
     */
    public Long addSolution(CmsSolution po) {
         long csId = this.cmsSolutionDao.addSolution(po);
         List<CmsSolutionProductMap> relationList = po.getRelationList();
         for(CmsSolutionProductMap bean : relationList){
             bean.setCsId(csId);
             this.cmsSolutionDao.addSolutionProductRelation(bean);
         }
         return csId;
    }
    
    /**
     * 更新系统
     * @param prodClazz
     * @return
     */
    public void updateSolution(CmsSolution po) {
        this.cmsSolutionDao.updateSolution(po);
        List<CmsSolutionProductMap> relationList = po.getRelationList();
        this.cmsSolutionDao.deleteSolutionProductRelation(po.getCsId());
        for(CmsSolutionProductMap bean : relationList){
            bean.setCsId(po.getCsId());
            this.cmsSolutionDao.addSolutionProductRelation(bean);
        }
    }
    
   
    /**
     * 删除系统
     * @param pcid
     * @return
     */
    public void deleteSolution(long pcid) {
        this.cmsSolutionDao.deleteSolution(pcid);
    }
    /**
     * 是否可以添加系统
     * @param name
     * @return
     */
    public boolean isAddSolution(Map map) {
        return this.cmsSolutionDao.isAddSolution(map);
     }
    
    /**
     * 是否可以删除系统
     * @param name
     * @return
     */
    public boolean isDeleteSolution(Long csId) {
       return  this.cmsSolutionDao.isDeleteSolution(csId);
     }
    /**
     * 更新发布状态
     * @param csId
     * @param publishType
     */
    public void modifyPublishType(Long csId,int publishType){
        CmsSolution bean = new CmsSolution();
        bean.setCsId(csId);
        bean.setPublishType(publishType);
        this.cmsSolutionDao.updateSolution(bean);
    }
}
