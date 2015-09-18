  	
  
  <form action="/cmsSolution/sub/add.action" method="post" id="addForm">
  <input type="hidden" name="desc" id="desc" >
  <input type="hidden" name="arch" id="arch" >
  <input type="hidden" name="func" id="func" >
  
 <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">CMS发布管理</a> &gt; 系统发布 &gt;<strong> 增加系统</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">系统发布</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         <tr>
           <td colspan="3" class="red">* 号为必填项</td>
           </tr>
         <tr>
           <td width="168" align="right" class="hui1">系统分类：</td>
           <td width="284" align="left" valign="middle">
          <select id="cscId" name="cscId" class="inputa">
            <#list catList as cat>
         		<option value="${cat.cscId!''}">${cat.name!''}</option>
         	</#list>
          </select>
          </td>
           <td width="615">&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1"><span class="red">*</span> 系统名称：</td>
           <td align="left" valign="middle">
           		<input name="name" type="text" id="name"  class="input validate[required] text-input" />
           </td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">系统介绍</td>
           <td class="hui">&nbsp;</td>
           <td width="15">&nbsp;</td>
         </tr>
         
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 模块内容：</td>
           <td align="left" valign="middle" class="hui">
           		<textarea  cols="45" rows="5" class="input validate[required,length[1000] text-input mokuainr ckeditor" name="desc1"  id="desc1" ></textarea>
           </td>
           <td class="hui">&nbsp;</td>
           <td width="15">&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">系统架构</td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
         
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 模块内容：</td>
           <td align="left" valign="middle" class="hui">
           <textarea name="arch1" id="arch1" cols="45" rows="5" class="input validate[required,length[1000] text-input mokuainr ckeditor" ></textarea>
           </td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">系统功能/特点</td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
        
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 模块内容：</td>
           <td align="left" valign="middle" class="hui">
           		<textarea name="func1" id="func1" cols="45" rows="5" class="input validate[required,length[1000] text-input mokuainr ckeditor" ></textarea></td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
          <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">相关产品列表</td>
           <td class="hui"><p><span class="hui1">插入相关产品：</span><a    href="javascript:showQx()">选择关联产品</a></p></td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1">产品名称：</td>
           <td colspan="2" valign="top">
            <div class="chanpin" style="display:none;">
             <ul>
             </ul>
            </div>
           </td>
           <td>&nbsp;</td>
         </tr>
         
         <tr>
           <td align="right" class="hui1">系统链接：</td>
           <td align="left" valign="middle" class="hui">
           		<input  type="text" id="accessUrl" name="accessUrl" size="30" class="inputa" />
           </td>
           <td>&nbsp;</td>
         </tr>
         
         </table>

     </div>
    </div>
    <div class="anniu">
	   <a href="javascript:void(0)"><img  onclick="add()" src="/images/erji1_19.jpg" width="101" height="29" /></a>
	   &nbsp;&nbsp;<a href="/cmsSolution/sub/list.action"><img   src="/images/gddc_05.jpg"  /></a>
    </div>
   </div>
   </form>
   
   
   
   
   <!--            层                                -->
   
   
   <div class="modal hide fade quanxian">
  <div class="quanxian1">
   <div class="whitea">选择产品</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal" /></div>
  </div>
  <div class="quanxian2">
    <div class="xuanze">
     <div class="jiedian">
      <div class="jiedian1">关联产品分类：</div>
      <div class="jiedian2">
      
      <select id="pacId" name="pacId" class="inputa" onchange="getPoductAppByPacId()">
            <#list productCatList as cat>
         		<option value="${cat.pacId!''}">${cat.name!''}</option>
         	</#list>
       </select>
          
       
      </div>
     </div>
     <div style='display:none;' class="chanpin1">
          <ul>
          </ul>
         </div>
    </div>
   <div class="caidan2"><a href="javascript:qycp()"><img src="/images/qr.jpg" width="62" height="23" /></a>
     &nbsp; <a  href="javascript:void(0)" id="cheng"  data-dismiss="modal" ><img src="/images/bjwj_05.jpg" /></a></div>
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
		   //下拉选触发事件
		   $("#pacId option").eq(0).change();
		   
		});
		
		
	//显示层
	function showQx(){
			$(".quanxian").modal().css({
			'width':'800px',
			'margin-top': function () {
		        return -($(this).height()/2)},
		    'margin-left': function () {
		        return -($(this).width()/2);
		    }
		}); 
		}
  	
  	//根据产品分类查询产品
	function getPoductAppByPacId(pacId){
	$(".chanpin1").show();
	var pacId = $("#pacId option:selected").val();
	var url = "/productApp/class/getPoductAppByPacId.action";
		var param = {"pacId":pacId};
		$.ajax( {
				url:url,
				data:param,
				async:false,
				type:"get",
				success:function(data) 
				{
					var li =""; 
					 for(i=0;i<data.productAppList.length;i++) {
					  li = li + '<li><input type="checkbox" name="pacName" id="checkbox" style=" vertical-align:middle" value='+ data.productAppList[i].paId + ' tempPacName='+ data.productAppList[i].name + ' />'+data.productAppList[i].name+'</li>';
					 }
					 $(".chanpin1 ul").html(li);
					 //如果没有隐藏层
					 var ll = $(".chanpin1 ul li").length;
					 if(ll==0){
						$(".chanpin1").hide();
					 }
					 
					 
				}
			}
	     );
	}
	//确认产品
	function qycp(){
		
		
		var lis = ""; 
		$(":checkbox[name=pacName]").each(function(){
			if(this.checked)
			{
			   lis=lis+"ttt";
				var tempPacName = $(this).attr("tempPacName");
			  	var lcount = $(".chanpin ul li[tempName="+tempPacName+"]").length;
			  	//没有就添加
			  	if(lcount==0) 
			  	{
				  	var li = '<li tempName='+tempPacName+'>'+tempPacName+' <a href="javascript:void(0)"><img onclick="removeLi(this)" src="/images/overlay-cancel.jpg" style="vertical-align:middle"/></a>'+'<input type="hidden" name="paId" value='+this.value+' > '+'<input type="hidden" name="paName" value='+tempPacName+' > '+' </li>';
				    $(".chanpin ul").append(li); 
			  	}
			}
	});
	//没有选择产品
	if(lis==""){
		alert("请选择产品");
		return;
	}
	
	
	    $(".chanpin").show();
		$("#cheng").click();
	}
		
