<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-产品管理-增加产品</title>
<script src="/js/addp.js"></script>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine.pack.js"></script>
<script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine-cn.js"></script>
<link href="http://www.loiot.com/c/validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<#include "../include/bootstrap.ftl"/>
<script LANGUAGE="javascript">
$(document).ready(function(){
   $("#Command").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
     });
function addCommand(addType){	
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

$("#actionType").val(addType);
$("#Command").submit();
}


$(function(){
		$(".selAttr").click(function(){
				var temp=$(this).closest(".modal").find("input:radio:checked").val();
			   $(".temp").find(".paId").val(temp);
			   var t=$(this).closest(".modal").find("input:radio:checked").parent().next().text();
			   if($(this).closest(".modal").find("input:radio:checked").length){
			   $(".ab").find("a").remove();
			    $(".ab").append(t+"<a href='javascript:void(0)' onclick='remove(this)' class='remAttr'>"+"[取消关联]"+"</a>");
			    $(".remAttr").parents("table").find(".connect").removeClass("ab");
			    $(".remAttr").parents("table").removeClass("temp");
			    }
		})
})

function addKey(t){
		   $(t).parents("table").addClass("temp");
		   $(t).parents("table").find(".connect").addClass("ab");
			$(".xin1").modal().css({
			width:"432px",
			'margin-top': function () {
		        return -($(this).height()/2)},
		    'margin-left': function () {
		        return -($(this).width()/2);
		    }
		});
}

function remove(t){
 $(t).parent().parent().find(".paId").val("");
 $(t).parent().addClass("temp");
 $(t).parent().text("")
 $(".temp").append("<a href='javascript:void(0)' class='Attribute' onclick='addKey(this)'>"+"[点击从属性Key中选择]"+"</a>");
 $(".temp").removeClass("temp");
}
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

 <form id="Command"  action="/product/management/AddCommand.action" method="post" class="amend">
     <input name="product.productId" type="hidden"  class="input" value="${productId}"/>
       <input id="hz0" type="hidden" name="product.productPanel.ppId" value="<#if (panel.ppId)??>${panel.ppId}</#if>"/>
        <input name="product.productPanel.isDefault" type="hidden" value="0"/>
     <input name="actionType" id="actionType" type="hidden"  class="input" value="2"/>
       <div class="form2">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="hui1">
			<td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="12%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="11%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="20%" align="center" valign="middle" background="/images/erji_22.jpg">&nbsp;</td>
			<td width="15%" align="center" valign="middle" background="/images/erji_22.jpg"><a href="javascript:void(0)" class="addorders"><img src="/images/2.jpg" width="120" height="28" /></a></td>
	     </tr>
        </table>
        <div class="zh  add2">
         <#if CommandGroups?exists&&(CommandGroups?size>0)>
         <div class="control">
         <!--<div class="control1"><img src="/images/ico_x.gif" /></div>-->
          <div class="control2">
           <#list CommandGroups as CommandGroup>
            <table width="100%" border="0"  class="paixu1" id="order1">
              <tr>
                <td width="14%" align="right" bgcolor="#e5e5e5" class="hui1">命令组名称：<input id="hz0" type="hidden"  name="product.commandGroupList[#].pcgId" value="${CommandGroup.pcgId}"/></td>
                <td width="15%" align="left" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].title" type="text"  id="id_title" class="input" value="${CommandGroup.title!""}" validate="validate[required,length[1,20]]"/> </td>
                <td width="15%" align="right" bgcolor="#e5e5e5" class="hui1">命令组KEY：</td>
                <td width="15%" align="left" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].cmdKey" type="text" id="id_cmdKey" class="input" value="${CommandGroup.cmdKey!""}" validate="validate[required,length[1,20]]"/>
                <input name="product.commandGroupList[#].paId" type="hidden" id="paId" class="input paId" value="${CommandGroup.paId!""}"/>
                </td>
                <td width="19%" align="left" bgcolor="#e5e5e5" class="connect">
                <#if CommandGroup.productAttribute??>
                  ${CommandGroup.productAttribute.title!""}
                  &nbsp;${CommandGroup.productAttribute.unit!""}
                 	<a href="javascript:void(0)" onclick="remove(this)">[取消关联]</a>
                <#else>
                 <a href="javascript:void(0)" class="Attribute" onclick="addKey(this)">[点击从属性Key中选择]</a>
                </#if>
                </td>
                <td width="11%" align="left" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="addbtn2"><img src="/images/erji1_17.jpg" width="88" height="23" /></a></td>
                <td width="11%" align="right" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="delete"><img src="/images/3.jpg" width="120" height="28" /></a></td>
              </tr>
              <#list CommandGroup.productCommandList as Command>
              <tr class="cha paixu2">
                <td align="right" class="hui1">控制名称：<input id="hz0"  type="hidden" name="product.commandGroupList[#].productCommandList[&].pcId" value="${Command.pcId}"/></td>
                <td align="left" valign="middle"><input name="product.commandGroupList[#].productCommandList[&].title" type="text"  class="input" id="t_1" value="${Command.title!""}" validate="validate[required,length[1,20]]"/></td>
                <td align="right" class="hui1">控制字符串：</td>
                <td align="left" valign="middle"><input name="product.commandGroupList[#].productCommandList[&].cmdStr" type="text"  class="input" id="t_2" value="${Command.cmdStr!""}" validate="validate[required,length[1,20]]"/></td>
                <td align="left" valign="middle" class="hui1"><img src="/images/erji1_10.jpg" alt="" style="vertical-align:middle"/> &nbsp;<a href="javascript:void(0)" class="delbtn2">删除</a></td>
                <td align="left" valign="middle" class="hui1">&nbsp;</td>
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
       <div class="baocun"><a  href="javascript:void(0)" onclick="subCommand(this)"><img src="/images/bjwj03.jpg" width="62" height="23" class="sub" /></a> &nbsp;<a href="javascript:void(0)" onclick="Commandcal(${productId})"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a></div>
     </form>
   
   
   
