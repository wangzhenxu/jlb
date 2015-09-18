<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-开发者管理-应用查看</title>
<#include "../include/bootstrap.ftl"/>
<script type="text/javascript" src="http://www.loiot.com/c/loiot.core.min.js"></script>
<script type="text/javascript" src="/js/app/ajaxfileupload.js"></script>
<script type="text/javascript" src="/js/app/appIamge.js"></script>
<script type="text/javascript" src="http://www.loiot.com/c/validation/jquery.validationEngine.js"></script>
<script type="text/javascript" src="http://www.loiot.com/c/validation/jquery.validationEngine.min.js"></script>
<link href="http://www.loiot.com/c/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<style>
/*file样式*/
#preview_fake{ /* 该对象用户在IE下显示预览图片 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);   
}   
#preview_size_fake{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);     
    visibility:hidden;   
}   
#preview{ /* 该对象用户在FF下显示预览图片 */   
    width:128px;   
    height:128px;   
}   
#preview_fake1{ /* 该对象用户在IE下显示预览图片 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);   
}   
#preview_size_fake1{ /* 该对象只用来在IE下获得图片的原始尺寸，无其它用途 */   
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);     
    visibility:hidden;   
}   
#preview1{ /* 该对象用户在FF下显示预览图片 */   
    width:64px;   
    height:64px;   
} 
</style>
</head>
<body>
   <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">应用上线</a> &gt; <strong>修改应用上线</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">应用修改</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="177" align="right" class="hui1">应用发布状态：</td>
           <td width="913" align="left" valign="middle" class="org"><strong>${DeployStatus.PUBLISHING.getTitle()}</strong></td>
           </tr>
         <tr>
           <td align="right" valign="top" class="hui1">上线发布时间：</td>
           <td class="hui">${app.lastTime?string("yyyy-MM-dd HH:mm:ss")}</td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1">操作日志：</td>
           <td class="hui"><a href="javascript:popLog(${app.appId});">查看</a></td>
         </tr>
       </table>
      </div>
     </div>
     <div class="basic">
	 <div class="basic01">应用信息</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <form action="/app/updateapp.action" method="post" enctype="multipart/form-data" id="editapp">  
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="175" align="right" class="hui1">应用分类：</td>
           <td colspan="2" align="left" valign="middle" class="hui">
           <select name="app.atiId" id="app.atiId" class="inputa">
             <#list appTypes as appType>
             <option value="${appType.atiId}" <#if appType.atiId=app.atiId>selected="selected"</#if>>${appType.typeName}</option>
            </#list>
           </select></td>
           </tr>
         <tr>
           <td align="right" valign="top" class="hui1">应用名称：</td>
           <td colspan="2" align="left" valign="middle" class="hui"><p>
             <input type="hidden" value="${app.appId}" name="app.appId"/>
           	 <input type="hidden" value="${app.atiId}" name="app.atiId"/>
           	 <input type="hidden" value="${app.auditStatus}" name="app.auditStatus"/>
          	 <input type="hidden" value="${app.deployStatus}" name="app.deployStatus"/>
           	 <input type="hidden" value="${app.platformType}" name="app.platformType"/>
           	 <input type="hidden" value="${app.platformStr!''}" name="app.platformStr"/>   
           	 <input type="hidden" value="${app.userCount}" name="app.userCount"/>  
           	 <input type="hidden" value="${app.sandboxStatus}" name="app.sandboxStatus"/>
           	 <input type="hidden" value="${app.recommendWeight}" name="app.recommendWeight"/>
           	 <input type="hidden" value="${app.completeStatus}" name="app.completeStatus"/>      	 
             <input type="text" value="${app.appName}" name="app.appName" id="appName" onblur="validateAppName();"  onkeyup="validateAppName();"/>
           </p></td>
           </tr>
         <tr>
           <td align="right" valign="top" class="hui1">应用介绍：</td>
           <td colspan="2" align="left" valign="middle" class="hui">
             <textarea name="app.description" cols="45" rows="5" class="text1 validate[required] validate[maxSize[1000]]" id="textarea">${app.description}</textarea></td>
           </tr>
         <tr>
           <td align="right" class="hui1">应用类型：</td>
           <td colspan="2" align="left" valign="middle" class="hui">
			<#switch app.platformType>
         	<#case 0>
         		站内应用
         		<#break>
         	<#case 1>
         		客户端-桌面&nbsp&nbsp${app.platformStr?default('')}	
         		<#break>
         	<#default>
         		客户端-手机&nbsp&nbsp${app.platformStr?default('')}	
         	</#switch>
			</td>
           </tr>
         <tr>
           <td align="right" valign="top" class="hui1">标签TAGS：</td>
           <td colspan="2" align="left" valign="middle" class="hui"><p>
             <input name="tag.tagWord" type="text"  class="inputa" id="tag" onblur="validateAppTag()" onkeyup="validateAppTag();" value="<#list tagsList as tag>${tag!""}<#if tag_has_next>，</#if></#list>"></input>
           </p></td>
           </tr>
         <tr>
           <td align="right" class="hui1">应用地址：</td>
           <td colspan="2" align="left" valign="middle" class="hui">
            <input type="text" name="app.appUrl" value="${app.appUrl!""}" id="appurl" class="inputa validate[required,custom[url]"/>
		   </td>
           </tr>
         <tr>
           <td align="right" class="hui1">Iframe高度：</td>
           <td colspan="2" align="left" valign="middle" class="hui">
           
           <#if app.iframeHeight!=0>
            <input type="text" name="app.iframeHeight" value="${(app.iframeHeight)?c}" id="iframeHeight" class="validate[min[600]] validate[max[5000]] validate[required,custom[integer]"/>px 
            <input type="checkbox" name="app.iframeHeight" id="iframeHeightCheckBox" <#if app.iframeHeight=0>checked="true"</#if>  value="0" onclick="lockInput(${(app.iframeHeight)?c})"/>
        	    高度自适应 
       	   （现支持600像素-5000像素）
        </div>
        <#else>
          <input type="text" name="app.iframeHeight" disabled="disabled"  value=""  id="iframeHeight" class="validate[min[600]] validate[max[5000]] validate[required,custom[integer]"/>px 
            <input type="checkbox" name="app.iframeHeight" value="0" id="iframeHeightCheckBox" <#if app.iframeHeight=0>checked="true"</#if> onclick="lockInput(${(app.iframeHeight)?c})" />
            	高度自适应 （现支持600像素-5000像素）
        </div>
        </#if>
             
             
             </td>
           </tr>
         <tr>
           <td align="right" class="hui1">数据公开类型：</td>
           <td colspan="2" align="left" valign="middle" class="hui">
		<#if app.publicType=0>
  	        <input type="radio" name="app.publicType" value="1"/>
				公开 （是否公开用户的数据） 
            <input type="radio" name="app.publicType" value="0" checked/>
           		 不公开 
          <#else>
          <input type="radio" name="app.publicType" value="1" checked/>
           	 	公开（是否公开用户的数据） 
            <input type="radio" name="app.publicType" value="0"/>
            	不公开 
          </#if>
			</td>
           </tr>
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品大图片：</td>
           <td width="332" valign="top" class="hui"><div class="uploadlay">
             <!--
             <div id="idPicFile1"><input type="file" name="bpic" id="bpic" value="${app.largeIcon!""}" onchange="onUploadImgChange(this)"/></div>
             -->
             <div id="ui-upload-filepath">
               	<input type="text" id="ui-upload-filepathtxt" name="bpicPath" class="filepathtxt" />
             </div>
             <div id="ui-upload-holder">
               	<div id="ui-upload-txt">浏览
               <input type="file" class="ui-upload-input" id="bpic" name="bpic" onchange="onUploadImgChange(this)"/>
               	</div>
               <!--
               -->
             </div>
           </div></td>
           <td width="585" valign="top" class="hui">图片类型：JPG、GIF、PNG，文件大小：1M以内。</td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td><div class="liulan">
	           <div id="preview_wrapper"> 
		        	<div id="preview_fake"> 
		            	<img id="preview" src="${ApplicationConst.APP_UPLOAD_PIC_URL}${app.largeIcon!''}?temp=${RandomUtil.nextString(10)}" width="128" height="128"  onload="onPreviewLoad(this)"/> 
		        	</div> 
	    		</div> 
           		</div>
	    		<img id="preview_size_fake"/>
             <div class="chicun">128*128</div></td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 产品小图片：</td>
           <td valign="top"><div class="uploadlay">
			<!--
             <div id="idPicFile">
		       <input type="file" name="spic" id="spic" onchange="onUploadImgChange1(this)" value="${app.smallIcon!""}"/>
		     </div>
            -->
             <div id="ui-upload-filepath">
               <input type="text" id="ui-upload-filepathtxt" name="spicPath" class="filepathtxt" />
             </div>
             <div id="ui-upload-holder">
               <div id="ui-upload-txt">浏览</div>
               <input type="file" class="ui-upload-input" id="spic" name="spic" onchange="onUploadImgChange1(this)"/>
             </div>
           </div></td>
           <td valign="top"><span class="hui">图片类型：JPG、GIF、PNG，文件大小：1M以内。</span></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td><div class="liulan1">
	           <div id="preview_wrapper1">
		        	<div id="preview_fake1"> 
		            	<img id="preview1" src="${ApplicationConst.APP_UPLOAD_PIC_URL}${app.smallIcon!''}?temp=${RandomUtil.nextString(10)}" width="64" height="64"  onload="onPreviewLoad1(this)"/> 
		        	</div> 
	    		</div> 
	           </div>
	    		<img id="preview_size_fake1"/>
             <div class="chicun1">64*64</div></td>
           <td>&nbsp;</td>
         </tr>
         </table>
        </form>
      </div>
     </div>  
    </div>
    <div class="anniu">&nbsp;<a href="javascript:void(0);" onclick="sub();"><img src="/images/erji1_19.jpg" width="101" height="29" /></a></div>
   </div>
  </div>
 </div>

  <!-- 操作日志弹窗开始 -->
 <div class="xin1 modal hide fade log" id="logDiv">

