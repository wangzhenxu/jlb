package com.loiot.baqi.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * Author: sf
 * CreateDate: 13-11-1 上午9:22
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MpPdtRuleCateoryByType implements  java.io.Serializable {
    private static final long serialVersionUID = -305379155073051020L;

    private List<Long>  attrMprIdList;
    private List<Long> cmdMprIdList;
}
