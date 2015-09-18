package com.loiot.baqi.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @Author: zhangsf
 * CreateDate: 13-10-17 下午2:56
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class WechatLog {
    private String openid;
    private String loginName;
    private String type;
    private String keyword;
    private String rule;
    private Date createtime;
    private String content;
}
