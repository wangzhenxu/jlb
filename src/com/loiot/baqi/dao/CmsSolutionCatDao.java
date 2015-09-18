package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.CmsSolutionCat;
/**
 * 系统分类管理Dao
 * @author wangzx
 */
@Repository("cmsSolutionCatDao")
@SuppressWarnings("unchecked")
public class CmsSolutionCatDao  extends SqlSessionDaoSupport{

    /**
     **********************************系统分类的相关数据操作****************************
     **/ 
    
	/**
	 * 查询系统分类
	 * @param map
	 * @return
	 */
	public List<CmsSolutionCat> getProClazzListByName(Map<String, Object> map) {
        return getSqlSession().selectList("CmsSolutionCat.getProduct_Clazz_List",map);
    }
	
	/**
     * 查询系统分类(级联)
     * @param map
     * @return
     */
    public List<CmsSolutionCat> getProduct_ClazzSocend_List() {
        return getSqlSession().selectList("CmsSolutionCat.getProduct_ClazzSocend_List");
    }
	
	

	/**
	 * 查询类别总数
	 * @param map
	 * @return
	 */
	public Integer getProductClassListCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("CmsSolutionCat.getProductClassListCount",map);
    }
	
	/**
	 * 查询所有系统分类列表
	 * @return
	 */
	public List<CmsSolutionCat> getProClazzList() {
        return getSqlSession().selectList("CmsSolutionCat.getProduct_Clazz_AllList");
    }
	
    /**
     * 添加系统分类
     * @param name
     * @return
     */
    public int addProClazz(CmsSolutionCat cat) {
        return getSqlSession().insert("CmsSolutionCat.addProduct_Clazz", cat);
    }
    
    /**
     * 删除系统分类
     * @param pcid
     * @return
     */
    public int deleteProClazz(long pcid) {
        // TODO Auto-generated method stub
        return getSqlSession().delete("CmsSolutionCat.deleteProduct_Clazz", pcid);
    }
    
    /**
     * 更新系统分类
     * @param prodClazz
     * @return
     */
    public int updateProClazz(CmsSolutionCat prodClazz) {
        // TODO Auto-generated method stub
        return getSqlSession().update("CmsSolutionCat.updateProduct_Clazz",prodClazz);
    }
   
    /**
     * 是否可以添加系统类别
     * @param name
     * @return
     */
    public boolean isAddClass(String name) {
        Integer count= (Integer) getSqlSession().selectOne("CmsSolutionCat.isAddClass",name);
         return count>0?false:true;
     }
    
    /**
     * 是否可以删除系统类别
     * @param name
     * @return
     */
    public boolean isDeleteClass(Long pacId) {
        Integer count= (Integer) getSqlSession().selectOne("CmsSolutionCat.isDeleteClass",pacId);
         return count>0?false:true;
     }
}
