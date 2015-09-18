package com.loiot.baqi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.model.ScenePo;
import com.loiot.baqi.model.SceneProductDetail;
import com.loiot.baqi.service.SceneService;
import com.timeloit.pojo.Scene;

/**
 * 场景管理处理器。
 * 
 * @author yanjg
 * 
 */
@Controller
@RequestMapping(value = "/scene")
public class SceneController {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 场景业务逻辑
     */
    @Resource
    private SceneService sceneService;

  /**
  * 场景列表页
  * 
  */
 @RequestMapping(value = "/list")
 public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex ,
		 @RequestParam(value = "sSn", defaultValue="") String sSn,
		 @RequestParam(value="sName",defaultValue="" ) String sName,
		 ModelMap model) {
	 Map<String,Object> pMap=new HashMap<String,Object>();
	 pMap.put("sSn", sSn);
	 pMap.put("sName", sName);
	 Pager<Scene> pager = sceneService.getSceneListPage(pMap, pageIndex);
	 
	 model.put("pager", pager);
     model.put("sName", sName);
     model.put("sSn", sSn);
     model.put("menuClass", "sceneManage");
     return "/scene/scene_list";
 }
 
 /**
  * 场景详情页
  * 
  */
 /**
 * @param snValue
 * @param model
 * @return
 */
@RequestMapping(value = "/detail")
 public String detail(@RequestParam(value = "sn", required=true) String snValue ,
		 ModelMap model) {
	 List<SceneProductDetail> spdList=new ArrayList<SceneProductDetail>();
//	 获取场景详情数据,包括节点列表及当前值
	 ScenePo scenePo=sceneService.getScenePo(snValue);
	 
//	 将scenePo中的信息填充到spdList中
	 sceneService.fillSPDList(scenePo,spdList);
	 
	 model.put("scene", scenePo);
     model.put("spdList", spdList);
     model.put("menuClass", "sceneManage");
     return "/scene/scene_detail";
 }
//    /**
//     * 跳转后台用户列表页
//     * 
//     * @return 模板位置
//     */
//    @RequestMapping(value = "/list")
//    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
//            @RequestParam(value = "username", defaultValue = "") String username, ModelMap model) {
//
//        Pager<Account> pager = accountService.getAccountListPage(username, pageIndex);
//        model.put("pager", pager);
//        model.put("username", username);
//
//        return "/account/account_list";
//    }
//
//    /**
//     * 跳转到添加页面
//     * 
//     * @return
//     */
//    @RequestMapping(value = "/toAddAccount")
//    public String toAddAccount(ModelMap model) {
//        model.put("roleList", roleService.getRoleListAll());
//        return "/account/account_add";
//    }
//
//    /**
//     * 添加账户
//     * 
//     * @param account 账户
//     * @return ajax响应
//     */
//    @RequestMapping(value = "/add")
//    @ResponseBody
//    public Object add(Account account) {
//
//        // 数据不合格，返回系统繁忙
//        if (StringUtils.isBlank(account.getUsername()) || account.getRole() == null
//                || account.getRole().getRoleId() == null) {
//            return AjaxResponse.SYSTEM_BUSY;
//        }
//
//        try {
//            accountService.addAccount(account);
//        } catch (UsernameExistException ex) {
//            // 用户名已经存在
//            log.debug("username is exist", ex);
//            return ACCOUNT_USERNAME_EXIST;
//        }
//
//        // 添加成功
//        return AjaxResponse.OK;
//    }
//
//    /**
//     * 跳转到编辑页面
//     * 
//     * @return
//     */
//    @RequestMapping(value = "/toEditAccount")
//    public String toEditAccount(@RequestParam(value = "accountId", required = true) Long accountId, ModelMap model) {
//        model.put("account", accountService.getAccountById(accountId));
//        model.put("roleList", roleService.getRoleListAll());
//        return "/account/account_edit";
//    }
//
//    /**
//     * 更新账户
//     * 
//     * @param account 账户
//     * @return ajax响应
//     */
//    @RequestMapping(value = "/edit")
//    @ResponseBody
//    public Object edit(Account account) {
//        accountService.updateAccount(account);
//        return AjaxResponse.OK;
//    }
//
//    /**
//     * 跳转到查看页面
//     * 
//     * @return
//     */
//    @RequestMapping(value = "/toViewAccount")
//    public String toViewAccount(@RequestParam(value = "accountId", required = true) Long accountId, ModelMap model) {
//        model.put("account", accountService.getAccountById(accountId));
//        return "/account/account_view";
//    }
//
//    /**
//     * 删除后台账号
//     * 
//     * @param accountId 后台账号ID
//     */
//    @RequestMapping(value = "/delete")
//    public String delete(@RequestParam(value = "accountId", required = true) Long accountId) {
//        accountService.deleteAccount(accountId);
//        return "redirect:/account/list.action";
//    }
}
