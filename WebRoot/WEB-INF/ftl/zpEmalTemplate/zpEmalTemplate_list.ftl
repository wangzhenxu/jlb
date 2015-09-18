  	
  <script src="/js/zpEmalTemplate.js"></script>
  <form action="/zpEmalTemplate/edit.action" method="post" id="addForm">
	  <input type="hidden" name="templateSubject" id="templateSubject" >
	  <input type="hidden" name="emalId" id="emalId" >
	   <input type="hidden" name="templateContent" id="templateContent" >
  </form>
 <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">CMS发布管理</a> &gt; 系统发布 &gt;<strong> 增加系统</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">邮件模版</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
       <#list pager.data as c>
	         <tr>
	           <td align="right" class="hui1"></td>
	           <td align="left" valign="middle" class="hui">${c.templateTitle!''}</td>
	           <td class="hui">&nbsp;</td>
	           <td width="15">&nbsp;</td>
	         </tr>
	         
	         <tr>
	           <td align="right" class="hui1">邮件主题：</td>
	           <td align="left" valign="middle" class="hui"><input style="width:400px;"  type="text" id="templateSubject${c_index}" class="input validate[required] text-input" value="${c.templateSubject!''}"></td>
	           <td class="hui">&nbsp;</td>
	           <td width="15">&nbsp;</td>
	         </tr>
	         
	         <tr>
	           <td align="right" valign="top" class="hui1"> 邮件内容：</td>
	           <td align="left" valign="middle" class="hui">
	           		<textarea  cols="45" rows="5" class="input validate[required,length[1000] text-input mokuainr ckeditor" name="desc${c_index}"  id="desc${c_index}" >${c.templateContent!''}</textarea>
	           </td>
	           <td class="hui">&nbsp;</td>
	           <td width="15">&nbsp;</td>
	         </tr>
	         
	          <tr>
	           <td align="right" class="hui1"></td>
	           <td align="left" valign="middle" class="hui">
	           		<div class="anniu" style="text-align:left;">
	   					<a href="javascript:void(0)"><img onclick="update('${c_index}',${c.emalId!''})"  src="/images/erji1_19.jpg" width="101" height="29"></a>
	   					&nbsp;&nbsp;
    				</div>
    		   </td>
	           <td class="hui">&nbsp;</td>
	           <td width="15">&nbsp;</td>
	         </tr>
	         
         </#list>
         </table>

     </div>
    </div>
    
   </div>
   
   
 </div>
 
 	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
	<link href="/css/alert.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>			
<script type="text/javascript">
	var linkFlag=true;//标签验证通过标志
		//表单绑定
		$(document).ready(function(){
		   $("#addForm").validationEngine(
		      {scroll:false}
		   ); 
		});

</script>
 <script type="text/javascript">
//ckeditor宽高属性设定
	CKEDITOR.replace('desc0', {
		height : 150,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
		CKEDITOR.replace('desc1', {
		height : 150,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
	CKEDITOR.replace('desc2', {
		height : 150,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
		CKEDITOR.replace('desc3', {
		height : 150,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});	
</script>  




