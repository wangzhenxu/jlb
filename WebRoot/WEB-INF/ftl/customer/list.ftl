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
		$("input[name=checkbox]").click(function(){
			 $("input[name=checkbox2]").each(function(){
			 	$(this).attr("checked",!this.checked);
			 });
		});
	    
	});
	function search(){
		var name=$("input[name='customerName']").val();
		if(name==""){
			alert("请输入客户名称");
			return false;
		}
		window.location.href="/customer/list.action"+"?customerName="+name;
	}
	function del(){
		var checkedCount=$("input[name=checkbox2]:checked").size();
		var customerIds="";
		if(checkedCount==0){
			alert("请选择客户");
			return false;
		}
		$("input[name=checkbox2]:checked").each(function(){
			customerIds=customerIds+$(this).attr("attr_id")+",";
		});
		if(customerIds.length>1){
			customerIds=customerIds.substring(0,customerIds.length-1);
		}
		
		var delUrl="/customer/delete.action?customerIds="+customerIds;
		$.post(delUrl,{"customerIds":customerIds},function(data){
			if(data.s>0){
				alert("删除成功");
				window.location.href="/customer/list.action";
			}else{
				alert("删除失败："+data.d);
				return false;
			}
		})
		
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
      <ul>
       <li><span class="classify">客户名称：</span>
         <input name="customerName" type="text"  class="input" value="${(customerName)!''}"/></li>
       <li><a href="javascript:search();void(0);" ><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
      <div class="form2">
        <table class="table_style03">
       <tr>
        <th width="11%" valign="middle"><input type="checkbox" name="checkbox" id="checkbox" style="vertical-align:middle " /> 
        &nbsp;全选</th>
        <th width="13%">序列号</th>
        <th width="19%">客户名称</th>
        <th width="20%">管理帐号</th>
        <th width="21%">创建时间</th>
        <th width="16%">操作</th>
        </tr>
        
       <#list pager.data as c>
       <tr>
        <td><input type="checkbox" name="checkbox2" style="vertical-align:middle" attr_id="${c.customerId}" /></td>
        <td class="hui">${c_index+1}</td>
        <td class="hui">${c.customerName!''}</td>
        <td class="hui">${c.caName!''}</td>
        <td class="hui">${c.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
        <td><a class="blue" href="/customer/detail.action?customerId=${c.customerId}">查看</a> 
        	<a class="blue" href="/customer/toEdit.action?customerId=${c.customerId}">编辑 </a></td>
        </tr>
        </#list>
	   
	   <tr>
        <td valign="middle" class="d">
        	<#if subject.isPermitted("customer:toAdd")>
        		<a href="/customer/toAdd.action"><img src="/images/zengjia.jpg"/></a>
        	</#if></td>
        <td  colspan="5" align="left" class="d"> <a href="javascript:del();void(0);"><img src="/images/del.jpg" /></a></td>
       </tr>
      </table>
   </div>
	 <@pageBar pager=pager url="/customer/list.action?customerName="+customerName join="&"></@pageBar>
    </div>
   </div>
 
</body>
</html>
