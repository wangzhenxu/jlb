package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.loiot.commons.cache.aop.Mempojo;
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
import com.timeloit.pojo.Tag;




/**
 * @author zhangbo
 * 
 */
@Repository("productDao")
@SuppressWarnings("unchecked")
public class ProductDao  extends SqlSessionDaoSupport{

    /**
     **********************************产品分类的相关数据操作****************************
     **/ 
    
	/**
	 * 查询产品分类
	 * @param map
	 * @return
	 */
	public List<ProductClazz> getProClazzListByName(Map<String, Object> map) {
        return getSqlSession().selectList("Product.getProduct_Clazz_List",map);
    }

	/**
	 * 查询类别总数
	 * @param map
	 * @return
	 */
	public Integer getProductClassListCount(Map<String, Object> map) {
        return (Integer) getSqlSession().selectOne("Product.getProductClassListCount",map);
    }
	
	/**
	 * 查询所有产品分类列表
	 * @return
	 */
	public List<ProductClazz> getProClazzList() {
        return getSqlSession().selectList("Product.getProduct_Clazz_AllList");
    }
	
    /**
     * 添加产品分类
     * @param name
     * @return
     */
    public int addProClazz(String name) {
        return getSqlSession().insert("Product.addProduct_Clazz", name);
    }
    
    /**
     * 删除产品分类
     * @param pcid
     * @return
     */
    public int deleteProClazz(long pcid) {
        // TODO Auto-generated method stub
        return getSqlSession().delete("Product.deleteProduct_Clazz", pcid);
    }
    
    /**
     * 更新产品分类
     * @param prodClazz
     * @return
     */
    public int updateProClazz(ProductClazz prodClazz) {
        // TODO Auto-generated method stub
        return getSqlSession().update("Product.updateProduct_Clazz",prodClazz);
    }
   
    
    /*
     * 
     * *************************************产品相关操作**********************************************
     */
    /**
     * 查询产品列表
     * @param map
     * @param skipResults
     * @param maxResults
     * @return
     */
    public List<Product> getProductListByName(Map<String, Object> map,int skipResults, int maxResults) {
        // TODO Auto-generated method stub
        map.put("skipResults", skipResults);
        map.put("maxResults", maxResults);
        return getSqlSession().selectList("Product.getProductList",map);
    }
     
    /**
     * 查询产品数量
     * @param map
     * @return
     */
    public Integer getProductListCount(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return (Integer) getSqlSession().selectOne("Product.getProductListCount", map);
    }
    
    /**
     * 通过ID查询产品
     * @param productId
     * @return
     */
    public Product getProductInfo_Class_TagById(Long productId) {
        // TODO Auto-generated method stub
        return (Product) getSqlSession().selectOne("Product.getProduct_Info", productId);
    }
    
    /**
     * 查询所有产品名称
     * @return
     */
    public List<Product> getProductName() {
        return  getSqlSession().selectList("Product.getProductName");
    }
    
    
    
    /**
     * 查询产品属性
     * @param productId
     * @return
     */
    public List<ProductAttribute> getProduct_Attribute(Long productId) {
        // TODO Auto-generated method stub
        return  getSqlSession().selectList("Product.getProduct_Attribute", productId);
    }
     
    /**
     * 查询产品命令
     * @param productId
     * @return
     */
    public List<ProductCommand> getProduct_command(Long productId) {
        // TODO Auto-generated method stub
        return  getSqlSession().selectList("Product.getProduct_Command", productId);
    }
    
    /**查询产品命令组
     * @param productId
     * @return
     */
    public List<ProductCommandGroup> getProduct_CommandLGroup(Long productId) {
        // TODO Auto-generated method stub
        return  getSqlSession().selectList("Product.getProduct_CommandLGroup", productId);
    }
    
    /**
     * 查询产品个性化编辑
     * @param productId
     * @return
     */
    public ProductPanel getProduct_Panel(Long productId) {
        // TODO Auto-generated method stub
        return  (ProductPanel) getSqlSession().selectOne("getProduct_Panel",productId);
    } 
    
    /**
     * 添加产品
     * @param product
     * @return
     */
    public long addProduct(Product product) {
        // TODO Auto-generated method stub;
         getSqlSession().insert("Product.addProduct",product);
         return product.getProductId();
    }
    
    /**
     * 添加产品标签
     * @param tag
     * @return
     */
    public long addTag(Tag tag) {
        // TODO Auto-generated method stub;
        getSqlSession().insert("Product.addTag",tag);
        return tag.getTagId();
    }
    
