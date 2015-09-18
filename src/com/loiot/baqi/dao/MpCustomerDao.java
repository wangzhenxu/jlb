package com.loiot.baqi.dao;

import com.loiot.baqi.model.MpCustomerGroup;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.MpCustomer;
import com.timeloit.pojo.MpOpenid;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: zhangsf
 * Date: 13-8-27 Time: 上午9:09
 */

@Repository("mpCustomerDao")
public class MpCustomerDao extends SqlSessionDaoSupport {


    /**
     * 获取 客户列表
     * @return
     */
    public List<Customer>   getCustomers()
    {
      return getSqlSession().selectList("MpCustomer.getCustomers");
    }

    /**
     * 获取客户的 公众帐号列表  的个数
     *
     * @param customerId 客户id
     * @return   返回公众帐号列表  个数
     */
    public Integer  getMpCustomerCount(long customerId,String createTime)
    {
        Map<String, Object> params = new HashMap<String, Object>();


        if (customerId>0) {
            params.put("customerId", customerId);
        }
        params.put("createTime","".equals(createTime)?null:createTime);
        return (Integer)getSqlSession().selectOne("MpCustomer.getMpCount",params)  ;
    }


    /**
     * 获取公众帐号详情
     *
     * @param mcId  公众帐号id
     * @return  公众帐号 对象
     */
    public MpCustomer getMp(long mcId) {
        return (MpCustomer) getSqlSession().selectOne("MpCustomer.getMp",mcId);
    }

    /**
     * 查询后台账号列表
     *
     * @param customerId 客户编号
     * @param createTime 创建时间
     * @param skipResults 跳过的记录数
     * @param maxResults 最大的记录数
     * @return 后台账号列表
     */
    public List<MpCustomer> getMpListPage(long customerId,String createTime,int skipResults, int maxResults) {

        Map<String, Object> params = new HashMap<String, Object>();

        params.put("skipResults", skipResults);
        params.put("maxResults", maxResults);
        if (customerId>0) {
            params.put("customerId", customerId);
        }
          params.put("createTime","".equals(createTime)?null:createTime);

        return getSqlSession().selectList("MpCustomer.getMpListPage", params);
    }

    /**
     * 获取客户的 公众帐号列表
     *
     * @param customerId 客户id
     * @return  List 返回公众帐号列表
     */
    @SuppressWarnings("unchecked")
	public List<MpCustomer>  getMpCustomerList(long customerId)
    {
        return (List<MpCustomer>) getSqlSession().selectList("MpCustomer.getMpsName",customerId)  ;
    }

    /**
     *  公众帐号列表
     *

     * @return  List 返回公众帐号列表
     */
    @SuppressWarnings("unchecked")
    public List<MpCustomer>  getAllMpCustomerList()
    {
        return (List<MpCustomer>) getSqlSession().selectList("MpCustomer.getAllMpsName")  ;
    }

    /**
     *    获取授权 用户分页列表
     * @param mcId
     * @param loginName
     * @param isGranted
     * @return
     */
    public List<MpOpenid> getGrantedListPage(Long mcId,
                                         String loginName,
                                         Short isGranted,
                                         int skipResults,
                                         int maxResults)
    {
        HashMap<String,Object> paras=new HashMap<String, Object>();

        paras.put("mcId",mcId);
        paras.put("loginName",loginName);
        paras.put("isGranted",isGranted);
        paras.put("skipResults",skipResults);
        paras.put("maxResults",maxResults);

       return  getSqlSession().selectList("MpCustomer.getGrantedUserList",paras);

    }


    /**
     * 查询授权记录的总数
     * @param mcId
     * @param loginName
     * @param isGranted
     * @return
     */
    public Integer getGrantedListCount( Long mcId,
                                    String loginName,
                                    Short isGranted)
    {
        HashMap<String,Object> paras=new HashMap<String, Object>();

        paras.put("mcId",mcId);
        paras.put("loginName",loginName);
        paras.put("isGranted",isGranted);
      return  (Integer)getSqlSession().selectOne("MpCustomer.getGrantedUserListCount",paras);
    }


    /**
     * 添加公众帐号
     *
     * @param mp 公众帐号
     * @return  long 返回添加的公众帐号的主键编号
     */
    public long  addMpCustomer(MpCustomer mp)
    {
            getSqlSession().insert("MpCustomer.addMpCustomer",mp);
            return mp.getMcId();
    }


    /**
     * 删除公众帐号
     *
     * @param mcId 公众帐号ID
     */
    public void deleteRole(long mcId) {
        getSqlSession().delete("MpCustomer.deleteMp", mcId);
    }


    /**
     * 修改公众帐号 token
     *
     * @param mcId 公众帐号ID
     * @param  token
     */
    public void  updateToken(long mcId,String token)
    {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("mcId", mcId);
        params.put("token", token);
           getSqlSession().update("MpCustomer.updateToken", params);
    }


    /**
     *   更新 disabled，0为启用 1为禁用
     *
     * @param mcId 公众帐号ID
     * @param disabled 启用状态
     */

    public void updateDisabled(long mcId,short disabled)
    {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("mcId", mcId);
        params.put("disabled", disabled);
        getSqlSession().update("MpCustomer.updateDisabled",params);
    }


    /**
     *  判断 公众帐号的name 是否存在
     *
     * @param mcId 公众帐号ID
     * @param disabled 启用状态
     */
    public Long isMpExist(String name)
    {
        return (Long) getSqlSession().selectOne("MpCustomer.isMpExist",name);
    }

    /**
     *   更新 appid appseret
     *
     * @param mcId 公众帐号ID
     * @param  appId
     * @param appseret
     */
    public void updateApp(long mcId,String appId,String appSecret)
    {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("mcId", mcId);
        params.put("appId", appId);
        params.put("appSecret", appSecret);
        getSqlSession().update("MpCustomer.updateApp",params);
    }


    /**
     *批量删除 公众帐号信息
     * @param mcId
     */
    public void  delMps( List<Long> mcId)
    {
         getSqlSession().delete("MpCustomer.deleteMps",mcId) ;
    }


   public int getMCNameCount(String name)
   {
       return (Integer)getSqlSession().selectOne("MpCustomer.getMCNameCount",name) ;
   }


    /**
     * 获取 客户下公众帐号列表
     * @return
     */
  public List<MpCustomerGroup> getMpCustomerGroup()
  {
      return getSqlSession().selectList("MpCustomer.getMpCustomerGroup") ;
  }

    public void delMpOpenidByMcIdList(List<Long> mcId)
    {
        getSqlSession().delete("MpCustomer.delMpOpenidByMcIdList",mcId) ;
    }
}
