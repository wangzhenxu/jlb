<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-产品修改-增加产品</title>
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
     <div class="location01">您现在的位置是：首页 &gt; 产品管理 &gt; <strong>修改产品 </strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">基本信息</div>
	</div>
     <div class="query1">
     <table width="100%" border="0">
       <tr>
        <td colspan="3" align="left" class="red">* 号为必填项</td>
        <td width="29%" align="left" valign="middle">&nbsp;</td>
        <td width="21%" align="left" valign="middle">&nbsp;</td>
        </tr>
       <tr>
         <td width="12%" align="right" class="hui1"><span class="red">*</span> 产品分类：</td>
         <td width="17%" align="left" valign="middle"><select name="product.pcId" id="select" class="inputa">
           <#list classes as class>
               <#if class.pcId==productinfo.productClazz.pcId>
               <option value=${class.pcId} selected="selected">${class.name}</option>  
               </#if>
                <#if class.pcId!=productinfo.productClazz.pcId>
               <option value=${class.pcId}>${class.name}</option>  
               </#if>
           </#list>
          </select></td>
         <td width="21%" align="right" class="hui1">&nbsp;</td>
         <td colspan="2" rowspan="9" valign="top" class="hui1"><table width="100%" border="0">
           <tr>
             <td width="22%" align="right">系统图片：</td>
             <td width="33%">
             <#if productinfo.picUrl="/images/cgq.jpg">
             <input type="radio" name="product.picUrl" id="radio3" value="/images/cgq.jpg"  style=" vertical-align:middle" checked="true" />
             </#if>
             <#if productinfo.picUrl!="/images/cgq.jpg">
             <input type="radio" name="product.picUrl" id="radio3" value="/images/cgq.jpg"  style=" vertical-align:middle" />
             </#if>
             <span class="hui"> 版本1</span>
             </td>
             <td width="45%"> 
             <#if productinfo.picUrl="/images/cgq1.jpg">
             <input type="radio" name="product.picUrl" id="radio4" value="/images/cgq1.jpg"  style=" vertical-align:middle" checked="true" />
             </#if>
             <#if productinfo.picUrl!="/images/cgq1.jpg">
             <input type="radio" name="product.picUrl" id="radio4" value="/images/cgq1.jpg"  style=" vertical-align:middle" />
             </#if>
             <span class="hui"> 版本2</span>
             </td>
           </tr>
           <tr>
             <td>&nbsp;</td>
             <td><div class="kuang"><img src="/images/cgq.jpg" /></div></td>
             <td><div class="kuang"><img src="/images/cgq1.jpg" /></div></td>
           </tr>
         </table></td>
         </tr>
       <tr>
         <td align="right" class="hui1"><span class="red">*</span> 产品ID：<input name="product.productId" type="hidden"  class="input" value="${productinfo.productId}"/></td>
         <td align="left" valign="middle"><input name="product.snPrefix" type="text" disabled="disabled" readonly="true"  class="inputa" value="${productinfo.snPrefix}" id="product_snPrefix" validate="validate[required,length[4,20]]"/></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品名称：</td>
         <td align="left" valign="middle"><input name="product.name" type="text"  class="inputa" value="${productinfo.name}" id="product_name" validate="validate[required,length[4,20]]"/></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 提供商：</td>
         <td align="left" valign="middle">${productinfo.customerName!""}</td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 标签TAGS：</td>
         <td align="left" valign="middle"><textarea name="tag.tagWord" id="textarea" cols="45" rows="5" class="texta"><#list productinfo.tagList as tag>${tag.tagWord!""}<#if tag_has_next>,</#if></#list></textarea></td>
         <td align="left" valign="middle" class="lan1">例如：温度，湿度，红外监控等可以逗号、空格、回车的形式分隔开。</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品描述：</td>
         <td align="left" valign="middle"><textarea name="product.description" id="textarea" cols="45" rows="5" class="texta" >${productinfo.description!""}</textarea></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品KEY：</td>
         <td align="left" valign="middle"> 
          <#if productinfo.hasKey=1>
          <input type="radio" name="product.hasKey" id="radio" value="1"  style=" vertical-align:middle" checked="true"/>
          </#if>
          <#if productinfo.hasKey!=1>
          <input type="radio" name="product.hasKey" id="radio" value="1"  style=" vertical-align:middle"/>
          </#if>
          <span class="hui">有</span>&nbsp;&nbsp;
          <#if productinfo.hasKey=0>
          <input type="radio" name="product.hasKey" id="radio2" value="0"  style=" vertical-align:middle" checked="true"/> 
          </#if>
           <#if productinfo.hasKey!=0>
          <input type="radio" name="product.hasKey" id="radio2" value="0"  style=" vertical-align:middle"/> 
          </#if>
          <span class="hui"> 无</span></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品类型：</td>
         <td align="left" valign="middle">
          <#if productinfo.productType==0> 
         <input type="text" disabled="disabled" readonly="true"  class="inputa" value="用户组装"/>
          </#if>
          <#if productinfo.productType==1>
         <input type="text" disabled="disabled" readonly="true"  class="inputa" value="网关"/>
          </#if>
         <#if productinfo.productType==2>
         <input type="text" disabled="disabled" readonly="true"  class="inputa" value="中间件"/>
          </#if>
         <#if productinfo.productType==3> 
         <input type="text" disabled="disabled" readonly="true"  class="inputa" value="节点"/>
          </#if>
             </td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" class="hui1">&nbsp;</td>
         <td align="right" class="hui1">&nbsp;</td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       </table>
    </div>
    <div id="key_ctrl"><!--产品有无key控制-->
      <#if productinfo.hasKey==0>
     <div class="basic">
	 <div class="basic01">产品编辑</div>
	</div>
	 <div class="xuxian">
      <div class="title">
     <div class="title1_1"><strong>产品属性编辑</strong></div>
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
			 <#if attribute.isShow==1><input type="checkbox" name="product.attributeList[#].isShow" value="1" id="checkbox" checked="true"/></#if>
             <#if attribute.isShow==0><input type="checkbox" name="product.attributeList[#].isShow" value="1" id="checkbox"/></#if>
			 </td>
			 <td align="center" bgcolor="#FFFFFF">
			 <#if attribute.isChief=1><input type="radio" name="product.attributeList[#].isChief" value="1" id="radio5" checked="true" /></#if>
             <#if attribute.isChief=0><input type="radio" name="product.attributeList[#].isChief" value="1" id="radio5" /></#if>
             </td>
			 <td align="center" bgcolor="#FFFFFF" class="hui1"><a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" border="0" style="vertical-align:middle"/></a>&nbsp; <a href="javascript:void(0)" class="delbtn1">删除</a></td>
         </tr>
          </#list>
       </#if>
        </table>
       </div>
      </div>
	 </div>
     <div class="xuxian">
      <div class="title">
       <div class="title1_1"><strong>控制命令</strong></div>
      </div>
	  <div class="nature">
       <div class="form2">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="hui1">
			<td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="12%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="11%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="16%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="19%" align="center" valign="middle" background="/images/erji_22.jpg"><a href="javascript:void(0)" class="addorders"><img src="/images/2.jpg" width="120" height="28" /></a></td>
	     </tr>
        </table>
        <div class="zh add2">
         <#if CommandGroups?exists&&(CommandGroups?size>0)>
         <div class="control">
          <div class="control2">
           <#list CommandGroups as CommandGroup>
            <table width="100%" border="0"  class="paixu1" id="order1">
              <tr>
                <td width="10%" align="right" bgcolor="#e5e5e5" class="hui1">命令组名称： <input id="hz0" type="hidden" name="product.commandGroupList[#].pcgId" value="${CommandGroup.pcgId}"/></td>
                <td width="22%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].title" type="text"  id="id_title" class="input" value="${CommandGroup.title!""}" validate="validate[required,length[1,20]]"/></td>
                <td width="11%" align="right" bgcolor="#e5e5e5" class="hui1">命令组KEY：</td>
                <td width="22%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].cmdKey" type="text" id="id_cmdKey" class="input" value="${CommandGroup.cmdKey!""}" validate="validate[required,length[1,20]]"/></td>
                <td width="12%" align="left" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="addbtn2"><img src="/images/erji1_17.jpg" width="88" height="23" /></a></td>
                <td width="23%" align="right" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="delete"><img src="/images/3.jpg" width="120" height="28" /></a></td>
              </tr>
               <#list CommandGroup.productCommandList as Command>
              <tr class="cha paixu2">
                <td align="right" class="hui1">控制名称：<input id="hz0"  type="hidden" name="product.commandGroupList[#].productCommandList[&].pcId" value="${Command.pcId}"/></td>
                <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].title" type="text"  class="input" id="t_1" value="${Command.title!""}" validate="validate[required,length[1,20]]"/></td>
                <td align="right" class="hui1">控制字符串：</td>
                <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].cmdStr" type="text"  class="input" id="t_2" value="${Command.cmdStr!""}" validate="validate[required,length[1,20]]"/></td>
                <td align="left" valign="middle" class="hui1"><img src="/images/erji1_10.jpg" alt="" style="vertical-align:middle"/> &nbsp;<a href="javascript:void(0)" class="delbtn2">删除</a></td>
                <td align="left" valign="middle" class="hui1">&nbsp;</td>
              </tr>
              </#list>
            </table>
            </#list>
          </div>
        </div>
         </#if>
        </div>
       </div>
      </div>
	 </div>
	  <div class="xuxian">
	  <div class="add1">
    <div class="form2">
      <div class="control">
      <table width="181" border="0">
  		<tr valign="baseline">
	    <td width="71" valign="middle" style="line-height:inherit">个性化编辑</td>
	    <td width="21" valign="middle" style="line-height:inherit" align="right"><input name="product.productPanel.isDefault" type="checkbox" value="0"  id="ccck" checked="true"  onclick="showtextarea2();"/></td>
	    <td width="75" valign="middle" style="line-height:inherit" align="left">系统默认</td>
  	  </tr>
	  </table>
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
     </#if>
    </div><!--产品有无key控制-->
    
   
     </div>
    <div class="anniu"><a href="javascript:updateproduct()"><img src="/images/erji1_19.jpg" width="101" height="29"  class="sub"/></a></div>
   </div>
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
				 <td align="center"><input type="radio" name="product.attributeList[#].isChief" id="radio5" value="1" checked="true"/>
				   </td>
			     <td align="center" bgcolor="#FFFFFF" class="hui1"><a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" border="0" style="vertical-align:middle"/></a>&nbsp; <a href="javascript:void(0)" class="delbtn1">删除</a></td>				 
			  </tr>
		   </table>
		   <div class="control orders">
		   <div class="control2">
		   <table width="100%" border="0">
						  <tr>
							<td width="10%" align="right" bgcolor="#e5e5e5" class="hui1">命令组名称：</td>
							<td width="22%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].title" type="text"  class="input" id="commandGroup_title" validate="validate[required,length[1,20]]"/></td>
							<td width="11%" align="right" class="hui1" bgcolor="#e5e5e5">命令组KEY：</td>
							<td width="22%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].cmdKey" type="text"  class="input" id="commandGroup_cmdKey" validate="validate[required,length[1,20]]"/></td>
							<td width="12%" align="left" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="addbtn2"><img src="/images/erji1_17.jpg" width="88" height="23" /></a></td>
              				<td width="23%" align="right" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="delete"><img src="/images/3.jpg" width="120" height="28" /></a></td>
						  </tr>
						  <tr class="paixu2 cha tempRow2">
							<td align="right" class="hui1">控制名称：</td>
							<td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].title" type="text"  class="input" id="Command_title" validate="validate[required,length[1,20]]"/></td>
							<td align="right" class="hui1">控制字符串：</td>
							<td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].cmdStr" type="text"  class="input" id="Command_cmdStr" validate="validate[required,length[1,20]]"/></td>
                            <td align="left" valign="middle" class="hui1"> <img src="/images/erji1_10.jpg" alt="" style="vertical-align:middle"/> &nbsp;<a href="javascript:void(0)" class="delbtn2">删除</a></td>
                            <td align="left" valign="middle" class="hui1">&nbsp;</td>
                          </tr>
		   </table>
		 </div>
		</div>   
</div>
</body>
</html>