<div style="display:none">
		   <table width="100%" border="0" class="orders">
						  <tr>
							<td width="14%" align="right" bgcolor="#e5e5e5" class="hui1">命令组名称：</td>
							<td width="15%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].title" type="text"  class="input" id="commandGroup_title" validate="validate[required,length[1,20]]"/></td>
							<td width="15%" align="right" class="hui1" bgcolor="#e5e5e5">命令组KEY：</td>
							<td width="15%" valign="middle" bgcolor="#e5e5e5"><input name="product.commandGroupList[#].cmdKey" type="text"  class="input" id="commandGroup_cmdKey" validate="validate[required,length[1,20]]"/>
							<input name="product.commandGroupList[#].paId" type="hidden" id="paId" class="input paId" value=""/></td>
							<td width="19%" align="left" bgcolor="#e5e5e5" class="connect"><a href="javascript:void(0)"  onclick='addKey(this)'>[点击从属性Key中选择]</a></td>
							<td width="11%" align="left" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="addbtn2"><img src="/images/erji1_17.jpg" width="88" height="23" /></a></td>
              				<td width="11%" align="right" bgcolor="#e5e5e5"><a href="javascript:void(0)" class="delete"><img src="/images/3.jpg" width="120" height="28" /></a></td>
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


 <div class="modal hide fade xin1">
  <div class="xin1_1">
   <div class="whitea">
     <p>选择属性Key</p>
   </div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
     <table width="100%" border="0">
      <#if attributes?exists&&(attributes?size>0)>
      <#list attributes as attribute>
      <tr>
        <td align="right" class="hui1"><input type="radio" name="paId" id="radio" value="${attribute.paId}"/></td>
        <td align="left" valign="middle" class="hui">${attribute.title}   ${attribute.unit}  </td>
      </tr>
       </#list>
       </#if>
     </table>
    </div>
   </div>
   <div class="caidan2">&nbsp;<a href="#"><img src="/images/qr.jpg" width="62" height="23" data-dismiss="modal" class="selAttr"/></a></div>
  </div>
 </div>
</body>
</html>
