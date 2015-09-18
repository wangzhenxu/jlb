/*
 * Timeloit.com Inc.
 * Copyright (c) 2012 时代凌宇物联网数据平台. All Rights Reserved
 */
package com.loiot.baqi.model;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.timeloit.pojo.Product;
import com.timeloit.pojo.SimpleLoiotPojo;
import com.timeloit.pojo.Tag;



/**
 * @author yanjg
 * 
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ScenePo extends SimpleLoiotPojo implements java.io.Serializable {
    private static final long serialVersionUID = -7359793891878472807L;
/**
 * 场景ID
 */
    private Long sceneId;
    /**
     * sn
     */
    private String snValue;
    /**
     * 场景类型
     */
    private String sceneType;
    /**
     * 场景标题
     */
    private String title;
    /**
     * 使用者
     */
    private String userLoginName;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 场景描述
     */
    private String description;
    /**
     * 场景标签
     */
    private List<Tag> tags;
    /**
     * 场景下属节点
     */
    List<NodePo> nodes;
    /**
     * 场景对应的产品
     */
    Product product;
}
