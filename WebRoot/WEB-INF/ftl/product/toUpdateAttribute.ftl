<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-产品管理-增加产品</title>
<script src="/js/addp.js"></script>
<#include "../include/bootstrap.ftl"/>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine.pack.js"></script>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine-cn.js"></script>
<link href="http://www.loiot.com/c/validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script LANGUAGE="javascript">
function addattribute(addType){	
$("#actionType").val(addType);
$("#attribute").submit();
}
$(document).ready(function(){
   $("#attribute").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
     });
</script>
</head>
<!--[if IE 6]>
<script type="text/javascript" src="http://axiu.me/wp-content/themes/Summ/js/DD_belatedPNG.js" ></script>
 
<script type="text/javascript">
DD_belatedPNG.fix('.jiben');
</script>
<![endif]-->
<script LANGUAGE="javascript">
<!--
var subMenu = new Array(3);
subMenu[0] = 'undefine';
subMenu[1] = 'undefine';
subMenu[2] = 'undefine';
subMenu[3] = 'undefine';
subMenu[4] = 'undefine';
function gotoURL(szURL){
 window.open(szURL,'Main','') ;
}
//-->
</script>
<script LANGUAGE="javascript">
<!--
var RightMenuUID = "";
function spreadMenu(n){
 var szSubMenuClassName1 = document.getElementById('SubMenu1').className ;
 document.getElementById('SubMenu1').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer1Down').style.display = '' ;
 document.getElementById('ArrowLayer1Right').style.display = 'none' ;
 var szSubMenuClassName2 = document.getElementById('SubMenu2').className ;
 document.getElementById('SubMenu2').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer2Down').style.display = '' ;
 document.getElementById('ArrowLayer2Right').style.display = 'none' ;
 var szSubMenuClassName3 = document.getElementById('SubMenu3').className ;
 document.getElementById('SubMenu3').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer3Down').style.display = '' ;
 document.getElementById('ArrowLayer3Right').style.display = 'none' ;
 var szSubMenuClassName4 = document.getElementById('SubMenu4').className ;
 document.getElementById('SubMenu4').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer4Down').style.display = '' ;
 document.getElementById('ArrowLayer4Right').style.display = 'none' ;
 switch (n){
  case 1 :
   if (szSubMenuClassName1 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu1').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer1Down').style.display = 'none' ;
    document.getElementById('ArrowLayer1Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu1').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer1Down').style.display = '' ;
    document.getElementById('ArrowLayer1Right').style.display = 'none' ;
   }
   break ;
  case 2 :
   if (szSubMenuClassName2 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu2').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer2Down').style.display = 'none' ;
    document.getElementById('ArrowLayer2Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu2').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer2Down').style.display = '' ;
    document.getElementById('ArrowLayer2Right').style.display = 'none' ;
   }
   break ;
  case 3 :
   if (szSubMenuClassName3 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu3').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer3Down').style.display = 'none' ;
    document.getElementById('ArrowLayer3Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu3').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer3Down').style.display = '' ;
    document.getElementById('ArrowLayer3Right').style.display = 'none' ;
   }
   break ;
  case 4 :
   if (szSubMenuClassName4 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu4').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer4Down').style.display = 'none' ;
    document.getElementById('ArrowLayer4Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu4').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer4Down').style.display = '' ;
    document.getElementById('ArrowLayer4Right').style.display = 'none' ;
   }
   break ;
 }
}
function spreadSubMenu(k){
 var szSubMenuClassName1 = document.getElementById('SubSubMenu1').className ;
 document.getElementById('SubSubMenu1').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer1Down').style.display = '' ;
 document.getElementById('ArrowSubLayer1Right').style.display = 'none' ;
 var szSubMenuClassName2 = document.getElementById('SubSubMenu2').className ;
 document.getElementById('SubSubMenu2').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer2Down').style.display = '' ;
 document.getElementById('ArrowSubLayer2Right').style.display = 'none' ;
 var szSubMenuClassName3 = document.getElementById('SubSubMenu3').className ;
 document.getElementById('SubSubMenu3').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer3Down').style.display = '' ;
 document.getElementById('ArrowSubLayer3Right').style.display = 'none' ;
 var szSubMenuClassName3 = document.getElementById('SubSubMenu4').className ;
 document.getElementById('SubSubMenu4').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer4Down').style.display = '' ;
 document.getElementById('ArrowSubLayer4Right').style.display = 'none' ;
 switch (k){
  case 1 :
   if (szSubMenuClassName1 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu1').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer1Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer1Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu1').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer1Down').style.display = '' ;
    document.getElementById('ArrowSubLayer1Right').style.display = 'none' ;
   }
   break ;
  case 2 :
   if (szSubMenuClassName2 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu2').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer2Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer2Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu2').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer2Down').style.display = '' ;
    document.getElementById('ArrowSubLayer2Right').style.display = 'none' ;
   }
   break ;
  case 3 :
   if (szSubMenuClassName3 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu3').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer3Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer3Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu3').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer3Down').style.display = '' ;
    document.getElementById('ArrowSubLayer3Right').style.display = 'none' ;
   }
   break ;
  
   case 4 :
   if (szSubMenuClassName3 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu4').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer4Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer4Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu4').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer4Down').style.display = '' ;
    document.getElementById('ArrowSubLayer4Right').style.display = 'none' ;
   }
   break ;
  
 }
}
//-->
</script>
<body>
<div class="right">
<form id="attribute"  action="/product/management/AddAttribute.action" method="post" class="amend">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">产品管理</a> &gt; <strong>增加产品 </strong></div>
     <input name="product.productId" type="hidden"  class="input" value="${productId}"/>
     <input name="actionType" id="actionType" type="hidden"  class="input" value="0"/>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">产品属性编辑</div>
	</div>
     <div class="jiben"><img src="/images/liucheng2.png" width="570" height="60" /></div> 
	 <div class="xuxian">
      <div class="nature">
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
			 <td align="center" bgcolor="#FFFFFF"><input id="h0" type="hidden" name="product.attributeList[#].paId"  value="${attribute.paId}"/>
			 <input name="product.attributeList[#].attrKey" type="text"  class="input2" id="x_1" value="${attribute.attrKey}" validate="validate[required,length[1,20]]" />
			 </td>
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].title" type="text"  class="input2" id="x_2" value="${attribute.title}" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].unit" type="text"  class="input2" id="x_3" value="${attribute.unit}" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].symbol" type="text"  class="input2" id="x_4" value="${attribute.symbol}" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF">
			 <input type="checkbox" name="product.attributeList[#].isShow" value="1" id="checkbox" <#if attribute.isShow==1>checked="true"</#if>/>
			 </td>
			 <td align="center" bgcolor="#FFFFFF">
			 <input type="radio" name="product.attributeList[#].isChief" value="1" id="radio5" <#if attribute.isChief=1>checked="true"</#if> />
             </td>
			 <td align="center" bgcolor="#FFFFFF" class="hui1"><a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" border="0" style="vertical-align:middle"/></a>&nbsp; <a href="javascript:void(0)" class="delbtn1">删除</a></td>
         </tr>
          </#list>
       </#if>
        </table>
       </div>
      </div>
	 </div>
    </div>
    <div class="anniu"><a href="/product/management/toUpdateNKeyPro.action?productId=${productId}"><img src="/images/syb.jpg" width="102" height="30" /></a> &nbsp;<a href="javascript:addattribute(1)"><img src="/images/bcx.jpg" width="102" height="30" class="sub" /></a> &nbsp;<a href="javascript:addattribute(0)"><img src="/images/bct.jpg" width="102" height="30" class="sub"/></a></div>
    </form>
   </div>
   
   
   
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
			     <td align="center" bgcolor="#FFFFFF" class="hui1"><a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" border="0" style="vertical-align:middle"/></a>&nbsp; <a href="javascript:void(0)" class="delbtn1">删除</a></td>				 
			  </tr>
		   </table>
</div>
</body>
</html>
