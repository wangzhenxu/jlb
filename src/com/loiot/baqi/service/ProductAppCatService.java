package com.loiot.baqi.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.ProductAppCatDao;
import com.timeloit.pojo.ProductApp;
import com.timeloit.pojo.ProductAppCat;

/**
 * 产品分类管理Service
 * @author wangzx $Id$
 *
 */
@Transactional
@Service("productAppCatService")
public class ProductAppCatService {
    @Resource
    private ProductAppCatDao productAppCatDao;
    private SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    /**
     * 类别查询、分页
     * @param name
     * @param pageIndex
     * @return
     */
    public Pager<ProductAppCat> getProClassListByName(String name,int pageIndex) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("classname", null==name?"":name.trim());
        int totalResults = productAppCatDao.getProductClassListCount(hashMap);
        Pager<ProductAppCat> pager = new Pager<ProductAppCat>(totalResults, pageIndex);
        hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        List<ProductAppCat> productClazzs=productAppCatDao.getProClazzListByName(hashMap);
        pager.setData(productClazzs);
        return pager;
    }
    /**
     * 查询所有产品分类列表
     * @return
     */
    public List<ProductAppCat> getProClazzList() {
        return productAppCatDao.getProClazzList();
    }
    
    public int addProClazz(ProductAppCat cat) {
        return productAppCatDao.addProClazz(cat);
    }
    
    public boolean isAddClass(String name) {
        return productAppCatDao.isAddClass(null==name?name:name.trim());
     }
    
    public int deleteProClazz(long pcid) {
        return productAppCatDao.deleteProClazz(pcid);
    }

    public int updateProClazz(ProductAppCat prodClazz) {
        return productAppCatDao.updateProClazz(prodClazz);
    }
    
    /**
     * 是否可以删除产品类别
     * @param name
     * @return
     */
    public boolean isDeleteClass(Long pacId) {
        return this.productAppCatDao.isDeleteClass(pacId);
     }
    
    
    // ******************************************** 产品相关接口 ******************************************** 
    /**
     * 根据产品分类查询产品
     * @return
     */
    public List<ProductApp> getPoductAppByPacId(Long pacId) {
        Map<String,Object> paraMap = new HashMap<String,Object>();
        paraMap.put("pacId", pacId);
        paraMap.put("publishType", 1);
        List<ProductApp> list = this.productAppCatDao.productAppList(paraMap);
        return list;
    }
    
    /**
     * 查询产品分类级联到产品 
     * @return
     */
    public List<ProductAppCat> queryCatCascadeProduct_List() {
        return this.productAppCatDao.queryCatCascadeProduct_List();
    }
    
}
