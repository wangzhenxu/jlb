package com.loiot.baqi.controller;


import com.loiot.baqi.model.*;
import com.loiot.baqi.service.MpPdtRuleService;
import com.loiot.baqi.service.MpRuleService;
import com.loiot.commons.utils.EncryptUtil;
import com.loiot.commons.utils.RandomUtil;
import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.MpCustomerService;
import com.loiot.baqi.service.WechatLogServices;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.MpCustomer;
import com.timeloit.pojo.MpOpenid;
import com.timeloit.pojo.MpPdtRule;
import com.timeloit.pojo.MpRule;
import com.timeloit.pojo.MpRuleKw;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * User: zhangsf
 * Date: 13-8-27 Time: 下午1:54
 */

@Controller
@RequestMapping(value="/mps")
public class MpCustomerController {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    private SimpleDateFormat format=new SimpleDateFormat("yyMMddHHmmssSSS");
    @Resource
    private MpCustomerService mpCustomerService ;

    @Resource
    private WechatLogServices wechatLogServices;

    @Resource
    private MpPdtRuleService mpPdtRuleService;

    @Resource
    private MpRuleService mpRuleService;
    /**
     * 客户 公众帐号列表
     *
     * @param model
     * @param createTime
     * @param  pageIndex
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getMpList(ModelMap model,
                            @RequestParam(value = "ci",defaultValue="0") long customerId,
                            @RequestParam(value = "ct",defaultValue="") String createTime,
                            @RequestParam(value = "pi", defaultValue = "0") int pageIndex) throws Exception {

        List<Customer> crs=mpCustomerService.getCustomers();

        model.put("crs", crs);

        if(customerId>0)
        {
            Pager<MpCustomer> pager = mpCustomerService.getMpListPage(customerId,createTime, pageIndex);
            model.put("mps", pager.getData());
            model.put("pager", pager);
            model.put("ci", customerId);
        }else{
            if(crs!=null&&crs.size()>0)
            {
                Pager<MpCustomer> pager = mpCustomerService.getMpListPage(crs.get(0).getCustomerId(),createTime, pageIndex);
                model.put("mps", pager.getData());
                model.put("pager", pager);
                model.put("ci", crs.get(0).getCustomerId());
            }

        }


        model.put("ct",createTime) ;
        model.put("menuClass", "mpsClass");


        return "/mps/mps_list";
    }

    /**
     * 获取公众帐号信息
     *
     * @param model
     * @param mcId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getMp(ModelMap model,@RequestParam(value = "mcId",defaultValue="") long mcId) throws Exception {
         MpCustomer mp=mpCustomerService.getMp(mcId);
        model.put("mp",mp);
        return "/mps/mps_detail"  ;
    }

    /**
     * 跳转到 添加公众帐号页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toAddmp", method = RequestMethod.GET)
    public String addMp(ModelMap model,@RequestParam(value = "ty",defaultValue ="0") int type,@RequestParam(value="tp",defaultValue = "")String tip)  throws Exception
    {
        if(type==1)
        {
          model.put("tip",tip);
        }
         return "/mp/mpAdd";
    }



//    /**
//     * 初步添加 公众帐号信息
//     * @param model
//     * @param mc
//     * @param session
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value="/Addmp",method = RequestMethod.POST)
//    public String toAddmp(ModelMap model ,MpCustomer mc,HttpSession session) throws  Exception{
//        Customer c=(Customer) session.getAttribute(Const.SESSION_USER_KEY);
//
//         mc.setCustomerId(c.getCustomerId());
//      /*  使用des 加密name作为token*/
//        String rawtoken=  EncryptUtil.encodeDES(mc.getName());
//
//        String token=rawtoken.substring(0,rawtoken.length()>18?18:rawtoken.length()-1);
//    /*    使用name获得8位随机数，作为url*/
//        String url= RandomUtil.nextString(15,format.format(new Date()));
//
//        String fullUrl= ApplicationConst.MP_URL_PREFIX+url;
//
//        mc.setToken(token);
//        mc.setUrl(url);
//        mc.setCreateTime(new Date());
//        mc.setDisabled(1);
//        long  mcId=mpCustomerService.addMp(mc);
//
//        mc.setMcId(mcId);
//        mc.setUrl(fullUrl);
//        model.put("mp",mc) ;
//
//        return "/mp/toAddmp2";
//
//    }

