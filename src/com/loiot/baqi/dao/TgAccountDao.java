package com.loiot.baqi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.timeloit.pojo.Account;
import com.timeloit.pojo.TgAccount;


/**
 * 账号数据访问层。
 * 
 * @author zhengrj
 */
@Repository("tgAccountDao")
public class TgAccountDao extends SqlSessionDaoSupport {

    /**
     * 通过账号名查询账号
     * 
     * @param username 账号
     * @return 返回一个查询到的账号
     */
    public TgAccount getAccountByUsername(String username) {
        return (TgAccount) getSqlSession().selectOne("TgAccount.getAccountByUserName", username);
    }

    /**
     * 通过用户名获得密码
     * 
     * @param username 账号
     * @return 返回这个账号的密码
     */
    public String getPasswordByUsername(String username) {
        return (String) getSqlSession().selectOne("TgAccount.getPasswordByUsername", username);
    }

    /**
     * 检测用户名是否存在
     * 
     * @param username 用户名
     * @return true 已存在，false 不存在
     */
    public boolean isExistUsername(String username) {
        return getSqlSession().selectOne("TgAccount.isExistUsername", username) != null;
    }

    /**
     * 更新密码
     * 
     * @param username 用户名
     * @param password 密码
     */
    public void updatePassword(String username, String password) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", username);
        params.put("password", password);

        getSqlSession().update("TgAccount.updatePassword", params);
    }
    
    public void updateDeleteStatus(Long accountId,Integer isDelete){
    	 Map<String, Object> params = new HashMap<String, Object>();
         params.put("accountId", accountId);
         params.put("isDelete", isDelete);
        getSqlSession().update("TgAccount.updateDeleteStatus", params);

    }

    /**
     * 为账户添加角色
     * 
     * @param accountId
     * @param roleId
     */
    public void addAccountRole(Long accountId, Long roleId) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("accountId", accountId);
        params.put("roleId", roleId);

        getSqlSession().insert("TgAccount.addAccountRole", params);
    }

    /**
     * 删除一个角色
     * 
     * @param accountId 账号ID
     * @param roleId 角色ID
     */
    public void deleteAccountRole(Long accountId) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("accountId", accountId);

        getSqlSession().insert("TgAccount.deleteAccountRole", params);
    }

    /**
     * 添加后台账号
     * 
     * @param account 后台账号
     * @return 返回新增后台账号的ID
     */
    public TgAccount addAccount(TgAccount account) {
        getSqlSession().insert("TgAccount.addAccount", account);
        return account;
    }
    
    /**
     * 更新type
     * 
     * @param TgAccount 后台账号
     * @return 返回新增后台账号的ID
     */
    public void updateAccountType(TgAccount account) {
        getSqlSession().update("TgAccount.updateType", account);
    }
    
    

    /**
     * 删除后台账号
     * 
     * @param accountId 后台账号ID
     */
    public void deleteAccount(Long accountId) {
        getSqlSession().delete("TgAccount.deleteAccount", accountId);
    }

    /**
     * 查询后台账号列表条数
     * 
     * @param username 后台账号名
     * @return 后台账号列表
     */
    public int getAccountListCount(String username) {

        Map<String, Object> params = new HashMap<String, Object>();
        if (!StringUtils.isEmpty(username)) {
            params.put("username", username);
        }
        return (Integer) getSqlSession().selectOne("TgAccount.getAccountListCount", params);
    }

    /**
     * 查询后台账号列表
     * 
     * @param username 后台账号名
     * @param skipResults 跳过的记录数
     * @param maxResults 最大的记录数
     * @return 后台账号列表
     */
    public List<TgAccount> getAccountList(String username, int skipResults, int maxResults) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("skipResults", skipResults);
        params.put("maxResults", maxResults);
        if (!StringUtils.isEmpty(username)) {
            params.put("username", username);
        }
        return getSqlSession().selectList("TgAccount.getAccountList", params);
    }
    
    public int queryAccountListCount(HashMap<String,Object> pMap){
     return (Integer) getSqlSession().selectOne("TgAccount.getAccountListCount", pMap);
   }
    
   public List<TgAccount> queryAccountList(HashMap<String,Object> pMap, int skipResults, int maxResults){
		pMap.put("skipResults", skipResults);
		pMap.put("maxResults", maxResults);
	   return getSqlSession().selectList("TgAccount.getAccountList", pMap);
   }
   
   public List<TgAccount> queryAccountList(HashMap<String,Object> pMap){
    	 return getSqlSession().selectList("TgAccount.getAccountList", pMap);
    }

    /**
     * 获得后台账号
     * 
     * @param accountId 后台账号ID
     * @return 返回与ID匹配的后台账号
     */
    public TgAccount getAccountById(Long accountId) {
        return (TgAccount) getSqlSession().selectOne("TgAccount.getAccountById", accountId);
    }

}
