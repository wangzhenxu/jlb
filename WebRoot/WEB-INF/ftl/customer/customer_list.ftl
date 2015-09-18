<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/account.js"></script>
	<script src="/js/jquery.validationEngine.pack.js"></script>
    <script src="/js/jquery.validationEngine-cn.js"></script>
    <link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">	
	$(document).ready(function(){
	   $("#saveAccountForm").validationEngine({ ajaxSubmit: true, validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
	});
	function deleteCustomer(customerId,status) {
		if(status==1) {
			if(window.confirm("确认停用吗？如果停用，客户的所有帐号将不能登录")){
				location="delete.action?customerId=" + customerId+"&status="+status;
			}
		}  else {
			location="delete.action?customerId=" + customerId+"&status="+status;
		}
		
	   
    }	
	</script>
<title>网站后台管理系统-微服务</title>
</head>

<body>
   <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>客户账号</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">客户帐号</div>
     <div class="query">
	     <form action="list.action" method="post">
		      <ul>
		       <li><span class="classify">客户名称：</span>
		         <input name="customerName" type="text"  class="input"/></li>
		       <li><a href="#" onclick="$(this).parents('form').submit();"><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
		      </ul>
	      </form>
     </div>
    </div>
    <div class="form">
    
    
    <div class="form1">
    
	     <#if subject.isPermitted("customer:add")>
    		<a href="toAddCustomer.action"><img src="/images/zengjia.jpg" border="0" /></a>
    	 </#if>
    </div>
    
      <div class="form2">
        <table class="table_style03">
       <tr>
        <th width="13%">序列号</th>
        <th width="19%">客户名称</th>
        <th width="20%">管理帐号</th>
        <th width="10%">创建时间</th>
         <th width="9%">状态</th>
        <th width="16%">操作</th>
        </tr>
        
         <#list pager.data as c>
	       <tr>
		        <td class="hui">${c.customerId!''}</td>
		        <td class="hui">${c.customerName!''}</td>
		        <td class="hui">${c.caName!''}</td>
		        <td class="hui">${c.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
		        <td class="hui">
		         <#if c.isDelete==0>未停用</#if>
		         <#if c.isDelete==1>已停用</#if>
		        </td>
		        
		        
		        <td>
		        	<a class="blue" href="toViewCustomer.action?customerId=${c.customerId}">查看</a> 
		         	 <#if subject.isPermitted("customer:edit")>
		         		<a class="blue" href="toEditCustomer.action?customerId=${c.customerId}">编辑 </a>
		         	 </#if>
		         	 <#if subject.isPermitted("customer:delete")>
		         	 	 <#if c.isDelete==0><a class="blue" href="#" onclick="deleteCustomer('${c.customerId}',1)">停用 </a></#if>
		         		 <#if c.isDelete==1><a class="blue" href="#" onclick="deleteCustomer('${c.customerId}',0)">恢复 </a></#if>
		         		
		        	</#if>
		        </td>
	        </tr>
       	</#list>
	  
	   
      </table>
   </div>
	 
	 
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/customer/list.action?customerName="+customerName join="&"></@pageBar>
    
    
    </div>
   </div>
  </div>
 </div>
 
</body>
</html>
