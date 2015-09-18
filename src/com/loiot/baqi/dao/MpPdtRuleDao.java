
package com.loiot.baqi.dao;

import com.timeloit.pojo.MpPdtRule;
import com.timeloit.pojo.MpPdtRuleAttr;
import com.timeloit.pojo.MpPdtRuleCmd;
import com.timeloit.pojo.MpPdtRuleKw;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Description:
 * Create on 2013-9-2 上午10:27:42 
 * @author zhangsf
 *
 */

 
@Repository("mpPdtRuleDao")
public class MpPdtRuleDao  extends SqlSessionDaoSupport {

   private static  String pre="MpPdtRule.";
    /**
     *   根据公众帐号id和规则模版名称查询规则
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

	  return getSqlSession().selectList("MpPdtRule.getMpPdtRulesPage",paras);
	  
  }


    /**
     * 根据公众帐号id和规则模版名称 查询规则的条数
     * @param mcId
     * @param name
     * @return
     */
    public Integer getMpRulesCount(Long mcId,String name)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
        paras.put("name",name);
       return  (Integer) getSqlSession().selectOne("MpPdtRule.getMpPdtRulesCount",paras);
    }

    /**
     * 更新 上线状态
     * @param mprId
     * @param isOnline
     */
    public void updateIsOnline(long mprId,short isOnline)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
       paras.put("mprId",mprId);
        paras.put("isOnline",isOnline);
       getSqlSession().update("MpPdtRule.updateIsOnline",paras);
    }


    /**
     * 插入 产品规则模版主表部分
     * @param pdr
     * @return
     */
    public long addMpPdtRule(MpPdtRule pdr)
    {
//        HashMap<String,Object> paras=new HashMap<String,Object>();
//        paras.put("mcId",pdr.getMpCustomer().getMcId());
//        paras.put("productId",pdr.getProduct().getProductId());
//        paras.put("name",pdr.getName());
//        paras.put("responseMessage",pdr.getResponseMessage());
//        paras.put("type",pdr.getType());
//        paras.put("createTime",pdr.getCreateTime());
//        paras.put("isOnline",pdr.getIsOnline());


         getSqlSession().insert(pre+"addMpPdtRuleComm",pdr);
        return pdr.getMprId() ;
    }

    /**
     * 批量 添加产品规则模版的关键字
     * @param mpPdtRuleKwList
     */
    public void addMpPdtRuleKws(List<MpPdtRuleKw>  mpPdtRuleKwList)
    {
          getSqlSession().insert(pre+"addMpPdtRuleKws",mpPdtRuleKwList) ;
    }

    /**
     * 批量添加产品模版的属性关联
     * @param mpPdtRuleAttrList
     */
    public void addMpPdtRuleAttrs(List<MpPdtRuleAttr> mpPdtRuleAttrList)
    {
        getSqlSession().insert(pre+"addMpPdtRuleAttrs",mpPdtRuleAttrList) ;
    }


    /**
     * 批量 添加产品模版的命令关联
     * @param mpPdtRuleCmdList
     */
    public void addMpPdtRuleCmds(List<MpPdtRuleCmd> mpPdtRuleCmdList)
    {
        getSqlSession().insert(pre+"addMpPdtRuleCmds",mpPdtRuleCmdList);
    }


    /**
     * 获取 产品规则模版 主要信息部分
     * @param mprId
     * @return
     */
    public MpPdtRule getMpPdtRuleMain(long mprId){
        return (MpPdtRule)getSqlSession().selectOne(pre+"getMpPdtRuleMain",mprId)   ;
    }

    /**
     * 获取 产品规则的 关键字列表
     * @param mprId
     * @return
     */
   public List<MpPdtRuleKw> getPdtRuleKeys(long mprId){
        return getSqlSession().selectList(pre+"getPdtRuleKeys",mprId);
    }

    /**
     * 获取产品规则的 属性关联
     * @param mprId
     * @return
     */

    public List<MpPdtRuleAttr> getMpPdtRuleAttrs(long mprId) {

        return getSqlSession().selectList(pre+"getMpPdtRuleAttrs",mprId);
    }

    /**
     * 获取产品规则的 命令关联
     * @param mprId
     * @return
     */
    public List<MpPdtRuleCmd> getMpPdtRuleCmds(long mprId)
    {
      return  getSqlSession().selectList(pre+"getMpPdtRuleCmds",mprId);
    }

    /**
     * 删除 一个产品规则的所有关键字
     * @param mprId
     */
    public void delKws(long mprId){
        getSqlSession().delete(pre+"delKws",mprId);
    }

    /**
     * 删除 一个产品规则的所有的命令组关联
     * @param mprId
     */

    public void delCmds(long mprId){
        getSqlSession().delete(pre+"delCmds",mprId);
    }

    /**
     * 删除 一个产品规则的所有的属性关联
     * @param mprId
     */
    public void delAttrs(long mprId){
        getSqlSession().delete(pre+"delAttrs",mprId);
    }

    public void delMpr(long mprId)
    {
      getSqlSession().delete(pre+"delMpr",mprId);
    }


    /**
     * 获取 公众帐号下 规则命令字 count，判断是否重复
     * @param mcId
     * @param keyword
     * @return
     */
     public int getPdtRuleKwTxtCount(long mcId,String keyword)
     {
         HashMap<String,Object> paras=new HashMap<String,Object>();
         paras.put("mcId",mcId);
         paras.put("keyword",keyword);

         return (Integer)getSqlSession().selectOne(pre+"getPdtRuleKwTxtCount",paras);
     }



    /**
     * 判断 公共帐号 关键字规则和产品规则是否包含要添加的关键字名称
     * @param kws1
     * @param kws2
     * @param mcId
     * @return
     */
    public int getMpPdt2RuleKeywordCount(List<String> kws1,List<String> kws2,long mcId)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
        paras.put("kws1",kws1);
        paras.put("kws2",kws2);
        return (Integer)getSqlSession().selectOne(pre+"getMpPdt2RuleKeywordCount",paras);
    }

    /**
     * 查询 规则名称条数 判断是否重复
     * @param name
     * @return
     */
    public int getPdtRuleNameCount(String name)
    {
        return (Integer)getSqlSession().selectOne(pre+"getPdtRuleNameCount",name);
    }



    public List<MpPdtRule> getMpPdtRuleByMcIdList(List<Long> mcId)
    {
        return getSqlSession().selectList(pre+"getMpPdtRuleByMcIdList",mcId);
    }

    public void delMpPdtRuleCmdByMprIdList(List<Long> mprId)
    {
        getSqlSession().delete(pre+"delMpPdtRuleCmdByMprIdList",mprId);
    }

    public void delMpPdtRuleAttrByMprIdList(List<Long> mprId)
    {
        getSqlSession().delete(pre+"delMpPdtRuleAttrByMprIdList",mprId);
    }
    public void delMpPdtRuleKwByMprIdList(List<Long> mprId)
    {
        getSqlSession().delete(pre+"delMpPdtRuleKwByMprIdList",mprId);
    }
    public void delMpPdtRuleByMprIdList(List<Long> mprId)
    {
        getSqlSession().delete(pre+"delMpPdtRuleByMprIdList",mprId);
    }

}
