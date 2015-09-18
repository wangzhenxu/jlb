<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-产品管理-查看信息</title>
<#include "../include/bootstrap.ftl"/>
<script src="/js/main.js"></script>
<script>
$(function(){

$("#kuang1").find("#confirm").click(function(){
 var temp="commandgroup:{";
  $("#kuang1").find("input").each(function(i,v){
  if ($(this).attr("checked")) {
               var name= ","+$(this).attr("name")+":";
                temp+=name+"{command:"+$(this).val()+"}";
      }
  })
   $("#kuang2").html(temp);
})
})
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
	</div>
     <div class="query1">
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
         <#if (productinfo.showType)??>
         <tr>
         <td align="right" valign="top" class="hui1">展示类型：</td>
         <td align="left" valign="middle" class="hui showType"></td>
         </tr>   
         </#if>             
       <tr>
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
     <#if productinfo.hasKey==0>
      <div class="basic">
	 <div class="basic01">产品信息</div>
	</div>
     <div class="title"><strong>展示属性</strong></div>
     <div class="nature">
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
       <#list attributes as attribute>
       <tr class="hui">
         <td align="center">${attribute.attrKey}</td>
         <td align="center">${attribute.title}</td>
         <td align="center">${attribute.unit!""}</td>
         <td align="center">${attribute.symbol}</td>
         <td align="center"><#if attribute.isShow==1><input type="checkbox" name="checkbox" id="checkbox" checked="true"/></#if>
        <#if attribute.isShow==0><input type="checkbox" name="checkbox" id="checkbox"/></#if>
		</td>
         <td align="center"><#if attribute.isChief=1><input type="radio" name="radio5" id="radio5" value="radio5" checked="true" /></#if>
        <#if attribute.isChief=0><input type="radio" name="radio5" id="radio5" value="radio5"/></#if>
        </td>
       </tr>
       </#list>
       </table>
     </div>
	 <!--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
    </div>
     <div class="title"><strong>控制命令选择</strong></div>
     <div class="nature">
     <div class="form2">
     <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="hui1">
        <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">命令组名称</td>
        <td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">控制命令</td>
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><p>控制字符串</p></td>
       </tr>
       <#list Commands as Commandgroup>
       <tr class="hui">
         <td align="center" rowspan="${Commandgroup.productCommandList?size+1}">${Commandgroup.title}(key:${Commandgroup.cmdKey!""})</td>
       </tr>
        <#list Commandgroup.productCommandList as Command>
        <tr class="hui">
         <td align="center">${Command.title!""}</td>
         <td align="center">${Command.cmdStr!""}</td>
        </tr>
         </#list>
        </#list>
       </table>
     </div>
	 <!--<div class="manu"><span class="disabled"> <Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
    </div>
     <div class="title"><strong>控制命令面板</strong></div>
     <div class="form2">
     <div class="add">
      <div class="add2">
       <div class="add2_1">
        <div class="add1">网页预览</div>
        <div class="kuang1" style="padding:10px 20px 20px; height:auto;" id="kuang1">
        ${panleHtml!""}
        </div>
       </div>
       <div class="add2_1">
        <div class="add1">手机预览</div>
        <div class="kuang1" id="kuang2">
        </div>
       </div>
      </div>
     </div>
     <div class="add">
      <div class="add1">个性化编辑</div>
      <div class="add2">
       <table width="100%" border="0">
          <tr>
            <td width="19%" align="left" class="hui1"><textarea name="textarea2" id="textarea2" cols="45" rows="5" class="text1" disabled="false">
            ${panleHtml!""}
            </textarea></td>
            <td width="81%" valign="middle">&nbsp;</td>
          </tr>
          </table>

      </div>
     </div>
    </div>
    </div>
     </#if>
    <div class="anniu"><a href="/product/management/list.action"><img src="/images/gddc_05.jpg" width="91" height="27" /></a></div>
   </div>
</body>
</html>
