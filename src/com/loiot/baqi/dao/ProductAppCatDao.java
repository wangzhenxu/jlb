package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.ProductApp;
import com.timeloit.pojo.ProductAppCat;
/**
 * 产品分类管理Dao
 * @author wangzx
 */
@Repository("productAppCatDao")
@SuppressWarnings("unchecked")
public class ProductAppCatDao  extends SqlSessionDaoSupport{

    /**
     **********************************产品分类的相关数据操作****************************
     **/ 
    
	/**
	 * 查询产品分类
	 * @param map
	 * @return
	 */
	public List<ProductAppCat> getProClazzListByName(Map<String, Object> map) {
        return getSqlSession().selectList("ProductAppCat.getProduct_Clazz_List",map);
    }

	/**
	 * 查询类别总数
	 * @param map
	 * @return
	 */
	public Integer getProductClassListCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("ProductAppCat.getProductClassListCount",map);
    }
	
	/**
	 * 查询所有产品分类列表
	 * @return
	 */
	public List<ProductAppCat> getProClazzList() {
        return getSqlSession().selectList("ProductAppCat.getProduct_Clazz_AllList");
    }
	
    /**
     * 添加产品分类
     * @param name
     * @return
     */
    public int addProClazz(ProductAppCat cat) {
        return getSqlSession().insert("ProductAppCat.addProduct_Clazz", cat);
    }
    
    /**
     * 删除产品分类
     * @param pcid
     * @return
     */
    public int deleteProClazz(long pcid) {
        // TODO Auto-generated method stub
        return getSqlSession().delete("ProductAppCat.deleteProduct_Clazz", pcid);
    }
    
    /**
     * 更新产品分类
     * @param prodClazz
     * @return
     */
    public int updateProClazz(ProductAppCat prodClazz) {
        // TODO Auto-generated method stub
        return getSqlSession().update("ProductAppCat.updateProduct_Clazz",prodClazz);
    }
   
    /**
     * 是否可以添加产品类别
     * @param name
     * @return
     */
    public boolean isAddClass(String name) {
        Integer count= (Integer) getSqlSession().selectOne("ProductAppCat.isAddClass",name);
         return count>0?false:true;
     }
    
    /**
     * 是否可以删除产品类别
     * @param name
     * @return
     */
    public boolean isDeleteClass(Long pacId) {
        Integer count= (Integer) getSqlSession().selectOne("ProductAppCat.isDeleteClass",pacId);
         return count>0?false:true;
     }
    
    // ******************************************** 产品相关接口 ******************************************** 
    /**
     * 查询所有产品列表
     * @return
     */
    public List<ProductApp> productAppList(Map map) {
        return getSqlSession().selectList("ProductAppCat.productAppList",map);
    }
    
    /**
     * 查询产品分类级联到产品 
     * @return
     */
    public List<ProductAppCat> queryCatCascadeProduct_List() {
        return getSqlSession().selectList("ProductAppCat.queryCatCascadeProduct_List");
    }
    
    
    
    
}
