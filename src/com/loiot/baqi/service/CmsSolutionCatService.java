package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.CmsSolutionCatDao;
import com.timeloit.pojo.CmsSolutionCat;

/**
 * 系统分类管理Service
 * @author wangzx $Id$
 *
 */
@Transactional
@Service("cmsSolutionCatService")
public class CmsSolutionCatService {
    @Resource
    private CmsSolutionCatDao cmsSolutionCatDao;
    /**
     * 类别查询、分页
     * @param name
     * @param pageIndex
     * @return
     */
    public Pager<CmsSolutionCat> getProClassListByName(String name,int pageIndex) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("classname", null==name?"":name.trim());
        int totalResults = cmsSolutionCatDao.getProductClassListCount(hashMap);
        Pager<CmsSolutionCat> pager = new Pager<CmsSolutionCat>(totalResults, pageIndex);
        hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        List<CmsSolutionCat> productClazzs=cmsSolutionCatDao.getProClazzListByName(hashMap);
        pager.setData(productClazzs);
        return pager;
    }
    /**
     * 查询所有系统分类列表
     * @return
     */
    public List<CmsSolutionCat> getProClazzList() {
        return cmsSolutionCatDao.getProClazzList();
    }
    
    /**
     * 查询系统分类(级联)
     * @param map
     * @return
     */
    public List<CmsSolutionCat> getProduct_ClazzSocend_List() {
        return this.cmsSolutionCatDao.getProduct_ClazzSocend_List();
    }
    
    public int addProClazz(CmsSolutionCat cat) {
        return cmsSolutionCatDao.addProClazz(cat);
    }
    
    public boolean isAddClass(String name) {
        return cmsSolutionCatDao.isAddClass(null==name?name:name.trim());
     }
    
    public int deleteProClazz(long pcid) {
        return cmsSolutionCatDao.deleteProClazz(pcid);
    }

    public int updateProClazz(CmsSolutionCat prodClazz) {
        return cmsSolutionCatDao.updateProClazz(prodClazz);
    }
    
    /**
     * 是否可以删除系统类别
     * @param name
     * @return
     */
    public boolean isDeleteClass(Long pacId) {
        return this.cmsSolutionCatDao.isDeleteClass(pacId);
     }
    
}
