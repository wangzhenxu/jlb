package com.loiot.baqi.pojo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户扩展信息 实体类
 * 
 * @author  wangzx 
 * @creation 2015-10-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AccountExpandInfo  implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
		
	    private java.lang.Long expandId;  //id db_column: expand_id 
	    private java.lang.Long accountId;  //账户id db_column: account_id 
	    private java.lang.Long auditPositionId;  //评审职位id db_column: audit_position_id 
	    private java.lang.String nickName;  //昵称 db_column: nick_name 
	    private java.lang.String iphone;  //手机 db_column: iphone 
	    private java.lang.String email;  //邮箱 db_column: email 
	    private java.lang.Long sexId;  //性别id db_column: sex_id 
	    private java.lang.Long paymentTypeId;  //支付方式 db_column: payment_type_id 
	    private java.lang.String paymentCode;  //支付内容 db_column: payment_code 
	    private java.util.Date inTime;  //录入时间 db_column: in_time 
	    private java.lang.Long inPerson;  //录入人 db_column: in_person 


	public AccountExpandInfo(){
	}

	public AccountExpandInfo(
		java.lang.Long expandId
	){
		this.expandId = expandId;
	}

	
	
}

