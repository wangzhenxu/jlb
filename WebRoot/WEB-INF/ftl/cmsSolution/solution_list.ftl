<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-系统分类</title>
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
		var cscId = $("#cscId option:selected").val();
		location.href="/cmsSolution/sub/list.action?name="+name+"&cscId=" +cscId;
	}
	//删除系统
	function deleteSolution(csId) 
	{
	 		 $.get("/cmsSolution/sub/delete.action",{csId:csId},function(resp) {
							if (resp.s > 0) {
							  location.href="/cmsSolution/sub/list.action";
							} else {
								hiOverAlert(resp.d,1000);
							}
			});
	}
	
	//更新发布状态
	function modifyPublishType(csId,publishType) 
	{
	 		 $.get("/cmsSolution/sub/modifyPublishType.action",{csId:csId,publishType:publishType},function(resp) {
							if (resp.s > 0) {
							  location.href="/cmsSolution/sub/list.action";
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
     <div class="location01">您现在的位置是：首页 &gt; CMS发布管理 <strong>&gt; 系统发布</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">系统发布</div>
     <div class="query">
      <ul>
       <li><span class="classify">系统分类：   </span>
          <select name="select" id="cscId" class="input">
            <#list catList as cat>
         		<option value="${cat.cscId!''}">${cat.name!''}</option>
         	</#list>
          </select>
       </li>
        <li><span class="classify">系统名称：</span>
          <input type="text"  id="name" class="input" name="name" value="${name}">
       </li>
       <li><a href="javascript:query()" ><img width="64" height="26" src="/images/erji_06.jpg"></a></li>
      </ul>
     </div> 
    </div>
    <div class="form">
     <div class="form1">
	     <#if subject.isPermitted("systemPublish:add")>
    	 	<a href="/cmsSolution/sub/toAdd.action"><img src="/images/zjxt.jpg" /></a>
    	 </#if>	
     </div>
     <div class="form2">
       <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="lan">
           <td width="11%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序号</strong></td>
           <td width="17%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>系统分类</strong></td>
           <td width="16%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>系统名称</strong></td>
           <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>发布者</strong></td>
           <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>发布时间</strong></td>
           <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
           <td width="20%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
         </tr>
         
          <#list solutionList as solution>
		         <tr>
		           <td align="center" class="hui">${solution.csId!''}</td>
		           <td align="center" class="hui"><p>${solution.cscName!''}</p></td>
		           <td align="center" class="hui">${solution.name!''}</td>
		           <td align="center" class="hui">${solution.userName!''}</td>
		           <td align="center" class="hui">${solution.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
		           <td align="center" class="hui">
			         <a href="/cmsSolution/sub/detail.action?csId=${solution.csId!''}">查看 </a> &nbsp;
			         <#if subject.isPermitted("systemPublish:update")>
			            <a href="/cmsSolution/sub/toEdit.action?csId=${solution.csId!''}"> 编辑 </a>&nbsp;&nbsp;
			    	 </#if>
			    	 <#if subject.isPermitted("systemPublish:delete")>      
			            <a href="javascript:deleteSolution('${solution.csId}')">删除</a>
			         </#if>
			         <a href="${solution.staticUrl!''}" target="_blank">预览</a>
		            
		            </td>
		            <#if subject.isPermitted("systemPublishType:update")>
		           	<#if solution.publishType?? && solution.publishType==0>
			           <td align="center" class="hui"><a href="javascript:modifyPublishType('${solution.csId}',1)"><img src="/images/fb.jpg" width="80" height="24" /></a></td>
			        </#if>
			        <#if solution.publishType?? && solution.publishType==1>
			           <td align="center" class="hui"><a href="javascript:modifyPublishType('${solution.csId}',0)"><img src="/images/yfb.jpg" width="80" height="24" /></a></td>
			        </#if>
			        </#if>
		         </tr>
          </#list>
       </table>
     </div>
	
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/cmsSolution/sub/list.action?name="+name join="&"></@pageBar>
	
    </div>
   </div>
  </div>
</body>
</html>


