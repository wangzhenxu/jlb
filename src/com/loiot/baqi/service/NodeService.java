package com.loiot.baqi.service;

import static org.springframework.data.mongodb.core.query.Criteria.where;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.WriteResultChecking;
import org.springframework.data.mongodb.core.query.Order;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.timeloit.pojo.mongo.NodeData;

/**
 * 节点逻辑类
 * 
 * @author yanjg
 * 
 */
@Service("nodeService")
public class NodeService {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MongoTemplate mongoTemplate;
    
    private String MONGO_TABLE_NODEDATA="nodedata";
    
    
    /**
     * 从mongo中取出最新值
     * @param pMap(ssn,nsn)
     * @return
     */
    public NodeData getMongoCD(Map pMap) {
        // TODO Auto-generated method stub
        mongoTemplate.setWriteResultChecking(WriteResultChecking.EXCEPTION);
        Query query = new Query(where("sceneSn").is(pMap.get("ssn").toString()).and("nodeSn").is(pMap.get("nsn").toString()));
        query.sort().on("at", Order.DESCENDING);
//      BasicQuery query = new BasicQuery("{'sn':'1234','datastreams.current_value':'-333'}");
        NodeData nodeData = mongoTemplate.findOne(query , NodeData.class,MONGO_TABLE_NODEDATA);
        return nodeData;
    }
}