    /**添加产品标签映射
     * @param map
     * @return
     */
    public long addPro_Tag_Map(Map<String, Long>  map) {
        // TODO Auto-generated method stub;
        return getSqlSession().insert("Product.addPro_Tag_Map",map);
    }
    
    
    /**
     * 添加产品属性
     * @param attribute
     * @return 
     */
    public long addPro_Attribute(ProductAttribute attribute) {
        // TODO Auto-generated method stub;
        return getSqlSession().insert("Product.addPro_Attribute",attribute);
    }
    
    /**
     * 添加命令组
     * @param commandGroup
     * @return 影响的主键
     */
    public long addPro_Command_Group(ProductCommandGroup commandGroup) {
        getSqlSession().insert("Product.addPro_Command_Group",commandGroup);
        return commandGroup.getPcgId();
        
    }
    
    /**
     * 添加命令
     * @param command
     * @return 是否成功
     */
    public long addPro_Command(ProductCommand command) {
        return getSqlSession().insert("Product.addPro_Command",command);
    }
    
    
    /**
     * 添加产品对应的命令个性编辑
     * @param productPanel
     * @return 是否成功
     */
    public long addPro_Panel(ProductPanel productPanel) {
        return getSqlSession().insert("Product.addPro_Panel",productPanel);
    }
    
    /**
     * 删除产品
     * @param productId
     * @return
     */
    public long deleteProduct(Long productId) {
        return getSqlSession().update("Product.deleteProduct",productId);
    }
    

    /**
     * 修改产品信息
     * @param product
     * @return
     */
    public long updateProduct(Product product) {
        return getSqlSession().update("Product.updateProduct",product);
    }
    
    /**
     * 修改产品属性
     * @param productAttribute
     * @return
     */
    public long updateAttribute(ProductAttribute productAttribute) {
        return getSqlSession().update("Product.updateAttribute",productAttribute);
    }
    
    /**
     * 修改产品命令组
     * @param productCommandGroup
     * @return
     */
    public long updatePro_command_group(ProductCommandGroup productCommandGroup) {
        return getSqlSession().update("Product.updatePro_command_group",productCommandGroup);
    }
    
    /**
     * 修改产品命令
     * @param productCommand
     * @return
     */
    public long updatePro_command(ProductCommand productCommand) {
        return getSqlSession().update("Product.updatePro_command",productCommand);
    }
    
    /**
     * 修改产品命令显示面板
     * @param productPanel
     * @return
     */
    public long updatePro_Panel(ProductPanel productPanel) {
        return getSqlSession().update("Product.updatePro_Panel",productPanel);
    }
    
    /**
     * 删除标签
     * @param tagId
     * @return
     */
    public long deleteTag(Long tagId) {
        return getSqlSession().delete("Product.deleteTag",tagId);
    }
    
    
   
    /**
     * 删除产品映射
     * @param productId
     * @return
     */
    public long deleteTag_Map(long productId) {
        return getSqlSession().delete("Product.deleteTag_Map",productId);
    }
    
    /**
     * 删除产品属性
     * @param paId
     * @return
     */
    public long deleteAttribute(Long paId){
        return getSqlSession().delete("Product.deleteAttribute",paId);
    }
    
    /**
     * 删除产品命令组信息
     * @param pgcId
     * @return
     */
    public long deletePor_command_group(Long pgcId){
        return getSqlSession().delete("Product.deletePor_command_group",pgcId);
    }
    
    
    /**
     * 删除产品命令信息
     * @param pcId
     * @return
     */
    public long deletePor_command(Long pcId){
        return getSqlSession().delete("Product.deletePor_command",pcId);
    }
    
    /**
     * 删除产品命令信息通过命令组
     * @param pcgId
     * @return
     */
    public long deletePor_commandByPcgId(Long pcgId){
        return getSqlSession().delete("Product.deletePor_commandByPcgId",pcgId);
    }
    
    
    /**
     * 通过产品ID查询对应的TAgID
     * @param productId
     * @return
     */
    public List<Long> getTagId(Long productId) {
        return getSqlSession().selectList("Product.getTagId",productId);
    }
    
    /**
     * 查询序列号Batch
     * @param map
     * @return
     */
    public List<ProductBatch> getProduct_Batch(HashMap<String, Object> map) {
        return getSqlSession().selectList("Product.getProduct_Batch",map);
    }
    
    
    /**
     * 查询序列号总数
     * @param map
     * @return
     */
    public Integer getProductBatchCount(HashMap<String, Object> map) {
        return (Integer) getSqlSession().selectOne("Product.getProductBatchCount",map);
    }
    
    /**
     * 插入序列号
     * @param productSn
     * @return
     */
    public long addProductSn(ProductSn productSn) {
        return getSqlSession().insert("Product.addProductSn",productSn);
    }
    
    
    /**
     * 插入序列号操作记录
     * @param productBatch
     * @return
     */
    public long addProductBatch(ProductBatch productBatch) {
        getSqlSession().insert("Product.addProductBatch",productBatch);
        return productBatch.getPbId();
    }
    
    
    /**
     * 查询序列号
     * @param pbId
     * @return
     */
    public List<ProductSn> getProductSn(Long pbId) {
        return getSqlSession().selectList("Product.getProductSn",pbId);
    }
    
