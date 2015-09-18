package com.loiot.baqi.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 关注 回复消息
 * User: zsf
 * Date: 9/18/13
 * Time: 6:44 PM
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MpRuleFollow {

    private String content;
    private long mpMsgId;
    private long mcId;
    private long  mrId;
    private long  mtId;
    private long msgId;
    private String name;
    private short category;
    private short type ;

}
