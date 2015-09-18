<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTf-8" />
<title>网站后台管理系统-产品管理-增加产品</title>
<script src="/js/addp.js"></script>
<script src="/js/main.js"></script>
<script src="/js/jquery.validationEngine.pack.js"></script>
<script src="/js/jquery.validationEngine-cn.js"></script>
<link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<#include "../include/bootstrap.ftl"/>
<script  language="javascript">
$(document).ready(function(){
   $("#product").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
     });
function updateproduct(){	
$("#product").submit();
}

function showtextarea2(){	
   $("#textarea2").attr("disabled",!!$("#ccck").attr("checked"));
}
</script>
</head>
<body>
<form id="product"  action="/product/management/update.action" method="post" class="amend">
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt;产品管理&gt; <strong>增加产品 </strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">基本信息</div>
	 <div class="basic02"></div>
	</div>
     <div class="query1">
     <table width="800" border="0">
       <tr>
        <td width="10%" align="right" class="hui1">产品ID：<input name="product.productId" type="hidden"  class="input" value="${productinfo.productId}"/></td>
        <td width="24%" align="left" valign="middle"><input name="product.snPrefix" type="text" disabled="disabled" readonly="true"  class="input" value="${productinfo.snPrefix}" id="product_snPrefix" validate="validate[required,length[4,20]]"/></td>
        <td width="11%" align="right" class="hui1">产品名称：</td>
        <td width="23%" align="left" valign="middle"><input name="product.name" type="text"  class="input" value="${productinfo.name}" id="product_name" validate="validate[required,length[4,20]]"/></td>
        <td width="32%" align="left" valign="middle">&nbsp;</td>
       </tr>
       <#---
        <tr>
        <td align="right" class="hui1">产品类型：</td>
        <td colspan="3" align="left" valign="middle">
        <#if productinfo.productType==0>用户组装</#if>
        <#if productinfo.productType==1>网关</#if>
        <#if productinfo.productType==2>中间件</#if>
        <#if productinfo.productType==3>节点</#if>
        </td>
       </tr>
       ----->
       <tr>
        <td align="right" class="hui1">提供商：</td>
        <td colspan="3" align="left" valign="middle">${productinfo.customerName!""}</td>
       </tr>
       <tr>
        <td align="right" class="hui1">产品KEY：</td>
        <td align="left" valign="middle">
         <#if productinfo.hasKey=1>
        <input type="radio" name="product.hasKey" id="radio" value="1"  style=" vertical-align:middle" checked="true"/>
        </#if>
        <#if productinfo.hasKey!=1>
        <input type="radio" name="product.hasKey" id="radio" value="1"  style=" vertical-align:middle"/>
        </#if>
          <span class="hui">
            有</span>&nbsp;&nbsp;
          <#if productinfo.hasKey=0>
          <input type="radio" name="product.hasKey" id="radio2" value="0"  style=" vertical-align:middle" checked="true"/> 
          </#if>
           <#if productinfo.hasKey!=0>
          <input type="radio" name="product.hasKey" id="radio2" value="0"  style=" vertical-align:middle"/> 
          </#if>
          <span class="hui"> 无</span>
        </td>
        <td align="right" class="hui1">产品分类：</td>
        <td align="left" valign="middle">
          <select name="product.pcId" id="select" class="input">
           <#list classes as class>
               <#if class.pcId==productinfo.productClazz.pcId>
               <option value=${class.pcId} selected="selected">${class.name}</option>  
               </#if>
                <#if class.pcId!=productinfo.productClazz.pcId>
               <option value=${class.pcId}>${class.name}</option>  
               </#if>
           </#list>
          </select></td>
       </tr>
       <tr>
        <td align="right" valign="top" class="hui1">产品描述：</td>
        <td align="left" valign="top"><textarea name="product.description" id="textarea" cols="45" rows="5" class="text" >${productinfo.description}</textarea></td>
        <td align="right" valign="top" class="hui1">产品TAGS：</td>
        <td align="left" valign="top">
        <textarea name="tag.tagWord" id="textarea" cols="45" rows="5" class="text"><#list productinfo.tagList as tag>${tag.tagWord}<#if tag_has_next>,</#if></#list></textarea></td>
                <td align="left" valign="middle" class="lan">例如：温度，湿度，红外监控等可以逗号、空格、回车的形式分隔开。</td>
        </tr>
      <tr>
        <td align="right" class="hui1">系统图片：</td>
        <td align="left" valign="middle">
        <#if productinfo.picUrl="/images/cgq.jpg">
        <input type="radio" name="product.picUrl" id="radio3" value="/images/cgq.jpg"  style=" vertical-align:middle" checked="true" />
        </#if>
         <#if productinfo.picUrl!="/images/cgq.jpg">
        <input type="radio" name="product.picUrl" id="radio3" value="/images/cgq.jpg"  style=" vertical-align:middle" />
        </#if>
          <span class="hui"> 版本1</span>
          </td>
        <td colspan="2" align="left" class="hui1">
         <#if productinfo.picUrl="/images/cgq1.jpg">
        <input type="radio" name="product.picUrl" id="radio4" value="/images/cgq1.jpg"  style=" vertical-align:middle" checked="true" />
         </#if>
          <#if productinfo.picUrl!="/images/cgq1.jpg">
        <input type="radio" name="product.picUrl" id="radio4" value="/images/cgq1.jpg"  style=" vertical-align:middle" />
         </#if>
          <span class="hui"> 版本2</span></td>
        </tr>
       <tr>
        <td align="right">&nbsp;</td>
        <td align="left" valign="middle">
         <div class="kuang"><input name="" type="image" src="/images/cgq.jpg"/></div>
        </td>
        <td colspan="2" align="left" valign="top">
         <div class="kuang"><input name="" type="image" src="/images/cgq1.jpg"/></div>
        </td>
      </tr>
     </table>
     </form>
    </div>
