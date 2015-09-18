<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	
<title>网站后台管理系统-微服务</title>
</head>
<body>
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>客户账号</strong></div>
    </div>
    <div class="form">
       <table class="table_style02">
	    <tr>
         <td align="right" valign="middle" class="hui1">客户名称：</td>
         <td class="hui">${c.customerName!''}</td>
        </tr>
        <tr>
         <td width="28%" align="right" valign="middle" class="hui1">管理客户登录名称：</td>
         <td width="72%" class="hui">&nbsp;${c.caName!''}</td>
        </tr>
        <tr>
         <td width="28%" align="right" valign="middle" class="hui1">管理客户登录密码：</td>
         <td width="72%" class="hui">&nbsp;${(c.customerAccount.passwordTxt)!''}</td>
        </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">联系人：</td>
	      <td valign="middle" class="hui">${c.contacts!'无'}</td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">电话：</td>
	      <td class="hui"><p>${c.customerTel!'无'}</p></td>
	      </tr>
	    <tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">客户地址：</td>
	      <td class="hui"><p>${c.address!'无'}</p></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">邮箱
	        ：</td>
	      <td valign="middle" class="hui"><p>${c.customerEmail!'无'}</p></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">备注：</td>
	      <td class="hui">${c.remarks!'无'}</td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">创建时间：</td>
	      <td class="hui"><p>${c.createTime?string("yyyy-MM-dd HH:mm:ss")}</p></td>
	     </tr>
	     
	     <tr>
	     	<td align="right" valign="middle" class="hui1">项目类型：</td>
	      	<td class="hui"><p>${(c.project.name)!"无"}</p></td> 
	     </tr>
	     <#if c.project.code!="PTXM">
	     <tr>
	     	<td align="right" valign="middle" class="hui1">商家类型：</td>
	      	<td class="hui"><p><#if (c.projectRest.merchantType==1)>单店<#else>连锁</#if></p></td> 
	     </tr>
	     <tr>
	     	<td align="right" valign="middle" class="hui1">网关产品类型：</td>
	      	<td class="hui"><p>${(sceneProduct.name)!"无"}</p></td> 
	     </tr>
	     <tr>
	     	<td align="right" valign="middle" class="hui1">节点产品类型：</td>
	      	<td class="hui"><p>${(nodeProduct.name)!"无"}</p></td> 
	     </tr>
	     </#if>
	     <tr>
	     	<td align="right" valign="middle" class="hui1">管理角色：</td>
	      	<td class="hui"><p>${(customerRole.roleName)!"无"}</p></td> 
	     </tr>
	     <#if (c.projectRest.userName)??>
	     <tr>
	     	<td align="right" valign="middle" class="hui1">数据平台账号：</td>
	      	<td class="hui"><p>${(c.projectRest.userName)!""}</p></td> 
	     </tr>
	     <tr>
	     	<td align="right" valign="middle" class="hui1">数据平台密码：</td>
	      	<td class="hui"><p>${(c.projectRest.pwd)!""}</p></td> 
	     </tr>
	     </#if>
       </table>
    </div>
    <div class="anniu"><#if subject.isPermitted("customer:toEdit")>
    						<a href="/customer/toEdit.action?customerId=${c.customerId}"><img src="/images/bianji1.jpg"  /></a>&nbsp;
    				   </#if>
    				   <#if subject.isPermitted("customer:delete")>
    					<a href="javascript:history.go(-1);void(0);"><img src="/images/back1.jpg" /></a>
    				   </#if>
    				   </div>
   </div>
</body>
</html>