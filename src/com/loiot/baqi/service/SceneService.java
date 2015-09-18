package com.loiot.baqi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.RestStoreDao;
import com.loiot.baqi.dao.SceneDao;
import com.loiot.baqi.model.NodePo;
import com.loiot.baqi.model.ScenePo;
import com.loiot.baqi.model.SceneProductDetail;
import com.timeloit.pojo.CustomerAccount;
import com.timeloit.pojo.NodeAttribute;
import com.timeloit.pojo.ProjectRest;
import com.timeloit.pojo.Scene;
import com.timeloit.pojo.mongo.NodeData;
import com.timeloit.pojo.rest.RestStore;

/**
 * 场景逻辑类
 * 
 * @author yanjg
 * 
 */
@Service("sceneService")
public class SceneService {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 场景数据访问接口
     */
    @Resource
    private SceneDao sceneDao;
    @Resource
    private NodeService nodeService;
    @Autowired
    private HttpClientService httpClientService;
    @Autowired
    private RestStoreDao  restStoreDao;
    /**
     * 查询场景列表分页
     * 
     * @param pageIndex 页索引
     * @return
     */
	public Pager<Scene> getSceneListPage(Map<String, Object> pMap, int pageIndex) {
      // 查询场景总条数
      int totalResults = sceneDao.getSceneListCount(pMap);
      // 构造一个分页器
      Pager<Scene> pager = new Pager<Scene>(totalResults, pageIndex);
      // 查询场景列表
      List<Scene> sceneList = sceneDao.getSceneList(pMap, pager.getSkipResults(),
              pager.getMaxResults());
      pager.setData(sceneList);
      return pager;
	}
	/**
	 * 获取场景详情数据,包括节点列表及当前值
	 * @param snValue
	 * @return
	 */
	public ScenePo getScenePo(String snValue) {
		// TODO Auto-generated method stub
		ScenePo scenePo=sceneDao.getScenePo(snValue);
		return scenePo;
	}
	/**
	 * 将scenePo中的信息填充到spdList中
	 * @param scenePo
	 * @param spdList
	 */
	public void fillSPDList(ScenePo scenePo, List<SceneProductDetail> spdList) {
		// TODO Auto-generated method stub
		if(scenePo==null) return;
//		添加网关产品
		SceneProductDetail spd=new SceneProductDetail();
//		网关没有其他属性信息
		spd.setOtherAttr("");
		if(scenePo.getProduct()!=null){
			spd.setPname(scenePo.getProduct().getName());
		   	spd.setPtype(scenePo.getProduct().getProductType().toString());
		   	spd.setStitle(scenePo.getTitle());
		}else{
			spd.setPname("无");
		   	spd.setPtype("0");
		   	spd.setStitle(scenePo.getTitle());
		}
	   	spd.setUnit("无");
	   	spd.setChiefAttr("无");
	   	spd.setCurrentState("无");
	   	spd.setCurrentVal("无");
	   	spdList.add(spd);
	   	
//	   	添加节点产品
	   	if(scenePo.getNodes()!=null && scenePo.getNodes().size()>0){
	   		for(NodePo nodePo: scenePo.getNodes()){
	   			SceneProductDetail spdnode=new SceneProductDetail();
	   			
	   			if(nodePo.getAttrs()!=null && nodePo.getAttrs().size()>0){
	   				String otherAttr="",unit="",chiefAttr="";
	   				for(NodeAttribute nattr: nodePo.getAttrs()){
	   					if(nattr.getIsChief()==1){
	   						unit=nattr.getUnit();
	   						chiefAttr=nattr.getAttrKey();
	   					}else if(nattr.getAttrKey().length()>0){
	   						otherAttr=otherAttr+nattr.getAttrKey()+","+nattr.getUnit()+";";
	   					}
	   				}
		   			spdnode.setOtherAttr(otherAttr);
		   			spdnode.setUnit(unit);
		   			spdnode.setChiefAttr(chiefAttr);
	   			}else{ //该节点没有属性
	   				spdnode.setOtherAttr("");
		   			spdnode.setUnit("");
		   			spdnode.setChiefAttr("");
	   			}

	   			
	   			
//	   			设置currentVal
	   			Map queryMap=new HashMap();
	   			queryMap.put("ssn", scenePo.getSnValue());
	   			queryMap.put("nsn",nodePo.getSnValue());
	   			NodeData curND=nodeService.getMongoCD(queryMap);
	   			
	   			if(curND!=null){//有当前值
	   				spdnode.setCurrentVal(curND.getData().get(spdnode.getChiefAttr())==null?"":curND.getData().get(spdnode.getChiefAttr()).toString());
	   				
	   				if(spdnode.getOtherAttr().length()>0){
	   					String[] otherAttrArray=spdnode.getOtherAttr().split(";");
	   					String newOtherAttr="";
	   					for(String otherAttr: otherAttrArray){
	   						if(otherAttr.length()==0) continue;
	   						String otherAttrKey=otherAttr.split(",")[0];
	   						String otherAttrUnit="";
	   						if(otherAttr.split(",").length>1){
	   							otherAttrUnit=otherAttr.split(",")[1];
	   						}
	   						
	   						String otherAttrVal= curND.getData().get(otherAttrKey)==null?"":curND.getData().get(otherAttrKey).toString();
	   						newOtherAttr=newOtherAttr+otherAttrUnit+","+otherAttrVal+";";
	   					}
	   					if(newOtherAttr.length()>0){
	   						spdnode.setOtherAttr(newOtherAttr.substring(0,newOtherAttr.length()-1));
	   					}
	   				}
	   			}else{//没有当前值
	   				spdnode.setCurrentVal("");
	   			}
	   			
	   			

	   			if(nodePo.getProduct()!=null){
	   				spdnode.setPname(nodePo.getProduct().getName());
	   				spdnode.setPtype(nodePo.getProduct().getProductType().toString());
	   				spdnode.setStitle(nodePo.getName());
	   			}else{
	   				spdnode.setPname("无");
	   				spdnode.setPtype("0");
	   				spdnode.setStitle(nodePo.getName());
	   			}
	   			spdnode.setCurrentState("无");
	   			
	   		   	spdList.add(spdnode);
	   		}
	   	}
	   	
	}
	/**
	 * 创建单店对应的场景
	 * @param account 
	 * @param loginName 
	 * @param projectRest
	 * @param customerName 
	 * @throws Exception 
	 * @throws RestClientException 
	 */
	public void createScene(CustomerAccount account, String loginName, ProjectRest projectRest, String customerName) throws RestClientException, RuntimeException {
		// TODO Auto-generated method stub
		//1)调用用户登录接口，获取accessToken
		String accessToken=httpClientService.userLogin(loginName,projectRest.getUserId(),projectRest.getPwd());
		//2)调用product接口，获取apikey, ssn
		Map<String,Object> apiMap=httpClientService.getApiSSn(accessToken,projectRest.getSceneProductId());
		
		//3)调用创建网关接口，注册网关
		httpClientService.addScene(accessToken,apiMap.get("KeyValue").toString(),apiMap.get("snValue").toString(),customerName);
		
//		4)往rest_store中插入记录
		RestStore restStore=new RestStore();
		restStore.setApiKey(apiMap.get("KeyValue").toString());
		restStore.setRsCaId(account.getCaId());
		restStore.setSsn(apiMap.get("snValue").toString());
		restStore.setIsRemote((short)0);
		
		restStoreDao.addRestStore(restStore);
		
	}

}
