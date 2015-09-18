package com.loiot.baqi.service;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.WechatLogDao;
import com.loiot.baqi.model.WechatLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Author: sf
 * CreateDate: 13-10-17 下午4:25
 */
@Service("wechatLogServices")
public class WechatLogServices {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private WechatLogDao wechatLogDao;



    public Pager<WechatLog> getAllWechatLogsPage(long mcId,String kw,int pageIndex)
    {
        // 查询  总条数
        int totalResults = getAllWechatLogsCount(mcId,kw);

        // 构造一个分页器
        Pager<WechatLog> pager = new Pager<WechatLog>(totalResults, pageIndex);

        // 查询公众帐号列表
        List<WechatLog> mpList = getAllWechatLogs(mcId,kw, pager.getSkipResults(), pager.getMaxResults());
        pager.setData(mpList);
        pager.setPageSize(10);
        return pager;
    }

    /**
     *获取 公众帐号所有记录的条数
     * @param mcId
     * @return
     */
    public Integer getAllWechatLogsCount(long mcId,String kw)
    {
        return wechatLogDao.getAllWechatLogsCount(mcId,kw);
    }
    /**
     * 获取 公众帐号的 所有记录
     * @param mcId
     * @return
     */

    public List<WechatLog> getAllWechatLogs(long mcId,String kw,int skipResults, int maxResults)
    {
       return wechatLogDao.getAllWechatLogs(mcId, kw,skipResults, maxResults);
    }


    public Pager<WechatLog> getWechatLogsPage(long mcId,short type,String kw,int pageIndex)
    {
        // 查询  总条数
        int totalResults = getWechatLogsCount(mcId,type,kw);

        // 构造一个分页器
        Pager<WechatLog> pager = new Pager<WechatLog>(totalResults, pageIndex);

        // 查询公众帐号列表
        List<WechatLog> mpList = getWechatLogs(mcId,type,kw, pager.getSkipResults(), pager.getMaxResults());
        pager.setData(mpList);
        pager.setPageSize(10);
        return pager;
    }
    /**
     *    获取 公众帐号某一类消息记录条数
     * @param mcId
     * @param type
     * @return
     */
    public Integer getWechatLogsCount(long mcId,short type,String kw)
    {
         return wechatLogDao.getWechatLogsCount(mcId, type,kw) ;
    }

    /**
     * 获取 公众帐号 某一类消息的记录
     * @param mcId
     * @param type
     * @return
     */
    public List<WechatLog> getWechatLogs(long mcId,short type,String kw,int skipResults, int maxResults)
    {
         return wechatLogDao.getWechatLogs(mcId, type, kw,skipResults, maxResults);
    }

}
