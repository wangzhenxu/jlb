<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/account.js"></script>
    <script src="/js/hiAlert/jquery.alert.js"></script>	
    <link href="/css/alert.css" rel="stylesheet" type="text/css" />
    <script src="http://www.loiot.com/c/validation/jquery.validationEngine.min.js"></script>
	<script src="http://www.loiot.com/c/validation/jquery.validationEngine.js"></script>
	<link href="http://www.loiot.com/c/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">
	function add(){
	//添加projectCode用来判断项目类型
	$("input[name='projectCode']").val($("input[name='projectId']:checked").attr("attr_code"));
  	//表单
	var $form=$("#addForm");
	//验证表单
	if($form.validationEngine("validate")){	
	// 提交form表单
	$form.ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			hiOverAlert("添加成功",1000);
			location.href="/customer/list.action";
		} else {
			//客户名称存在
			if(resp.s==-100){
			  	hiOverAlert(resp.d,1000);
			   $("#caName").val("").focus();
			}else if(resp.s==-101){
				hiOverAlert(resp.d,1000);
			   $("#customerName").val("").focus();
			}else{
				hiOverAlert(resp.d,1000);
			}
		}
	});
	}
	}
		
	$(document).ready(function(){
		$("#addForm").validationEngine();
		$("input[name='projectId'][attr_type='projectType']").click(function(){
			var projectRoleUrl="/project/getProjectRole.action";
			$.post(projectRoleUrl,{"projectId":$(this).val()},function(data){
					var optionHtml="";
					for(var i=0;i<data.length;i++){
						optionHtml=optionHtml+"<option value='"+data[i].roleId+"'>"+data[i].roleName+"</option>";
					}
					$("select[name=customerRoleId]").html(optionHtml);
			});
			if($(this).attr("attr_code")=="CYXM"){
				$("tr[attr_type='rest']").show();
			}else{
				$("tr[attr_type='rest']").hide();
			}
		});
		
	});
	</script>
<title>网站后台管理系统-微服务</title>
</head>

<body>
   
   <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>客户账号</strong></div>
    </div>
    <div class="nav">
         <form method="POST" id="addForm" action="/customer/add.action">
         <input name="projectCode" type="hidden" />
     <div class="basic">
	 <div class="basic01">基本信息</div>
	</div>
     <div class="form">
       <table class="table_style02">
	    <tr>
	      <td width="28%" align="right" valign="middle" class="hui1"><span class="red">*</span> 客户名称：</td>
	      <td width="72%" class="hui">
	        <input name="customerName" id="customerName" type="text"  class="inputa validate[required]"/>
	       </td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">联系人
	        ：</td>
	      <td valign="middle" class="hui">
	        <input name="contacts" type="text"  class="inputa"/>
	      </td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">联系电话：</td>
	      <td class="hui"><input name="customerTel" type="text"  class="inputa"/></td>
	      </tr>
	      <tr>
	      <td align="right" valign="middle" class="hui1">客户地址：</td>
	      <td class="hui"><input name="address" type="text"  class="inputa"/></td>
	      </tr>
	    
	    <tr>
	      <td align="right" valign="middle" class="hui1">邮箱：</td>
	      <td class="hui">
	        <input name="customerEmail" type="text"  class="inputa"/>
	      </td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">备注：</td>
	      <td class="hui"><textarea name="remarks" id="textarea" cols="45" rows="5" class="texta"></textarea></td>
	      </tr>
	    </table>
    </div>
     <div class="basic">
	  <div class="basic01">项目信息</div>
	 </div>
     <div class="form">
       <table class="table_style02">
	    <tr>
	      <td width="28%" align="right" valign="middle" class="hui1">选择项目类型</td>
	      <td width="72%" class="hui"><p>
	      	<#list projects as project>
	      		<input type="radio" name="projectId" attr_code="${project.code}"  <#if project.code=='PTXM'>checked</#if> value="${project.projectId}" attr_type="projectType"/>${project.name} 
	      	</#list>
	      </td>
	      </tr>
	    
	    <tr attr_type="rest" style="display:none;">
	      <td align="right" valign="middle" class="hui1">商家类型：</td>
	      <td class="hui">
	        <select name="merchantType" class="inputa">
	        	<option value="1">单店</option>
	        	<option value="2">连锁</option>
	        </select>
	       </td>
	      </tr>
	      
	      <tr attr_type="rest" style="display:none;">
	      <td align="right" valign="middle" class="hui1">网关产品类型：</td>
	      <td class="hui">
	        <select name="sceneProductId" class="inputa">
	        	<#list sceneProducts as product>
	        	<option value="${product.productId}">${product.name}</option>
	        	</#list>
	        </select>
	       </td>
	      </tr>
	      <tr attr_type="rest" style="display:none;">
	      <td align="right" valign="middle" class="hui1">节点产品类型：</td>
	      <td class="hui">
	        <select name="nodeProductId" class="inputa">
	        <#list nodeProducts as product>
	        	<option value="${product.productId}">${product.name}</option>
	        </#list>
	        </select>
	      </td>
	      </tr>
	    </table>
    </div>
     <div class="basic">
	  <div class="basic01">帐号信息</div>
	 </div>
     <div class="form">
       <table class="table_style02">
	     <tr>
	       <td width="28%" align="right" valign="middle" class="hui1"><span class="red">*</span> 管理客户登录名称：</td>
	       <td width="72%" class="hui"><input name="caName" id="caName" type="text"  class="inputa  validate[required]"/></td>
	     </tr>
	     <tr>
	      <td align="right" valign="middle" class="hui1">管理角色：</td>
	      <td class="hui">
	        <select name="customerRoleId" id="prSelect" class="inputa">
	        <#list projectRoleList as projectRole>
	        	<option value="${projectRole.roleId}">${projectRole.roleName}</option>
	        </#list>
	        </select>
	      </td>
	      </tr>
	     <tr>
	       <td align="right" valign="middle" class="hui1"><span class="red">*</span> 管理客户登录密码：</td>
	       <td class="hui"><input name="old_password" id="old_password" type="password"  class="inputa validate[required]"/></td>
	       </tr>
	     <tr>
	       <td align="right" valign="middle" class="hui1"><span class="red">*</span> 确认密码：</td>
	       <td valign="middle" class="hui"><input name="caPassword" id="caPassword" type="password"  class="inputa validate[equals[old_password]]"/></td>
	       </tr>
	     
	    </table>
    </div>
     <div class="anniu"><a href="javascript:void(0);" onclick="add();"><img src="/images/erji1_19.jpg" /></a>&nbsp;
     				    <a href="javascript:void(0);" onclick="history.go(-1);"><img src="/images/back1.jpg" /></a>
     </div>
    </div>
     	</form>
   </div>
</body>
</html>
