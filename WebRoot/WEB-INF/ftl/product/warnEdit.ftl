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
   $("#warn").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
     });
function subwarn(t){	
			 $(t).parents("form").find("input").trigger("blur");
			var i=$(t).parents("form").find(".error-field").length;
		    if(i<1){
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
									    $.post($("#warn").attr("action"),$("#warn").serialize(),function(data){
							  			 	$("#warni").html(data);
							   			});
								     }
				}
}
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
						
					
})
function delwarn(t){
								$(t).closest("tr").remove();
								temp=$(t).parent().parent().parent().find("[type=hidden]").attr("value");
								if(temp){
								$("#warn").append("<input name='delProductconditionId' type='hidden' value="+temp+">");
								}
}
</script>
</head>
<body>
    <form id="warn"  action="/product/management/saveWarn.action" method="post">
    <input name="product.productId" type="hidden"  class="input" value="${productId}"/>
     <input name="actionType" id="actionType" type="hidden"  class="input" value="2"/>
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
			   <select name="conditionList[#].paId" class="input2" id="select">
			    <#assign x=0/>
        		<#list attributes as attribute>
        		<#assign x=x+1/>
			     <option value="${attribute.paId}"<#if condition.paId=attribute.paId>selected="selected"  <#assign unit=attribute.unit/></#if>>${attribute.title}</option>
			    </#list>
			   </select></td>
			 <td align="center" bgcolor="#FFFFFF">${(unit)!""}</td>
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
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].value" type="text"  id="valueq" class="input2" value="${condition.value!0}" validate="validate[required,length[1,20],custom[onlyNumber]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].meetCount" type="text"  id="valuez" class="input2" value="${condition.meetCount!0}" validate="validate[required,length[1,20],custom[onlyNumber]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><a href="javascript:void(0)"><img src="/images/erji1_10.jpg" width="15" height="15" onclick="delwarn(this)"/></a></td>
			 </#if>
			 </tr>
		  </#list>
		 </#if>
        </table>
       </div>
       <div class="baojing">
         <table width="100%" cellspacing="0" cellpadding="0">
           <tr>
             <td width="12%" align="right" class="hui1">报警方式： 
             <input name="actionAlert.paaId" type="hidden"  class="input2 code" value="<#if (actionAlert.paaId)??>${actionAlert.paaId}</#if>"/></td>
             <td width="88%" class="hui">
             <input type="Radio" name="actionAlert.actionType" id="email"  value="2" 
             <#if (actionAlert.actionType)??>
             <#if actionAlert.actionType==2>
             checked="true"
             </#if>
             <#else>
             checked="true"
             </#if>
              style="vertical-align:middle"/>
               	 <label for="email">邮件通知 </label>
                 <input type="Radio" name="actionAlert.actionType" id="phone" value="1" <#if (actionAlert.actionType)??><#if actionAlert.actionType==1>checked="true"</#if></#if> style="vertical-align:middle"/>
                 <label for="phone"> 手机短信 </label>
                 <input type="Radio" name="actionAlert.actionType" id="zn" value="3" <#if (actionAlert.actionType)??><#if actionAlert.actionType==3>checked="true"</#if></#if> style="vertical-align:middle"/>
              	<label for="zn">站内短信</label></td>
           </tr>
           <tr>
             <td align="right" valign="top" class="hui1">编辑内容信息：</td>
             <td><textarea name="actionAlert.content" id="textarea" cols="45" rows="5" class="texta" validate="validate[optional,length[1,100]]">${(actionAlert.content)!""}</textarea>
               <p class="hui">（内容不超过100个字）</p></td>
           </tr>
         </table>
       </div>
   <div class="baocun"><a href="javascript:void(0);" onclick="subwarn(this);"><img src="/images/bjwj03.jpg" width="62" height="23" /></a> &nbsp;<a href="javascript:void(0);" onclick="warnCal(${productId});"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a></div>
   </form>
   
   
   <!-- 隐藏复制模板 -->
  <div style="display:none">
  <table>
     <tr class="hui1 tmp">
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
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].value" type="text"  class="input2" value="" id="warnvalue" validate="validate[required,length[1,20],custom[number]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><input name="conditionList[#].meetCount" type="text"  class="input2" value="" id="warnmeetCount" validate="validate[required,length[1,20],custom[onlyNumber]]"/></td>
			 <td align="center" bgcolor="#FFFFFF"><a href="javascript:void(0)"><img src="/images/erji1_10.jpg" width="15" height="15" onclick="delwarn(this)"/></a></td>
			 </#if>
	</tr>
  </table>
  </div> 
</body>
</html>
