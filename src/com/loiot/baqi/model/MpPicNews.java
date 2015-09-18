package com.loiot.baqi.model;


import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 客户帐号列表
 * 
 * @author lum
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MpPicNews implements java.io.Serializable {

    private static final long serialVersionUID = -7359793891878472807L;
	private long mpMsgId;
	private long miId; 
	private String title;
	private Date createTime;  
}
