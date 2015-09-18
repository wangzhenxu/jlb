<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
function addproduct(){	
$("#product").submit();
}
</script>
</head>

<body>
<form id="product"  action="/product/management/add.action" method="post">
 <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 产品管理 &gt; <strong>增加产品 </strong></div>
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
           <option value=${class.pcId}>${class.name}</option>  
           </#list>
          </select>
          </td>
         <td width="21%" align="right" class="hui1">&nbsp;</td>
         <td colspan="2" rowspan="9" valign="top" class="hui1"><table width="100%" border="0">
           <tr>
             <td width="22%" align="right">系统图片：</td>
             <td width="33%">
             <input type="radio" name="product.picUrl" id="radio3" value="/images/cgq.jpg"  style=" vertical-align:middle"  checked="true"/>
             <span class="hui"> 版本1</span>
             </td>
             <td width="45%">
             <input type="radio" name="product.picUrl" id="radio4" value="/images/cgq1.jpg"  style=" vertical-align:middle"/>
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
         <td align="right" class="hui1"><span class="red">*</span> 产品ID：</td>
         <td align="left" valign="middle"><input name="product.snPrefix" id="product_snPrefix" type="text"  class="inputa"   validate="validate[required,custom[eightCha]]"/></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品名称：</td>
         <td align="left" valign="middle"><input name="product.name" id="product_name" type="text"  class="inputa" validate="validate[required,length[4,20]]"/></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 提供商：</td>
         <td align="left" valign="middle"><input name="product.customerName"  id="product_company"   type="text"  class="inputa" validate="validate[required,length[4,40]]"/></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 标签TAGS：</td>
         <td align="left" valign="middle"><textarea name="tag.tagWord" id="textarea" cols="45" rows="5" class="texta"></textarea></td>
         <td align="left" valign="middle" class="lan1">例如：温度，湿度，红外监控等可以逗号、空格、回车的形式分隔开。</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品描述：</td>
         <td align="left" valign="middle"><textarea name="product.description" id="textarea" cols="45" rows="5" class="texta"></textarea></td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品KEY：</td>
         <td align="left" valign="middle"><input type="radio" name="product.hasKey" id="radio" value="1"  style=" vertical-align:middle"/>
          <span class="hui">有</span>&nbsp;&nbsp;
          <input type="radio" name="product.hasKey" id="radio2" value="0"  style=" vertical-align:middle" checked="true"/> 
          <span class="hui"> 无</span>
          </td>
         <td align="right" class="hui1">&nbsp;</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品类型：</td>
         <td align="left" valign="middle">
         <input type="radio" name="product.productType" id="radio"  value="1"  style=" vertical-align:middle" checked="true"/>
          <span class="hui">网关</span>&nbsp;&nbsp;
          <input type="radio" name="product.productType" id="radio2" value="2"  style=" vertical-align:middle"/> 
          <span class="hui"> 中间件</span>
           <input type="radio"name="product.productType" id="radio2" value="3"  style=" vertical-align:middle"/> 
          <span class="hui"> 节点</span>
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
     <div class="basic">
	 <div class="basic01">产品编辑</div>
	</div>
	 <div class="xuxian">
      <div class="title">
     <div class="title1_1"><strong>产品属性编辑</strong></div>
    </div>
      <div class="nature">
       <div class="form2">
        <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse"  name="pro_attr">
         <tr class="hui1">
			<td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">属性KEY</td>
			<td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">显示名称</td>
			<td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">单位</td>
			<td width="12%" align="center" valign="middle" background="/images/erji_22.jpg">符号</td>
			<td width="11%" align="center" valign="middle" background="/images/erji_22.jpg">选择展示</td>
			<td width="16%" align="center" valign="middle" background="/images/erji_22.jpg">展示主属性</td>
			<td width="19%" align="center" valign="middle" background="/images/erji_22.jpg"><a href="javascript:void(0)" class="addbtn1"><img src="/images/1.jpg" /></a></td>
	     </tr>
		 <tr class="hui1">
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].attrKey" type="text"  class="input2" id="x_10" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].title" type="text"  class="input2" id="x_11" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].unit" type="text"  class="input2" id="x_12" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].symbol" type="text"  class="input2" id="x_13" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="product.attributeList[#].isShow" type="checkbox" id="checkbox"   value="1"/> </td>
			 <td align="center" bgcolor="#FFFFFF"><input type="radio" name="product.attributeList[#].isChief" id="radio5" value="1" checked="true" /></td>
			 <td align="center" bgcolor="#FFFFFF" class="hui1"><a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" border="0" style="vertical-align:middle"/></a>&nbsp; <a href="javascript:void(0)" class="delbtn1">删除</a></td>
         </tr>
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
         <div class="control">
<!--         <div class="control1"><img src="/images/ico_x.gif" /></div>-->
          <div class="control2">
            <table width="100%" border="0"  class="paixu1" id="order1">
              <tr>
                <td width="10%" align="right" bgcolor="#e5e5e5" class="hui1">命令组名称：</td>
                <td width="22%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].title" type="text"   class="input" id="h_01"  validate="validate[required,length[1,20]]"/></td>
                <td width="11%" align="right" bgcolor="#e5e5e5" class="hui1">命令组KEY：</td>
                <td width="22%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].cmdKey" type="text"   class="input" id="h_02" validate="validate[required,length[1,20]]"/></td>
                <td width="12%" align="left" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="addbtn2"><img src="/images/erji1_17.jpg" width="88" height="23" /></a></td>
                <td width="23%" align="right" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="delete"><img src="/images/3.jpg" width="120" height="28" /></a></td>
              </tr>
              <tr class="cha paixu2">
                <td align="right" class="hui1">控制名称：</td>
                <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].title" type="text"  class="input" id="h_03" validate="validate[required,length[1,20]]"/></td>
                <td align="right" class="hui1">控制字符串：</td>
                <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].cmdStr" type="text"  class="input" id="h_04" validate="validate[required,length[1,20]]"/></td>
                <td align="left" valign="middle" class="hui1"><img src="/images/erji1_10.jpg" alt="" style="vertical-align:middle"/> &nbsp;<a href="javascript:void(0)" class="delbtn2">删除</a></td>
                <td align="left" valign="middle" class="hui1">&nbsp;</td>
              </tr>
            </table>
          </div>
        </div>
        </div>
       </div>
      </div>
	 </div>
	</div> <!--产品有无key控制-->
    </div>
    <div class="anniu"><a href="javascript:addproduct()"><img src="/images/erji1_19.jpg" width="101" height="29" class="sub"/></a></div>
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
