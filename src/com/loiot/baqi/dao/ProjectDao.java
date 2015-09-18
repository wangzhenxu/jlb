package com.loiot.baqi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.Project;
import com.timeloit.pojo.Scene;

/**
 * 项目访问接口
 * @author yanjg
 */
@Repository("projectDao")
public class ProjectDao extends SqlSessionDaoSupport {

	public void save(Project project) {
		// TODO Auto-generated method stub
		getSqlSession().insert("Project.saveProject", project);
	}

	/**
	 * 获取项目总条数
	 * @param pMap
	 * @return
	 */
	public int getProjectCount(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("Project.getProjectCount",pMap);
	}

	public List<Project> getProjectList(Map<String, Object> pMap,
			int skipResults, int maxResults) {
		// TODO Auto-generated method stub
		pMap.put("skipResults", skipResults);
		pMap.put("maxResults", maxResults);

		return (List<Project>)getSqlSession().selectList("Project.getProjectList", pMap);
	}

	public Project getProject(long projectId) {
		// TODO Auto-generated method stub
		return (Project)getSqlSession().selectOne("Project.getProject",projectId+"");
	}

	public void update(Project project) {
		// TODO Auto-generated method stub
		getSqlSession().update("Project.updateProject",project);
	}

	public void del(String[] projectIdArr) {
		// TODO Auto-generated method stub
		getSqlSession().delete("Project.delProject", projectIdArr);
	}

	public List<Project> getAllList() {
		// TODO Auto-generated method stub
		return (List<Project>)getSqlSession().selectList("Project.getProjectList");
	}
}
