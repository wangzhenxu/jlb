package com.loiot.baqi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.mongo.NodeData;

/**
 * 节点数据访问接口。
 * 
 * @author zhengrj
 * 
 */
@Repository("nodeDataDao")
public class NodeDataDao {
    /**
     * MongoDB的操作模板。
     */
    @Resource
    private MongoTemplate mongoTemplate;
    /**
     * 节点数据的集合名。
     */
    private final String collectionName = "nodedata";
    
     /**
     * 增加一条节点数据。
     * 
     * @param nodeData 节点数据。
     */
    public void addNodeData(NodeData nodeData) {
        mongoTemplate.insert(nodeData, collectionName);
    }

    /**
     * 增加多条节点数据。
     * 
     * @param nodeDataList 节点数据列表。
     */
    public void addNodeDataList(List<NodeData> nodeDataList) {
        mongoTemplate.insert(nodeDataList, collectionName);
    }
}
