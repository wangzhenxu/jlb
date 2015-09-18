package com.loiot.baqi.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.UserService;
import com.timeloit.pojo.Scene;
import com.timeloit.pojo.User;

/**
 * 网站用户处理器。
 * 
 * @author zhengrj
 * 
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 网站用户业务逻辑接口
     */
    @Resource
    private UserService userService;

    /**
     * 跳转网站用户列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
            @RequestParam(value = "username", defaultValue = "") String username, ModelMap model) {

        Pager<User> pager = userService.getUserListPage(username, pageIndex);
        model.put("pager", pager);
        model.put("username", username);
        model.put("menuClass", "userManage");
        return "/user/user_list";
    }

    
    /**
     * 用户详情展示
     * @param userid
     * @param model
     * @return
     */
    @RequestMapping(value = "/userView")
    public String userView(@RequestParam(value = "userid", defaultValue = "0") int userid
           , ModelMap model,@RequestParam(value = "pi", defaultValue = "0") int pageIndex) {
        User user=userService.getUserinfoById(userid);
        Pager<Scene> scenes=userService.getSceneAndProductByUserId(userid,pageIndex);
        model.put("user", user);
        model.put("scenes", scenes.getData());
        model.put("pager", scenes);
        model.put("userid", userid);
        model.put("menuClass", "userManage");
        return "/user/user_view";
    }
    
}
