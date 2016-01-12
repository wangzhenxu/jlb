<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>网站后台管理系统-帐号管理-角色管理</title>
	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/tgRole.js"></script>
	<script src="/js/jquery.validationEngine.pack.js"></script>
    <script src="/js/jquery.validationEngine-cn.js"></script>
    <link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">	
	$(document).ready(function(){
	   $("#saveRoleForm").validationEngine({ ajaxSubmit: true, validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
	});
	function deleterole(roid) {
	    $(".pop_sure").modal().css({
	                'width':'390px',
                    'margin-top': function () {
        			return -($(this).height()/2);
                    },	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
        $(".pop_sure .mar").click(function() {
					location.href="delete.action?roleId="+roid;
						});
}
	</script>
	<style type="text/css">
		.close{opacity:1;}
	</style>
</head>
<body>
   
   <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>  后台角色</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">角色管理</div>
     <div class="query">
     	<form action="list.action" method="post">
	      <ul>
		       <li>
		       		<span class="classify">角色名称：</span>
		         	<input name="roleName" type="text"  class="input"/>
		       </li>
		       <li>
		       		<a href="javascript:;" onclick="$(this).parents('form').submit();"><img src="/images/erji_06.jpg" width="64" height="26" /></a>
		       </li>
	      </ul>
      	</form>
     </div>
    </div>
    <div class="form">
    	<div class="form1">
      		<#if subject.isPermitted("tgRole:add")>
      			<a href="javascript:initAdd();"><img src="/images/addjs.jpg" border="0" /></a>
      		</#if>
      	</div>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
       <tr class="lan">
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
        <td width="61%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>角色名称</strong></td>
        <td width="24%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
		<#-- 角色列表 -->
       <#list pager.data as role>
	       <tr>
	        <td align="center" class="hui">${role.roleId}</td>
	        <td align="center" class="hui">${role.roleName}</td>
	        <td align="center" class="hui">
	        	<a href="javascript:initView(${role.roleId});"> 查看</a>&nbsp;&nbsp;
      			<#if subject.isPermitted("tgRole:edit")>
	        		<a href="javascript:initEdit(${role.roleId});">修改</a> &nbsp;&nbsp;
	        	</#if>
      			<#if subject.isPermitted("tgRole:delete")>
      				<a href="javascript:deleterole(${role.roleId})"> 删除</a>
	        	</#if>
	        </td>
	       </tr>
       </#list>
      </table>
     </div>
     
     <#-- 分页栏 -->
     <#-- <@pageBar pager=pager url="/tgAccount/role/list.action?roleName="+roleName join="&" ></@pageBar>-->
     
    </div>
    
    <#include "role_modal.ftl"/>
  <!-- 弹窗 开始 -->
<div class="pop_sure modal hide fade">
  <div class="title0">确认框<a class="x" href="javascript:void(0)"  data-dismiss="modal"></a></div>
  <div class="text0">你确定删除吗？</div>
  <div class="w100">
    <ul class="r50">
      <li><a class="button mar" href="javascript:void(0)" value=false><span>确定</span></a><a class="button" 

href="javascript:void(0)"  data-dismiss="modal"><span>取消</span></a></li>
    </ul>
</div>
<!-- 弹窗 结束 -->
 <script>
  common.initLeftMenuSelected("tgRole_list");
  </script>
</body>
</html>