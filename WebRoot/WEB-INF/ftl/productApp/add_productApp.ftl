<script>
	var samllPicbool=true;
	var isSubmit = true;
</script>
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
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
	<link href="/css/alert.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/js/viewUploadImg.js"></script>
	<script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>	
	<script type="text/javascript" src="http://www.loiot.com/c/loiot.core.min.js"></script>	

<!--[if IE 6]>
<script type="text/javascript" src="http://axiu.me/wp-content/themes/Summ/js/DD_belatedPNG.js" ></script>
 
<script type="text/javascript">
DD_belatedPNG.fix('.jiben');
</script>
<![endif]-->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">产品管理</a> &gt; 产品发布 &gt;<strong> 增加产品</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">产品发布</div>
	</div>
	<form action="/productApp/sub/add.action" method="post" id="addForm" enctype="multipart/form-data">
	  <input type="hidden" name="PDesc" id="PDesc" >
	  <input type="hidden" name="techPara" id="techPara" >
	  <input type="hidden" name="install" id="install" >
     <div class="query1">
       <table width="100%" border="0">
         <tbody><tr>
           <td class="red" colspan="3">* 号为必填项</td>
           </tr>
         <tr>
           <td width="139" align="right" class="hui1">产品库分类：</td>
           <td width="310" valign="middle" align="left">
           
           <select name="pacId" id="pacId" class="inputa">
            <#list catList as cat>
         		<option value="${cat.pacId!''}">${cat.name!''}</option>
         	</#list>
          </select>
           
           </td>
           <td width="599">&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1"><span class="red">*</span> 产品名称：</td>
           <td valign="middle" align="left"><input type="text" class="input validate[required] text-input" id="name" name="name"></td>
           <td>&nbsp;</td>
         </tr>
         
         <tr>
           <td align="right" class="hui1"><span class="red"></span> 产品价格：</td>
           <td valign="middle" align="left"><input type="text" class="input validate[custom[number]] text-input" id="price" name="price">&nbsp;元</td>
           <td>&nbsp;</td>
         </tr>
         
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 产品大图片：</td>
           <td valign="top">
           		 <input type="file" id="file1" name="file1" size="24"  onChange="preivew(this, document.getElementById('pic_path1'),'',200);">
           
           </td>
           <td class="hui" colspan="2">上传文件类型：JPG、GIF、PNG 文件大小：不超过50KB</td>
           </tr>
         
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 产品小图片：</td>
           <td valign="top">
            	 <input type="file" id="file2" name="file2" size="24"  onChange="preivew(this, document.getElementById('pic_path2'),'',200);">
           </td>
           <td class="hui">上传文件类型：JPG、GIF、PNG 文件大小：不超过50KB</td>
           </tr>
         
         <tr>
           <td valign="top" align="right" class="hui1"> 产品资料下载：</td>
           <td valign="top">
             <input type="file" id="file3" name="file3" size="24">
           </td>
           <td><span class="hui">文件大小不超过2MB 。</span></td>
         </tr>
         </tbody></table>
     </div>
     <div class="basic">
	 <div class="basic01">栏目添加</div>
	</div>
     <div class="query1">
       <table width="100%" border="0">
         <tbody>
         
         <tr>
           <td width="159" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">产品介绍</td>
           <td width="599">&nbsp;</td>
         </tr>
         
         <tr>
           <td width="159" valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top" colspan="2">
           			<textarea  class="input validate[required,length[1000] text-input texta1" rows="10" cols="80" name="recommend" id="recommend"></textarea>
           </td>
         </tr>
         
         <tr>
           <td width="159" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">产品描述</td>
           <td width="599">&nbsp;</td>
         </tr>
         
         <tr>
           <td width="159" valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top">
           			<textarea  class="input validate[required,length[1000] text-input texta1" rows="5" cols="45" name="PDesc1" id="PDesc1"></textarea>
             </td>
           <td></td>
         </tr>
         
         
         
        
         
         
         <tr>
           <td width="159" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">技术参数</td>
           <td></td>
         </tr>
        
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top">
           		<textarea class="input validate[required,length[1000] text-input texta1" rows="5" cols="45" name="techPara1" id="techPara1"></textarea></td>
           <td></td>
         </tr>
         <tr>
           <td width="139" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">安装说明</td>
           <td></td>
           </tr>
         
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top">
           		<textarea class="input validate[required,length[1000] text-input texta1" rows="5" cols="45" name="install1" id="install1"></textarea></td>
           <td></td>
           </tr>
       </tbody></table>
     </div>
   </form>
    </div>
    <div class="anniu"> 
    <a href="javascript:void(0)"><img  onclick="add()" src="/images/erji1_19.jpg" width="101" height="29" /></a>
     &nbsp;&nbsp;<a href="/productApp/sub/list.action"><img   src="/images/gddc_05.jpg"  /></a>
    </div>
   </div>
   
   
 
	
<script type="text/javascript">
	//表单绑定
	$(document).ready(function(){
	   $("#addForm").validationEngine(
	      {scroll:false}
	   ); 
	});
	
//提交表单
function add(){


		var b = $('#addForm').validationEngine('validate');
		if(!b){
			return false;
		}
		
		
		
		//TEXTAREA 赋值
		var PDesc = CKEDITOR.instances.PDesc1.getData();
		$("#PDesc").val(PDesc);
		var techPara = CKEDITOR.instances.techPara1.getData();
		$("#techPara").val(techPara);
		var install= CKEDITOR.instances.install1.getData();
		$("#install").val(install);
		//验证TEXTAREA
		if(PDesc==""){
			alert("产品描述不能为空");
			return
		}
		if(techPara==""){
			alert("技术参数不能为空");
			return
		}
		if(install==""){
			alert("安装说明不能为空");
			return
		}
		
		if($.trim($("#file1").val())==""){
			alert("请上传产品大图");
			return;
		}else
		if($.trim($("#file2").val())==""){
			alert("请上传产品小图");
			return;
		}
		if(!isSubmit){
			alert("图片格式上传错误");
			return;
		}
		/*
		if($.trim($("#file3").val())==""){
			alert("请上传资料");
			return;
		}
		*/
		//$('#addForm').submit();
		
		var option={
			success: function(resp,textStatus){  
                       if(T.type(resp)=="string"){
								resp=T.json.parse(resp);
						}
						if (resp.s > 0) {
							location.href="/productApp/sub/list.action";
						}else
						if (resp.s==-100) {
							alert("产品资料文件过大");
							return;
						}
						 else {
							$("#name").validationEngine("showPrompt",resp.d,"error");
						} 
                    },  
                    error: function(XmlHttpRequest, textStatus, errorThrown){  
                       alert(1111);
                       alert(textStatus);
                       alert(errorThrown);
                       if(textStatus==413 || textStatus=="413"){
                       	  alert("产品资料文件过大");
                       	  return;
                       }
                    }  
         }       
		$('#addForm').ajaxSubmit(option);
	    
}	
</script>
<script type="text/javascript">
//ckeditor宽高属性设定
$(function(){
	CKEDITOR.replace('PDesc1', {
		height : 200,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
		CKEDITOR.replace('techPara1', {
		height : 200,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
		CKEDITOR.replace('install1', {
		height : 200,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
	
})
</script>  