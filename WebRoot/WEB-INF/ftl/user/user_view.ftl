<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-用户信息-用户详情</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
</head>
<body>
 <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="user.html">用户信息</a> &gt; <strong>用户详情</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">用户详情</div>
     <div class="query">
      <div class="details">
      <div class="details2">
       <table width="100%" border="0">
         <tr>
           <td width="11%" align="right" class="hui1">用户名：</td>
           <td width="27%" class="hui">${user.loginName}</td>
           <td width="24%" align="right" class="hui1">用户类型：</td>
           <td width="38%" class="hui">
           <#if user.userType==1>
           	机构用户
           </#if>
           <#if user.userType==0>
           	个人
           </#if>
           </td>
           </tr>
         <tr>
           <td align="right" class="hui1">登录邮箱：</td>
           <td class="hui">${user.email}</td>
           <td align="right" class="hui1">联系人姓名：</td>
           <td class="hui">${user.realName!""}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">所在地区：</td>
           <td class="hui"><p>${user.province!""}
           ${user.city!""}
           ${user.district!""}
           </p></td>
           <td align="right" class="hui1">联系电话：</td>
           <td class="hui"><p>${user.mobile!""}</p></td>
         </tr>
         <tr>
           <td align="right" class="hui1">联系QQ：</td>
           <td class="hui"><p>${user.qq!""}</p></td>
           <td align="right" class="hui1">网站：</td>
           <td class="hui"><p>${user.webSite!""}</p></td>
         </tr>
         <tr>
           <td align="right" class="hui1">注册时间：</td>
           <td class="hui"><p>
            <#if user.createTime??> 
            	 ${user.createTime?string("yyyy-MM-dd HH:mm:ss")}
            </#if>
           </p>
           </td>
           <td align="right" class="hui1">最后一次登录时间：</td>
           <td class="hui">
           <p>
           <#if user.lastLoginTime??> 
            	 ${user.lastLoginTime?string("yyyy-MM-dd HH:mm:ss")}
            </#if></p></td>
         </tr>
         </table>
      </div>
      <div class="details1">
      <div class="details1_1"><strong>用户当前头像</strong></div>
      <div class="details1_2">
      <input type="image" src="${user.picUrl!"/images/persion.png"}" style="width:auto; height:95%"/>
      </div>
     </div>
      </div>
     </div>
    </div>
    <div class="form">
     <div class="title1"><strong>使用信息</strong></div>
     <div class="form2">
       <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="lan">
           <td width="19%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品分类</strong></td>
           <td width="22%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品名称</strong></td>
           <td width="21%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>使用情况</strong></td>
           <td width="17%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>创建时间</strong></td>
           <td width="21%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>地理位置</strong></td>
         </tr>
         <#list scenes as scene>
         <tr class="hui1">
           <td align="center">${scene.product.productClazz.name}</td>
           <td align="center">${scene.product.name}</td>
           <td align="center">&nbsp;</td>
           <td align="center">
           <#if scene.createTime??> 
            	 ${scene.createTime?string("yyyy-MM-dd HH:mm:ss")}
            </#if>
           </td>
           <td align="center">${scene.longitude!""},${scene.latitude!""}</td>
         </tr>
         </#list>
         <tr class="hui1">
           <td align="center" bgcolor="#f2efef">&nbsp;</td>
           <td align="center" bgcolor="#f2efef">&nbsp;</td>
           <td align="center" bgcolor="#f2efef">&nbsp;</td>
           <td align="center" bgcolor="#f2efef">&nbsp;</td>
           <td align="center" bgcolor="#f2efef">&nbsp;</td>
         </tr>
       </table>
     </div>
	  <@pageBar pager=pager url="/user/userView.action?userid="+userid join="&"></@pageBar>
    </div>
   </div>
</body>
</html>
