package com.loiot.baqi.controller;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.RoleService;
import com.loiot.baqi.service.TgRoleService;
import com.timeloit.pojo.Role;

/**
 * 角色处理器。
 * 
 * @author zhengrj
 * 
 */
@Controller
@RequestMapping(value = "/tgAccount/role")
public class TgRoleController {

    public static final AjaxResponse ROLE_NAME_IS_EMPTY = new AjaxResponse(-100201, "请您输入角色名称");
    public static final AjaxResponse ROLE_PERMISSION_LIST_IS_EMPTY = new AjaxResponse(-100202, "请您选择角色权限");

    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 角色业务逻辑
     */
    @Resource
    private TgRoleService tgRoleService;

    /**
     * 跳转角色列表页
     * 
     * @return 登陆模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
            @RequestParam(value = "roleName", defaultValue = "") String roleName, ModelMap model) {
        // 查询角色
        Pager<Role> pager = tgRoleService.getRoleListPage(roleName, pageIndex);
        model.put("pager", pager);
        model.put("roleName", roleName);
        return "/tgAccount/role/role_list";
    }

    /**
     * 删除角色
     * 
     * @param roleId 角色ID
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam(value = "roleId", required = true) Long roleId) {

        // 删除角色和权限
        tgRoleService.deleteRole(roleId);

        return "redirect:/tgAccount/role/list.action";
    }

    @RequestMapping(value = "/view")
    public String viewRole(@RequestParam(value = "roleId", required = true) Long roleId) {
        return null;
    }

    /**
     * 保存角色,当角色ID存在时，进行更新。当角色ID不存在时，进行新增。
     * 
     * @param role 角色
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public Object save(Role role) {

        // 当角色名称为空时
        if (StringUtils.isEmpty(role.getRoleName())) {
            log.debug("role name is empty.");
            return ROLE_NAME_IS_EMPTY;
        }

        // 当权限列表为空时
        if (CollectionUtils.isEmpty(role.getPermissionList())) {
            log.debug("role permission list is empty.");
            return ROLE_PERMISSION_LIST_IS_EMPTY;
        }

        if (role.getRoleId() != null) {
            // 修改角色
            tgRoleService.updateRole(role);
        } else {
            // 插入数据
            tgRoleService.addRole(role);
        }

        return AjaxResponse.OK;
    }

    /**
     * 获得角色
     * 
     * @param roleId 角色ID
     * @return
     */
    @RequestMapping(value = "/get")
    @ResponseBody
    public Object get(@RequestParam(value = "roleId", required = true) Long roleId) {

        // 当角色ID为空时
        if (roleId == null) {
            log.debug("role id is empty.");
            return AjaxResponse.SYSTEM_BUSY;
        }

        // 获得角色
        Role role = tgRoleService.getRole(roleId);

        if (role != null) {
            return AjaxResponse.OK(role);
        } else {
            return AjaxResponse.SYSTEM_BUSY;
        }

    }
}
