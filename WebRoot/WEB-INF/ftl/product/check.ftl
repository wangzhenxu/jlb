<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-产品管理-查看信息</title>
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
<#include "../include/bootstrap.ftl"/>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine.pack.js"></script>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine-cn.js"></script>
<script type="text/javascript" src="/js/loiot.core.min.js"></script>
<script src="/js/checkIamge.js"></script>
<script src="/js/ajaxfileupload.js"></script>
<link href="http://www.loiot.com/c/validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script>
function productEdit(productId){
	$.get("/product/management/toEdit.action?t="+new Date().getTime(),{productId:productId,actionType:2},function(data){
		$("#pro").html(data.d);
    });
}

function attributeEdit(productId){
	$.get("/product/management/toUpdateAttribute.action",{productId:productId,actionType:2},function(data){
		$("#attr").html(data);
    });
}

function subattribute(t){
        $(t).parents("form").find("input").trigger("blur");
		var i=$(t).parents("form").find(".error-field").length;
	    if(i<1){
		$.post($("#attribute").attr("action"),$("#attribute").serialize(),function(data){
			$("#attr").html(data);
  		  });
  		}
}

function attributecal(productId){
	$.get("/product/management/toAttributeInfo.action",{productId:productId},function(data){
		$("#attr").html(data);
    });
}


function commandEdit(productId){
	$.get("/product/management/toAddtCommand.action",{productId:productId,actionType:2,random:Math.random()},function(data){
		$("#commandDiv").html(data);
    });
}

