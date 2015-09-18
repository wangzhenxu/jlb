package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.loiot.baqi.model.ScenePo;
import com.timeloit.pojo.Scene;

/**
 * 场景数据访问接口。
 * 
 * @author yanjg
 */
@Repository("sceneDao")
public class SceneDao extends SqlSessionDaoSupport {

	/**
	 * 查询符合条件的场景数
	 * 
	 */
	public int getSceneListCount(Map<String, Object> pMap) {
		return (Integer) getSqlSession().selectOne("Scene.getSceneListCount",
				pMap);
	}

	/**
	 * 获取符合条件的场景列表
	 * @param pMap
	 * @param skipResults
	 * @param maxResults
	 * @return
	 */
	public List<Scene> getSceneList(Map<String, Object> pMap, int skipResults,
			int maxResults) {
		pMap.put("skipResults", skipResults);
		pMap.put("maxResults", maxResults);

		return (List<Scene>)getSqlSession().selectList("Scene.getSceneList", pMap);
	}
	/**
	 * 获取场景详情数据,包括节点列表及当前值
	 * @param snValue
	 * @return
	 */
	public ScenePo getScenePo(String snValue) {
		// TODO Auto-generated method stub
		return (ScenePo)getSqlSession().selectOne("Scene.getScenePo",snValue);
	}

}