<script type="text/javascript">
String.prototype.trim = function () {
		return this .replace(/^\s\s*/, '' ).replace(/\s\s*$/, '' );
}
var subNameFlag=true;//应用名称验证通过标志
var subTagFlag=true;//标签验证通过标志
		$(document).ready(function(){
		   $("#editapp").validationEngine({scroll:false,validationEventTrigger:"keyup blur"}); 
		});
//验证应用名称
function validateAppName(){
		name = $("#appName").val();     
        var tag=3;//标签数量                                                            
		var reg = /^\s+|\s+$/g;
		var twname = name.replace(reg,"");//去除两边空值
		//验证是否为空
		if(name.trim()==""){
		    $(".appNameformError").remove();
			$("#appName").validationEngine("showPrompt"," 请填写应用名称","error");//为空弹出错误提示
			subNameFlag=false;//提交标志位置否
			return false;//中断
		}else{
			var len = escape(twname).replace(/%u\w{2}/g,"").length;//得到字符长度，一个汉字长度为2
			//验证长度
			if(len>20){
								$(".appNameformError").remove();
								$("#appName").validationEngine("showPrompt","不超过10个汉字或20个字母","error");//为空弹出错误提示
								subNameFlag=false;//提交标志位置否
								return false;//中断
							}else{
										$(".appNameformError").remove();
										subNameFlag=true;
							}
		}
}
//验证应用标签
function validateAppTag(){
        name = $("#tag").val();     
        var tag=3;//标签数量                                                            
		var reg = /^\s+|\s+$/g;
		var twname = name.replace(reg,"");//去除两边空值
		var regg = /\s+?|[,，-]/g;
		var midname = twname.replace(regg," ");//将中间特定连接符转为空
		var arr = midname.split(" "); //按空值将字符串转换为数组
		var length=arr.length;//数组长度
		//验证是否为空
		if(name.trim()==""){
		    $(".tagformError").remove();
			$("#tag").validationEngine("showPrompt"," 请填写标签","error");//为空弹出错误提示
			subTagFlag=false;//提交标志位置否
			return false;//中断
		}else{
		if(length >tag){
		     $(".tagformError").remove();
		     $("#tag").validationEngine("showPrompt"," 请用空格或中英文逗号分隔标签，最多三个，例如1，2，3或1 2 3","error");//超出3个弹出错误提示
		     subTagFlag=false;//提交标志置否
		   }else{
		   				$(".tagformError").remove();
		   				//轮询标签
				   		for(i=0;i<length;i++){
				   		       //验证长度
								var len = escape(arr[i]).replace(/%u\w{2}/g,"").length;
								if(len>10){
																	$(".tagformError").remove();
																	$("#tag").validationEngine("showPrompt","每个标签不超过5个汉字或10个字符","error");//为空弹出错误提示
																	subTagFlag=false;//提交标志位置否
																	return false;//中断
												}else{
																	$(".tagformError").remove();
																	subTagFlag=true;
														}
					 	}
		 	}
	 	}
}

