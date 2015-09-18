package com.loiot.baqi.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.ProjectService;
import com.timeloit.pojo.CustomerRole;
import com.timeloit.pojo.Project;

/**
 * 项目管理处理器。
 * 
 * @author yanjg
 * 
 */
@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 项目业务逻辑
	 */
	@Resource
	private ProjectService projectService;

	@RequestMapping(value = "/list")
	public String list(
			@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
			@RequestParam(value = "name", defaultValue = "") String name,
			ModelMap model) {
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("name", name);
		Pager<Project> pager = projectService.getProjectList(pMap, pageIndex);

		model.put("pager", pager);
		model.put("name", name);
		model.put("menuClass", "projectManage");
		return "/project/list";
	}

	@RequestMapping(value = "/toAdd")
	public String toAdd(ModelMap model) {
		model.put("menuClass", "projectManage");
		return "/project/add";
	}

	@RequestMapping(value = "/add")
	public String add(Project project) {
		projectService.save(project);
		return "redirect:/project/list.action";
	}
	
	@RequestMapping(value="/detail")
	public String detail(@RequestParam(value="projectId") long projectId,
			ModelMap model){
		Project project =projectService.getProject(projectId);
		model.put("project", project);
		model.put("menuClass", "projectManage");
		return "/project/detail";
	}
	
	@RequestMapping(value="/toEdit")
	public String toEdit(@RequestParam(value="projectId") long projectId,
			ModelMap model){
		Project project =projectService.getProject(projectId);
		model.put("project", project);
		model.put("menuClass", "projectManage");
		return "/project/edit";
	}
	
	@RequestMapping(value="/edit")
	public String edit(Project project,
			ModelMap model){
		projectService.update(project);
		model.put("project", project);
		return "redirect:/project/list.action";
	}
	
	@RequestMapping(value="/del")
	@ResponseBody
	public AjaxResponse del(@RequestParam(value="projectIds") String projectIds,
			ModelMap model){
		String [] projectIdArr=projectIds.split(",");
		projectService.del(projectIdArr);
		return AjaxResponse.OK;
	}
	
	@RequestMapping(value="getProjectRole")
	@ResponseBody
	public List<CustomerRole> getProjectRole(@RequestParam(value="projectId") long projectId,
			ModelMap model){
		List<CustomerRole> projectRoleList=projectService.getProjectRole(projectId);
		return projectRoleList;
	}
	
	
	
}
