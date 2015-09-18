<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine.pack.js"></script>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine-cn.js"></script>
<link href="http://www.loiot.com/c/validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<title>网站后台管理系统-产品管理-增加产品</title>
<script src="/js/addp.js"></script>
<#include "../include/bootstrap.ftl"/>
<script LANGUAGE="javascript">
$(document).ready(function(){
   $("#attribute").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
     });
</script>
</head>
<body>
<form id="attribute"  action="/product/management/AddAttribute.action" method="post" class="amend">
	 <input name="product.productId" type="hidden"  class="input" value="${productId}"/>
     <input name="actionType" id="actionType" type="hidden"  class="input" value="2"/>
       <div class="form2">
        <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse" name="pro_attr">
         <tr class="hui1">
			<td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>属性KEY</strong></td>
			<td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>显示名称</strong></td>
			<td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>单位</strong></td>
			<td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>符号</strong></td>
			<td width="11%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>选择展示</strong></td>
			<td width="16%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>展示主属性</strong></td>
			<td width="19%" align="center" valign="middle" background="/images/erji_22.jpg"><a href="javascript:void(0)" class="addbtn1"><img src="/images/1.jpg" /></a></td>
	     </tr>
		 <#if attributes?exists>
        <#list attributes as attribute>
		 <tr class="hui1">
			 <td align="center">
			 	     <#if conditions??>
				     	<#list conditions as condition>
				     	<#if condition.paId==attribute.paId>
				     		<p style="display:none" value="${condition.paId}"/>
				     	</#if>
				     	</#list>
				     </#if>
			 <input id="h0" type="hidden" name="product.attributeList[#].paId"  value="${attribute.paId}"/>
			 <input name="product.attributeList[#].attrKey" type="text"  class="input2" id="x_1" value="${attribute.attrKey}" validate="validate[required,length[1,20]]" />
			 </td>
			 <td align="center"><input name="product.attributeList[#].title" type="text"  class="input2" id="x_2" value="${attribute.title}" validate="validate[required,length[1,20]]"/></td>
			 <td align="center"><input name="product.attributeList[#].unit" type="text"  class="input2" id="x_3" value="${attribute.unit}" validate="validate[required,length[1,20]]"/></td>
			 <td align="center"><input name="product.attributeList[#].symbol" type="text"  class="input2" id="x_4" value="${attribute.symbol}" validate="validate[required,length[1,20]]"/></td>
			 <td align="center">
			 <input type="checkbox" name="product.attributeList[#].isShow" value="1" id="checkbox" <#if attribute.isShow==1>checked="true"</#if>/>
			 </td>
			 <td align="center">
			 <input type="radio" name="product.attributeList[#].isChief" value="1" id="radio5" <#if attribute.isChief=1>checked="true"</#if> />
             </td>
			 <td align="center" class="hui1"><a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" border="0" style="vertical-align:middle"/></a>&nbsp; <a href="javascript:void(0)" class="delbtn1">删除</a></td>
         </tr>
          </#list>
       </#if>
        </table>
      </div>
     <div class="baocun"><a href="javascript:void(0)" onclick="subattribute(this)"><img src="/images/bjwj03.jpg" width="62" height="23" class="sub"/></a> &nbsp;<a href="javascript:void(0)" onclick="attributecal(${productId})"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a></div>
    </form>
   
   
   
   <div style="display:none">
           <table>
			  <tr class="hui1 tempRow1">
				 <td align="center"><input name="product.attributeList[#].attrKey" type="text"  class="input2" id="attrKey" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input name="product.attributeList[#].title" type="text"  class="input2" id="title" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input name="product.attributeList[#].unit" type="text"  class="input2" id="unit" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input name="product.attributeList[#].symbol" type="text"  class="input2" id="symbol" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input type="checkbox" name="product.attributeList[#].isShow" id="checkbox" value="1" />
				   </td>
				 <td align="center"><input type="radio" name="product.attributeList[#].isChief" id="radio5" value="1"/>
				   </td>
			     <td align="center" class="hui1"><a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" border="0" style="vertical-align:middle"/></a>&nbsp; <a href="javascript:void(0)" class="delbtn1">删除</a></td>				 
			  </tr>
		   </table>
</div>
</body>
</html>