//删除li
function removeLi(obj){
	$(obj).parent().parent().remove();
	var ll = $(".chanpin ul li").length;
	if(ll==0){
		$(".chanpin").hide();
	}
	
}
//验证标签

	
//提交表单
function add(){
		var b = $('#addForm').validationEngine('validate');
		if(!b){
			return false;
		}
		//TEXTAREA 赋值
		var desc = CKEDITOR.instances.desc1.getData();
		$("#desc").val(desc);
		var arch = CKEDITOR.instances.arch1.getData();
		$("#arch").val(arch);
		var func = CKEDITOR.instances.func1.getData();
		$("#func").val(func);
		//验证TEXTAREA
		if(desc==""){
			alert("系统介绍不能为空");
			return
		}
		if(arch==""){
			alert("系统架构不能为空");
			return
		}
		if(func==""){
			alert("系统功能/特点不能为空");
			return
		}
		
		var ll = $(".chanpin ul li").length;
		if(ll==0){
			linkFlag=false;
			alert('请选择关联产品');
			return;
		} 
		
			$('#addForm').ajaxSubmit(function(resp) {
				if (resp.s > 0) {
					location.href="/cmsSolution/sub/list.action";
				} else {
					$("#name").validationEngine("showPrompt",resp.d,"error");
				}
		    });
}
</script>
 <script type="text/javascript">
//ckeditor宽高属性设定
	CKEDITOR.replace('desc1', {
		height : 200,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
		CKEDITOR.replace('arch1', {
		height : 200,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
		CKEDITOR.replace('func1', {
		height : 200,
		width : 720,
		filebrowserUploadUrl:'/upload.action'
	});
</script>  