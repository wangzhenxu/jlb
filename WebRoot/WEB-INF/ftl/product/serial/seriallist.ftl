<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-序列号管理</title>
<#include "../../include/bootstrap.ftl"/>
<#include "../../include/pager.ftl">
<script src="/js/jquery.validationEngine.pack.js"></script>
<script src="/js/jquery.validationEngine-cn.js"></script>
<script src="/js/fileTypeJudge.js"></script>
<script src="/js/hiAlert/jquery.alert.js"></script>
<link href="/css/alert.css" rel="stylesheet" type="text/css" />
<link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="/css/date_input.css" rel="stylesheet" type="text/css" />
<script>  
$(document).ready(function(){
   $("#serial").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
   $(":file").live("change",function(){  
         $(this).fileTypeJudge("txt");
   })  
     });
jQuery.extend(DateInput.DEFAULT_OPTS, {   
month_names: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],   
short_month_names: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],   
short_day_names: ["一", "二", "三", "四", "五", "六", "日"],  
 dateToString: function(date) {  
    var month = (date.getMonth() + 1).toString();  
    var dom = date.getDate().toString();  
    if (month.length == 1) month = "0" + month;  
    if (dom.length == 1) dom = "0" + dom;  
    return date.getFullYear() + "-" + month + "-" + dom;  
  }  
  
});   

$(function() {   
$("[name=date]").date_input();  
if("${reun!''}"){
 hiOverAlert("${reun!''}");
 }   
});
$(document).ready(function(){
		  $("#tan01").click(function(){
		  $("#tan02").modal().css({
				'margin-top': function () {
			        return -($(this).height()/2)},
			    'margin-left': function () {
			        return -($(this).width()/2);
			    }
			}); 
		  });
		});
   function create(){
   $("#serial").submit();
   }
   function downLoadsn(pbId){	
	location.href="/product/serialnumber/downLoadSN.action?pbId="+pbId;
}

function query(){	
	var productname=$("#productname").attr("value");
	var createdate=$("#date").attr("value");
	location.href="/product/serialnumber/list.action?productname="+productname+"&&createdate="+createdate;
}

function uploadfile(){
$("#upload").modal().css({
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
});
}

function subupload(){
   var temp
   temp=$(":file").val();
   if(temp){
   $("#serialupload").submit();
   $(":file").replaceWith('<input name="file" type="file" class="input" id="textfield2"/>');
   }
   }
   
function deleteSn(pbId){
   $.post("/product/serialnumber/deleteProductSn.action", {
					pbId : pbId
				}, function(resp) {
					if (resp.s == 1) {
						query();
						}
						else{
						  alert(resp.d);
						}
				});
}
</script> 
</head>

<body>
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt;<strong> 序列号管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">序列号管理</div>
     <div class="query">
      <ul>
       <li><span class="classify">产品名称：</span>
         <input name="productname" type="text"  class="input" id="productname"  value="${productname}"/></li>
       <li><span class="classify">生成日期：</span>
         <input name="date" type="text"  class="input" readonly="true" id="date"/></li>
       <li><a href="javascript:query();"><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("sn:generate")>
     <div class="form1"><a href="javascript:void(0)" id="tan01"><img src="/images/xlh.jpg"/></a>
     <a href="javascript:void(0)"><img src="/images/dxlh.jpg" onclick="uploadfile()";/></a>
     </div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td width="16%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品名称</strong></td>
        <td width="18%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号数量</strong></td>
        <td width="17%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>生成作者</strong></td>
        <td width="15%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>生成日期</strong></td>
        <td width="15%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
      </tr>
      <#list productBatchs as productBatch>
       <tr id=${productBatch.pbId}>
        <td align="center" class="hui">${productBatch.productName}</td>
        <td align="center" class="hui">${productBatch.num}</td>
        <td align="center" class="hui">${productBatch.accountUsername}</td>
        <td align="center" class="hui">${productBatch.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
        <td align="center" class="hui">
      		<#if subject.isPermitted("sn:download")>
      			<a href="javascript:downLoadsn(${productBatch.pbId});">下载</a>
      			<a href="javascript:deleteSn(${productBatch.pbId});">&nbsp;删除</a>
      		</#if>
      	</td>
       </tr>
       </#list>
      </table>
     </div>
	<#-- 分页栏 -->
	  <@pageBar pager=pager url="/product/serialnumber/list.action?productname="+productname+"&&createdate="+createdate join="&"></@pageBar>
    </div>
   </div>
   
 <div class="xin1 modal hide fade" id="tan02">
  <div class="xin1_1">
   <div class="whitea">生成序列号</div>
   <div class="close" data-dismiss="modal"><img src="/images/xinjian_03.gif" width="18" height="18" /></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
    <form id="serial"  action="/product/serialnumber/create.action" method="post">
     <table width="100%" border="0">
      <tr>
        <td align="right" class="hui1">产品名称：</td>
        <td align="left" valign="middle">
          <select name="productName" id="select" class="input">
           <#list products as product>
          <option value="${product.productId+"!"+product.name}">${product.name}</option>
          </#list>
          </select>
          </td>
      </tr>
      <tr>
        <td align="right" class="hui1">序列号数量：</td>
        <td align="left" valign="middle"><input name="num" type="text" class="input" id="textfield2" validate="validate[required,custom[onlyNumber],length[1,20]]" /></td>
      </tr>
     </table>
     </form>
    </div>
   </div>
   <div class="caidan2"><a href="javascript:create();"><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp; <a href="#" data-dismiss="modal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a></div>
  </div>
 </div>
  
  <div class="xin1 modal hide fade" id="upload">
  <div class="xin1_1">
   <div class="whitea">上传序列号</div>
   <div class="close" data-dismiss="modal"><img src="/images/xinjian_03.gif" width="18" height="18" /></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
    <form id="serialupload"  action="/product/serialnumber/upload.action"  enctype="multipart/form-data" method="post">
     <table width="100%" border="0">
      <tr>
        <td align="right" class="hui1">产品名称：</td>
        <td align="left" valign="middle">
          <select name="productName" id="select" class="input">
           <#list products as product>
          <option value="${product.productId+"!"+product.name}">${product.name}</option>
          </#list>
          </select>
          </td>
      </tr>
      <tr>
        <td align="right" class="hui1">文本文件：</td>
        <td align="left" valign="middle"><input name="file" type="file" class="input" id="textfield2"/></td>
      </tr>
     </table>
     </form>
    </div>
   </div>
   <div class="caidan2"><a href="javascript:subupload();"><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp; <a href="#" data-dismiss="modal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a></div>
  </div>
 </div> 
  
  
</body>
</html>
