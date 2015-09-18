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
function addproduct(){	
$("#product").submit();
}
</script>
</head>
<body>
<form id="product"  action="/product/management/add.action" method="post">
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt;产品管理 &gt; <strong>增加产品 </strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">基本信息</div>
	</div>
     <div class="query1">
     <table width="800" border="0">
       <tr>
        <td width="10%" align="right" class="hui1">产品ID：</td>
        <td width="24%" align="left" valign="middle"><input name="product.snPrefix" id="product_snPrefix" type="text"  class="input"   validate="validate[required,custom[eightCha]]"/></td>
        <td width="11%" align="right" class="hui1">产品名称：</td>
        <td width="23%" align="left" valign="middle"><input name="product.name" id="product_name" type="text"  class="input" validate="validate[required,length[4,20]]"/></td>
        <td width="32%" align="left" valign="middle">&nbsp;</td>
       </tr>
       <tr>
        <td align="right" class="hui1">提供商：</td>
        <td colspan="4" align="left" valign="middle"><input name="product.company"  id="product_company"   type="text"  class="input1" validate="validate[required,length[4,40]]"/></td>
       </tr>
       <tr>
        <td align="right" class="hui1">产品KEY：</td>
        <td align="left" valign="middle"><input type="radio" name="product.hasKey" id="radio" value="1"  style=" vertical-align:middle"/>
          <span class="hui">
            	有</span>&nbsp;&nbsp;
          <input type="radio" name="product.hasKey" id="radio2" value="0"  style=" vertical-align:middle" checked="true"/> 
          <span class="hui"> 无</span>
        </td>
        <td align="right" class="hui1">产品分类：</td>
        <td align="left" valign="middle">
          <select name="product.pcId" id="select" class="input">
           <#list classes as class>
           <option value=${class.pcId}>${class.name}</option>  
           </#list>
          </select></td>
       </tr>
        <tr>
        <td align="right" class="hui1">产品类型：</td>
        <td align="left" valign="middle" colspan="3">
          <input type="radio" name="product.productType" id="radio"  value="1"  style=" vertical-align:middle" checked="true"/>
          <span class="hui">
            	网关</span>&nbsp;&nbsp;
          <input type="radio" name="product.productType" id="radio2" value="2"  style=" vertical-align:middle"/> 
          <span class="hui"> 中间件</span>
           <input type="radio"name="product.productType" id="radio2" value="3"  style=" vertical-align:middle"/> 
          <span class="hui"> 节点</span>
        </td>
       </tr>
       <tr>
        <td align="right" valign="top" class="hui1">产品描述：</td>
        <td align="left" valign="top"><textarea name="product.description" id="textarea" cols="45" rows="5" class="text"></textarea></td>
        <td align="right" valign="top" class="hui1">标签TAGS：</td>
        <td align="left" valign="top"><textarea name="tag.tagWord" id="textarea" cols="45" rows="5" class="text"></textarea></td>
        <td align="left" valign="middle" class="lan">例如：温度，湿度，红外监控等可以逗号、空格、回车的形式分隔开。</td>
        </tr>
      <tr>
        <td align="right" class="hui1">系统图片：</td>
        <td align="left" valign="middle"><input type="radio" name="product.picUrl" id="radio3" value="/images/cgq.jpg"  style=" vertical-align:middle"  checked="true"/>
          <span class="hui"> 版本1</span>
          </td>
        <td colspan="2" align="left" class="hui1"><input type="radio" name="product.picUrl" id="radio4" value="/images/cgq1.jpg"  style=" vertical-align:middle"/>
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
<div id="key_ctrl">
     <div class="basic">
	 <div class="basic01">产品编辑</div>
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
       <tr class="hui1" >
        <td align="center"><input name="product.attributeList[#].attrKey" type="text"  class="input2" id="x_10" validate="validate[required,length[1,20]]"/></td>
        <td align="center"><input name="product.attributeList[#].title" type="text"  class="input2" id="x_11" validate="validate[required,length[1,20]]"/></td>
        <td align="center"><input name="product.attributeList[#].unit" type="text"  class="input2" id="x_12" validate="validate[required,length[1,20]]"/></td>
        <td align="center"><input name="product.attributeList[#].symbol" type="text"  class="input2" id="x_13" validate="validate[required,length[1,20]]"/></td>
        <td align="center"><input name="product.attributeList[#].isShow" type="checkbox" id="checkbox"   value="1"/>
        </td>
        <td align="center"><input name="product.attributeList[#].isChief" type="radio" id="radio5"  value="1" checked="true"/>
        </td>
        <td align="center" class="hui1">&nbsp;<a href="javascript:void(0)" class="delbtn1"><img src="/images/erji1_10.jpg" style="vertical-align:middle"/>删除</a></td>
       </tr>
     </table>
     </div>
	 <!--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
    </div>
     <div class="title" align="left"><strong>控制命令</strong></div>
     <div class="form2">
     <div class="order">
      <div class="add1"><a href="javascript:void(0)"><img align="left" src="/images/erji1_16.jpg" class="addorders"/></a></div>
      <div class="add2">
       <table width="100%" border="0" class="paixu1" id="order0">
          <tr id="o1">
            <td width="10%" align="right" class="hui1">命令组名称：</td>
            <td width="18%" valign="middle"><input name="product.commandGroupList[#].title" type="text"   class="input" id="h_01"  validate="validate[required,length[1,20]]"/></td>
            <td width="10%" align="right" class="hui1">命令组KEY：</td>
            <td width="18%" valign="middle"><input name="product.commandGroupList[#].cmdKey" type="text"   class="input" id="h_02" validate="validate[required,length[1,20]]"/></td>
			 <td width="10%" align="left"><a href="javascript:void(0)" class="addbtn2"><img src="/images/2.jpg" alt="" /></a></td>
            <td width="17%">&nbsp;</td>
            <td width="17%">&nbsp;</td>
          </tr>
          <tr class="cha paixu2" id="o2">
            <td align="right" class="hui1">控制名称：</td>
            <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].title" type="text"  class="input" id="h_03" validate="validate[required,length[1,20]]"/></td>
            <td align="right" class="hui1">控制字符串：</td>
            <td valign="middle"><input name="product.commandGroupList[#].productCommandList[&].cmdStr" type="text"  class="input" id="h_04" validate="validate[required,length[1,20]]"/></td>
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
     </div>
    </div>
    </div>
</div>
    <div class="anniu"><a href="javascript:addproduct()"><img src="/images/erji1_19.jpg" width="101" height="29"  class="sub"/></a></div>
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
</body>
</html>
