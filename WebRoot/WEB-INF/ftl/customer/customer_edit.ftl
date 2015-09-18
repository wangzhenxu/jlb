  
  <#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/account.js"></script>
	<script src="/js/jquery.validationEngine.pack.js"></script>
    <script src="/js/jquery.validationEngine-cn.js"></script>
    <script src="/js/hiAlert/jquery.alert.js"></script>	
    <link href="/css/alert.css" rel="stylesheet" type="text/css" />
    
    <link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script  language="javascript">	
	$(document).ready(function(){
		$("#updateForm").validationEngine(
		      {scroll:false}
		   ); 		
	});
</script>
 <form action="edit.action" method="post" id="updateForm">
 <input type="hidden" name="oldCustomerName" value="${c.customerName!''}"/>
 <input type="hidden" name="customerId" value="${c.customerId!''}"/>
 
  <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>客户账号</strong></div>
    </div>
    <div class="form">
       <table class="table_style02">
	    <tr>
	      <td align="right" valign="middle" class="hui1"><span class="red">*</span> 客户名称：</td>
	      <td class="hui"><p>
	        <input  type="text" name="customerName" id="customerName" value="${c.customerName!''}" class="input validate[required] inputa"/>
	      </p></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">联系人
	        ：</td>
	      <td valign="middle" class="hui"><p>
	        <input name="contacts" id="contacts" type="text" value="${c.contacts!''}" class="inputa"/>
	      </p></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">电话：</td>
	      <td class="hui"><input name="customerTel" id="customerTel" type="text" value="${c.customerTel!''}" class="input validate[custom[phone]] inputa" /></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">邮箱：</td>
	      <td class="hui"><p>
	        <input name="customerEmail" id="customerEmail"  type="text" value="${c.customerEmail!''}"  class="input validate[custom[email]] inputa"/>
	      </p></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">备注：</td>
	      <td class="hui"><textarea name="remarks" id="remarks" cols="60" rows="20" class="texta" >${c.remarks!''}</textarea></td>
	      </tr>
	    </table>
    </div>
    <div class="anniu"><a href="#" onclick="add()" ><img src="/images/erji1_19.jpg" /></a>&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="#" onclick="javascript:history.back(-1)" ><img src="/images/gddc_05.jpg" /></a></div>
   </div>
   </form>
  <script>
  	function add(){
  	
  	//alert($(".error-field").size());
  	//return;
  		
  			//表单
	var $form=$("#updateForm");
	
	$("[name=customerName]").blur();
	
	
	if($(".error-field").size()){
	}else{
	// 提交form表单
	$form.ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			hiOverAlert("修改成功",1000);
			location.href="/customer/list.action";
		} else {
			if(resp.s==-101){
				hiOverAlert(resp.d,1000);
			   $("#customerName").val("").focus();
			}
		}
	});
	}
		
  		
  	}
  </script>