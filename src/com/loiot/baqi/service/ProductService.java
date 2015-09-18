package com.loiot.baqi.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;

import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.constant.FileUtil;
import com.loiot.baqi.controller.request.ProductRequesthandler;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.CustomerRoleDao;
import com.loiot.baqi.dao.ProductDao;
import com.loiot.baqi.utils.RandomUtil;
import com.loiot.commons.utils.JsonUtil;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.Account;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.Product;
import com.timeloit.pojo.ProductActionAlert;
import com.timeloit.pojo.ProductAttribute;
import com.timeloit.pojo.ProductBatch;
import com.timeloit.pojo.ProductClazz;
import com.timeloit.pojo.ProductCommand;
import com.timeloit.pojo.ProductCommandGroup;
import com.timeloit.pojo.ProductCondition;
import com.timeloit.pojo.ProductPanel;
import com.timeloit.pojo.ProductSn;
import com.timeloit.pojo.Project;
import com.timeloit.pojo.Tag;
import com.timeloit.pojo.status.OperatorType;

@Transactional
@Service("productService")
public class ProductService {
    @Resource
    private ProductDao productDao;
    private SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    
    
    /**
     * 产品查询、分页
     * @param name
     * @param pageIndex
     * @return
     */
    public Pager<Product> getProductListByName(String name, int pageIndex) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("proname", null==name?"":name.trim());
        int totalResults = productDao.getProductListCount(hashMap);
        Pager<Product> pager = new Pager<Product>(totalResults, pageIndex);
        List<Product> productList = productDao.getProductListByName(hashMap, pager.getSkipResults(),
                pager.getMaxResults());
        pager.setData(productList);
        return pager;
    }
    
    /**
     * 获取产品列表
     */
    public List<Product> getProductList(int productType){
    	Map<String,Object> paraMap=new HashMap<String,Object>();
    	paraMap.put("productType", productType);
    	if(Const.PRODUCT_SCENE==productType){
    		paraMap.put("productIds", ApplicationConst.GATEWAY_PRODUCT_ID_LIST);
    	}else if(Const.PRODUCT_NODE==productType){
    		paraMap.put("productIds", ApplicationConst.NODE_PRODUCT_ID_LIST);
    	}
    	
    	List<Product> productList=productDao.getProductList(paraMap);
    	return productList;
    }

    
    /**
     * 类别查询、分页
     * @param name
     * @param pageIndex
     * @return
     */
    public Pager<ProductClazz> getProClassListByName(String name,int pageIndex) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("classname", null==name?"":name.trim());
        int totalResults = productDao.getProductClassListCount(hashMap);
        Pager<ProductClazz> pager = new Pager<ProductClazz>(totalResults, pageIndex);
        hashMap.put("skipResults", pager.getSkipResults());
        hashMap.put("maxResults", pager.getMaxResults());
        List<ProductClazz> productClazzs=productDao.getProClazzListByName(hashMap);
        pager.setData(productClazzs);
        return pager;
    }
    
    
    public Product getProductInfo_Class_TagById(Long productId) {
        return (Product) productDao.getProductInfo_Class_TagById(productId);
    }

    public List<ProductAttribute> getProduct_Attribute(Long productId) {
        return productDao.getProduct_Attribute(productId);
    }

    public List<ProductCommand> getProduct_command(Long productId) {
        return productDao.getProduct_command(productId);
    }

    public List<ProductCommandGroup> getProduct_CommandLGroup(Long productId) {
        return productDao.getProduct_CommandLGroup(productId);
    }

    public ProductPanel getProduct_Panel(Long productId) {
        return (ProductPanel) productDao.getProduct_Panel(productId);
    }

    
    /**
     * 查询所有产品分类列表
     * @return
     */
    public List<ProductClazz> getProClazzList() {
        return productDao.getProClazzList();
    }
    
    public int addProClazz(String name) {
        return productDao.addProClazz(name);
    }

    public boolean isDeleteClass(long pc_id) {
        return productDao.isDeleteClass(pc_id);
    }
    
    public boolean isAddClass(String name) {
        
        return productDao.isAddClass(null==name?name:name.trim());
     }
    
    public int deleteProClazz(long pcid) {
        return productDao.deleteProClazz(pcid);
    }

    public int updateProClazz(ProductClazz prodClazz) {
        return productDao.updateProClazz(prodClazz);
    }

    
    /**添加产品信息
     * @param productRequesthandler
     * @param keyType
     */
    public Long addProduct(ProductRequesthandler productRequesthandler,MultipartFile imgFile) {
        Product product = productRequesthandler.getProduct();
        product.setUploadTime(new Date());
        Tag tag = productRequesthandler.getTag();
    	if (StringUtil.isNotEmpty(imgFile.getOriginalFilename())) {
			File img = FileUtil.getFile(imgFile, ApplicationConst.UPLOAD_PIC_PATH + "/product",null);
			if (null == img ||img.getName().isEmpty()) {
				product.setPicUrl(null);
			} else {
				product.setPicUrl("/product/" + img.getName());
			}
    	}
        // 添加产品并获取该次影响的ID
    	String idAndNmae[]= product.getCustomerName().split(",");
    	product.setCustomerId(Long.parseLong(idAndNmae[0]));
    	product.setCustomerName(idAndNmae[1]);
        long proindex = productDao.addProduct(product);
        // 添加标签返回影响的ID集合
        Long tagindex[] = addTag(tag);
        // 添加产品和标签的映射表
        addPro_Tag_Map(proindex, tagindex);
        return proindex;
    }
    
    
    /**
     * 修改产品相关信息
     * 
     * @param productRequesthandler
     */
    public void updateProduct(ProductRequesthandler productRequesthandler,MultipartFile imgFile) {
        // 更新产品
        Product product = productRequesthandler.getProduct();
        if (StringUtil.isNotEmpty(imgFile.getOriginalFilename())) {
			File img = FileUtil.getFile(imgFile, ApplicationConst.UPLOAD_PIC_PATH + "/product",product.getPicUrl());
			if (null == img ||img.getName().isEmpty()) {
				product.setPicUrl(null);
			} else {
				product.setPicUrl("/product/" + img.getName());
			}
    	}
        productDao.updateProduct(product);
        // 删除标签
        deleteTags( product.getProductId());
        // 添加新标签
        Tag tag = productRequesthandler.getTag();
        addTags(tag, product.getProductId());
    }

    
    /**修改产品属性
     * @param productRequesthandler
     */
    public void updateProductAttribute(ProductRequesthandler productRequesthandler) {
    	 Product product = productRequesthandler.getProduct();
    	  long[] delProductAttributeId = productRequesthandler.getDelProductAttributeId();
          deleteAttribute(delProductAttributeId);
          // 属性修改
          UpdateAttribute(product.getAttributeList(),product.getProductId());
 }
    
    
    
    /**修改命令
     * @param productRequesthandler
     */
    public void updateCommand(ProductRequesthandler productRequesthandler) {
    	Product product = productRequesthandler.getProduct();
    	  // 删除命令组
        deleteCommandGroup(productRequesthandler.getDelProductCommandGroupId());
        // 删除命令
        deleteCommand(productRequesthandler.getDelProductCommandId());
        // 修改命令组和命令
        updateCommandAndGroup(product.getProductId(), product.getCommandGroupList());
        //更新产品面板        
        updatePanel(product.getProductPanel(), product.getCommandGroupList(), product.getProductId());
 }
    
    
    /**保存报警设置
     * @param productRequesthandler
     */
    public void saveWarn(ProductRequesthandler productRequesthandler){
    	if(null==productRequesthandler)return;
    	List<ProductCondition> productConditions=productRequesthandler.getConditionList();
    	long productId=productRequesthandler.getProduct().getProductId();
    	
    	productDao.deleteProductActionAlert(productId);
    	//报警条件操作
    	deletecondition(productRequesthandler.getDelProductconditionId());
    	if(null!=productConditions){
    		for (ProductCondition productCondition : productConditions) {
    			if(null!=productCondition.getPcId()){
    				updateProductCondition(productCondition);
    			}else{
    				productCondition.setProductId(productId);
                	addProductCondition(productCondition);
    			}
        		
    		}
    		ProductActionAlert productActionAlert=productRequesthandler.getActionAlert();
        	productActionAlert.setProductId(productId);
        	addProductActionAlert(productActionAlert);
    	}
    }
    
    /**
     * 添加产品相关信息
     * 
     * @param productRequesthandler
     */
    public void addProduct(ProductRequesthandler productRequesthandler) {
        Product product = productRequesthandler.getProduct();
        product.getProductType();
        product.setUploadTime(new Date());
        Tag tag = productRequesthandler.getTag();
        // 添加产品并获取该次影响的ID
        long proindex = productDao.addProduct(product);
        // 添加标签返回影响的ID集合
        Long tagindex[] = addTag(tag);
        // 添加产品和标签的映射表
        addPro_Tag_Map(proindex, tagindex);
        // 如果无Key则需要继续添加属性、命令、命令组相关信息
        if (product.getHasKey() == 0) {
            // 添加属性
            List<ProductAttribute> attributes = product.getAttributeList();
            if(null!=attributes)
            for (int i = 0; i < attributes.size(); i++) {
                ProductAttribute attribute = attributes.get(i);
                attribute.setProductId(proindex);
                attribute.setIsShow((short) (null == attribute.getIsShow() ? 0 : 1));
                attribute.setIsChief((short) (null == attribute.getIsChief() ? 0 : 1));
                productDao.addPro_Attribute(attribute);
            }
            List<ProductCommandGroup> commandGroups = product.getCommandGroupList();
            if(null!=commandGroups)
            for (ProductCommandGroup productCommandGroup : commandGroups) {
                // 添加命令组并获取影响ID
                productCommandGroup.setProductId(proindex);
                long groupid = productDao.addPro_Command_Group(productCommandGroup);
                List<ProductCommand> commands = productCommandGroup.getProductCommandList();
                for (ProductCommand productCommand : commands) {
                    // 添加命令
                    productCommand.setProductId(proindex);
                    productCommand.setPcgId(groupid);
                    productDao.addPro_Command(productCommand);
                }
            }
            // 添加个性编辑
            ProductPanel panel = new ProductPanel();
            panel.setProductId(proindex);
            String templateContent= getpanelHTML(commandGroups).toString();
            panel.setTemplateContent(templateContent);
            panel.setIsDefault(0);
            productDao.addPro_Panel(panel);
        }
    }

    /**
     * 修改产品相关信息
     * 
     * @param productRequesthandler
     */
    public void updateProduct(ProductRequesthandler productRequesthandler) {
        // 更新产品
        Product product = productRequesthandler.getProduct();
        productDao.updateProduct(product);
        // 删除标签
        deleteTags( product.getProductId());
        // 添加新
        Tag tag = productRequesthandler.getTag();
        addTags(tag, product.getProductId());
        
        
        
        if(product.getHasKey()==1) return;
        // 刪除属性
        long[] delProductAttributeId = productRequesthandler.getDelProductAttributeId();
        deleteAttribute(delProductAttributeId);
        // 属性修改
        UpdateAttribute(product.getAttributeList(),product.getProductId());
        // 删除命令组
        deleteCommandGroup(productRequesthandler.getDelProductCommandGroupId());
        // 删除命令
        deleteCommand(productRequesthandler.getDelProductCommandId());
        // 修改命令组和命令
        updateCommandAndGroup(product.getProductId(), product.getCommandGroupList());
        // 修改产品命令面板
        ProductPanel productPanel = product.getProductPanel();
        updatePanel(productPanel,product.getCommandGroupList(),product.getProductId());
    }


	/**
	 * 修改模板
	 * @param productPanel
	 * @param commandGroups
	 */
	private void updatePanel(ProductPanel productPanel,List<ProductCommandGroup> commandGroups,long productId) {
		if(null==productPanel) {
			productPanel=new ProductPanel();
			productPanel.setProductId(productId);
			productPanel.setIsDefault(0);
		}
		productPanel.setProductId(null==productPanel.getProductId()?productId:productPanel.getProductId());
        productPanel.setIsDefault(null==productPanel.getIsDefault()?1:0);
        if(0==productPanel.getIsDefault()){
        	  StringBuffer buffer=getpanelHTML(commandGroups);
        	  productPanel.setTemplateContent(buffer.toString());
        }
        if(null==productPanel.getPpId()){
        	productDao.addPro_Panel(productPanel);
            return;
        }
        productDao.updatePro_Panel(productPanel);
	}

  
    /**
     * @param productId
     * @param commandGroups
     */
    private void updateCommandAndGroup(long productId, List<ProductCommandGroup> commandGroups) {
        // 命令组是否有ID，有则修改否则添加
        if(null!=commandGroups)
        for (ProductCommandGroup productCommandGroup : commandGroups) {
            if (null != productCommandGroup.getPcgId()) {
                productDao.updatePro_command_group(productCommandGroup);
                // 命令是否有ID，有则修改否则添加
                List<ProductCommand> commands = productCommandGroup.getProductCommandList();
                if(null!=commands)
                for (ProductCommand productCommand : commands) {
                    if (null != productCommand.getPcId()) {
                        productDao.updatePro_command(productCommand);
                    } else {
                        productCommand.setPcgId(productCommandGroup.getPcgId());
                        productCommand.setProductId(productId);
                        productDao.addPro_Command(productCommand);
                    }
                }
            } else {
                productCommandGroup.setProductId(productId);
                long groupid = productDao.addPro_Command_Group(productCommandGroup);
                // 命令是否有ID，有则修改否则添加
                List<ProductCommand> commands = productCommandGroup.getProductCommandList();
                if(null!=commands)
                for (ProductCommand productCommand : commands) {
                        productCommand.setPcgId(groupid);
                        productCommand.setProductId(productId);
                        productDao.addPro_Command(productCommand);
                }
            }
        }
    }

    /**
     * @param delProductconditionId
     */
    private void deletecondition(long[] delProductconditionId) {
        // 是否有需报警条件
        for (int i = 0; null != delProductconditionId && i < delProductconditionId.length; i++) {
            productDao.deleteProductCondition(delProductconditionId[i]);
        }
    }

    /**
     * @param delProductCommandGroupId
     */
    private void deleteCommandGroup(long[] delProductCommandGroupId) {
     // 是否有需要删除的命令组
        for (int i = 0; null != delProductCommandGroupId && i < delProductCommandGroupId.length; i++) {
            productDao.deletePor_command_group(delProductCommandGroupId[i]);
            productDao.deletePor_commandByPcgId(delProductCommandGroupId[i]);
        }
    }

    /**
     * @param delProductCommandId
     */
    private void deleteCommand(long[] delProductCommandId) {
        // 是否有需要删除的命令
        for (int i = 0; null != delProductCommandId && i < delProductCommandId.length; i++) {
            productDao.deletePor_command(delProductCommandId[i]);
        }
    }
    
    /**
     * @param attributes
     */
    private void UpdateAttribute(List<ProductAttribute> attributes,long productId) {
        // 属性是否有ID，有则修改否则添加
        if(null!=attributes)
        for (ProductAttribute productAttribute : attributes) {
            productAttribute.setIsShow((short) (null == productAttribute.getIsShow() ? 0 : 1));
            productAttribute.setIsChief((short) (null == productAttribute.getIsChief() ? 0 : 1));
            if (null != productAttribute.getPaId()) {
                productDao.updateAttribute(productAttribute);
            } else {
                productAttribute.setProductId(productId);
                productDao.addPro_Attribute(productAttribute);
            }
        }
    }

    /**
     * @param delProductAttributeId
     */
    private void deleteAttribute(long[] delProductAttributeId) {
        // 是否有删除的属性
        for (int i = 0; null != delProductAttributeId && i < delProductAttributeId.length; i++) {
            productDao.deleteAttribute(delProductAttributeId[i]);
        }
    }

    /**
     * @param productRequesthandler
     * @param product
     */
    private void addTags(Tag tag,long productId) {
      
        // 添加标签返回影响的ID集合
        Long tagindex[] = addTag(tag);
        // 添加产品和标签的映射表
        addPro_Tag_Map(productId, tagindex);
    }

    /**
     * @param productRequesthandler
     * @param product
     */
    private void deleteTags(long ProductId) {
        // 获取产品以前标签
//        List<Long> tagIdArray = productDao.getTagId(ProductId);
//        for (Long long1 : tagIdArray) {
//            productDao.deleteTag(long1);
//        }
        productDao.deleteTag_Map(ProductId);
    }

    /**
     * 批量添加标签，以逗号分隔
     * 
     * @param tag 标签集合字符串
     * @return 影响的ID列[]
     */
    private Long[] addTag(Tag tag) {
		Long[] index = null;
		if (null != tag.getTagWord() && !"".equals(tag.getTagWord().trim())) {
			if (tag.getTagWord().indexOf(",") > 0
					|| tag.getTagWord().indexOf("，") > 0
					|| tag.getTagWord().indexOf("\r") > 0
					|| tag.getTagWord().indexOf("\n") > 0
					|| tag.getTagWord().indexOf("、") > 0
					|| tag.getTagWord().indexOf(" ") > 0) {
				String tag_word[] = tag.getTagWord().split(",| |，|\r|\n|、");
				List<Long> list = new ArrayList<Long>();
				for (int i = 0; i < tag_word.length; i++) {
					if (null != tag_word[i] && !"".equals(tag_word[i])) {
						Long tag_id = productDao.getTagIdByTagWord(tag_word[i]
								.trim());
						if (null != tag_id && tag_id > 0) {
							list.add(tag_id);
						} else {
							Tag temp = new Tag();
							temp.setTagWord(tag_word[i].trim());
							list.add(productDao.addTag(temp));
						}
					}
				}
				index = list.toArray(new Long[list.size()]);
			} else {
				index = new Long[1];
				Long tag_id = productDao.getTagIdByTagWord(tag.getTagWord());
				if (null != tag_id && tag_id > 0) {
					index[0] = tag_id;
				} else {
					index[0] = productDao.addTag(tag);
				}

			}
		}
		return index;
    }

    /**
     * 添加产品和标签映射表
     * 
     * @param proindex 产品ID
     * @param tagindex 标签ID
     */
    private void addPro_Tag_Map(long proindex, Long tagindex[]) {
        for (int i = 0; null != tagindex && i < tagindex.length; i++) {
            HashMap<String, Long> maps = new HashMap<String, Long>();
            maps.put("product_id", proindex);
            maps.put("tag_id", tagindex[i]);
            productDao.addPro_Tag_Map(maps);
        }
    }

    public long addPro_Command(ProductCommand command) {
        return productDao.addPro_Command(command);
    }

    public long deleteProduct(Long productId) {
        return productDao.deleteProduct(productId);
    }


    
    
    /**
     * 查询序列号操作
     * 
     * @param productname 产品名称
     * @param createdate 创建时间
     * @return List<ProductBatch>
     */
    public Pager<ProductBatch> getProduct_Batch(String productname, String createdate,int pageIndex) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("productname", null==productname?"":productname.trim());
        map.put("createdate", "".equals(createdate)?null:createdate);
        int totalResults = productDao.getProductBatchCount(map);
        Pager<ProductBatch> pager = new Pager<ProductBatch>(totalResults, pageIndex);
        map.put("skipResults", pager.getSkipResults());
        map.put("maxResults", pager.getMaxResults());
        List<ProductBatch>  batchs= productDao.getProduct_Batch(map);
        pager.setData(batchs);
        return pager;
    }

    /**
     * 查询所有产品名称
     * @return
     */
    public List<Product> getProductName() {
        return  productDao.getProductName();
    }
    
    /**
     * 插入序列号、记录操作
     * @param productBatch
     */
    public void create(ProductBatch productBatch,HttpSession session) {
    	    //记录序列号操作
            long pbId = insertBatch(productBatch, session);
            //查询SN——prefix和有无Key
           
    		Long productId=productBatch.getProductId();
            Product product=productDao.getSn_prefixByProductId(productId);
            //生成序列号
            Map<String, String> serialList = serialNumberFactory(productBatch.getNum(),pbId,product);
            //插入序列号
            insertSn(productId, pbId, product, serialList);
    }

    
    
	/**
	 * 批量插入序列号
	 * @param productId
	 * @param pbId
	 * @param product
	 * @param serialList
	 */
	private void insertSn(Long  productId, long pbId,
			Product product, Map<String, String> serialList) {
		if (null != serialList)
		        for (Entry entry : serialList.entrySet()) {   
		            ProductSn productSn=new ProductSn(); 
		            productSn.setPbId(pbId);
		            productSn.setProductId(productId);
		            String key = (String) entry.getKey(); 
		            String value=(String) entry.getValue();
		            if(product.getHasKey()==1){
		                productSn.setKeyValue(key);
		            }
		            productSn.setSnValue(value);
		            productDao.addProductSn(productSn);
		        }
	}


	/**
	 * 记录序列号操作
	 * @param productBatch
	 * @param session
	 * @return
	 */
	private long insertBatch(ProductBatch productBatch, HttpSession session) {
		Account account= (Account) session.getAttribute(Const.SESSION_USER_KEY);
		String userName= null==account?"游客":account.getUsername();
		productBatch.setCreateTime(new Date());
		productBatch.setAccountUsername(null==userName&&"".equals(userName)?"游客":userName);
		String productinfo[]= productBatch.getProductName().split("!");
		Long productId=Long.parseLong(productinfo[0]);
		productBatch.setProductId(productId);
		productBatch.setProductName(productinfo[1]);
		long pbId=productDao.addProductBatch(productBatch);
		return pbId;
	}
    
	
    /**
     * 序列号下载
     * @param pbId
     */
    public void downLoadProductSn(long pbId,HttpServletResponse response){
        List<ProductSn> sns=productDao.getProductSn(pbId);
        String snstr="";
        for (ProductSn productSn : sns) {
        	Map<String,Object> m = new HashMap<String,Object>();
        	if(null!=productSn.getKeyValue()){
        		m.put("key", productSn.getKeyValue());
        	}
        	m.put("sn", productSn.getSnValue());
            try {
				snstr+=productSn.getSnValue()+(productSn.getKeyValue()==null?"":"\t"+productSn.getKeyValue())+"\t"+JsonUtil.toJson(m)+"\r\n";
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=序列号批次"+pbId+".txt");
        response.setContentType("application/txt;charset=UTF-8");
        // 解决ie6下，保存错误问题
        response.setHeader("Pragma", "public");
        response.setHeader("Cache-Control", "public");
        try {
            IOUtils.write(snstr, response.getOutputStream(), "UTF-8");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    
	/**
	 * 序列号上传
	 * @param productBatch
	 * @param model
	 * @param file
	 * @param session
	 */
	public void uploadSn(ProductBatch productBatch, ModelMap model,
			MultipartFile file, HttpSession session) {
		BufferedReader reader = null;
		String til = "";
		int i = 0;
		int count = 0;
		long pbId=0;
		try {
			if (file.isEmpty()) {
				til = "请正确上传文件";
				session.setAttribute("reun", til);
				return;
			}
			if(file.getName().indexOf("")>0){
			}
			// 记录序列号操作
			pbId = insertBatch(productBatch, session);
			// 获取productId
			Long productId = productBatch.getProductId();
			InputStream inputStream = file.getInputStream();
			reader = new BufferedReader(new InputStreamReader(inputStream));
			String tempString = null;
			while ((tempString = reader.readLine()) != null) {
				i++;
				if ("".equals(tempString)) {
					til += i + ",";
					continue;
				}
				ProductSn productSn = new ProductSn();
				productSn.setProductId(productId);
				productSn.setPbId(pbId);
				if (tempString.indexOf(":") > 0) {
					String[] tmparray = tempString.split(":");
					String sn = tmparray[0];
					String key =tmparray.length>1?tmparray[1]:null;
					if (null==key||!key.matches("[a-zA-Z0-9]{32}")
							|| !sn.matches("[a-zA-Z0-9]{16}")) {
						til += i + ",";
						continue;
					}
					productSn.setKeyValue(key);
					productSn.setSnValue(sn);
				} else if (tempString.matches("[a-zA-Z0-9]{16}")) {
					productSn.setSnValue(tempString);
				} else {
					til += i + ",";
					continue;
				}
				productDao.addProductSn(productSn);
				count++;
			}
		}catch (FileNotFoundException e) {
			til+="请正确上传文本文件";
		}catch (DuplicateKeyException e) {
			til += "和已有序列号冲突";
		}catch (MaxUploadSizeExceededException e) {
			til+="请注意文件大小";
		}catch (MultipartException e) {
			til+="请正确上传文本文件";
		}catch (IOException e) {
			til+="请正确上传文本文件";
		}finally {
			if (reader != null) {
				try {
					if (count > 0) {
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("num", count);
						map.put("pbid", pbId);
						productDao.updateBatchCount(map);
					} else
						productDao.deleteBatch(pbId);
					til=(null==til||"".equals(til))?"导入成功":til+ "格式有问题";
					session.setAttribute("reun", til);
					reader.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					til+="请正确上传文本文件";
				}
			}
		}
	}
    
    
    
    /**
     * 通过命令组和下属命令组织HTML
     * 
     * @param commandGroups
     * @return
     */
    public StringBuffer getpanelHTML(List<ProductCommandGroup> commandGroups) {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("<form method=\"post\">");
        if(null!=commandGroups)
        for (ProductCommandGroup productCommandGroup : commandGroups) {
        	stringBuffer.append("<div class=\"commandgroup\">");
            stringBuffer.append("<div style=\"font:bold 12px/30px '宋体'; padding-top:6px;\">");
            stringBuffer.append(productCommandGroup.getTitle());
            stringBuffer.append("</div>");
            List<ProductCommand> commands = productCommandGroup.getProductCommandList();
            stringBuffer.append("<div style=\"width:100%; overflow:hidden; padding-bottom:6px; text-align:center;\">");
            for (ProductCommand productCommand : commands) {
                stringBuffer.append("<span style=\"white-space:nowrap; padding-right:10px;\">");
                stringBuffer.append("<input style=\"vertical-align:middle;\" name=\""+productCommandGroup.getCmdKey()+"\"" +
                		"  value=\""+productCommand.getCmdStr()+"\" id=\"l"+productCommand.getCmdStr()+"\"   type=\"radio\"/>");
                stringBuffer.append("<label for=\"l"+productCommand.getCmdStr()+"\">");
                stringBuffer.append(productCommand.getTitle());
                stringBuffer.append("</label>");
                stringBuffer.append("</span>");
            }
            stringBuffer.append("</div>");
            stringBuffer.append("</div>");
        }
        stringBuffer.append("<div style=\"height:9px; overflow:hidden; border-bottom:1px dashed #ccc;\"></div>");
        stringBuffer.append("<div style=\"margin:10px 0 0 40px;\"><input type=\"checkbox\"  value=\"1\" id=\"cmdsync\"  name=\"cmdsync\" style=\"vertical-align:middle;\" />同步</div>");
        
//        stringBuffer.append("<a style=\"padding-left:20px; background:url(http://www.loiot.com/images/date/button.png); display:block; margin:20px 0 0 40px; line-height:28px; float:left;\" href=\"javascript:void(0);\">" +
//        		"<span id=\"confirm\" style=\"display:block; background:url(http://www.loiot.com/images/date/button.png) right 0; padding-right:20px; color:#fff;\">确认</span></a>");
//        stringBuffer.append("<a style=\"padding-left:20px; background:url(http://www.loiot.com/images/date/button.png); display:block; margin:20px 0 0 40px; line-height:28px; float:left;\" href=\"javascript:void(0);\">" +
//        		"<span id=\"confirm\" style=\"display:block; background:url(http://www.loiot.com/images/date/button.png) right 0; padding-right:20px; color:#fff;\">关闭</span></a>");
        stringBuffer.append("<a class=\"cmdConfirm\" style=\"background:url(http://www.loiot.com/images/date/button64.png); margin:20px 0 0 50px; width:64px; text-align:center; line-height:28px; float:left; display:block; display:inline; color:#fff;\" href=\"javascript:void(0);\">确认</a>");
        stringBuffer.append("<a class=\"cmdCancel\" style=\"background:url(http://www.loiot.com/images/date/button64.png); margin:20px 0 0 50px; width:64px; text-align:center; line-height:28px; float:left; display:block; display:inline; color:#fff;\" href=\"javascript:void(0);\">关闭</a>");
        stringBuffer.append("</form>");
        return stringBuffer;
    }

    
    
    
   
    /**
     * 生成序列号和对应的key
     * @param size 生成的数量
     * @param pbId 批次号前缀
     * @param product 带有sn_prefix和是否有key的对象
     * @return
     */
    private Map<String, String> serialNumberFactory(int size,Long pbId,Product product) {
        HashMap<String, String> hashMap=new HashMap<String, String>();
        while( hashMap.size() < size){
            String key=gen32Key();
            String value=genRandomNum((long) (hashMap.size()+1), pbId, product);
            hashMap.put(key, value);
        }
        return hashMap;
    }
    
    
    /**查询产品报警内容
     * @param productId
     * @return
     */
    public ProductActionAlert selectProductActionAlert(long productId){
		return productDao.selectProductActionAlert(productId);
    }
    
    
    
    /**
     * 修改报警内容
     * @param productActionAlert
     */
    public void updateProductActionAlert(ProductActionAlert productActionAlert){
    	productDao.updateProductActionAlert(productActionAlert);
    }
    
    /**
     * 新增报警内容
     * @param productActionAlert
     */
    public void addProductActionAlert(ProductActionAlert productActionAlert){
    	productDao.addProductActionAlert(productActionAlert);
    }
    
    /**查询产品报警条件
     * @param productId
     * @return
     */
    public List<ProductCondition> selectProductCondition(long productId){
		return  productDao.selectProductCondition(productId);
    }
    
    /**
     * 修改报警条件
     * @param productCondition
     */
    public void updateProductCondition(ProductCondition productCondition){
    	productDao.updateProductCondition(productCondition);
    }
    
    /**
     * 新增报警条件
     * @param productCondition
     */
    public void addProductCondition(ProductCondition productCondition){
    	productDao.addProductCondition(productCondition);
    }
    
    
    /**
     * 删除报警条件
     * @param pbid
     */
    public void deleteProductCondition(long pcId){
    	productDao.deleteProductCondition(pcId);
    }
    
    
  
    
    /**
     * 生成key。
     * 
     * @return 返回生成的32位key。
     */
    private String gen32Key() {
        return RandomUtil.getRandomStr(32);
    }
    
    /**
     * 生成5位顺序号
     * @param len
     * @return
     */
    public static String genRandomNum(Long i,Long pbId,Product product) {
      String BatchId= formatBatch(pbId,3);
      String sn_prefix=product.getSnPrefix();
      String numinfo=sn_prefix.trim()+BatchId;
//      String number = formatBatch(i,5);
      String number = padLeft(Long.toHexString(i),5);
      numinfo+=number;
    return numinfo; 
    
    }
    
    
    /**
     * 格式化十进制数字
     * @param 数字
     * @return 位数
     */
    public static String formatBatch(Long i,int digit) {
        DecimalFormat decimalFormat=new DecimalFormat();
        decimalFormat.setMinimumIntegerDigits(digit);
        String number = decimalFormat.format(i);
      return number.replace(",",""); 
      }
    
    
	/**
	 * 格式化十六进制数据
	 * @param str
	 * @param len
	 * @return
	 */
	public static String padLeft(String str, int len) {
		String pad = "0000000000000000";
		return len > str.length() && len <= 16 && len >= 0 ?( pad.substring(0,
				len - str.length()) + str).toUpperCase() : str.toUpperCase();
	}
	
	
	/**通过产品条件和属性生成对应的内容
	 * @param product
	 * @param productConditions
	 * @param productAttributes
	 * @return
	 */
	public String getContent(Product product,List<ProductCondition> productConditions,List<ProductAttribute> productAttributes) {
		// 拼接关联信息
		StringBuilder sb = new StringBuilder();
		for (ProductCondition productCondition : productConditions) {
			if (sb.length() == 0) {
				sb.append("当");
			} else {
				sb.append("并且");
			}
				sb.append(product.getName());
				ProductAttribute productAttributeTem =null;
				for (ProductAttribute productAttribute : productAttributes) {
					if(productCondition.getPaId().longValue()==productAttribute.getPaId().longValue()){
						productAttributeTem=productAttribute;
						break;
					}
				}
				sb.append(productAttributeTem !=null ? productAttributeTem.getTitle()  : "");
				sb.append(OperatorType.get(productCondition.getOperatorChar()).getOperatorCN());
				sb.append(productCondition.getValue());
				sb.append(productAttributeTem!=null ? productAttributeTem.getUnit() : "");
			sb.append("，");
		}
		String content = null;
		if (sb.length() > 0) {
			content = sb.substring(0, sb.length() - 1);
		}

		return content;
	}

	
	/**删除序列号
	 * @param pbId
	 */
	public Object deleteSnValue(long pbId){
		List<ProductSn> productSns=productDao.getProductSn(pbId);
		for (ProductSn productSn : productSns) {
			String snValue=productSn.getSnValue();
			int count=productDao.NodeIsHave(snValue)+productDao.sceneIsHave(snValue);
			if(count>0){
				AjaxResponse ajaxResponse=new AjaxResponse(-1, "有序列号使用中");
				return ajaxResponse;
			}
		}
			productDao.deleteProductSn(pbId);
			productDao.deleteBatch(pbId);
		return AjaxResponse.OK;
	}
	
	
	 /**查询客户列表
	 * @return 
     */
    public List<Customer> getCustomerList(){
    	return productDao.getCustomerList();
    }
}
