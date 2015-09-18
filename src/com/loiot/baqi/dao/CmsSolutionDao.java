package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.CmsSolution;
import com.timeloit.pojo.CmsSolutionProductMap;
/**
 * 系统管理Dao
 * @author wangzx
 */
@Repository("cmsSolutionDao")
@SuppressWarnings("unchecked")
public class CmsSolutionDao  extends SqlSessionDaoSupport{

    
	/**
	 * 查询系统信息
	 * @param map
	 * @return
	 */
	public List<CmsSolution> getSolutionListByCondtion(Map<String, Object> map) {
        return getSqlSession().selectList("CmsSolution.getSolution_List",map);
    }

	/**
	 * 查询系统总数
	 * @param map
	 * @return
	 */
	public Integer getSolutionListCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("CmsSolution.getSolutionListCount",map);
    }
	
	/**
     * 查询一个系统信息
     * @param csId
     * @return
     */
    public CmsSolution getSolution_One(Long csId) {
        return (CmsSolution) getSqlSession().selectOne("CmsSolution.getSolution_One",csId);
    }
	
	
	
	/**
	 * 查询所有系统分类列表
	 * @return
	 */
	public List<CmsSolution> getSolution_AllList() {
        return getSqlSession().selectList("CmsSolution.getSolution_AllList");
    }
	
    /**
     * 添加系统
     * @param po
     * @return
     */
    public Long addSolution(CmsSolution po) {
         getSqlSession().insert("CmsSolution.addSolution", po);
         return po.getCsId();
    }
    
    /**
     * 添加应用与产品关系
     * @param po
     * @return
     */
    public int addSolutionProductRelation(CmsSolutionProductMap po) {
        return getSqlSession().insert("CmsSolution.addSolutionProductRelation", po);
    }
    /**
     * 删除系统
     * @param pcid
     * @return
     */
    public int deleteSolution(long pcid) {
        // TODO Auto-generated method stub
        return getSqlSession().delete("CmsSolution.deleteSolution", pcid);
    }
    
    /**
     * 删除系统与产品关系
     * @param pcid
     * @return
     */
    public int deleteSolutionProductRelation(long pcid) {
        // TODO Auto-generated method stub
        return getSqlSession().delete("CmsSolution.deleteSolutionProductRelation", pcid);
    }
    
    
    
    /**
     * 更新系统
     * @param prodClazz
     * @return
     */
    public int updateSolution(CmsSolution prodClazz) {
        // TODO Auto-generated method stub
        return getSqlSession().update("CmsSolution.updateSolution",prodClazz);
    }
   
    /**
     * 是否可以添加系统
     * @param map
     * @return
     */
    public boolean isAddSolution(Map map) {
        Integer count= (Integer) getSqlSession().selectOne("CmsSolution.isAddSolution",map);
         return count>0?false:true;
     }
    
    /**
     * 是否可以删除系统
     * @param csId
     * @return
     */
    public boolean isDeleteSolution(Long csId) {
        Integer count= (Integer) getSqlSession().selectOne("CmsSolution.isDeleteSolution",csId);
         return count>0?false:true;
     }
    
    
}
