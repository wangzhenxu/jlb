/*
 * Timeloit.com Inc.
 * Copyright (c) 2012 时代凌宇物联网数据平台. All Rights Reserved
 */
package com.loiot.baqi.model;

import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.timeloit.pojo.SimpleLoiotPojo;

/**
 * @author yanjg
 * 
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class NodeCurrentDataPo extends SimpleLoiotPojo implements java.io.Serializable {
    private static final long serialVersionUID = -7359793891878472807L;
    private Long at;
    private Map<String, Object> data;
}