    /**
     * 是否可以删除
     * @param pc_id
     * @return
     */
    public boolean isDeleteClass(Long pc_id) {
       Integer count= (Integer) getSqlSession().selectOne("Product.isDeleteClass",pc_id);
        return count>0?false:true;
    }
    
    
    /**
     * 是否可以添加产品类别
     * @param name
     * @return
     */
    public boolean isAddClass(String name) {
        Integer count= (Integer) getSqlSession().selectOne("Product.isAddClass",name);
         return count>0?false:true;
     }
     
    
    /**
     * 查询标签ID
     * @param tagWord
     * @return
     */
    public Long getTagIdByTagWord(String tagWord) {
        return  (Long) getSqlSession().selectOne("Product.getTagIdByTagWord",tagWord);
         
     }
    
    /**
     * 查询sn_prefix和是否有key
     * @param productId
     * @return
     */
    public Product getSn_prefixByProductId(Long productId) {
        return  (Product) getSqlSession().selectOne("Product.getSn_prefix",productId);
         
     }
    
    /**
     * 删除序列号记录
     * @param pbid
     */
    public void deleteBatch(long pbid){
    	getSqlSession().delete("Product.deleteBatch",pbid);
    }
    

    /**
     * 修改序列号数量
     * @param map
     */
    public void updateBatchCount(Map<String, Object> map){
    	getSqlSession().update("Product.updateBatchCount",map);
    }
    
    
    /**查询产品报警内容
     * @param productId
     * @return
     */
    public ProductActionAlert selectProductActionAlert(long productId){
		return (ProductActionAlert) getSqlSession().selectOne("Product.selectProductActionAlert",productId);
    }
    
    /**
     * 修改报警内容
     * @param productActionAlert
     */
    public void updateProductActionAlert(ProductActionAlert productActionAlert){
    	getSqlSession().update("Product.updateProductActionAlert",productActionAlert);
    }
    
    /**
     * 新增报警内容
     * @param productActionAlert
     */
    public void addProductActionAlert(ProductActionAlert productActionAlert){
    	getSqlSession().insert("Product.addProductActionAlert",productActionAlert);
    }
    
    
    
    
    /**查询产品报警条件
     * @param productId
     * @return
     */
    public List<ProductCondition> selectProductCondition(long productId){
		return  getSqlSession().selectList("Product.selectProductCondition",productId);
    }
    
    /**
     * 修改报警条件
     * @param productCondition
     */
    public void updateProductCondition(ProductCondition productCondition){
    	getSqlSession().update("Product.updateProductCondition",productCondition);
    }
    
    /**
     * 新增报警条件
     * @param productCondition
     */
    public void addProductCondition(ProductCondition productCondition){
    	getSqlSession().insert("Product.addProductCondition",productCondition);
    }
    
    
    /**
     * 删除报警条件
     * @param pbid
     */
    public void deleteProductCondition(long pcId){
    	getSqlSession().delete("Product.deleteProductCondition",pcId);
    }
    
    /**查询节点是否使用序列号  
     * @param snValue
     * @return
     */
    public int NodeIsHave(String snValue){
    	return (Integer) getSqlSession().selectOne("Product.NodeIsHave",snValue);
    }
    
    /**查询场景是否使用序列号 
     * @param snValue
     * @return
     */
    public int sceneIsHave(String snValue){
    	return (Integer) getSqlSession().selectOne("Product.sceneIsHave",snValue);
    }
    
    /**
     * 删除序列号记录
     * @param pbId
     */
    public void deleteProductBatch(long pbId){
    	getSqlSession().delete("Product.deleteProductBatch",pbId);
    }
    /**
	 * 删除序列号
	 * 
	 * @param pbId
	 */
	@Mempojo
	public List<ProductSn> deleteProductSn(long pbId) {
		List<ProductSn> productSnList = getProductSn(pbId);
		getSqlSession().delete("Product.deleteProductSn", pbId);
		return productSnList;
	}
    
    /**删除报警内容
     * @param productId
     */
    public void deleteProductActionAlert(long productId){
    	getSqlSession().delete("Product.deleteProductActionAlert",productId);
    }
    
    /**查询客户列表
     */
    public List<Customer> getCustomerList(){
    	return getSqlSession().selectList("Product.getCustomerList");
    }

    /**
     * 根据条件查询产品列表
     * @param paraMap
     * @return
     */
	public List<Product> getProductList(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("Product.getList",paraMap);
	}
}
