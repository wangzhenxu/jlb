package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.ProductAppDao;
import com.loiot.baqi.dao.ProductAppDao;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.ProductApp;

/**
 * 产品管理Service
 * @author wangzx $Id$
 *
 */
@Transactional
@Service("productAppService")
public class ProductAppService {
    @Resource
    private ProductAppDao productAppDao;
   
    
    
    
    /**
     * 查询产品信息
     * @param map
     * @return
     */
    public  Pager<ProductApp> getProductAppListByCondtion(String name,Long pacId,int pageIndex) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("name", StringUtil.isBlank(name) ? null : name.trim());
        hashMap.put("pacId", pacId==0 ? null : pacId);
        int totalResults = productAppDao.getProductAppListCount(hashMap);
        Pager<ProductApp> pager = new Pager<ProductApp>(totalResults, pageIndex);
        hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        List<ProductApp> productClazzs=productAppDao.getProductAppListByCondtion(hashMap);
        pager.setData(productClazzs);
        return pager;
    }
    /**
     * 查询一个产品信息
     * @param map
     * @return
     */
    public ProductApp getProductApp_One(Long csId) {
        return productAppDao.getProductApp_One(csId);
    }
    /**
     * 添加产品
     * @param name
     * @return
     */
    public Long addProductApp(ProductApp po) {
       return  this.productAppDao.addProductApp(po);
    }
    
    /**
     * 更新产品
     * @param prodClazz
     * @return
     */
    public void updateProductApp(ProductApp po) {
        this.productAppDao.updateProductApp(po);
    }
    
   
    /**
     * 删除产品
     * @param pcid
     * @return
     */
    public void deleteProductApp(long paId) {
        this.productAppDao.deleteProductApp(paId);
    }
    /**
     * 是否可以添加产品
     * @param name
     * @return
     */
    public boolean isAdd(Map map) {
        return this.productAppDao.isAdd(map);
     }
    
    /**
     * 是否可以删除产品
     * @param name
     * @return
     */
    public boolean isDeleteSolution(Long paId) {
       return  this.productAppDao.isDelete(paId);
     }
    /**
     * 更新发布状态
     * @param csId
     * @param publishType
     */
    public void modifyPublishType(Long paId,int publishType){
        ProductApp bean = new ProductApp();
        bean.setPaId(paId);
        bean.setPublishType(publishType);
        this.productAppDao.updateProductApp(bean);
    }
}
