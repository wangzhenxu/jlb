package com.loiot.baqi.service;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.MpCustomerDao;
import com.loiot.baqi.model.MpCustomerGroup;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.MpCustomer;
import com.timeloit.pojo.MpOpenid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * User: zhangsf
 * Date: 13-8-27 Time: 上午10:41
 */

@Transactional
@Service("mpCustomerService")
public class MpCustomerService {


    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 账号数据访问接口
     */
    @Resource
    private MpCustomerDao   mpCustomerDao;


    /**
     * 获取 客户列表
     * @return
     */
    public List<Customer>   getCustomers()
    {
        return mpCustomerDao.getCustomers();
    }


    /**
     * 查询后台账号列表分页
     *
     * @param customerId 客户编号
     * @param createTime 创建时间
     * @param pageIndex 页索引
     * @return
     */
    public Pager<MpCustomer> getMpListPage(long customerId,String createTime, int pageIndex) {

        // 查询  总条数
        int totalResults = mpCustomerDao.getMpCustomerCount(customerId,createTime);

        // 构造一个分页器
        Pager<MpCustomer> pager = new Pager<MpCustomer>(totalResults, pageIndex);

        // 查询公众帐号列表
        List<MpCustomer> mpList = mpCustomerDao.getMpListPage(customerId,createTime, pager.getSkipResults(),
                pager.getMaxResults());

        // 关注和授权 总人数
        Iterator<MpCustomer> iter=mpList.iterator();
        while (iter.hasNext()) {
            MpCustomer next =  iter.next();
             List<MpOpenid> ls=next.getMpOpenids();
            if (ls != null) {
                  next.setFollowSum(ls.size());

                int gantedsum=0;
                Iterator<MpOpenid> lsit=ls.iterator();
                while (lsit.hasNext()) {
                    MpOpenid o =  lsit.next();
                    /*是否已授权*/
                    if (o.getIsGranted() == 1) {
                        ++gantedsum;
                    }
                    
                }

                next.setGrantedSum(gantedsum);
            } else{
                 next.setFollowSum(0);
                next.setGrantedSum(0);
            }

            next.setMpOpenids(null);
        }


        pager.setData(mpList);

        return pager;
    }


    /**
     * 获取客户 公众帐号列表
     * @param customerId
     * @return
     */
    public List<MpCustomer> getMps(long customerId)
    {
        return mpCustomerDao.getMpCustomerList(customerId);
    }

    /**
     *  公众帐号列表
     * @param customerId
     * @return
     */
    public List<MpCustomer> getAllMps()
    {
        return mpCustomerDao.getAllMpCustomerList();
    }


    /**
     * 查询公众帐号
     *
     * @param mcId 公众帐号id
     *
     * @return 返回公众帐号信息
     */
    public MpCustomer getMp(long mcId)
    {
        MpCustomer mc=mpCustomerDao.getMp(mcId);
        List openids=mc.getMpOpenids();
        Iterator<MpOpenid> ite=openids.iterator() ;
         if(openids.size()>0)
         {
             mc.setFollowSum(openids.size());
             int grantedsum=0;
             while (ite.hasNext()) {
                 MpOpenid next =  ite.next();
                 if(next.getIsGranted()==1)
                 {
                   ++ grantedsum;
                 }
             }

             mc.setGrantedSum(grantedsum);

         } else{
             mc.setFollowSum(0);
             mc.setGrantedSum(0);
         }

        return mc;
    }
    /**
     * 添加公众帐号
     *
     * @param mp 添加的公众帐号
     *
     * @return  添加公众帐号的编号，若公众帐号name已存在 ，则返回0
     */
    public  long addMp(MpCustomer mp) {

       Long mcid=mpCustomerDao.isMpExist(mp.getName());
        if (mcid!=null&&mcid >0) {
          return  Long.valueOf("0");
        }else{
          return   mpCustomerDao.addMpCustomer(mp) ;
        }
    }


    /**
     *  删除 公众帐号
     *
     * @param mcId 公众帐号主键
     *
     */
    public void delMp(long mcId){
        mpCustomerDao.deleteRole(mcId);
    }


    /**
     *  更新 token
     *
     * @param mcId 公众帐号主键
     * @param  token
     *
     */
   public void updateToken(long mcId,String token)
   {
       mpCustomerDao.updateToken(mcId,token);
   }

    /**
     *  更新 disabled
     *
     * @param mcId 公众帐号主键
     * @param  token
     *
     */
    public void updateDisabled(long mcId,short disabled)
    {
        mpCustomerDao.updateDisabled(mcId,disabled);
    }


    /**
     *  更新 appid appsecret
     * @param mcId
     * @param appId
     * @param appSecret
     */

  public void updateApp(long mcId,String appId,String appSecret)
  {
       mpCustomerDao.updateApp(mcId,appId,appSecret);
  }

    /**
     *  获得 公众帐号的授权记录
     * @param mcId
     * @param loginName
     * @param isGranted
     * @return
     */
    public Pager<MpOpenid> getGrantedList(Long mcId,String loginName,Short isGranted ,int pageIndex )
    {
        // 查询  总条数
        int totalResults = mpCustomerDao.getGrantedListCount(mcId,loginName,isGranted);

        // 构造一个分页器
        Pager<MpOpenid> pager = new Pager<MpOpenid>(totalResults, pageIndex);

        // 查询 授权分页列表
        List<MpOpenid> mList = mpCustomerDao.getGrantedListPage(mcId,loginName,isGranted, pager.getSkipResults(),
                pager.getMaxResults());
         pager.setData(mList);

        return pager ;


    }



    /**
     * 批量删除 公众帐号信息
     * @param mcId
     */
   public void delMps(List<Long> mcId)
   {
       mpCustomerDao.delMps(mcId);
   }


    public int getMCNameCount(String name)
    {
        return mpCustomerDao.getMCNameCount(name) ;
    }


    /**
     * 获取 客户下 公众帐号列表
     * @return
     */
    public List<MpCustomerGroup> getMpCustomerGroup()
    {
        List<MpCustomerGroup> mpCustomerGroups=mpCustomerDao.getMpCustomerGroup();
       MpCustomerGroup nullMpCustomGroup=new MpCustomerGroup();
//        Customer nullCustomer=new Customer();
//        nullCustomer.setCustomerName("没有关联客户");
        nullMpCustomGroup.setCustomerName("没有关联客户");
//      /*  将所有customer为空的mc 放在一起*//**/
      List<MpCustomer> mpCustomerList=new ArrayList<MpCustomer>();
       Iterator<MpCustomerGroup> it=mpCustomerGroups.iterator();
        while (it.hasNext()) {
            MpCustomerGroup next =  it.next();
            if(next.getCustomerId()<1)
            {
              if(next.getMpCustomerList()!=null)
              {
                  mpCustomerList.addAll(next.getMpCustomerList()) ;
              }
                //del the null mpcutomergroup
               it.remove();
            }
        }

        nullMpCustomGroup.setMpCustomerList(mpCustomerList);
        mpCustomerGroups.add(nullMpCustomGroup);

        return  mpCustomerGroups;
    }


    public void delMpOpenidByMcIdList(List<Long> mcId)
    {
        mpCustomerDao.delMpOpenidByMcIdList(mcId);
    }
}
