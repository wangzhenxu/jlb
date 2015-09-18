package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.ProductApp;
/**
 * 产品管理Dao
 * @author wangzx
 */
@Repository("productAppDao")
@SuppressWarnings("unchecked")
public class ProductAppDao  extends SqlSessionDaoSupport{

    
	/**
	 * 查询产品信息
	 * @param map
	 * @return
	 */
	public List<ProductApp> getProductAppListByCondtion(Map<String, Object> map) {
        return getSqlSession().selectList("ProductApp.productAppList",map);
    }

	/**
	 * 查询产品总数
	 * @param map
	 * @return
	 */
	public Integer getProductAppListCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("ProductApp.getProductAppListCount",map);
    }
	
	/**
     * 查询一个产品信息
     * @param map
     * @return
     */
    public ProductApp getProductApp_One(Long paId) {
        Map map = new HashMap();
        map.put("paId", paId);
        return (ProductApp) getSqlSession().selectOne("ProductApp.productAppList",map);
    }
	
	
	
	/**
	 * 查询所有产品分类列表
	 * @return
	 */
	public List<ProductApp> getProductApp_AllList() {
        return getSqlSession().selectList("ProductApp.getProductApp_AllList");
    }
	
    /**
     * 添加产品
     * @param name
     * @return
     */
    public Long addProductApp(ProductApp po) {
         getSqlSession().insert("ProductApp.addProductApp", po);
         return po.getPaId();
    }
    
  
    /**
     * 删除产品
     * @param pcid
     * @return
     */
    public int deleteProductApp(long paId) {
        // TODO Auto-generated method stub
        return getSqlSession().delete("ProductApp.deleteProductApp", paId);
    }
    
    /**
     * 更新产品
     * @param prodClazz
     * @return
     */
    public int updateProductApp(ProductApp po) {
        // TODO Auto-generated method stub
        return getSqlSession().update("ProductApp.updateProductApp",po);
    }
   
    /**
     * 是否可以添加产品
     * @param name
     * @return
     */
    public boolean isAdd(Map map) {
        Integer count= (Integer) getSqlSession().selectOne("ProductApp.isAdd",map);
         return count>0?false:true;
     }
    
    /**
     * 是否可以删除产品
     * @param name
     * @return
     */
    public boolean isDelete(Long csId) {
        Integer count= (Integer) getSqlSession().selectOne("ProductApp.isDeleteSolution",csId);
         return count>0?false:true;
     }
    
    
}
