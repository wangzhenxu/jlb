package com.loiot.baqi.dao;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.timeloit.pojo.MpImage;
import com.timeloit.pojo.MpMsg;
import com.timeloit.pojo.MpNews;
import com.timeloit.pojo.MpText;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
@Repository("mpMsgDao")
public class MpMsgDao extends SqlSessionDaoSupport{
	/**
	 * 获得图片消息list
	 * 
	 * @param msgid
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ArrayList<MpNews> getImgsNews(long msgid) {
		return (ArrayList<MpNews>) getSqlSession().selectList(
				"getMpPicNewsByMsgId", msgid);
	}
	public MpImage getMpImageById(long id){
		MpImage img = null;
		//img.get
		try {
			img = (MpImage) getSqlSession().selectOne("getMpImage", id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return img;
	}
	/**
	 * 获得文字消息
	 * 
	 * @param msgid
	 * @return
	 */
	public MpText getTextNews(long msgid) {
		return (MpText) getSqlSession().selectOne("getMpTextNewsByMsgId",
				msgid);
	}
}