//提交函数
function sub(){
     validateAppName(); //验证名称
     validateAppTag();//验证标签
	 if(subNameFlag&&subTagFlag&&samllPicbool&&bigPicbool){
	  					$("#editapp").submit();
	 };
	 if(!samllPicbool){
	    $("#spic").validationEngine("showPrompt"," 请上传大小在1M以内的图片","error");//为空弹出错误提示
	 }
	 if(!bigPicbool){
	    $("#bpic").validationEngine("showPrompt"," 请上传大小在1M以内的图片","error");//为空弹出错误提示
	 }
}
//弹出日志框
function popLog(appId) {
	$.get("/app/logCheck.action",{"appId":appId},function(data){
		$("#logDiv").html(data);
    });
	    $(".log").modal().css({
	                'width':'798px',
                    'margin-top': '-150px',	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
}


//高度自适应函数，选中不可填高度
function lockInput(iframeHeight){	
	if($("#iframeHeightCheckBox").attr("checked")=="checked"){
	    $(".iframeHeightformError").remove();
        $("#iframeHeight").attr("disabled","disabled");
        $("#iframeHeight").css("background-color","#eee");
   }else{
   		$("#iframeHeight").removeAttr("disabled");
   		$("#iframeHeight").attr("value",iframeHeight);
   		$("#iframeHeight").css("background-color","#ffffff");
   }
}
$(function(){
if('${app.smallIcon!""}'!==""){
	samllPicbool=true;
};
if('${app.largeIcon!""}'!==""){
	bigPicbool=true;
};
})

</script>