<div id="p_key_ctrl">
 <#if productinfo.hasKey==0>
     <div class="basic">
	 <div class="basic01">产品编辑</div>
	 <div class="basic02"></div>
	</div>
    <div class="title">
     <div class="title1_1"><strong>产品属性编辑</strong></div>
     <div class="title1_2"><a href="javascript:void(0)"  class="addbtn1"><img src="/images/add_1.jpg" /></a></div>
    </div>
     <div class="nature">
     <div class="form2">
     <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse" name="pro_attr">
      <tr class="hui1">
        <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">属性KEY</td>
        <td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">显示名称</td>
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">单位</td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg">符号</td>
        <td width="11%" align="center" valign="middle" background="/images/erji_22.jpg">选择展示</td>
        <td width="16%" align="center" valign="middle" background="/images/erji_22.jpg">展示主属性</td>
        <td width="19%" align="center" valign="middle" background="/images/erji_22.jpg">操 作</td>
      </tr>
      <#if attributes?exists>
        <#list attributes as attribute>
       <tr class="hui1 tempRow" >
	    <td style="display:none" >
	    <input id="h0" type="hidden" name="product.attributeList[#].paId"  value="${attribute.paId}"/>
	    </td>
        <td align="center"><input name="product.attributeList[#].attrKey" type="text"  class="input2" id="x_1" value="${attribute.attrKey}" validate="validate[required,length[1,20]]" /></td>
        <td align="center"><input name="product.attributeList[#].title" type="text"  class="input2" id="x_2" value="${attribute.title}" validate="validate[required,length[1,20]]"/></td>
        <td align="center"><input name="product.attributeList[#].unit" type="text"  class="input2" id="x_3" value="${attribute.unit}" validate="validate[required,length[1,20]]"/></td>
        <td align="center"><input name="product.attributeList[#].symbol" type="text"  class="input2" id="x_4" value="${attribute.symbol}" validate="validate[required,length[1,20]]"/></td>
        <td align="center">
		<#if attribute.isShow==1><input type="checkbox" name="product.attributeList[#].isShow" value="1" id="checkbox" checked="true"/></#if>
        <#if attribute.isShow==0><input type="checkbox" name="product.attributeList[#].isShow" value="1" id="checkbox"/></#if>
        </td>
        <td align="center">
        <#if attribute.isChief=1><input type="radio" name="product.attributeList[#].isChief" value="1" id="radio5" checked="true" /></#if>
        <#if attribute.isChief=0><input type="radio" name="product.attributeList[#].isChief" value="1" id="radio5" /></#if>
        </td>
        <td align="center" class="hui1">&nbsp;<a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" style="vertical-align:middle"/>删除</a></td>
       </tr>
       </#list>
       </#if>
     </table>
     </div>
	 <!--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
    </div>
     <div class="title" align="left"><strong>控制命令</strong></div>
     <div class="form2">
     <div class="add">
      <div class="add1"><img align="left" src="/images/erji1_16.jpg" class="addorders"/></div>
      <div class="add2">
      <#if CommandGroups?exists>
       <#list CommandGroups as CommandGroup>
       <table width="100%" border="0" class="paixu1" id="order0">
          <tr id="o1">
		    <td style="display:none" >
		    <input id="hz0" type="hidden" name="product.commandGroupList[#].pcgId" value="${CommandGroup.pcgId}"/>
		    </td>
            <td width="10%" align="right" class="hui1">命令组名称：</td>
            <td width="18%" valign="middle"><input name="product.commandGroupList[#].title" type="text"  id="id_title" class="input" value="${CommandGroup.title!""}" validate="validate[required,length[1,20]]"/></td>
            <td width="10%" align="right" class="hui1">命令组KEY：</td>
            <td width="18%" valign="middle"><input name="product.commandGroupList[#].cmdKey" type="text" id="id_cmdKey" class="input" value="${CommandGroup.cmdKey!""}" validate="validate[required,length[1,20]]"/></td>
			 <td width="10%" align="left"><a href="javascript:void(0)" class="addbtn2"><img src="/images/2.jpg" alt="" /></a></td>
            <td width="17%">&nbsp;</td>
            <td width="17%">&nbsp;</td>
          </tr>
           <#list CommandGroup.productCommandList as Command>
          <tr class="cha paixu2" id="o2">
		    <td style="display:none" >
		    <input id="hz0"  type="hidden" name="product.commandGroupList[#].productCommandList[&].pcId" value="${Command.pcId}"/>
		    </td>
            <td align="right" class="hui1">控制名称：</td>
            <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].title" type="text"  class="input" id="t_1" value="${Command.title!""}" validate="validate[required,length[1,20]]"/></td>
            <td align="right" class="hui1">控制字符串：</td>
            <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].cmdStr" type="text"  class="input" id="t_2" value="${Command.cmdStr!""}" validate="validate[required,length[1,20]]"/></td>
            <td class="hui1"> <img src="/images/erji1_10.jpg" alt="" style="vertical-align:middle"/> &nbsp;<a href="javascript:void(0)" class="delbtn2">删除</a></td>
            <td valign="middle">&nbsp;</td>
            <td align="center" valign="middle">&nbsp;</td>
          </tr>
           </#list>
          <tr>
            <td align="right">&nbsp;</td>
            <td valign="middle">&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td valign="middle">&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="middle">&nbsp;</td>
            <td align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" class="delete"><a href="javascript:void(0)">删除命令组</a></td>
          </tr>
       </table>
        </#list>
         </#if>
      </div>
     </div>
      <div class="add">
      <div class="add1">
      <table width="181" border="0">
  		<tr valign="baseline">
	    <td width="71" valign="middle" style="line-height:inherit">个性化编辑</td>
	    <td width="21" valign="middle" style="line-height:inherit" align="right"><input name="product.productPanel.isDefault" type="checkbox" value="0"  id="ccck" checked="true"  onclick="showtextarea2();"/></td>
	    <td width="75" valign="middle" style="line-height:inherit" align="left">系统默认</td>
  	  </tr>
	  </table>
	  </div>
      <div class="add2">
       <#if panel?exists>
       <table width="100%" border="0">
          <tr>
            <td width="19%" align="left" class="hui1">
            <input id="hz0" type="hidden" name="product.productPanel.ppId" value="${panel.ppId!""}"/>
            <textarea name="product.productPanel.templateContent" id="textarea2" cols="45" rows="5" class="text1" disabled="disabled">${panleHtml!""}</textarea></td>
            <td width="81%" valign="middle">请输入相关代码(可以根据自身需求编辑控制面板）</td>
          </tr>
          </table>
      </#if>
      </div>
     </div>
    </div>
    </div>
    </div>
    </#if>
        <div class="anniu"><a href="javascript:updateproduct()"><img src="/images/erji1_19.jpg" width="101" height="29"  class="sub"/></a></div>
</div>


   </div>
</form>
<#if productinfo.hasKey==0>
<div style="display:none">
           <table>
			  <tr class="hui1 tempRow1">
				 <td align="center"><input name="product.attributeList[#].attrKey" type="text"  class="input2" id="attrKey" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input name="product.attributeList[#].title" type="text"  class="input2" id="title" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input name="product.attributeList[#].unit" type="text"  class="input2" id="unit" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input name="product.attributeList[#].symbol" type="text"  class="input2" id="symbol" validate="validate[required,length[1,20]]"/></td>
				 <td align="center"><input type="checkbox" name="product.attributeList[#].isShow" id="checkbox" />
				   </td>
				 <td align="center"><input type="radio" name="product.attributeList[#].isChief" id="radio5" value="radio5" />
				   </td>
				 <td align="center" class="hui1">&nbsp;<a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" style="vertical-align:middle"/> 删除</a></td>
			  </tr>
		   </table>
		   <table width="100%" border="0" class="orders">
						  <tr>
							<td width="10%" align="right" class="hui1">命令组名称：</td>
							<td width="18%" valign="middle"><input name="product.commandGroupList[#].title" type="text"  class="input" id="commandGroup_title" validate="validate[required,length[1,20]]"/></td>
							<td width="10%" align="right" class="hui1">命令组KEY：</td>
							<td width="18%" valign="middle"><input name="product.commandGroupList[#].cmdKey" type="text"  class="input" id="commandGroup_cmdKey" validate="validate[required,length[1,20]]"/></td>
							<td width="10%" align="right"><a href="javascript:void(0)" class="addbtn2"><img src="/images/2.jpg" /></a></td>
							<td width="17%">&nbsp;</td>
							<td width="17%">&nbsp;</td>
						  </tr>
						  <tr class="paixu2 tempRow2">
							<td align="right" class="hui1">控制名称：</td>
							<td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].title" type="text"  class="input" id="Command_title" validate="validate[required,length[1,20]]"/></td>
							<td align="right" class="hui1">控制字符串：</td>
							<td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].cmdStr" type="text"  class="input" id="Command_cmdStr" validate="validate[required,length[1,20]]"/></td>
            <td class="hui1"> <img src="/images/erji1_10.jpg" alt="" style="vertical-align:middle"/> &nbsp;<a href="javascript:void(0)" class="delbtn2">删除</a></td>
            <td valign="middle">&nbsp;</td>
            <td align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td valign="middle">&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td valign="middle">&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="middle">&nbsp;</td>
            <td align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" class="delete"><a href="javascript:void(0)">删除命令组</a></td>
          </tr>
		   </table>
</div>
</#if>
</body>
</html>
