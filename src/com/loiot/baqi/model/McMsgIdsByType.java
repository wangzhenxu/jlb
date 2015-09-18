package com.loiot.baqi.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * Author: sf
 * CreateDate: 13-10-31 上午9:32
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class McMsgIdsByType implements java.io.Serializable {

    private static final long serialVersionUID = 1910332144729818862L;

    private List<Long> textMpMsgIds;
    private List<Long> musicMpMsgIds;
    private List<Long> newsMpMsgIds;
}
