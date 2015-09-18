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
function subwarn(){	

			$(".warn tr").each(function(i1,val){//产品属性排序：每行一样，每列递增
					i1--;
					$(this).find("input").each(function(i2,val){
						    var list = $(this).attr("name");
                            $(this).attr("name",list.replace(/#/, i1));
					});
			});
			$(".warn tr").each(function(i1,val){//产品属性排序：每行一样，每列递增
					i1--;
					$(this).find("select").each(function(i2,val){
						    var list = $(this).attr("name");
                            $(this).attr("name",list.replace(/#/, i1));
					});
			});
		var temp=new Array();
		var n=0;
		$(".warn").find(".nodeAttr").each(function(){
					temp.push($(this).val());
		})
		var length=$(".warn").find(".nodeAttr").length;
				for(i=0;i<length;i++){
								var f_val=temp[i];
							    j=i+1;
									     for(j;j<length;j++){
									     var s_val=temp[j];
									       if(f_val==s_val){
									       			n++;
									       }
				     }
		}
		 if(n>0){
		     alert("节点属性重复")
		     }else{
		     var tr_num=$(".warn tbody tr").size()
		     if(tr_num>1){
		     	$("#warn").submit();
		     }else{
		        $("#textarea").removeAttr("validate");
		        $("#warn").submit();
		     }
		     }
}
$(document).ready(function(){
   $("#warn").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
     });
</script>
<script  language="javascript">
$(function(){
//
						$(".nodeAttr").change(function(){
						       var i=0;
								var val1=$(this).val();
								$(this).closest("table").find(".nodeAttr").each(function(){
									var val3=$(this).val();
									if(val1==val3){
									   i++;
									}
								})
						
								if(i>1){
											  alert("节点属性重复")
											}else{
											
															$(this).find("option").each(function(){
															var val2=$(this).val();
															if(val1==val2){
															 $(this).parent().parent().next().text($(this).attr("class"))
															}
															})
											
											}
						
						})
						
						$(".del").click(function(){
								$(this).closest("tr").remove();
								temp=$(this).parent().parent().parent().find("[type=hidden]").attr("value");
								if(temp){
								$("#warn").append("<input name='delProductconditionId' type='hidden' value="+temp+">");
								}
						})
						
})

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
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">产品管理</a> &gt; <strong>增加产品 </strong></div>
    </div>
    <form id="warn"  action="/product/management/saveWarn.action" method="post">
    <div class="nav">
     <div class="basic">
	 <div class="basic01">报警设置 <input name="product.productId" type="hidden"  class="input" value="${productId}"/></div>
	</div>
     <div class="jiben"><img src="/images/liucheng4.png" width="570" height="60" /></div> 
	 <div class="xuxian">
      <div class="nature1">
       <div class="form2">
        <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse" class="warn">
         <tr class="hui1">
			<td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>节点名称</strong></td>
			<td width="17%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>节点属性</strong></td>
			<td width="16%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>单位</strong></td>
			<td width="14%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>条件</strong></td>
			<td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>请输入具体数值</strong></td>
			<td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>探测次数</strong></td>
			<td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><a href="javascript:void(0)"><img src="/images/jia.jpg" width="19" height="19" onclick="add()"/></a></td>
			</tr>
	   <#if conditions?exists&&(conditions?size>0)>
	   <#list conditions as condition>
		 <tr class="hui1">
		   <#if attributes?exists>
			 <td align="center" bgcolor="#FFFFFF" class="hui">${product.name}
			 <input name="conditionList[#].pcId" type="hidden"  class="input2 code" value="${condition.pcId}"/>
			 </td>
			 <td align="center" bgcolor="#FFFFFF"><label for="select"></label>
			   <select name="conditionList[#].paId" class="input2 nodeAttr" id="select">
			    <#assign x=0/>
        		<#list attributes as attribute>
        		<#assign x=x+1/>
			     <option value="${attribute.paId}"<#if condition.paId=attribute.paId>selected="selected"  <#assign unit=attribute.unit/></#if>>${attribute.title}</option>
			    </#list>
			   </select></td>
			 <td align="center" bgcolor="#FFFFFF">${unit}</td>
			 <td align="center" bgcolor="#FFFFFF"><select name="conditionList[#].operatorChar" class="input2" id="select3">
			   <option value="1" <#if condition.operatorChar=1>selected="selected"</#if>>&gt;</option>
			   <option value="2" <#if condition.operatorChar=2>selected="selected"</#if>>&gt;=</option>
			   <option value="3" <#if condition.operatorChar=3>selected="selected"</#if>>&lt;</option>
			   <option value="4" <#if condition.operatorChar=4>selected="selected"</#if>>&lt;=</option>
			   <option value="5" <#if condition.operatorChar=5>selected="selected"</#if> >==</option>
			   <option value="6" <#if condition.operatorChar=6>selected="selected"</#if>>新值</option>
			   <option value="7" <#if condition.operatorChar=7>selected="selected"</#if>>冻结</option>
			   <option value="8" <#if condition.operatorChar=8>selected="selected"</#if>>复活</option>
             </select></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].value" type="text" id="valuea" class="input2" value="${condition.value!0}" id="value"validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].meetCount" type="text" id="values"  class="input2" value="${condition.meetCount!0}" id="meetCount" validate="validate[required,length[1,20]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><a href="javascript:void(0)"><img src="/images/erji1_10.jpg" width="15" height="15" class="del"/></a></td>
			 </#if>
			 </tr>
		  </#list>
		 </#if>
		   
		
        </table>
       </div>
       <div class="baojing">
         <table width="100%" cellspacing="0" cellpadding="0">
           <tr>
             <td width="12%" align="right" class="hui1">报警方式： <input name="actionAlert.paaId" type="hidden"  class="input2 code" value="<#if (actionAlert.paaId)??>${actionAlert.paaId}</#if>"/></td>
             <td width="88%" class="hui">
             <input type="Radio" name="actionAlert.actionType" id="email"  value="2" 
             <#if (actionAlert.actionType)??>
             <#if actionAlert.actionType==2>checked="true"</#if>
             <#else>
             checked="true"
             </#if> style="vertical-align:middle"/>
               	 <label for="email">邮件通知 </label>
                 <input type="Radio" name="actionAlert.actionType" id="phone" value="1" <#if (actionAlert.actionType)??><#if actionAlert.actionType==1>checked="true"</#if></#if> style="vertical-align:middle"/>
                 <label for="phone"> 手机短信 </label>
                 <input type="Radio" name="actionAlert.actionType" id="zn" value="3" <#if (actionAlert.actionType)??><#if actionAlert.actionType==3>checked="true"</#if></#if> style="vertical-align:middle"/>
              	<label for="zn">站内短信</label></td>
           </tr>
           <tr>
             <td align="right" valign="top" class="hui1">编辑内容信息：</td>
             <td><textarea name="actionAlert.content" id="textarea" cols="45" rows="5" class="texta"  validate="validate[required,length[1,100]]">${(actionAlert.content)!""}</textarea>
               <p class="hui">（内容不超过100个字）</p></td>
           </tr>
         </table>
        
       </div>
      </div>
	 </div>
    </div>
    <div class="anniu"><a href="/product/management/toAddtCommand.action?productId=${productId}"><img src="/images/syb.jpg" width="102" height="30" /></a> &nbsp;<a href="javascript:void(0);" onclick="subwarn();"><img src="/images/erji1_19.jpg" width="101" height="29" /></a>&nbsp;</div>
   </form>
   </div>
   <!-- 隐藏复制模板 -->
  <div style="display:none">
  <table>
     <tr class="hui1 tmp">
        <#assign unit=""/>
		   <#if attributes?exists&&(attributes?size>0)>
			 <td align="center" bgcolor="#FFFFFF" class="hui">${product.name}</td>
			 <td align="center" bgcolor="#FFFFFF"><label for="select"></label>
			   <select name="conditionList[#].paId" class="input2 nodeAttr" id="select">
			    <#assign x=0/>
        		<#list attributes as attribute>
        		<#assign x=x+1/>
			     <option value="${attribute.paId}"  class="${attribute.unit!""}">${attribute.title}</option>
			     <#if x=1>
			      <#assign unit=attribute.unit/>
			     </#if>
			    </#list>
			   </select></td>
			 <td align="center" bgcolor="#FFFFFF" class="unit">${unit}</td>
			 <td align="center" bgcolor="#FFFFFF"><select name="conditionList[#].operatorChar" class="input2" id="select3">
			   <option value="1">&gt;</option>
			   <option value="2">&gt;=</option>
			   <option value="3">&lt;</option>
			   <option value="4">&lt;=</option>
			   <option value="5">==</option>
			   <option value="6">新值</option>
			   <option value="7">冻结</option>
			   <option value="8">复活</option>
             </select></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].value" type="text"  class="input2" value=""/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].meetCount" type="text"  class="input2" value=""/></td>
			 <td align="center" bgcolor="#FFFFFF"><a href="#"><img src="/images/erji1_10.jpg" width="15" height="15" class="del"/></a></td>
			 </#if>
	</tr>
  </table>
  </div> 
</body>
</html>
