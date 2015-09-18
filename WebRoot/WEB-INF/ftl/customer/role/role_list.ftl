<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>网站后台管理系统-帐号管理-角色管理</title>
	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/customerRole.js"></script>
	<script src="/js/jquery.validationEngine.pack.js"></script>
    <script src="/js/jquery.validationEngine-cn.js"></script>
    <link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">	
	$(document).ready(function(){
	   $("#saveRoleForm").validationEngine({ ajaxSubmit: true, validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
	});
	var roid="";
	function deleterole(roid2) {
		roid = roid2;
	    $(".pop_sure").modal().css({
	                'width':'390px',
                    'margin-top': function () {
        			return -($(this).height()/2);
                    },	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
      
}

function delRole(){
  $.post("/customer/account/role/delete.action", {
				roleId : roid
			}, function(resp) {
				if (resp.s > 0) {
					location.reload();
				} else {
				
				 	$("#ssf").click();
				    alert(resp.d);
				}
			});
}
	</script>
	<style type="text/css">
		.close{opacity:1;}
	</style>
</head>
<body>
   
   <div class="right">
    
    <!-- 弹窗 开始 -->
<div class="pop_sure modal hide fade">
  <div class="title0">确认框<a class="x" href="javascript:void(0)"  data-dismiss="modal"></a></div>
  <div class="text0">你确定删除吗？</div>
  <div class="w100">
    <ul class="r50">
      <li><a class="button mar" href="javascript:delRole()" ><span>确定</span></a><a class="button" href="javascript:void(0)" id="ssf"   data-dismiss="modal"><span>取消</span></a></li>
    </ul>
</div>
</div>
<!-- 弹窗 结束 -->
    
    
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>  后台角色</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">角色管理</div>
     <div class="query">
     	<form action="list.action" method="post">
	      <ul>
		       <li>
		       		<span class="classify">项目类型：</span>
		         	<select name="projectId">
		         		 <#list plist as p>
		         			<option value="${p.projectId!''}"> ${p.name!''}</option>
		         		</#list>
		         	</select>
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
      		<#if subject.isPermitted("customer_account_role:save")>
      			<a href="javascript:initAdd();"><img src="/images/addjs.jpg" border="0" /></a>
      		</#if>
      	</div>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
       <tr class="lan">
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
        <td width="30%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>角色名称</strong></td>
         <td width="30%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>项目类型</strong></td>
        
        <td width="24%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
		<#-- 角色列表 -->
       <#list pager.data as role>
	       <tr>
	        <td align="center" class="hui">${role.roleId}</td>
	        <td align="center" class="hui">${role.roleName}</td>
	        <td align="center" class="hui">${role.projectName!''}</td>
	        <td align="center" class="hui">
	        	<#if subject.isPermitted("customer_account_role:get")>
	        		<a href="javascript:initView(${role.roleId},${role.projectId});"> 查看</a>&nbsp;&nbsp;
	        	</#if>
      			<#if subject.isPermitted("customer_account_role:save")>
	        		<a href="javascript:initEdit(${role.roleId},${role.projectId});">修改</a> &nbsp;&nbsp;
	        	</#if>
      			<#if subject.isPermitted("customer_account_role:delete")>
      				<a href="javascript:deleterole(${role.roleId})"> 删除</a>
	        	</#if>
	        	<#if subject.isPermitted("customer_account_role:saveRoleDistribution")>
	        	  <a href="javascript:getAllRoleByRole(${role.roleId},${role.projectId!''})"> 分配角色</a>
				</#if>
	        </td>
	       </tr>
       </#list>
      </table>
     </div>
     
     <#-- 分页栏 -->
     <@pageBar pager=pager url="/customer/account/role/list.action?projectId=${projectId!''}" join="&" ></@pageBar>
     
    </div>
    
    
   
   



<form id="giveRoleForm" action="/customer/account/role/saveRoleDistribution.action" method="post">
 <input type='hidden' name='roleId' id='roleId'  />
 <div class="modal hide fade quanxian" id="roleModal2" style="width:432px;">
		 <div class="xin1">
		  <div class="xin1_1">
		   <div class="whitea">分配角色</div>
		   <div class="close" href="javascript:void(0)"  data-dismiss="modal" ><img src="/images/xinjian_03.gif" width="18" height="18" /></div>
		  </div>
		  <div class="caidan">
		   <div class="cd">选择可分配角色</div>
		   <div class="caidan1">
		     <div class="fpjs">
     <ul id="roleAll">
      <li>
        <input type="checkbox" name="checkbox" id="checkbox" style="vertical-align:middle" />
        <span class="hui">连锁店管理员</span>
      </li>
      <li>
        <input type="checkbox" name="checkbox2" id="checkbox2" style="vertical-align:middle" />
        <span class="hui">分店分析员</span> 
      </li>
      <li>
  <input type="checkbox" name="checkbox3" id="checkbox3" style="vertical-align:middle" />
  <span class="hui">分店操作员 </span></li>
  <li>
  <input type="checkbox" name="checkbox4" id="checkbox4" style="vertical-align:middle" />
  <span class="hui">分店统计员</span>
  </li>
  <li>
        <input type="checkbox" name="checkbox5" id="checkbox5" style="vertical-align:middle" />
        <span class="hui">分店统计员</span>
      </li>
      </ul>
    </div>
		   </div>
			   <div class="caidan2">
			   	 <a href="javascript:giveRole()"><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp; 
			   	 <a href="#" href="javascript:void(0)"  id="closepop" data-dismiss="modal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a>
			   </div>
		  </div>
		 </div>
 </div>
</form>




  


 <#include "role_modal.ftl"/>
</body>
</html>