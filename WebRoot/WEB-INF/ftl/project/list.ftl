<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>网站后台管理系统-帐号管理-项目管理</title>
	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/jquery.validationEngine.pack.js"></script>
    <script src="/js/jquery.validationEngine-cn.js"></script>
    <link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">	
	function search(){
		var name=$("input[name='name']").val();
		if(name==""){
			alert("请输入项目名称");
			return false;
		}
		window.location.href="/project/list.action"+"?name="+name;
	}
	function del(){
		var checkedCount=$("input[name=checkbox2]:checked").size();
		var projectIds="";
		if(checkedCount==0){
			alert("请选择项目");
			return false;
		}
		$("input[name=checkbox2]:checked").each(function(){
			projectIds=projectIds+$(this).attr("attr_projectId")+",";
		});
		if(projectIds.length>1){
			projectIds=projectIds.substring(0,projectIds.length-1);
		}
		
		var delUrl="/project/del.action?projectIds="+projectIds;
		$.post(delUrl,{"projectIds":projectIds},function(data){
			if(data.s>0){
				alert("删除成功");
				window.location.href="/project/list.action";
			}else{
				alert("删除失败："+data.d);
				return false;
			}
		})
		
	}
	$(document).ready(function(){
		$("input[name=checkbox]").click(function(){
			 $("input[name=checkbox2]").each(function(){
			 	$(this).attr("checked",!this.checked);
			 });
		});
	   
	});
	</script>
</head>
<body>
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>项目管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">项目管理</div>
     <div class="query">
      <ul>
       <li><span class="classify">项目名称：</span>
         <input name="name" type="text"  class="input" value="${(name)!''}"/></li>
       <li><a href="javascript:search();void(0);"><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
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
        <th width="19%">项目名称名称</th>
        <th width="20%">项目负责人</th>
        <th width="21%">创建时间</th>
        <th width="16%">操作</th>
        </tr>
        <#list pager.data as project>
        <tr>
	        <td><input type="checkbox" name="checkbox2" id="checkbox2" style="vertical-align:middle " attr_projectId="${project.projectId}"/></td>
	        <td class="hui">${project_index+1}</td>
	        <td class="hui">${project.name}</td>
	        <td class="hui">${project.leader}</td>
	        <td class="hui">${project.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
	        <td><a class="blue" href="/project/detail.action?projectId=${project.projectId}">查看</a>
	        	<a class="blue" href="/project/toEdit.action?projectId=${project.projectId}">编辑 </a></td>
        </tr>
        </#list>
	   <tr>
        <td valign="middle" class="d"><a href="/project/toAdd.action"><img src="/images/zengjia1.jpg"/></a></td>
        <td  colspan="5" align="left" class="d"> <a href="javascript:del();void(0);"><img src="/images/del.jpg" /></a></td>
       </tr>
      </table>
   </div>
	 <@pageBar pager=pager url="/project/list.action?name="+name join="&"></@pageBar>
    </div>
</div>

</body>
</html>