package com.loiot.baqi.status;

/*
 * Timeloit.com Inc.
 * Copyright (c) 2012 时代凌宇物联网数据平台. All Rights Reserved
 */

/**
 * 字典类型
 * 
 * @author zhengrj
 * 
 */
public enum DictionaryType {

	
	SEX(1, "性别"),
	
	IS_MARRY(2, "婚否"),
	
	SALARY_REQUIRE(4, "薪水要求"),
	
	EDUCATION(5, "学历"),
	
	IS_RECOMEND(6, "推荐状态"),
	
    IS_NOTIFY(7, "通知状态"),
    
    IS_GO_INTERVIEW(8, "是否去面试"),
	
    JOB_POSITION(9, "职位"),
    
    JOB_POSITION_LEVE(10, "职位级别"),
	
	RESUME_REGEXP(11, "简历匹配正则"),
	
	ENGLISH_LEVEL(12, "英语等级");
	
    

	/**
	 * 状态码
	 */
	private int code;
	/**
	 * 标题
	 */
	private String title;

	/**
	 * 构造一个类型
	 * 
	 * @param code
	 *            状态码
	 * @param title
	 *            标题
	 */
	DictionaryType(int code, String title) {
		this.code = code;
		this.title = title;
	}

	/**
	 * 获得此枚举的标题。
	 * 
	 * @return 标题
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 获得此枚举的状态码。
	 * 
	 * @return 状态码
	 */
	public short getCode() {
		return (short) code;
	}

	/**
	 * 根据状态码获得枚举。
	 * 
	 * @param code
	 *            状态码
	 * @return 状态码对应的枚举，如果找不到则返回null。
	 */
	public static DictionaryType get(int code) {
		for (DictionaryType type : values()) {
			if (type.getCode() == code) {
				return type;
			}
		}
		return null;
	}
}