    /**
     *添加 appid appsecret
     * @param model
     * @param appId
     * @param appSecret
     * @param mcId
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/toAddMp2")
    @ResponseBody
    public Object addMp2(ModelMap model,
                 @RequestParam(value="ai") String appId,
                 @RequestParam(value = "as") String appSecret,
                 @RequestParam(value="mcId")Long mcId)   throws  Exception{


         try{
             mpCustomerService.updateApp(mcId,appId,appSecret);
             return  AjaxResponse.OK;
         }catch(Exception e)
         {
             return AjaxResponse.FAILED;
         }

    }


    /**
     *  更改启用状态
     * @param mcId
     * @param disabled
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/disabled",method = RequestMethod.GET)

      public Object disabled(@RequestParam(value = "mcId", defaultValue = "0") long mcId,
                             @RequestParam(value = "disabled", defaultValue = "0") short disabled) throws  Exception{

          mpCustomerService.updateDisabled(mcId,disabled);

          return AjaxResponse.OK;

      }


    /**
     * 获取 公众帐号已授权的loiot用户列表
     * @param model
     * @param mcId
     * @param loginName
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/grantedLs",method = RequestMethod.GET)
    public String getGrantedList( ModelMap model,
      @RequestParam(value = "mcId", defaultValue = "0")Long mcId,
      @RequestParam(value = "ln", defaultValue = "null") String  loginName,
      @RequestParam(value = "gt", defaultValue = "-1") Short  granted,
      @RequestParam(value = "pi", defaultValue = "0") int pageIndex
    )  throws Exception
    {
           if(loginName.equals("null"))
           {
              loginName=null;
           }
          if(granted==-1)
          {
              granted=null;
          }
        Pager<MpOpenid>  pger=mpCustomerService.getGrantedList(mcId,loginName,granted,pageIndex);
        MpCustomer mc=mpCustomerService.getMp(mcId);

        model.put("pager",pger);
        model.put("mos",pger.getData());
        model.put("mc",mc) ;
        model.put("lg",loginName);

        return"mps/mps_granteds";
    }


    /**
     * 批量 删除 公众帐号信息
     *    删除公众帐号下 openid 信息
     * @param del
     * @param createTime
     * @return
     * @throws Exception
     */
   @RequestMapping(value="/del")
   public String del(@RequestParam(value = "del", defaultValue = "")String del,
                     @RequestParam(value = "ct",defaultValue="") String createTime ,
                     @RequestParam(value = "ci",defaultValue="0") long  customerId
                      ) throws Exception
   {
//       if(del!=null){
//           String[] mcids=del.split(",");
//           List<Long>  ar=new ArrayList<Long>();
//           for(int i=0;i<mcids.length;i++)
//           {
//               ar.add(Long.valueOf(mcids[i]));
//           }
//
//            mpCustomerService.delMps(ar);
//
//           //TODO 删除openid 信息   产品规则 关键字规则 关注回复规则
//       }

       if(del!=null){
           String[] mcids=del.split(",");
           List<Long>  ar=new ArrayList<Long>();
           for(int i=0;i<mcids.length;i++)
           {
               ar.add(Long.valueOf(mcids[i]));
           }
           if(ar.size()>0)
           {
               //TODO 删除openid 信息   产品规则 关键字规则
               mpCustomerService.delMpOpenidByMcIdList(ar);
               //DEL 产品规则 属性 命令组关联信息，关键字，规则内容
               MpPdtRuleCateoryByType mpPdtRuleCateoryByType=mpPdtRuleService.getMpPdtRuleCateoryByType(ar);
               List<Long> allMprIdList=new ArrayList<Long>();
               if(mpPdtRuleCateoryByType!=null)
               {
                   if(mpPdtRuleCateoryByType.getAttrMprIdList()!=null&&mpPdtRuleCateoryByType.getAttrMprIdList().size()>0){
                       mpPdtRuleService.delMpPdtRuleAttrByMprIdList(mpPdtRuleCateoryByType.getAttrMprIdList());
                       allMprIdList.addAll(mpPdtRuleCateoryByType.getAttrMprIdList());
                   }
                   if(mpPdtRuleCateoryByType.getCmdMprIdList()!=null&&mpPdtRuleCateoryByType.getCmdMprIdList().size()>0)
                   {
                       mpPdtRuleService.delMpPdtRuleCmdByMprIdList(mpPdtRuleCateoryByType.getCmdMprIdList());
                       allMprIdList.addAll(mpPdtRuleCateoryByType.getCmdMprIdList());
                   }
                   if(allMprIdList.size()>0)
                   {
                       mpPdtRuleService.delMpPdtRuleKwByMprIdList(allMprIdList);
                       mpPdtRuleService.delMpPdtRuleByMprIdList(allMprIdList);
                   }
               }

               //DEL 关键字规则
               McMsgIdsByType mcMsgIdsByType= mpRuleService.getMpMsgIdsByType(ar);
               if(mcMsgIdsByType!=null)
               {
                   List<Long> AllMpMsgIdButNews=mcMsgIdsByType.getTextMpMsgIds();
                   AllMpMsgIdButNews.addAll(mcMsgIdsByType.getMusicMpMsgIds()) ;
                   if(AllMpMsgIdButNews!=null&&AllMpMsgIdButNews.size()>0)
                   {
                       mpRuleService.delNoNewsMpsMpMsg(AllMpMsgIdButNews);
                         /*删除除new消息外的mpmsg*/
                       if(mcMsgIdsByType.getMusicMpMsgIds()!=null&&mcMsgIdsByType.getMusicMpMsgIds().size()>0)
                       {
                           mpRuleService.delMpMusicByMpMsgIdList(mcMsgIdsByType.getMusicMpMsgIds());

                       }
                       if(mcMsgIdsByType.getTextMpMsgIds()!=null&&mcMsgIdsByType.getTextMpMsgIds().size()>0)
                       {
                           mpRuleService.delMpTextByMpMsgIdList(mcMsgIdsByType.getTextMpMsgIds());
                       }
                          /* 删除公众帐号规则及关键字*/
                       mpRuleService.delMpRuleKwByMcIdList(ar);
                       mpRuleService.delMpRuleByMcIdList(ar);
                   }

               }
               //删除公共帐号信息
               mpCustomerService.delMps(ar);
           }




       }
       return "redirect:/mps/list.action?ct="+createTime+"&ci="+customerId;

   }


