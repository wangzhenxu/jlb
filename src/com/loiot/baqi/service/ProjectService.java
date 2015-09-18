package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.CustomerRoleDao;
import com.loiot.baqi.dao.ProjectDao;
import com.loiot.baqi.dao.ProjectRestDao;
import com.timeloit.pojo.CustomerRole;
import com.timeloit.pojo.Project;
import com.timeloit.pojo.ProjectRest;

/**
 * 项目逻辑类
 * 
 * @author yanjg
 * 
 */
@Service("projectService")
public class ProjectService {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 项目数据访问接口
     */
    @Resource
    private ProjectDao projectDao;
    @Resource
    private ProjectRestDao projectRestDao;
    @Resource
    private CustomerRoleDao customerRoleDao;
    
    
    /**
     * 获取全部的project 列表
     * @param project
     */
    public List<Project> getAllList(){
    	return projectDao.getAllList();
    }
   		
	public void save(Project project) {
		// TODO Auto-generated method stub
		projectDao.save(project);
	}
	public Pager<Project> getProjectList(Map<String, Object> pMap, int pageIndex) {
		// TODO Auto-generated method stub
      // 查询项目总条数
      int totalResults = projectDao.getProjectCount(pMap);
      // 构造一个分页器
      Pager<Project> pager = new Pager<Project>(totalResults, pageIndex);
      // 查询场景列表
      List<Project> projectList = projectDao.getProjectList(pMap, pager.getSkipResults(),
              pager.getMaxResults());
      pager.setData(projectList);
      return pager;
	}
	
	
	public List<Project> getProjectAllList() {
      // 查询场景列表
      List<Project> projectList = projectDao.getProjectList(new HashMap(), 0,
              100);
      return projectList;
    }
    

	
	
	public Project getProject(long projectId) {
		// TODO Auto-generated method stub
		return projectDao.getProject(projectId);
	}
	public void update(Project project) {
		// TODO Auto-generated method stub
		projectDao.update(project);
	}
	
	public void del(String[] projectIdArr) {
		// TODO Auto-generated method stub
		projectDao.del(projectIdArr);
	}

	/**
	 * 获取一个项目下的角色
	 * @param projectId
	 * @return
	 */
	public List<CustomerRole> getProjectRole(long projectId) {
		// TODO Auto-generated method stub
		return customerRoleDao.getCustomerRoleList(projectId);
	}

	/**
	 * 保存餐饮项目的附加信息
	 * @param projectRest
	 */
	public void saveProjectRest(ProjectRest projectRest) {
		// TODO Auto-generated method stub
		projectRestDao.saveProjectRest(projectRest);
	}

	public void updateProjectRest(ProjectRest projectRest) {
		// TODO Auto-generated method stub
		if(projectRest.getPrId()!=null){//更新数据
			projectRestDao.updateProjectRest(projectRest);			
		}else{//新插入project_rest,在此之前先删除customer下的记录
			projectRestDao.saveProjectRest(projectRest);
		}
	}

	/**
	 * 根据项目代码来查询项目角色
	 * @param commonProject
	 * @return
	 */
	public List<CustomerRole> getProjectRoleByCode(String commonProject) {
		// TODO Auto-generated method stub
		return customerRoleDao.getProjectRoleByCode(commonProject);
	}

	/**
	 * 根据customerId来删除project_rest表中的信息
	 * @param customerId
	 */
	public void delProjectRest(Long customerId) {
		// TODO Auto-generated method stub
		String[] customerIds={customerId+""};
		projectRestDao.deleteProjectRest(customerIds);
	}
	
}
