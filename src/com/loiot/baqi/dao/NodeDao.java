package com.loiot.baqi.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 节点数据访问接口。
 * 
 * @author zhengrj
 */
@Repository("nodeDao")
@SuppressWarnings("unchecked")
public class NodeDao extends SqlSessionDaoSupport {

}