function subCommand(t){
        $(t).parents("form").find("input").trigger("blur");
		var i=$(t).parents("form").find(".error-field").length;
	    if(i<1){
					$(".amend .paixu1").each(function(n1,val){//命令组排序
								  $(this).find("input").each(function(n2,val){
											 var list = $(this).attr("name");
											 $(this).attr("name",list.replace(/#/, n1));
								  });
							$(this).find(".paixu2").each(function(n3,val){//命令行排序
								  $(this).find("input").each(function(n2,val){
											 var list = $(this).attr("name");
											 $(this).attr("name",list.replace(/&/, n3));
								  });
								});
				
							});
							
							
				  $.post($("#Command").attr("action"),$("#Command").serialize(),function(data){
				   $("#commandDiv").html(data);
				   });
			}
}


function Commandcal(productId){
	$.get("/product/management/toCommandInfo.action",{productId:productId},function(data){
		$("#commandDiv").html(data);
    });
}


function commandwarn(productId){
	$.get("/product/management/warn.action",{productId:productId,actionType:2},function(data){
		$("#warni").html(data);
    });
    $("#attr .baocun a:last").click();
}

function warnCal(productId){
	$.get("/product/management/toWarn.action",{productId:productId},function(data){
		$("#warni").html(data);
    });
}

function add(){
		var tmp=$(".tmp").clone(true);
		tmp.attr("class","hui1")
		var index=$(".tmp").find(".nodeAttr").find("option").length;
	    var num=$(".warn").find("tr").length;
	    if(num>index){
	       alert("不能再添加");
	    }else{
	      	$(".warn").append(tmp);
	    }
		
}
	<#if (productinfo.showType)??>
	 $(function(){
		switch(${productinfo.showType!""}){
			case 1:
			$(".showType").text("曲线图");
			break;
			case 2:
			$(".showType").text("锯齿图");
			break;
			case 3:
			$(".showType").text("图像");
			break;
			case 4:
			$(".showType").text("highstock");
			break;
			case 5:
			$(".showType").text("视频");
			break;
		}
	 })
	          </#if>   
</script>


</head>

<body>
 <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="/product/management/list.action">产品管理</a> &gt; <strong>查看信息 </strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	  <div class="basic01">基本信息</div>
      <div class="basic02"><a href="javascript:void(0);" onclick="productEdit(${productinfo.productId});"><img src="/images/bianji.jpg" /></a> </div>
     </div>
     <form id="product"  action='/product/management/update.action' method="post" enctype="multipart/form-data">
     <div id="pro">
     <div class="query1" id="query1">
       <!--<table width="100%" border="0">
         <tr>
           <td width="50%" valign="top"><table width="100%" border="1">
             <tr>
               <td width="18%" align="right" class="hui1">产品ID：</td>
               <td width="27%" align="left" valign="middle" class="hui">123456</td>
               <td width="26%" align="right" class="hui1">产品名称：</td>
               <td width="29%" align="left" valign="middle" class="hui">智能控制器</td>
             </tr>
             <tr>
               <td align="right" class="hui1">提供商：</td>
               <td colspan="3" align="left" valign="middle" class="hui">北京时代凌宇科技有限公司</td>
             </tr>
             <tr>
               <td align="right" class="hui1">产品KEY：</td>
               <td align="left" valign="middle"><span class="hui"> 无</span></td>
               <td align="right" class="hui1">产品类型：</td>
               <td align="left" valign="middle" class="hui">智能家居</td>
             </tr>
             <tr>
               <td align="right" valign="top" class="hui1">产品描述：</td>
               <td align="left" valign="top" class="hui">温度 湿度 </td>
               <td align="right" valign="top" class="hui1">标签TAGS：</td>
               <td align="left" valign="top" class="hui">&nbsp;</td>
             </tr>
           </table></td>
           <td width="50%" valign="top"><table width="100%" border="0">
             <tr>
               <td align="right" class="hui1">系统图片：</td>
               <td align="left" valign="middle"><input type="radio" name="radio" id="radio" value="radio"  style=" vertical-align:middle"/>
                 <span class="hui"> 版本1</span></td>
             </tr>
             <tr>
               <td align="right">&nbsp;</td>
               <td align="left" valign="middle"><div class="kuang"></div></td>
             </tr>
             </table></td>
         </tr>
       </table>-->
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dddddd" style=" border-collapse:collapse;">
       <tr>
         <td width="16%" align="right" class="hui1">产品ID：<input name="product.productId" type="hidden"  class="input" value="${productinfo.productId}"/></td>
         <td width="84%" align="left" valign="middle" class="hui">${productinfo.snPrefix!""}</td>
         </tr>
       <tr>
         <td align="right" class="hui1">产品分类：</td>
         <td align="left" valign="middle" class="hui">${productinfo.productClazz.name!""}</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品名称：</td>
         <td align="left" valign="middle" class="hui">${productinfo.name!""}</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品类型：</td>
         <td align="left" valign="middle" class="hui">${productType.get(productinfo.productType).getTitle()}</td>
         </tr>
       <tr>
         <#if (productinfo.showType)??>
         <tr>
         <td align="right" class="hui1">展示类型：</td>
         <td  align="left" valign="middle" class="hui showType"></td>
         </tr>   
         </#if>       
         <td align="right" valign="top" class="hui1"> 提供商：</td>
         <td align="left" valign="middle" class="hui"><p>${productinfo.customerName!""}</p></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品描述：</td>
         <td align="left" valign="middle" class="hui">${productinfo.description!""}</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">标签TAGS：</td>
         <td align="left" valign="middle" class="hui"><#list productinfo.tagList as tag>${tag.tagWord!""}<#if tag_has_next>,</#if></#list></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">系统图片：</td>
         <td valign="top" class="hui">
           <div class="kuang"><img src="${ApplicationConst.PRODUCT_PIC_URL}${productinfo.picUrl!""}"  width="150px" height="150px"/></div>
         </td>
         </tr>
       <#if productinfo.hasKey==1>
       <tr>
         <td align="right" valign="top" class="hui1">共享设置：</td>
         <td valign="top" class="hui"> <#if productinfo.isPublic=1>公开<#else>不公开</#if></td>
       </tr>
       </#if>
       </table>
     </div>
     </div>
     </form>
     <#if (productinfo.hasKey)??>
     <#if productinfo.hasKey==0>
     <div class="basic">
	 <div class="basic01">展示属性</div>
     <div class="basic02"><a href="javascript:void(0);" onclick="attributeEdit(${productinfo.productId});"><img src="/images/bianji.jpg" /></a> </div>
	</div>
     <div class="nature" id="attr">
     <div class="form2">
     <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="hui1">
        <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">属性KEY</td>
        <td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">显示名称</td>
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">单位</td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg">符号</td>
        <td width="11%" align="center" valign="middle" background="/images/erji_22.jpg">选择展示</td>
        <td width="16%" align="center" valign="middle" background="/images/erji_22.jpg">展示主属性</td>
        </tr>
       <#if attributes?exists>
       <#list attributes as attribute>
       <tr class="hui">
         <td align="center">${attribute.attrKey!""}</td>
         <td align="center">${attribute.title!""}</td>
         <td align="center">${attribute.unit!""}</td>
         <td align="center">${attribute.symbol!""}</td>
         <td align="center">
        <input type="checkbox" name="checkbox" id="checkbox"  <#if attribute.isShow==1>checked="true"</#if>/>
		</td>
         <td align="center">
         <input type="radio" name="radio5" id="radio5" value="radio5" <#if attribute.isChief=1>checked="true"</#if> />
        </td>
       </tr>
       </#list>
       </#if>
       </table>
     </div>
	 <!--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
    </div>
     <div class="basic">
	 <div class="basic01">控制命令</div>
     <div class="basic02"><a href="javascript:void(0);" onclick="commandEdit(${productinfo.productId});"><img src="/images/bianji.jpg" /></a> </div>
	</div>
     <div class="nature" id="commandDiv">
     <div class="form2">
     <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="hui1">
        <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">命令组名称</td>
        <td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">命令属性</td>
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><p>控制命令</p></td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><p>控制字符串</p></td>
        </tr>
        <#if CommandGroups?exists>
        <#list CommandGroups as Commandgroup>
       <tr class="hui">
         <td align="center" rowspan="${Commandgroup.productCommandList?size+1}">${(Commandgroup.title)!""}(key:${(Commandgroup.cmdKey)!""})</td>
         <td align="center" rowspan="${Commandgroup.productCommandList?size+1}">
         <#if Commandgroup.productAttribute?exists>
         ${(Commandgroup.productAttribute.title)!""} 
         &nbsp;${(Commandgroup.productAttribute.unit)!""}
         <#else>
             未设置关联
         </#if>
         </td>
       </tr>
        <#list Commandgroup.productCommandList as Command>
        <tr class="hui">
         <td align="center">${Command.title!""}</td>
         <td align="center">${Command.cmdStr!""}</td>
        </tr>
         </#list>
        </#list>
        </#if>
       </table>
     </div>
	 <!--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
    </div>
     <div class="basic">
	 <div class="basic01">报警设置</div>
     <div class="basic02"><a href="javascript:void(0);" onclick="commandwarn(${productinfo.productId});"><img src="/images/bianji.jpg" /></a> </div>
	</div>
	 <div id="warni">
     <div class="title1">报警设置详情</div>
     <div class="query1">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dddddd" style=" border-collapse:collapse;">
         <tr>
           <td width="16%" align="right" class="hui1">报警条件：</td>
           <td width="84%" align="left" valign="middle" class="hui">
           ${conditionStr!""}
           </td>
         </tr>
         <tr>
           <td align="right" class="hui1">报警方式：</td>
           <td align="left" valign="middle" class="hui">
           <#if (actionAlert.actionType)??><#if actionAlert.actionType==2>邮件通知</#if></#if> 
           <#if (actionAlert.actionType)??><#if actionAlert.actionType==1>手机短信</#if></#if> 
           <#if (actionAlert.actionType)??><#if actionAlert.actionType==3>站内信</#if></#if> 
           </td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1">报警内容：</td>
           <td align="left" valign="middle" class="hui">温馨提示：${(actionAlert.content)!""}</td>
         </tr>
         </table>
     </div>
    </div>
    </div>
    </#if>
    </#if>
    <div class="anniu"><a href="/product/management/list.action"><img src="/images/gddc_05.jpg" width="91" height="27" /></a></div>
   </div>
</body>
</html>
