package com.loiot.baqi.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.ProjectRest;

/**
 * 餐饮项目访问接口
 * @author yanjg
 */
@Repository("projectRestDao")
public class ProjectRestDao extends SqlSessionDaoSupport {

	public void saveProjectRest(ProjectRest projectRest) {
		// TODO Auto-generated method stub
		getSqlSession().insert("ProjectRest.saveProjectRest", projectRest);
	}
	
	public void deleteProjectRest(String[] customerIds){
		getSqlSession().delete("ProjectRest.deleteProjectRest", customerIds);
		
	}

	/**
	 * 更新project_rest表
	 * @param projectRest
	 */
	public void updateProjectRest(ProjectRest projectRest) {
		// TODO Auto-generated method stub
		getSqlSession().update("ProjectRest.updateProjectRest", projectRest);
	}
}
