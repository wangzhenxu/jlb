package com.loiot.baqi.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.apache.log4j.Logger;
import com.loiot.commons.utils.JsonUtil;
import com.loiot.commons.utils.StringUtil;
import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.FileUtil;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.MpMsgDao;
import com.loiot.baqi.model.MpPicNews;
import com.timeloit.pojo.MpImage;
import com.timeloit.pojo.MpMsg;
import com.timeloit.pojo.MpNews;
import com.timeloit.pojo.MpNewsMap;
import com.timeloit.pojo.MpPdtRule;
import com.timeloit.pojo.MpText;
import com.timeloit.pojo.Product;

@Service("msMsgService")
public class MpMsgService {
	@Resource
	private MpMsgDao mpMsgDao;
	private Logger log = Logger.getLogger(this.getClass());
	/**
	 * 根据msgId获取图片消息
	 * 
	 * @param mpMsgId
	 * @return
	 */
	public List<MpNews> getMpImgsNewsById(Long mpMsgId) {
		List<MpNews> MpNews = mpMsgDao.getImgsNews(mpMsgId);
		return MpNews;

	}
	/**
	 * 获取图片信息
	 * @return 
	 */
	public List<MpImage> getNewsImg(List<MpNews> mpNews){
			List<MpImage> mpImage =new  ArrayList<MpImage>();
			for (MpNews mpNew : mpNews) {
				mpImage.add(mpMsgDao.getMpImageById(mpNew.getMiId()));
			}
			return mpImage;
	}
	public MpText getMpTextNewsById(Long mpMsgId) {
		MpText MpNews = mpMsgDao.getTextNews(mpMsgId);
		return MpNews;

	}
}
