/*
 * Timeloit.com Inc.
 * Copyright (c) 2012 时代凌宇物联网数据平台. All Rights Reserved
 */
package com.loiot.baqi.model;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.timeloit.pojo.NodeAttribute;
import com.timeloit.pojo.Product;
import com.timeloit.pojo.SimpleLoiotPojo;
import com.timeloit.pojo.Tag;

/**
 * @author yanjg
 * 
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class NodePo extends SimpleLoiotPojo implements java.io.Serializable {
    private static final long serialVersionUID = -7359793891878472807L;
    private Long nodeId;
    private String snValue;
    private String name;
    private String description;
    
    private NodeCurrentDataPo currentData;
    /**
     * 节点对应的产品
     */
    Product product;
    /**
     * 节点对应的标签
     */
    private List<Tag> tags;
    
    /**
     * 节点对应的属性
     */
    private List<NodeAttribute> attrs;
}