    /**
     * 更新 公众帐号app 信息
     * @param mcId
     * @param appid
     * @param appSecret
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "/updateApp")
    @ResponseBody
    public Object updateApp(@RequestParam(value = "mi",required = true)long mcId,
                            @RequestParam(value = "ai",required = true)String appid,
                            @RequestParam(value = "as",required = true)String appSecret)throws  Exception{

        try{
            mpCustomerService.updateApp(mcId,appid,appSecret);
        }catch(Exception e)
        {
           return AjaxResponse.FAILED;
        }


        return AjaxResponse.OK;
    }


    /**
     * 链接到 公众帐号修改页面
     * @param model
     * @param mcId
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/edit")
    public String edit(ModelMap model,@RequestParam(value="mi",required = true)long mcId)throws  Exception{
        MpCustomer mp=mpCustomerService.getMp(mcId);
        mp.setUrl(ApplicationConst.MP_URL_PREFIX+mp.getUrl());
        model.put("mp",mp) ;
        model.put("edit","edit");
        return "/mps/toAddmp2";
    }


    /**
     * 公共帐号修改保存
     * @param model
     * @param token
     * @param appId
     * @param appSecret
     * @param mcId
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/editSave")
    @ResponseBody
    public Object editSave(ModelMap model,
                        @RequestParam(value = "token") String token,
                         @RequestParam(value="ai") String appId,
                         @RequestParam(value = "as") String appSecret,
                         @RequestParam(value="mcId")Long mcId)   throws  Exception{

        try{
            mpCustomerService.updateApp(mcId,appId,appSecret);
            mpCustomerService.updateToken(mcId,token);
            return AjaxResponse.OK;
        }catch(Exception e)
        {
           return  AjaxResponse.FAILED;
        }



    }


    /**
     * 检查添加的名称 是否可用
     * @param name
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/checkName")
    public Object  checkMCName(@RequestParam(value="name",required = true)String name) throws Exception
    {
        int i=mpCustomerService.getMCNameCount(name);
        if(i>0)
        {
           return new AjaxResponse(-1,"名称已存在！");
        }else{
            return  AjaxResponse.OK;
        }

    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }


    /**
     * 操作记录
     * @param model
     * @param session
     * @param cat
     * @param kw
     * @param mcId
     * @param type
     * @param pageIndex
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/opls")
    public String opls(ModelMap model,
                       HttpSession session,
                       @RequestParam(value="cat",defaultValue = "0")short cat,
                       @RequestParam(value="kw",defaultValue = "")String kw,
                       @RequestParam(value="mi",defaultValue = "0")short mcId,
                       @RequestParam(value="ty",defaultValue = "100")short type,
                       @RequestParam(value = "pi", defaultValue = "0") int pageIndex) throws  Exception
    {

        List<MpCustomer> mclist=mpCustomerService.getAllMps();
        List<MpCustomerGroup> mcgs=mpCustomerService.getMpCustomerGroup();
        model.put("mcgs",mcgs) ;
        model.put("mps",mclist) ;
         Pager<WechatLog> ops =null;
        if(cat!=0&&mcId>0)
        {
            if(type==100)
            {
                ops=wechatLogServices.getAllWechatLogsPage(mcId,kw,pageIndex) ;
            } else{
                ops=wechatLogServices.getWechatLogsPage(mcId,type,kw,pageIndex);
            }
            MpCustomer mp=mpCustomerService.getMp(mcId);

            model.put("pager",ops);


            model.put("mp",mp);
            model.put("cat",1);
            model.put("kw",kw);
            model.put("ty",type);
            model.put("mi",mcId);
        }
        model.put("menuClass", "mpsOpsClass");
         return"/mps/mps_ops";
    }


    /**
     * 规则设定
     * @param cat
     * @param mcid
     * @param ruleName
     * @return
     * @throws Exception
     */
   @RequestMapping(value="/rules")
   public  String rules(ModelMap model,
                        @RequestParam(value="cat",defaultValue = "0")int cat,
                        @RequestParam(value="mi",defaultValue = "0")long mcid,
                        @RequestParam(value="pi",defaultValue = "0")int pageIndex,
                        @RequestParam(value="rn",required = false)String ruleName)throws  Exception{

       List<MpCustomer> mps=mpCustomerService.getAllMps();
       List<MpCustomerGroup> mcgs=mpCustomerService.getMpCustomerGroup();
       model.put("mcgs",mcgs) ;
       model.put("mps",mps);

       if(mcid>0)
       {
            if(cat==0)//产品规则
            {
                Pager<MpPdtRule> pager = mpPdtRuleService.getMpRulesPage(mcid, ruleName, pageIndex);
                model.put("pdrs", pager.getData());
                model.put("pager", pager);
                model.put("mcId", mcid);
                model.put("name",ruleName);

            } else if(cat==1)//关注回复 规则
            {
                MpRuleFollow mrf=mpRuleService.getMpRuleFollow(mcid);
                model.put("mrf",mrf);
                MpCustomer mp=mpCustomerService.getMp(mcid);
                model.put("mp",mp);

            } else if(cat==2)//关键字规则
            {
    			Pager<MpRule> pager = mpRuleService.getMpRulesPage(mcid,
    					ruleName, pageIndex);
    			List<MpRuleKw> keyWords=new ArrayList<MpRuleKw>();
    			for (MpRule mpRule : pager.getData()) {
    				Long mrId=mpRule.getMrId();
    				List<MpRuleKw> keyWord=mpRuleService.getKeysByRuleid(mrId);
    				for (MpRuleKw mpRuleKw : keyWord) {
    					keyWords.add(mpRuleKw);
					}
				}
    			model.put("keyWords", keyWords);
                model.put("pdrs", pager.getData());
                model.put("pager", pager);
                model.put("mcId", mcid);
                model.put("name",ruleName);
            }


           model.put("cat",cat);
       }else{ //默认
           if(mps!=null&&mps.size()>0)
           {
               if(cat==0)//产品规则
               {
                   Pager<MpPdtRule> pager = mpPdtRuleService.getMpRulesPage(mps.get(0).getMcId(), ruleName, pageIndex);
                   model.put("pdrs", pager.getData());
                   model.put("pager", pager);
                   model.put("mcId", mps.get(0).getMcId());
                   model.put("name","");

               } else if(cat==1)//关注回复 规则
               {
                   MpRuleFollow mrf=mpRuleService.getMpRuleFollow(mps.get(0).getMcId());
                   model.put("mrf",mrf);
                   MpCustomer mp=mpCustomerService.getMp(mps.get(0).getMcId());
                   model.put("mp",mp);

               } else if(cat==2)//关键字规则
               {
       			Pager<MpRule> pager = mpRuleService.getMpRulesPage(mps.get(0).getMcId(),
    					ruleName, pageIndex);
    			List<MpRuleKw> keyWords=new ArrayList<MpRuleKw>();
    			for (MpRule mpRule : pager.getData()) {
    				Long mrId=mpRule.getMrId();
    				List<MpRuleKw> keyWord=mpRuleService.getKeysByRuleid(mrId);
    				for (MpRuleKw mpRuleKw : keyWord) {
    					keyWords.add(mpRuleKw);
					}
				}
    			model.put("keyWords", keyWords);
                model.put("pdrs", pager.getData());
                model.put("pager", pager);
                model.put("mcId", mps.get(0).getMcId());
                model.put("name","");
               }

           }

           model.put("cat",cat);
       }

       model.put("menuClass", "mpsRuleClass");

       return "/mps/rule/mps_rules";
   }
}
