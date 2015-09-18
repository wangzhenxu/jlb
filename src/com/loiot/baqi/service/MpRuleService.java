package com.loiot.baqi.service;

import com.loiot.baqi.dao.MpRuleDao;
import com.loiot.baqi.model.McMsgIdsByType;
import com.loiot.baqi.dao.MpRuleKwDao;
import com.loiot.baqi.model.MpRuleFollow;
import com.loiot.baqi.controller.response.Pager;
import com.timeloit.pojo.MpMsg;
import com.timeloit.pojo.MpPdtRule;
import com.timeloit.pojo.MpRule;
import com.timeloit.pojo.MpRuleKw;
import com.timeloit.pojo.MpText;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * User: zhangsf
 * Date: 9/18/13 7:53 PM
 */
@Service("mpRuleService")
public class MpRuleService {

    @Resource
    private MpRuleDao mpRuleDao;
    @Resource
    private MpRuleKwDao mpRuleKwDao;


    /**
     * 查询 公众帐号的关注回复信息
     * @param mcId
     * @return
     */
    public MpRuleFollow getMpRuleFollow(long mcId)
    {
        return  mpRuleDao.getMpRuleFollow(mcId) ;
    }


    public int getMpRuleCount(long mcId){
        return mpRuleDao.getMpRuleCount(mcId);
    }

    /**
     * 判断 同一个公众帐号下 keyword是否重复
     * @param mcId
     * @param keyword
     * @return
     */
    public int getMpRuleKeyWordCount(long mcId,String keyword){
        return mpRuleDao.getMpRuleKeyWordCount(mcId, keyword) ;
    }

    public MpRule getMpRule(long mcId)
    {
        return mpRuleDao.getMpRule(mcId);
    }

    public int updateMpText(MpText mt)
    {
       return mpRuleDao.updateMpText(mt);
    }

    public long addMpMsg(MpMsg mm)
    {
        return mpRuleDao.addMpMsg(mm);
    }

    /**
     * 删除 公众帐号 关注回复所有相关的内容
     *
     * :删除公众帐号后，关注规则多所有信息也一起删除
     * mprule mpmsg mptext
     * @param mcId
     */
    public void delAllConcernMpRule(long mcId)
    {
       MpRule mr=mpRuleDao.getMpRule(mcId);
        if(mr.getMpMsgId()!=null)
        {
        mpRuleDao.delMpMsg(mr.getMpMsgId());
        mpRuleDao.delMpText(mr.getMpMsgId());
        }
        mpRuleDao.delMpRule(mcId);

    }

   public long addMpText(MpText mt)
   {
       return mpRuleDao.addMpText(mt);
   }


    public long addMpRule(MpRule mr)
    {
        return  mpRuleDao.addMpRule(mr);
    }
    public int delMpRule(long mr)
    {
        return  mpRuleDao.delMpRule(mr);
    }


    /**
     * 获取 公众帐号规则 分类消息id
     * @param mcId
     * @return
     */
    public McMsgIdsByType getMpMsgIdsByType(long mcId)
    {
        List<MpMsg> mpMsgList=mpRuleDao.getMcMsgIds(mcId);
        McMsgIdsByType mcMsgIdsByType=null;

        List<Long> txtLs=new ArrayList<Long>();
        List<Long> musicLs=new ArrayList<Long>();
        List<Long> newsLs=new ArrayList<Long>();

        for (MpMsg mpMsg : mpMsgList) {
            switch (mpMsg.getType())
            {
                case 0:
                    txtLs.add(mpMsg.getMpMsgId());
                    break;
                case 1:
                    musicLs.add(mpMsg.getMpMsgId());
                    break;
                case 2:
                    newsLs.add(mpMsg.getMpMsgId());
                    break;
            }
        }
        mcMsgIdsByType.setMusicMpMsgIds(musicLs);
        mcMsgIdsByType.setNewsMpMsgIds(newsLs);
        mcMsgIdsByType.setTextMpMsgIds(txtLs);
        return mcMsgIdsByType;
    }

