<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-产品分类</title>
<link href="/css/css.css" rel="stylesheet" type="text/css" />

	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
	<link href="/css/alert.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body {
			background-image: url(/images/erji_22.jpg);
			background-repeat: repeat-x;
			}
	</style>
	
<script>
	//查询列表
	function query()
	{
		var name=$("#name").attr("value");
		var pacId = $("#pacId option:selected").val();
		location.href="/productApp/sub/list.action?name="+name+"&pacId=" +pacId;
	}
	//删除产品
	function deleteSolution(paId) 
	{
	 		 $.get("/productApp/sub/delete.action",{paId:paId},function(resp) {
							if (resp.s > 0) {
							  location.href="/productApp/sub/list.action";
							} else {
								hiOverAlert(resp.d,1000);
							}
			});
	}
	
	//更新发布状态
	function modifyPublishType(paId,publishType) 
	{
	 		 $.get("/productApp/sub/modifyPublishType.action",{paId:paId,publishType:publishType},function(resp) {
							if (resp.s > 0) {
							  location.href="/productApp/sub/list.action";
							} else {
								hiOverAlert(resp.d,1000);
							}
			});
	}

</script>

</head>
<body>
   <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; CMS发布管理 <strong>&gt; 产品发布</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">产品发布</div>
     <div class="query">
      <ul>
       <li><span class="classify">产品分类：   </span>
          <select name="pacId" id="pacId" class="input">
            <#list catList as cat>
         		<option value="${cat.pacId!''}">${cat.name!''}</option>
         	</#list>
          </select>
       </li>
        <li><span class="classify">产品名称：</span>
          <input type="text"  id="name" class="input" name="name" value="${name}">
       </li>
       <li><a href="javascript:query()" ><img width="64" height="26" src="/images/erji_06.jpg"></a></li>
      </ul>
     </div> 
    </div>
    <div class="form">
    <#if subject.isPermitted("productPublish:add")>
     <div class="form1"><a href="/productApp/sub/toAdd.action"><img src="/images/erji1_03.jpg" /></a></div>
    </#if>
     <div class="form2">
       <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="lan">
           <td width="11%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序号</strong></td>
           <td width="17%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品分类</strong></td>
           <td width="16%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品名称</strong></td>
           <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>发布者</strong></td>
           <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>发布时间</strong></td>
           <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
           <td width="20%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
         </tr>
         
          <#list productAppList as app>
		         <tr>
		           <td align="center" class="hui">${app.paId!''}</td>
		           <td align="center" class="hui"><p>${app.pacName}</p></td>
		           <td align="center" class="hui">${app.name!''}</td>
		           <td align="center" class="hui">${app.userName!''}</td>
		           <td align="center" class="hui">${app.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
		           <td align="center" class="hui">
			        <a href="/productApp/sub/detail.action?paId=${app.paId!''}">查看 </a> &nbsp;
			        <#if subject.isPermitted("productPublish:edit")>
			            <a href="/productApp/sub/toEdit.action?csId=${app.paId!''}"> 编辑 </a>&nbsp;&nbsp;
			        </#if>
			        <#if subject.isPermitted("productPublish:delete")>
			            <a href="javascript:deleteSolution('${app.paId}')">删除</a>
			        </#if>
			        <a target="_blank" href="${app.staticUrl!''}">预览</a>
		            </td>
		            <#if subject.isPermitted("productPublishType:edit")>
			           	<#if app.publishType?? && app.publishType==0>
				           <td align="center" class="hui"><a href="javascript:modifyPublishType('${app.paId}',1)"><img src="/images/fb.jpg" width="80" height="24" /></a></td>
				        </#if>
				        <#if app.publishType?? && app.publishType==1>
				           <td align="center" class="hui"><a href="javascript:modifyPublishType('${app.paId}',0)"><img src="/images/yfb.jpg" width="80" height="24" /></a></td>
				        </#if>
				    </#if>
		         </tr>
          </#list>
       </table>
     </div>
	
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/productApp/sub/list.action?name="+name join="&"></@pageBar>
	
    </div>
   </div>
  </div>
</body>
</html>


