
package com.loiot.baqi.controller;

import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.MpCustomerService;
import com.loiot.baqi.service.MpPdtRuleService;
import com.loiot.baqi.service.ProductService;
import com.loiot.baqi.utils.JsonUtils;
import com.timeloit.pojo.*;
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
import java.util.*;

/**
 * @author zhangsf
 * DateTime: 13-9-2 上午11:26
 */
@Controller
@RequestMapping(value ="/mp/pdtRule")
public class MpPdtRuleController {


    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private MpPdtRuleService mpPdtRuleService;
    @Resource
    private MpCustomerService mpCustomerService;
    @Resource
    private ProductService productService;

    /**
     * 查询 公众帐号下规则模版
     * @param model
     * @param mcId
     * @param name
     * @param pageIndex
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getMpList(ModelMap model,@RequestParam(value = "mcId",defaultValue="0") long mcId,
                            @RequestParam(value = "name",defaultValue="") String name,
                            @RequestParam(value = "pi", defaultValue = "0") int pageIndex,

                            HttpSession session)
                            throws Exception {


        Customer account = (Customer) session.getAttribute(Const.SESSION_USER_KEY);
        List<MpCustomer> mclist= mpCustomerService.getMps(account.getCustomerId()) ;

        if(mcId>0)
        {
            Pager<MpPdtRule> pager = mpPdtRuleService.getMpRulesPage(mcId, name, pageIndex);
            model.put("pdrs", pager.getData());
            model.put("pager", pager);
            model.put("mcId", mcId);
            model.put("name",name);
        }

        model.put("mps",mclist)  ;


        model.put("menuClass", "productClass");

        return "/mp/pdt/rule_list";
    }


    /**
     *   更新 上线状态
     * @param mprId

     * @return
     * @throws Exception
     */
      @RequestMapping(value="/toOnline")

