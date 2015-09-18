package com.loiot.baqi.dao;

import com.timeloit.pojo.MpPdtRule;
import com.timeloit.pojo.MpRuleKw;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository("mpRuleKwDao")
public class MpRuleKwDao extends SqlSessionDaoSupport{
	public MpRuleKw getMpRuleKwById(int id){
		MpRuleKw key = null;
		try {
			key = (MpRuleKw) getSqlSession().selectOne("getMpRuleKw", id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return key;
	}
    /**
     *   根据公众帐号id和规则模版名称查询规则页
     * @param mcId
     * @param name
     * @return
     */
  public List<MpPdtRule> getMpRulesPage(Long mcId,String name,int skipResults, int maxResults){
      HashMap<String,Object> paras=new HashMap<String,Object>();
      paras.put("mcId",mcId);
      paras.put("name",name);
      paras.put("skipResults",skipResults) ;
      paras.put("maxResults",maxResults);

	  return getSqlSession().selectList("MpRule.getMpRulesPage",paras);
	  
  }
    /**
     * 根据公众帐号id和规则模版名称 查询关键字规则的条数
     * @param mcId
     * @param name
     * @return
     */
    public Integer getMpRulesCount(Long mcId,String name)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
        paras.put("name",name);
       return  (Integer) getSqlSession().selectOne("MpRule.getMpRuleCount",paras);
    }
	public ArrayList<MpRuleKw> getKeysSearch(String keyword){
		ArrayList<MpRuleKw> keys=null;
		keys=(ArrayList<MpRuleKw>)getSqlSession().selectList("getMpRuleKwsSearch",keyword);
		return keys;
	}
	public long insertKey(MpRuleKw key){
		long result=0;
		try {
			result=getSqlSession().insert("insertMpRuleKw",key);;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(result>0){
			result=key.getMrkId();
		}
		return result;
	}
	public boolean delMpRuleKwById(long id){
		int result=0;
		try {
			result=getSqlSession().delete("delMpRuleKwByid",id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(result>0){
			return true;
		}else{
			return false;
		}
		
	}
	public boolean updateMpRuleKw(MpRuleKw key){
		int result=0;
		try {
			result=getSqlSession().update("updateMpRuleKw",key);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(result>0){
			return true;
		}else{
			return false;
		}
		
	}
	public boolean delKeyByRuleid(long mr_id){
		int result=0;
		try {
			result=getSqlSession().delete("getMpRuleKwListBymr_id",mr_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(result>0){
			return true;
		}else{
			return false;
		}
	}
	public ArrayList<MpRuleKw> getMpRuleKwListByRuleid(long mr_id){
		ArrayList<MpRuleKw> keys=null;
		keys=(ArrayList<MpRuleKw>)getSqlSession().selectList("getMpRuleKwListBymr_id",mr_id);
		return keys;
	}
	public HashMap<Integer,MpRuleKw> getMpRuleKwMapByRuleid(long mr_id){
		ArrayList<MpRuleKw> keys=null;
		keys=(ArrayList<MpRuleKw>)getSqlSession().selectList("getMpRuleKwListBymr_id",mr_id);
		HashMap<Integer,MpRuleKw> keysmap=new HashMap<Integer, MpRuleKw>();
		for (MpRuleKw mpRuleKw : keys) {
			keysmap.put(mpRuleKw.getMrkId(), mpRuleKw);
		}
		return keysmap;
	}
}