    /**
     * 获取 批量公众帐号下的 消息
     * @param mi
     * @return
     */
    public McMsgIdsByType getMpMsgIdsByType(List<Long> mi)
    {
        List<MpMsg> mpMsgList=mpRuleDao.getMcsMsgIds(mi);
        McMsgIdsByType mcMsgIdsByType=new McMsgIdsByType();

        List<Long> txtLs=new ArrayList<Long>();
        List<Long> musicLs=new ArrayList<Long>();
        List<Long> newsLs=new ArrayList<Long>();

        for (MpMsg mpMsg : mpMsgList) {
            switch (mpMsg.getType())
            {
                case 0:
                    txtLs.add(mpMsg.getMpMsgId());
                    break;
                case 1:
                    musicLs.add(mpMsg.getMpMsgId());
                    break;
                case 2:
                    newsLs.add(mpMsg.getMpMsgId());
                    break;
            }
        }
        mcMsgIdsByType.setMusicMpMsgIds(musicLs);
        mcMsgIdsByType.setNewsMpMsgIds(newsLs);
        mcMsgIdsByType.setTextMpMsgIds(txtLs);
        return mcMsgIdsByType;
    }


    /**
     * 删除 公众帐号下 除news之外的 所有信息
     * @param mpMsgIds
     */
    public void delNoNewsMpsMpMsg(List<Long> mpMsgIds)
    {
        mpRuleDao.delNoNewsMpsMpMsg(mpMsgIds);
    }

    /**
     * 删除 mcId公众帐号id相关的 公众帐号规则
     * @param mcId
     */
    public void delMpRuleByMcId(long mcId)
    {
        mpRuleDao.delMpRuleByMcId(mcId);
    }

    /**
     * 删除 公众帐号的公众帐号规则id
     * @param mcId
     */
    public void delMpRuleKwByMcId(long mcId)
    {
        mpRuleDao.delMpRuleKwByMcId(mcId);
    }

    /**
     * 删除 批量公众帐号  下大的公众帐号规则
     * @param mi
     */
    public void delMpRuleByMcIdList(List<Long> mi){
        mpRuleDao.delMpRuleByMcIdList(mi);
    }

    /**
     * 删除 批量mcId 下的公众帐号规则 关键字
     * @param mi
     */
    public void delMpRuleKwByMcIdList(List<Long> mi)
    {
        mpRuleDao.delMpRuleKwByMcIdList(mi);
    }


    public void delMpMusicByMpMsgIdList(List<Long> mpMsgIdLs)
    {
        mpRuleDao.delMpMusicByMpMsgIdList(mpMsgIdLs);
    }


    public void delMpTextByMpMsgIdList(List<Long> mpMsgIdLs)
    {
        mpRuleDao.delMpTextByMpMsgIdList(mpMsgIdLs);
    }
    /**
    * 查询规则分页列表
    * @param mcId
    * @param name
    * @param name
    * @param pageIndex
    * @return
    */
   public Pager<MpRule> getMpRulesPage(long mcId,String name,int pageIndex)
   {
       // 查询  总条数
       int totalResults = mpRuleDao.getMpRulesCount(mcId,name);
       // 构造一个分页器
       Pager<MpRule> pager = new Pager<MpRule>(totalResults, pageIndex);
       // 查询
        List<MpRule> mpList = mpRuleDao.getMpRulesPage(mcId,name, pager.getSkipResults(), pager.getMaxResults());
        pager.setData(mpList);

       return pager;
   }
	/**
	 * 获取关键字规则ID
	 * @param ruleId
	 * @return
	 */
	public List<MpRuleKw> getKeysByRuleid(long ruleId){
		HashMap<Long,ArrayList<MpRuleKw>> rule_keymap=new HashMap<Long, ArrayList<MpRuleKw>>();
		List<MpRuleKw> mpRuleKw=mpRuleKwDao.getMpRuleKwListByRuleid(ruleId);
		return mpRuleKw;
	}
	/**
	 * 获取关键字规则
	 * @param ruleid
	 * @return
	 */
	public MpRule getRule(int ruleid){
		MpRule rule = mpRuleDao.getMpRuleById(ruleid);
		return rule;
	}
}
