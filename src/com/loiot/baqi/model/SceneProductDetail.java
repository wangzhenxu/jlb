package com.loiot.baqi.model;

import lombok.Data;

import com.loiot.commons.cache.BaseLoiotPojo;

/**
 * 后台场景管理中产品详情pojo
 * @author yanjg
 *
 */
@Data
public class SceneProductDetail implements java.io.Serializable, BaseLoiotPojo{
	private static final long serialVersionUID = 4700052395745760829L;
//	产品分类
	private String ptype;
//	产品名称
	private String pname;
//	实际名称
	private String stitle;
//	主属性
	private String chiefAttr;
//	当前值
	private String currentVal;
//	单位
	private String unit;
//	当前状态
	private String currentState;
//	其他属性
	private String otherAttr;
	@Override
	public String getMemkey() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
