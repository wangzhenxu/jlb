<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-产品管理-增加产品</title>
<script type="text/javascript" src="/js/loiot.core.min.js"></script>
<script src="/js/checkIamge.js"></script>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine.pack.js"></script>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine-cn.js"></script>
<link href="http://www.loiot.com/c/validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script src="/js/ajaxfileupload.js"></script>
<#include "../include/bootstrap.ftl"/>
<style>
#preview_fake{ /* 该对象用户在IE下显示预览图片 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);   
}   
#preview_size_fake{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);     
    visibility:hidden;   
}   
#preview{ /* 该对象用户在FF下显示预览图片 */   
    width:150px;   
    height:150px;   
}  
</style>
<script LANGUAGE="javascript">
var samllPicbool=false;
function addproduct(){	
	if(samllPicbool){
    	//$("#product").find("input,select,textarea").attr("disabled","disabled");
		$("#product").submit();
	}else{
	$("#product").find("input").trigger("blur");
	$("#product").find("textarea").trigger("blur");
		$.validationEngine.buildPrompt('#ui-upload-holder','请上传大小在1M以内的图片','error');
	}
}
$(document).ready(function(){
   $("#product").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
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

<body>

 <div class="right">
 <form id="product"  action="/product/management/addNKeyPro.action" method="post" enctype="multipart/form-data">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">产品管理</a> &gt; <strong>增加产品 </strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">基本信息</div>
	</div>
     <div class="jiben"><img src="/images/liucheng1.png" width="570" height="60" /></div>
     <div class="query1">
     <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dddddd" style=" border-collapse:collapse;">
       <tr>
        <td colspan="2" align="left" class="red">* 号为必填项<input name="product.hasKey"  type="hidden" value="0"></td>
        </tr>
       <tr>
         <td width="15%" align="right" class="hui1"><span class="red">*</span> 产品ID：</td>
         <td width="85%" align="left" valign="middle"><input name="product.snPrefix" id="product_snPrefix" type="text"  class="inputa" validate="validate[required,custom[eightCha]]"/></td>
         </tr>
       <tr>
         <td align="right" class="hui1"><span class="red">*</span> 产品分类：</td>
         <td align="left" valign="middle"><select name="product.pcId" id="select2" class="inputa">
         <#list classes as class>
           <option value=${class.pcId}>${class.name}</option>  
           </#list>
         </select></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品名称：</td>
         <td align="left" valign="middle"><input name="product.name" id="product_name" type="text"  class="inputa" validate="validate[required,length[1,20]]"/></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品类型：</td>
         <td align="left" valign="middle"><input type="radio" name="product.productType" id="radio" checked="true"  value="3"  style=" vertical-align:middle"/>
           <span class="hui"> 节点</span>&nbsp;&nbsp;
           <input type="radio" name="product.productType" id="radio"  value="5"  style=" vertical-align:middle"/>
           <span class="hui"> RFID</span></td>
         </tr>
       <tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品类型：</td>
         <td align="left" valign="middle"><input type="radio" name="product.showType" id="radio"  value="1"  checked=true style=" vertical-align:middle"/>
           <span class="hui"> 曲线图</span>&nbsp;&nbsp;
           <input type="radio" name="product.showType" id="radio"  value="2"  style=" vertical-align:middle"/>
           <span class="hui"> 锯齿图</span><input type="radio" name="product.showType" id="radio"  value="3"  style=" vertical-align:middle"/>
           <span class="hui"> 图像</span>&nbsp;&nbsp;
           <input type="radio" name="product.showType" id="radio"  value="4"  style=" vertical-align:middle"/>
           <span class="hui"> highstock</span><input type="radio" name="product.showType" id="radio" value="5"  style=" vertical-align:middle"/>
           <span class="hui"> 视频</span></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 客户：</td>
         <td align="left" valign="middle">
         <select name="product.customerName" id="select2" class="inputa">
         <#if customers?exists&&(customers?size>0)>
         <#list customers as customer>
           <option value="${customer.customerId},${customer.customerName!""}">${customer.customerName!""}</option>  
         </#list>
         </#if>
         </select>
         </td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品描述：</td>
         <td align="left" valign="middle"><textarea name="product.description" id="textarea" cols="45" rows="5" class="texta"></textarea>
          </td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 标签TAGS：</td>
         <td align="left" valign="middle"><textarea name="tag.tagWord" id="textarea" cols="45" rows="5" class="texta" validate="validate[required,length[1,20]]"></textarea>
          <span class="lan1">例如：温度，湿度，红外监控等可以逗号、空格、回车的形式分隔开。</span></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span>系统图片：</td>
         <td valign="top" class="hui"><div class="uploadlay">
           <div id="ui-upload-holder">
             <div id="ui-upload-txt">浏览</div>
             <input type="file" id="ui-upload-input" class="ui-upload-input" name="ui-upload-input" onchange="onUploadImgChange(this)"/>
             </div>
         </div></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">&nbsp;</td>
         <td align="left" valign="middle" class="hui">图片类型：JPG、GIF、PNG，文件大小：1M以内。</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">&nbsp;</td>
         <td align="left" class="hui1">
           <div class="kuang">
            <div id="preview_wrapper"> 
	        	<div id="preview_fake"> 
	            	<img id="preview" src="" width="150" height="150"  onload="onPreviewLoad(this)"/> 
	        	</div> 
    		</div> 
    		<img id="preview_size_fake"/>
           </div>
           <div class="chicun">150*150</div>
         </td>
         </tr>
       </table>
    </div>
    </div>
    <div class="anniu"><a href="javascript:void(0);" onclick="addproduct();"><img src="/images/bcx.jpg" width="102" height="30" /></a></div>
   </form>
   </div>
</body>
</html>
