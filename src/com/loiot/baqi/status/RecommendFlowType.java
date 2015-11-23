package com.loiot.baqi.status;

/*
 * Timeloit.com Inc.
 * Copyright (c) 2012 时代凌宇物联网数据平台. All Rights Reserved
 */

/**
 * 推荐流程状态
 * @author wangzx
 * 
 */
public enum RecommendFlowType {
	
	WAIT_RECOMMEND_COMPANY(1, "技术已通过等待推荐企业"),
	ALREADY_RECOMMEND_COMPANY(2, "已推荐到企业待企业回复"),
	RECOMMEND_COMPANY_FAILURE(3, "推荐企业没通过");
	

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
	RecommendFlowType(int code, String title) {
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
	public static RecommendFlowType get(int code) {
		for (RecommendFlowType type : values()) {
			if (type.getCode() == code) {
				return type;
			}
		}
		return null;
	}
}
