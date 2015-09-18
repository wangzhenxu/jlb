package com.loiot.baqi.dao;

import com.loiot.baqi.model.MpRuleFollow;
import com.timeloit.pojo.MpMsg;
import com.timeloit.pojo.MpPdtRule;
import com.timeloit.pojo.MpRule;
import com.timeloit.pojo.MpText;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * User: zsf
 * Date: 9/18/13
 * Time: 7:23 PM
 */
@Repository("mpRuleDao")
public class MpRuleDao extends SqlSessionDaoSupport {

    private  static  String pre="MpRule.";



    public MpRuleFollow getMpRuleFollow(long mcId)
    {
       return (MpRuleFollow)getSqlSession().selectOne(pre+"getMpRuleFollow",mcId);
    }
    public ArrayList<MpRule> getMpRuleList(HashMap<String, Object> hashMap){
    	return (ArrayList<MpRule>)getSqlSession().selectList("getMpRuleList",hashMap);
    }

    public int getMpRuleCount(long mcId)
    {
      return (Integer)getSqlSession().selectOne(pre+"getMpRuleCount",mcId);
    }


    public int getMpRuleKeyWordCount(long mcId,String keyword)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
        paras.put("keyword",keyword);
        return (Integer) getSqlSession().selectOne(pre+"getMpRuleKeyWordCount",keyword) ;
    }

    public MpRule getMpRule(long ruleId)
    {
        return  (MpRule)getSqlSession().selectOne(pre+"getMpRule",ruleId);
    }
    /**
     * 获得关键字规则配置的详细信息
     * @param ruleId
     * @return
     */
    public MpRule getMpRuleInfo(long ruleId)
    {
        return  (MpRule)getSqlSession().selectOne(pre+"getMpRuleInfo",ruleId);
    }

    public int updateMpText(MpText mt)
    {
        return  getSqlSession().update(pre+"updateMpText",mt);
    }


    public long addMpMsg(MpMsg mm)
    {
         getSqlSession().insert(pre+"addMpMsg",mm);
        return mm.getMpMsgId();
    }

    public long addMpText(MpText mt){
        getSqlSession().insert(pre+"addMpText",mt);
        return mt.getMtId();
    }

    public long addMpRule(MpRule mr) {
        getSqlSession().insert(pre+"addMpRule",mr);
        return mr.getMrId();
    }

    public int updateMpRule(MpRule mr) {
       
        return  getSqlSession().update(pre+"updateMpRule",mr);
    }
    
    public int delMpRule(long mrId){
        return getSqlSession().delete(pre+"delMpRule",mrId);
    }


    public int delMpMsg(long mpMsgId){
        return getSqlSession().delete(pre+"delMpMsg",mpMsgId);
    }

    public int delMpText(long mpMsgId)
    {
        return getSqlSession().delete(pre+"delMpText",mpMsgId);
    }
    /**
     * 获取 公众帐号下 规则命令字 count，判断是否重复
     * @param mcId
     * @param kw
     * @return
     */
	public int getPdtRuleKwTxtCount(long mcId, String kw) {
		// TODO Auto-generated method stub
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
        paras.put("keyword",kw);

        return (Integer)getSqlSession().selectOne(pre+"getPdtRuleKwTxtCount",paras);
	}
    /**
     * 查询 规则名称条数 判断是否重复
     * @param nm
     * @return
     */
	public int getPdtRuleNameCount(String nm) {
		// TODO Auto-generated method stub
		 return (Integer)getSqlSession().selectOne(pre+"getPdtRuleNameCount",nm);
	}

    /**
     * 查询 公众帐号规则
     *
     *
     * @param mcId
     * @param keyword
     * @return
     */
    public int getMpRuleKwCount(long mcId,String keyword)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
        paras.put("keyword",keyword);

        return (Integer)getSqlSession().selectOne("MpRule.getMpRuleKwCount",paras) ;
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
    /**
     *   根据公众帐号id和规则模版名称查询规则页
     * @param mcId
     * @param name
     * @return
     */
  public List<MpRule> getMpRulesPage(Long mcId,String name,int skipResults, int maxResults){

      HashMap<String,Object> paras=new HashMap<String,Object>();
      paras.put("mcId",mcId);
      paras.put("name",name);
      paras.put("skipResults",skipResults) ;
      paras.put("maxResults",maxResults);

	  return getSqlSession().selectList("MpRule.getMpRulesPage",paras);
	  
  }
  /**
  * 根据ruleId查询规则
   * @param ruleId
   */    
  public MpRule getMpRuleById(long ruleId)
  {
      return  (MpRule)getSqlSession().selectOne(pre+"getMpRuleById",ruleId);
  }


    /**
     * 根据 公众帐号id查询 所有的 消息
     * @param mcId
     * @return
     */
    public List<MpMsg> getMcMsgIds(long mcId)
    {
        return  getSqlSession().selectList(pre+"getMcMsgIds",mcId);
    }

    /**
     * 获取 批量公众帐号下的 消息
     * @param mi
     * @return
     */
    public  List<MpMsg> getMcsMsgIds(List<Long> mi)
    {
        return getSqlSession().selectList(pre+"getMcsMsgIds",mi);
    }

    /**
     * 删除 公众帐号下 除news之外的 所有信息
     * @param mi
     */
    public void delNoNewsMpsMpMsg(List<Long> mi)
    {
        getSqlSession().delete(pre+"delNoNewsMpsMpMsg",mi);
    }

    /**
     * 删除 mcId公众帐号id相关的 公众帐号规则
     * @param mcId
     */
    public void delMpRuleByMcId(long mcId)
    {
        getSqlSession().delete(pre+"delMpRuleByMcId",mcId);
    }

    /**
     * 删除 批量公众帐号  下大的公众帐号规则
     * @param mi
     */
    public void delMpRuleByMcIdList(List<Long> mi){
        getSqlSession().delete(pre+"delMpRuleByMcIdList",mi);
    }

    /**
     * 删除 批量mcId 下的公众帐号规则 关键字
     * @param mi
     */
    public void delMpRuleKwByMcIdList(List<Long> mi)
    {
        getSqlSession().delete(pre+"delMpRuleKwByMcIdList",mi);
    }

    /**
     * 删除 公众帐号的公众帐号规则id
     * @param mcId
     */
    public void delMpRuleKwByMcId(long mcId)
    {
        getSqlSession().delete(pre+"delMpRuleKwByMcId",mcId);
    }



    public void delMpMusicByMpMsgIdList(List<Long> mpMsgIdLs)
    {
        getSqlSession().delete(pre+"delMpMusicByMpMsgIdList",mpMsgIdLs);
    }


    public void delMpTextByMpMsgIdList(List<Long> mpMsgIdLs)
    {
        getSqlSession().delete(pre+"delMpTextByMpMsgIdList",mpMsgIdLs);
    }
}
