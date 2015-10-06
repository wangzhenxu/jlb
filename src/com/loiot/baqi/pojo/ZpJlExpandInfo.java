package com.loiot.baqi.pojo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 简历扩展信息 实体类
 * 
 * @author  wangzx 
 * @creation 2015-10-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ZpJlExpandInfo  implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
		
	    private java.lang.Long jlExpandId;  //简历扩展id db_column: jl_expand_id 
	    private java.lang.Long jlId;  //简历id db_column: jl_id 
	    private java.lang.String jlFilePath;  //简历存放路径 db_column: jl_file_path 
	    private java.lang.String jlContent;  //简历内容 db_column: jl_content 


	public ZpJlExpandInfo(){
	}

	public ZpJlExpandInfo(
		java.lang.Long jlExpandId
	){
		this.jlExpandId = jlExpandId;
	}

	
	
}