     public Object updateIsOnline(@RequestParam(value="mpr",required = true)Long mprId,
                                  @RequestParam(value = "pi",defaultValue = "0") int pageIndex,
                                  @RequestParam(value="name",defaultValue = "")String name,
                                  @RequestParam(value="mcid",required = true)long mcid) throws  Exception
     {
         try{
             mpPdtRuleService.updateIsOnline(mprId,(short)1);
             return  "redirect:/mp/pdtRule/list.action?pi="+pageIndex+"&name="+name+"&mcId="+mcid ;

         }catch(Exception e)
         {
             return  "redirect:/mp/pdtRule/list.action" ;
         }

     }


//    /**
//     * 跳转到 添加页面
//     * @param model
//     * @param session
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value="/toAdd",method = RequestMethod.GET)
//    public String toAddPdtRule(ModelMap model,HttpSession session) throws  Exception{
//
//        Customer account = (Customer) session.getAttribute(Const.SESSION_USER_KEY);
//         List<MpCustomer> mpls=mpCustomerService.getMps(account.getCustomerId());
//        List<Product>   pdts=productService.getRulePdts(account.getCustomerId());
//        model.put("mps",mpls);
//        model.put("pdts",pdts);
//
//        return  "/mp/pdt/toAdd";
//    }


    /**
     * 查询产品的　命令组和属性
     * @param pdtid
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/getPdtCmdAttr")
    @ResponseBody
    public Object getPdtCmdAttr(@RequestParam(value="pdtid",required = true)Long pdtid) throws  Exception{

        List<ProductAttribute> pals=productService.getProduct_Attribute(pdtid) ;
        List<ProductCommandGroup>  pcgls= productService.getProduct_CommandLGroup(pdtid);
        HashMap<String,Object> paras=new HashMap<String, Object>();
        paras.put("pa",pals);
        paras.put("pcg",pcgls);
        AjaxResponse ajx=new AjaxResponse(1,"ok",paras);
        return ajx;
    }


    /**
     * 添加 产品规则
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/addPdtRule",method = RequestMethod.POST)
    @ResponseBody
    public Object addPdtRule(HttpSession session,
                             @RequestParam(value="pdrjs",required = true)String pdrjs)
            throws Exception{

    //  Customer account = (Customer) session.getAttribute(Const.SESSION_USER_KEY);

        try{
            Map<String,Object> pdr=  JsonUtils.jsonToObject(pdrjs,HashMap.class);

             Long productId=Long.parseLong(pdr.get("pid").toString());

            //判断 产品id是否有效
            if(productId>0)
            {
                Product pt=new Product(productId);
                Long mcId=Long.parseLong(pdr.get("mcid").toString());
                if(mcId>0)
                {
                    MpCustomer mc=new MpCustomer() ;
                      mc.setMcId(mcId);
                    String name=pdr.get("name").toString();
                    String resMsg=pdr.get("resmsg").toString();
                    short type=Short.parseShort(pdr.get("type").toString());
                    List<String> kwls=(List<String>)pdr.get("kws");
                    List<Long>  ass=(List<Long>)pdr.get("ass");

                    //构造 MpPdtRule
                    MpPdtRule mpr=new MpPdtRule();
                    mpr.setProduct(pt);
                    mpr.setMpCustomer(mc);
                    mpr.setIsOnline((short) 0);
                    mpr.setName(name);
                    mpr.setType(type);
                    mpr.setResponseMessage(resMsg);
                    mpr.setCreateTime(new Date());
                   long mprId= mpPdtRuleService.addMpPdtRule(mpr);

                    Iterator itor=kwls.iterator();
                    List<MpPdtRuleKw> mpPdtRuleKwList=new ArrayList<MpPdtRuleKw>();
                    while (itor .hasNext()) {
                        Map<String,Object> next =  (Map<String,Object>)itor .next();
                        MpPdtRuleKw kw=new MpPdtRuleKw();
                        kw.setMprId(mprId);
                        kw.setKeyword(next.get("kw").toString());
                        kw.setMatchWay(Short.parseShort(next.get("matchway").toString()));
                         kw.setCreateTime(new Date());
                        mpPdtRuleKwList.add(kw);
                    }

                    mpPdtRuleService.addMpPdtRuleKws(mpPdtRuleKwList);
                    //控制规则
                    if(type==0)
                    {
                        Iterator assit=ass.iterator();
                        List<MpPdtRuleCmd> mpPdtRuleCmdList=new ArrayList<MpPdtRuleCmd>();
                        while (assit.hasNext()) {
                            Object next =  assit.next();
                            MpPdtRuleCmd cmd=new MpPdtRuleCmd();
                            cmd.setMprId(mprId);
                            cmd.setPcId(Long.parseLong(next.toString()));
                             cmd.setCreateTime(new Date());
                            mpPdtRuleCmdList.add(cmd);
                        }

                        mpPdtRuleService.addMpPdtRuleCmds(mpPdtRuleCmdList);
                    }else{
                         Iterator asif=ass.iterator();
                        List<MpPdtRuleAttr> mpPdtRuleAttrList=new ArrayList<MpPdtRuleAttr>();
                        while (asif.hasNext()) {
                            Object next =  asif.next();
                             MpPdtRuleAttr attr=new MpPdtRuleAttr();
                            attr.setMprId(mprId);
                            attr.setPaId(Long.parseLong(next.toString()));
                            attr.setCreateTime(new Date());
                            mpPdtRuleAttrList.add(attr) ;
                        }

                        mpPdtRuleService.addMpPdtRuleAttrs(mpPdtRuleAttrList);
                    }

                   return  new AjaxResponse(1,"ok！") ;
                } else{
                    return  new AjaxResponse(-2,"invalid  mcId！") ;
                }

            } else{
                return  new AjaxResponse(-2,"invalid  productId！") ;
            }

        }catch(Exception e)
        {
            return  new AjaxResponse(-4,"the parsing of json string may fails ,or database error ！");
        }


    }



    /**
     * 产品模版
     * @param model
     * @param mprid
     * @param type
     * @param  cat 0 查看 1编辑
     * @return
     * @throws Exception
     */
     @RequestMapping(value="/toOp",method=RequestMethod.GET)
    public String pdrEdit(ModelMap model,
                          @RequestParam(value="mpr",required = true) long mprid,
                          @RequestParam(value="ty",required = true) short type,
                          @RequestParam(value="cat",required = true) short cat) throws  Exception{


         MpPdtRule mpr=mpPdtRuleService.getMpPdtRuleMain(mprid);
         List<MpPdtRuleKw> kwls=mpPdtRuleService.getPdtRuleKeys(mprid) ;
         model.put("mpr",mpr) ;
         model.put("ty",type) ;
         model.put("kws",kwls);
         //命令组 规则
         if(type==0)
         {
             List<ProductCommandGroup>  pcgls= productService.getProduct_CommandLGroup(mpr.getProduct().getProductId());
             List<MpPdtRuleCmd> mpPdtRuleCmdList=mpPdtRuleService.getMpPdtRuleCmds(mprid);
             List<Long> pcs=new ArrayList<Long>();
             for (MpPdtRuleCmd li : mpPdtRuleCmdList) {
                 pcs.add(li.getPcId());
             }

             model.put("pcgs",pcgls) ;
             model.put("pcs",pcs) ;
         }else {
             List<ProductAttribute> pals=productService.getProduct_Attribute(mpr.getProduct().getProductId()) ;
             List<MpPdtRuleAttr> mpPdtRuleAttrList=mpPdtRuleService.getMpPdtRuleAttrs(mprid);

             List<Long> pas=new ArrayList<Long>();
              for(MpPdtRuleAttr attr:mpPdtRuleAttrList) {
                  pas.add(attr.getPaId()) ;
              }

             model.put("pals",pals) ;
             model.put("pas",pas);
         }

         if(cat==0){
             return "/mps/rule/ruleDetail";
         } else{
             return "/mp/pdt/edit";
         }

    }

    /**
     * 产品模版 编辑页面保存
     * @param pdrjs
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/editPdtRule",method = RequestMethod.POST)
    @ResponseBody
    public Object editPdtRule(@RequestParam(value = "pdrjs",required = true)String pdrjs) throws Exception{



        try{
            Map<String,Object> pdr=  JsonUtils.jsonToObject(pdrjs,HashMap.class);
             long mprId=Long.parseLong(pdr.get("mprid").toString());
              short type=Short.parseShort(pdr.get("type").toString());

            List<String> kwls=(List<String>)pdr.get("kws");
            List<Long> ass=(List<Long>)pdr.get("ass");

            //删除 所有关键字
            mpPdtRuleService.delKws(mprId);

            //新添加 关键字列表
            Iterator itor=kwls.iterator();
            List<MpPdtRuleKw> mpPdtRuleKwList=new ArrayList<MpPdtRuleKw>();
            while (itor .hasNext()) {
                Map<String,Object> next =  (Map<String,Object>)itor .next();
                MpPdtRuleKw kw=new MpPdtRuleKw();
                kw.setMprId(mprId);
                kw.setKeyword(next.get("kw").toString());
                kw.setMatchWay(Short.parseShort(next.get("matchway").toString()));
                kw.setCreateTime(new Date());
                mpPdtRuleKwList.add(kw);
            }
            mpPdtRuleService.addMpPdtRuleKws(mpPdtRuleKwList);

            //命令组
            if(type==0)
            {
                mpPdtRuleService.delCmds(mprId);

                Iterator assit=ass.iterator();
                List<MpPdtRuleCmd> mpPdtRuleCmdList=new ArrayList<MpPdtRuleCmd>();
                while (assit.hasNext()) {
                    Object next =  assit.next();
                    MpPdtRuleCmd cmd=new MpPdtRuleCmd();
                    cmd.setMprId(mprId);
                    cmd.setPcId(Long.parseLong(next.toString()));
                    cmd.setCreateTime(new Date());
                    mpPdtRuleCmdList.add(cmd);
                }

                mpPdtRuleService.addMpPdtRuleCmds(mpPdtRuleCmdList);
            }else{
                mpPdtRuleService.delAttrs(mprId);

                Iterator asif=ass.iterator();
                List<MpPdtRuleAttr> mpPdtRuleAttrList=new ArrayList<MpPdtRuleAttr>();
                while (asif.hasNext()) {
                    Object next =  asif.next();
                    MpPdtRuleAttr attr=new MpPdtRuleAttr();
                    attr.setMprId(mprId);
                    attr.setPaId(Long.parseLong(next.toString()));
                    attr.setCreateTime(new Date());
                    mpPdtRuleAttrList.add(attr) ;
                }

                mpPdtRuleService.addMpPdtRuleAttrs(mpPdtRuleAttrList);
            }

            return new AjaxResponse(1,"ok");
          }catch(Exception e)
          {
            return  new AjaxResponse(-4,"the parsing of json string may fails ,or database error ！");
          }
    }


    /**
     * 删除 规则
     * @param mprs
     * @param types
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/del",method = RequestMethod.GET)
    @ResponseBody
    public Object delMpr(@RequestParam(value="mprs",required = true)String mprs,
                         @RequestParam(value="types",required=true)String types)throws  Exception{

        try{
            String[] mpridls=mprs.split(",");
            String[] typels=types.split(",");

            if(mpridls.length>0&&(mpridls.length==typels.length))
            {
                for (int i = 0; i < mpridls.length; i++) {
                  long mprid=Long.parseLong(mpridls[i].toString());

                    //删除 规则主体 关键字列表
                    mpPdtRuleService.delMpr(mprid);
                    mpPdtRuleService.delKws(mprid);
                    //命令组
                    if(typels[i].trim().equals("0"))
                    {
                        mpPdtRuleService.delCmds(mprid);

                    } else{
                        mpPdtRuleService.delAttrs(mprid);
                    }

                }
            }


            return  AjaxResponse.OK;

        }catch(Exception e)
        {
            return  new AjaxResponse(-4,"the parsing of json string may fails ,or database error ！");
        }

    }

    @ResponseBody
    @RequestMapping(value="/checkKW",method = RequestMethod.GET)
    public Object checkkw(@RequestParam(value="mi",required = true)long mcId,
                          @RequestParam(value="kw",required = true)String kw)throws  Exception{

        try{
             int count=mpPdtRuleService.getPdtRuleKwTxtCount(mcId,kw);
            if (count<1)
            {
                return  AjaxResponse.OK;
            } else{
                return  new AjaxResponse(-1," 关键字已存在！");
            }

        }  catch (Exception e){
            return  new AjaxResponse(-4,"数据库故障，请重试！");
        }
    }


    @ResponseBody
    @RequestMapping(value="/checkNM",method = RequestMethod.GET)
    public Object checkNM(@RequestParam(value="nm",required = true)String nm)throws  Exception{
        try{
            int count=mpPdtRuleService.getPdtRuleNameCount(nm);
            if (count<1)
            {
                return  AjaxResponse.OK;
            } else{
                return  new AjaxResponse(-1," 规则名称已存在！");
            }

        }  catch (Exception e){
            return  new AjaxResponse(-4,"数据库故障，请重试！");
        }
    }
}

