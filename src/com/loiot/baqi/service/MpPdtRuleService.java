package com.loiot.baqi.service;


import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.MpPdtRuleDao;
import com.loiot.baqi.model.MpPdtRuleCateoryByType;
import com.timeloit.pojo.MpPdtRule;
import com.timeloit.pojo.MpPdtRuleAttr;
import com.timeloit.pojo.MpPdtRuleCmd;
import com.timeloit.pojo.MpPdtRuleKw;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author zhangsf
 *  DateTime: 13-9-2 上午11:12
 */

@Transactional
@Service("mpPdtService")
public class MpPdtRuleService {

     private Logger log = LoggerFactory.getLogger(this.getClass());

    @Resource
    private MpPdtRuleDao mpPdtRuleDao;


    /**
     *
     * @param mcId
     * @param name
     * @param name
     * @param pageIndex
     * @return
     */
    public Pager<MpPdtRule> getMpRulesPage(long mcId,String name,int pageIndex)
    {
        // 查询  总条数
        int totalResults = mpPdtRuleDao.getMpRulesCount(mcId,name);
        // 构造一个分页器
        Pager<MpPdtRule> pager = new Pager<MpPdtRule>(totalResults, pageIndex);
        // 查询
         List<MpPdtRule> mpList = mpPdtRuleDao.getMpRulesPage(mcId,name, pager.getSkipResults(), pager.getMaxResults());
         pager.setData(mpList);

        return pager;
    }

    /**
     *  更新 上线状态
     * @param mprId
     * @param isOnline
     */
    public void updateIsOnline(long mprId,short isOnline)
    {
       mpPdtRuleDao.updateIsOnline(mprId,isOnline);
    }



    /**
     * 插入 产品规则模版主表部分
     * @param pdr
     * @return
     */
    public long addMpPdtRule(MpPdtRule pdr)
    {
        return  mpPdtRuleDao.addMpPdtRule(pdr) ;
    }

    /**
     * 批量 添加产品规则模版的关键字
     * @param mpPdtRuleKwList
     */
    public void addMpPdtRuleKws(List<MpPdtRuleKw>  mpPdtRuleKwList)
    {
       mpPdtRuleDao.addMpPdtRuleKws(mpPdtRuleKwList);
    }

    /**
     * 批量添加产品模版的属性关联
     * @param mpPdtRuleAttrList
     */
    public void addMpPdtRuleAttrs(List<MpPdtRuleAttr> mpPdtRuleAttrList)
    {
         mpPdtRuleDao.addMpPdtRuleAttrs(mpPdtRuleAttrList);
    }


    /**
     * 批量 添加产品模版的命令关联
     * @param mpPdtRuleCmdList
     */
    public void addMpPdtRuleCmds(List<MpPdtRuleCmd> mpPdtRuleCmdList)
    {
        mpPdtRuleDao.addMpPdtRuleCmds(mpPdtRuleCmdList);
    }

    /**
     * 获取 产品规则模版 主要信息部分
     * @param mprId
     * @return
     */
    public MpPdtRule getMpPdtRuleMain(long mprId){
        return mpPdtRuleDao.getMpPdtRuleMain(mprId)  ;
    }

    /**
     * 获取 产品规则的 关键字列表
     * @param mprId
     * @return
     */
    public List<MpPdtRuleKw> getPdtRuleKeys(long mprId){
        return mpPdtRuleDao.getPdtRuleKeys(mprId);
    }

    /**
     * 获取产品规则的 属性关联
     * @param mprId
     * @return
     */

    public List<MpPdtRuleAttr> getMpPdtRuleAttrs(long mprId) {

        return mpPdtRuleDao.getMpPdtRuleAttrs(mprId);
    }

    /**
     * 获取产品规则的 命令关联
     * @param mprId
     * @return
     */
    public List<MpPdtRuleCmd> getMpPdtRuleCmds(long mprId)
    {
        return  mpPdtRuleDao.getMpPdtRuleCmds(mprId);
    }

    public void delKws(long mprId)
    {
       mpPdtRuleDao.delKws(mprId);
    }

    public void delCmds(long mprId){
        mpPdtRuleDao.delCmds(mprId);
    }

    public void delAttrs(long mprId)
    {
       mpPdtRuleDao.delAttrs(mprId);
    }

    public void delMpr(long mprId){
        mpPdtRuleDao.delMpr(mprId);
    }

    /**
     * 判断 同一个公众帐号下 产品规则的keyword是否重复
     * @param mcId
     * @param keyword
     * @return
     */
    public Integer getPdtRuleKwTxtCount(long mcId,String keyword)
    {
        return mpPdtRuleDao.getPdtRuleKwTxtCount(mcId, keyword) ;
    }


    /**
     * 判断 规则名称是否重复
     * @param name
     * @return
     */
    public int getPdtRuleNameCount(String name)
    {
        return  mpPdtRuleDao.getPdtRuleNameCount(name);
    }

    /**
     * 查询 关键字列表 在关键字规则及产品规则条数
     * 新添加 规则时候 判断关键字是否重复
     * @param kws1  产品规则
     * @param kws1   关键字规则
     * @param mcId
     * @return
     */
    public int getMpPdt2RuleKeywordCount(List<String> kws1,List<String> kws2,long mcId)
    {


        return mpPdtRuleDao.getMpPdt2RuleKeywordCount(kws1,kws2,mcId);
    }


    public MpPdtRuleCateoryByType getMpPdtRuleCateoryByType(List<Long> mcId)
    {
        List<MpPdtRule> mpPdtRuleList=mpPdtRuleDao.getMpPdtRuleByMcIdList(mcId);
        List<Long> attrls=new ArrayList<Long>();
        List<Long> cmdLs=new ArrayList<Long>();
        MpPdtRuleCateoryByType mpPdtRuleCateoryByType=new MpPdtRuleCateoryByType();

        for (Iterator<MpPdtRule> iterator = mpPdtRuleList.iterator(); iterator.hasNext(); ) {
            MpPdtRule next =  iterator.next();
            switch (next.getType())
            {
                case 0:
                    cmdLs.add(next.getMprId());
                    break;
                case 1:
                    attrls.add(next.getMprId());
                    break;
            }
        }

        mpPdtRuleCateoryByType.setAttrMprIdList(attrls);
        mpPdtRuleCateoryByType.setCmdMprIdList(cmdLs);

        return mpPdtRuleCateoryByType;
    }


    public void delMpPdtRuleCmdByMprIdList(List<Long> mprId)
    {
        mpPdtRuleDao.delMpPdtRuleCmdByMprIdList(mprId);
    }

    public void delMpPdtRuleAttrByMprIdList(List<Long> mprId)
    {
        mpPdtRuleDao.delMpPdtRuleAttrByMprIdList(mprId);
    }
    public void delMpPdtRuleKwByMprIdList(List<Long> mprId)
    {
        mpPdtRuleDao.delMpPdtRuleKwByMprIdList(mprId);
    }
    public void delMpPdtRuleByMprIdList(List<Long> mprId)
    {
        mpPdtRuleDao.delMpPdtRuleByMprIdList(mprId);
    }
}
