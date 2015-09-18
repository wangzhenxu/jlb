<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>网站后台管理系统-帐号管理-用户管理</title>
	<#include "/include/pager.ftl">
</head>

<body>
   <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>用户信息</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">用户信息</div>
     <div class="query">
     	<form action="/user/list.action" method="post">
      <ul>
       <li><span class="classify">用户名：</span>
         <input name="username" type="text"  class="input"/></li>
       <li><a href="javascript:;" onclick="$(this).parents('form').submit();"><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
      </ul>
      	</form>
     </div>
    </div>
    <div class="form">
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
       <tr class="lan">
        <td width="9%" height="37" align="center" valign="middle" background="images/erji_22.jpg"><strong>序列号</strong></td>
        <td width="15%" height="37" align="center" valign="middle" background="images/erji_22.jpg"><strong>用户名</strong></td>
        <td width="15%" height="37" align="center" valign="middle" background="images/erji_22.jpg"><strong>登录邮箱</strong></td>
        <td width="12%" align="center" valign="middle" background="images/erji_22.jpg"><strong>用户类型</strong></td>
        <td width="12%" align="center" valign="middle" background="images/erji_22.jpg"><strong>最新登录时间</strong></td>
        <td width="14%" align="center" valign="middle" background="images/erji_22.jpg"><strong>所在区域</strong></td>
        <td width="9%" align="center" valign="middle" background="images/erji_22.jpg"><strong>操 作</strong></td>
        </tr>
		<#-- 用户列表 -->
       <#list pager.data as user>
	       <tr>
	        <td align="center" class="hui">${user.userId}</td>
	        <td align="center" class="hui">${user.loginName}</td>
	        <td align="center" class="hui">${user.email?default("")}</td>
	        <td align="center" class="hui"><#if user.userType==0>个人<#elseif user.userType==1>机构</#if></td>
	        <td align="center" class="hui">${user.lastLoginTime?default("")}</td>
	        <td align="center" class="hui">${user.district?default("")}</td>
	        <td align="center" class="hui"><a href="/user/userView.action?userid=${user.userId}"> 查看</a></td>
	        </tr>
       </#list>
      </table>
     </div>
     	<#-- 分页栏 -->
     	<@pageBar pager=pager url="/user/list.action?username="+username join="&"></@pageBar>
    </div>
 
</body>
</html>
