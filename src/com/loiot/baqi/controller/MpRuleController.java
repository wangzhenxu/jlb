package com.loiot.baqi.controller;

import com.loiot.baqi.constant.Const;
import com.loiot.baqi.model.MpRuleFollow;
import com.loiot.baqi.service.MpCustomerService;
import com.loiot.baqi.service.MpMsgService;
import com.loiot.baqi.service.MpRuleService;
import com.timeloit.pojo.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * User: zhangsf
 * Date: 9/18/13 8:04 PM
 */
@Controller
@RequestMapping(value = "/mp/follow")
public class MpRuleController {

    @Resource
    private MpRuleService mpRuleService;
    @Resource
    private MpCustomerService mpCustomerService  ;
    @Resource
    private MpMsgService mpMsgService  ;
    /**
     * 查询 公众帐号 关注回复信息
     * @param model
     * @param mcId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/disp")
    public String getMpRuleFollow(ModelMap model,
                                  HttpSession session,
                                  @RequestParam( value="mi",defaultValue ="0") long mcId) throws  Exception{
        Customer account = (Customer) session.getAttribute(Const.SESSION_USER_KEY);
        List<MpCustomer> mps=mpCustomerService.getMps(account.getCustomerId()) ;
        model.put("mps",mps);

         if(mcId>0)
         {
             MpRuleFollow mrf=mpRuleService.getMpRuleFollow(mcId);

             model.put("mrf",mrf);

             if(mcId>0)
             {
               MpCustomer mp=mpCustomerService.getMp(mcId);
               model.put("mp",mp);
             }
         }
        return "/mp/follow" ;
    }


    /**
     * 关注规则 更新或者新增
     * @param mcId
     * @param content
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/op")
    public String op(@RequestParam(value = "mi", required = true)long mcId,@RequestParam(value="ctt")String content) throws  Exception{

        int ct=mpRuleService.getMpRuleCount(mcId);

        MpRuleFollow mrfo=mpRuleService.getMpRuleFollow(mcId);

        String ctt=new String(content.getBytes(),"utf-8");

        //是否存在  只更新MpText
        if(ct>0&&mrfo!=null)
        {
            MpRule mr=mpRuleService.getMpRule(mcId);
            MpRuleFollow mrf=mpRuleService.getMpRuleFollow(mcId);
            MpText mt=new MpText();
            mt.setContent(content);
            mt.setCreateTime(new Date());
            mpRuleService.updateMpText(mt);

        }else{ //添加  MpMsg MpText   新的MpRule
            MpMsg mm=new MpMsg();
            mm.setCreateTime(new Date());
            mm.setType((short)0);
            long mmId=mpRuleService.addMpMsg(mm);
            MpText mt=new MpText();
            mt.setContent(content);
            mt.setCreateTime(new Date());
            mt.setMpMsgId(mmId);
            mpRuleService.addMpText(mt);
            MpRule mr=new MpRule();
            mr.setCreateTime(new Date());
            mr.setMpMsgId(mmId);
            mr.setCategory((short)0);
            mr.setName("关注规则");
            mr.setMcId(mcId);

            mpRuleService.addMpRule(mr);
        }
        return "redirect:/mp/follow/disp.action?mi="+ mcId;
    }
	/**
	 * 跳转到 关键字规则查看页面
	 * 
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/replyruleInfo", method = RequestMethod.GET)
	public String toInfoReplyRule(ModelMap model,
			@RequestParam(value = "ruleId") int ruleId, HttpSession session)
			throws Exception {
		MpRule mprule = mpRuleService.getRule(ruleId);
		List<MpRuleKw> mpRuleKws = mpRuleService.getKeysByRuleid(ruleId);
		List<MpNews> mpNews = mpMsgService.getMpImgsNewsById(mprule
				.getMpMsgId());
		List<MpImage> Img =mpMsgService.getNewsImg(mpNews);
		MpText mptextNews = mpMsgService.getMpTextNewsById(mprule.getMpMsgId());
		model.put("Img", Img);
		model.put("mpTextNews", mptextNews);
		model.put("mpNews", mpNews);
		model.put("mpKws", mpRuleKws);
		model.put("mpr", mprule);
		Long mcId=mprule.getMcId();
        if(mcId>0)
        {
          MpCustomer mp=mpCustomerService.getMp(mcId);
          model.put("mp",mp);
        }
		return "/mps/rule/keyWordDetail";
	}
}
