
<html>
	<head>
	<title>网站后台管理系统-产品分类</title>
	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
    <script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>			
    
    <script src="/js/zhHrInfo.js"></script>
	<link href="/css/alert.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body {
			background-image: url(/images/erji_22.jpg);
			background-repeat: repeat-x;
			}
	</style>
<script  language="javascript">
jQuery(document).ready(function(){
	jQuery("#addform,#updateform,#sendform").validationEngine({scroll:false});
	$('#xin1').on('hidden.bs.modal', function (e) {
		$("#addform").validationEngine("hide");
	});
	$('#xin2').on('hidden.bs.modal', function (e) {
		$("#updateform").validationEngine("hide");
	})
	
	$('#xin4').on('hidden.bs.modal', function (e) {
		$("#sendform").validationEngine("hide");
	})
	
	
});

</script>
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>hrQQ</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">产品分类</div>
     <div class="query">
      <ul>
       <li style="width:20%">
       	<span class="classify">邮箱：</span>
    	<input name="name" type="text"  class="input"  id="name" value="${qqNumber}"/>
       </li>
       
       <li style="width:20%">
       	<span class="classify">姓名：</span>
    	<input name="q_qqName" type="text"  class="input"  id="q_qqName" value="${qqName}"/>
       </li>
       
        <li style="width:20%">
       	<span class="classify">发送状态：</span>
    	<select id="sendStatus">
    		<option value="">全部</option>
    		<option value="0" <#if sendStatus??> <#if sendStatus=="0"> selected </#if> </#if> >未发送</option>
    		<option value="1" <#if sendStatus??> <#if sendStatus=="1"> selected </#if> </#if>>已成功发送</option>
    		<option value="2" <#if sendStatus??> <#if sendStatus=="2"> selected </#if> </#if>>发送失败</option>
    	</select>
       </li>
       <li style="width:20%"><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="query();"/></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("productClass:add")>
     	<div class="form1"><a href="javascript:void(0)"><img src="/images/erji_18.jpg" width="83" height="22" border="0"  name="addpro"  onclick="toadd();"/></a></div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">
			<input type="checkbox" style="vertical-align:middle " onclick="if(this.checked){$('.check').attr('checked',true)}else $('.check').attr('checked',false)  ">
		</td>
        <td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>邮箱</strong></td>
        <td width="25%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>姓名</strong></td>
         <td width="20%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>发送状态</strong></td>
          <td width="20%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>最后发送时间</strong></td>
        <td width="20%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list pager.data as c>
       <tr>
       <td align="center" class="hui"><input type="checkbox" name="checkbox" value="${c.hrId}" class="check"></td>
        <td align="center" class="hui">${c.qqNumber!''}</td>
        <td align="center" class="hui">${c.qqName!''}&nbsp;</td>
        <td align="center" class="hui">
        	 <#if c.sendStatus??> <#if c.sendStatus==0> 未发送 </#if>	  </#if>
        	 <#if c.sendStatus??> <#if c.sendStatus==1> 已成功发送 </#if> </#if>
        	 <#if c.sendStatus??> <#if c.sendStatus==2> 发送失败 </#if> </#if>
        </td>
        <td align="center" class="hui">
        <#if c.lastSendTime??>
        	${c.lastSendTime?string("yyyy-MM-dd HH:mm:ss")}
        </#if>
        &nbsp;</td>
        <td align="center" class="hui">
        		<a  href="javascript:toupdate('${c.qqName}','${c.qqNumber}','${c.hrId}');">修改</a>
         		<a  href="javascript:deleteclass(${c.hrId});">删除</a></td>
       </tr>
       </#list>
       <tr>
     	 <td colspan="7" valign="middle" class="d">
     	 	<a href="javascript:emalModal.openTemplateModal();" class=""><img src="/images/del.jpg" width="74" height="26">
     	 	</a>
     	 </td>
       </tr>
      </table>
     </div>
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/zpHrInfo/list.action?qqName="+qqName+"&qqNumber="+qqNumber+"&sendStatus="+sendStatus join="&"></@pageBar>
    </div>
   </div>
   
   
   
  <div class="modal hide fade xin1" id="xin1">
  <div class="xin1_1">
   <div class="whitea">新增hr</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd">基本信息</div>
    <div class="cd1">
    
    <form id="addform"  action="/zpHrInfo/add.action" method="post">
     <table width="100%" border="0">
      <tr>
        <td align="right" class="hui1">邮箱：</td>
        <td align="left" valign="middle"><input name="qqNumber" type="text" class="input validate[required,custom[email]]"  id="qqNumber"/></td>
      </tr>
       <tr>
        <td align="right" class="hui1">姓名：</td>
        <td align="left" valign="middle"><input name="qqName" type="text"  class="input validate[required]" id="qqName"/></td>
      </tr>
     </table>
    </form>
    </div>
   </div>
   <div class="caidan2"><a href="javascript:add();"><img src="/images/bjwj03.jpg" width="62" height="23"/></a>&nbsp;
   <a href="javascript:void(0);" onclick="hiddeninput()"><img src="/images/bjwj_05.jpg" width="62" height="23" data-dismiss="modal" /></a></div>
  </div>
 </div> 
 
 
  <!-- 弹窗 开始 --> 
 <div class="modal hide fade xin2" id="xin2">
  <div class="xin1_1">
   <div class="whitea">修改分类</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd">基本信息</div>
    <div class="cd1">
    
    <form id="updateform"  action="/zpHrInfo/edit.action" method="post">
    <input type="hidden" id="hrId" name="hrId" >
    <input type="hidden" id="inPerson" name="inPerson">
     <table width="100%" border="0">
        <tr>
        <td align="right" class="hui1">邮箱：</td>
        <td align="left" valign="middle"><input name="qqNumber" type="text" class="input validate[required,custom[email]]"  id="qqNumber"/></td>
      </tr>
       <tr>
        <td align="right" class="hui1">姓名：</td>
        <td align="left" valign="middle"><input name="qqName" type="text"  class="input validate[required]" id="qqName"/></td>
      </tr>
     </table>
    </form>
    </div>
   </div>
   <div class="caidan2"><a href="javascript:update();"><img src="/images/bjwj03.jpg" width="62" height="23"/></a>&nbsp;
   <a href="javascript:void(0)" onclick="hiddenupdate()"><img src="/images/bjwj_05.jpg" width="62" height="23" data-dismiss="modal" /></a></div>
  </div>
 </div> 
  <!-- 弹窗 结束 -->
	<#include "../include/deleteConfirmModal.ftl">
	<#include "emal_modal.ftl">
<script>
    var ttype="hr";
	CKEDITOR.replace('desc', {
		height : 150,
		width : 620,
		filebrowserUploadUrl:'/upload.action'
	});
</script>

</html>