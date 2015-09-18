package com.loiot.baqi.dao;

import com.loiot.baqi.model.WechatLog;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * @Author: zhangsf
 * CreateDate: 13-10-17 下午4:06
 */
@Repository("wechatLogDao")
public class WechatLogDao extends SqlSessionDaoSupport {

    private String pre="WechatLog.";

    /**
     *获取 公众帐号所有记录的条数
     * @param mcId
     * @return
     */
    public Integer getAllWechatLogsCount(long mcId,String kw)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);

        paras.put("kw",kw) ;
       return (Integer)getSqlSession().selectOne(pre+"getAllWechatLogsCount",paras);
    }
    /**
     * 获取 公众帐号的 所有记录
     * @param mcId
     * @return
     */

    public List<WechatLog>  getAllWechatLogs(long mcId,String kw,int skipResults, int maxResults)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
        paras.put("kw",kw) ;
        paras.put("skipResults",skipResults) ;
        paras.put("maxResults",maxResults);
       return   getSqlSession().selectList(pre+"getAllWechatLogs",paras);
    }

    /**
     *    获取 公众帐号某一类消息记录条数
     * @param mcId
     * @param type
     * @return
     */
     public Integer getWechatLogsCount(long mcId,short type,String kw)
     {
         HashMap<String,Object> paras=new HashMap<String,Object>();
         paras.put("mcId",mcId);
         paras.put("type",type) ;
         paras.put("kw",kw);
         return  (Integer)getSqlSession().selectOne(pre+"getWechatLogsCount",paras)  ;
     }

    /**
     * 获取 公众帐号 某一类消息的记录
     * @param mcId
     * @param type
     * @return
     */
    public List<WechatLog> getWechatLogs(long mcId,short type,String kw,int skipResults, int maxResults)
    {
        HashMap<String,Object> paras=new HashMap<String,Object>();
        paras.put("mcId",mcId);
         paras.put("type",type) ;
        paras.put("kw",kw);
        paras.put("skipResults",skipResults) ;
        paras.put("maxResults",maxResults);
        return  getSqlSession().selectList(pre+"getWechatLogs",paras)  ;
    }
}
