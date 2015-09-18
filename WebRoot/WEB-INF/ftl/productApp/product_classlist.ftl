<html>
	<head>
	<title>网站后台管理系统-产品分类</title>
	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
	<link href="/css/alert.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body {
			background-image: url(/images/erji_22.jpg);
			background-repeat: repeat-x;
			}
	</style>
<script  language="javascript">
jQuery(document).ready(function(){
	jQuery("#updateClazz").validationEngine({
		onSuccess:function(){
		},
		onFailure:function(){
		}
	})
});
function toadd(){
	$(".xin1").modal().css({
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
});
}

function toupdate(name,id){
	$("#updatename").val(name);
	$("#pcid").val(id);
	$(".xin2").modal().css({
	'width':'432px',
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
}); 
}

function update(){
	//$("#updateClazz").submit();
	$('#updateClazz').ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			location.href="/productApp/class/list.action";
		} else {
			$("#updatename").validationEngine("showPrompt",resp.d,"error");
		}
	});
}

function add(){
$('#ProductClazz').ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			location.href="/productApp/class/list.action";
		} else {
			$("#addname").validationEngine("showPrompt",resp.d,"error");
		}
	});
}

function query(){
	var name=$("#name").attr("value");
	location.href="/productApp/class/list.action?name="+name;
}


function deleteclass(pcid) {
	    $(".pop_sure").modal().css({
	                'width':'390px',
                    'margin-top': function () {
        			return -($(this).height()/2);
                    },	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
	    $(".pop_sure .mar").on("click",function(r) {
           if(r){
					$.get("/productApp/class/delete.action",{pcid:pcid},function(resp) {
							if (resp.s > 0) {
							  location.href="/productApp/class/list.action";
							} else {
								hiOverAlert(resp.d,1000);
							}
						});
		  }
        });
}
function hiddeninput(){
$("#ProductClazz").validationEngine("hide");
}

function hiddenupdate(){
$("#updateClazz").validationEngine("hide");
}
</script>
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>产品分类</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">产品分类</div>
     <div class="query">
      <ul>
       <li>
       <span class="classify">产品分类：</span>
         <input name="name" type="text"  class="input"  id="name" value="${name}"/></li>
       <li><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="query();"/></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("productApp:add")>
     	<div class="form1"><a href="javascript:void(0)"><img src="/images/erji_18.jpg" width="83" height="22" border="0"  name="addpro"  onclick="toadd();"/></a></div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td width="31%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品分类编号</strong></td>
        <td width="39%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品分类</strong></td>
        <td width="30%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list clazzes as clazz>
       <tr>
        <td align="center" class="hui">${clazz.pacId}</td>
        <td align="center" class="hui">${clazz.name}&nbsp;</td>
        <td align="center" class="hui">
        	<#if subject.isPermitted("productApp:update")>
        		<a  href="javascript:toupdate('${clazz.name}','${clazz.pacId}');">修改</a>
        	</#if>
        	<#if subject.isPermitted("productApp:delete")>
         		<a  href="javascript:deleteclass(${clazz.pacId});">删除</a></td>
         	</#if>
       </tr>
       </#list>
      </table>
     </div>
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/productApp/class/list.action?name="+name join="&"></@pageBar>
    </div>
   </div>
   
   
   
  <div class="modal hide fade xin1">
  <div class="xin1_1">
   <div class="whitea">新增分类</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd">基本信息</div>
    <div class="cd1">
    
    <form id="ProductClazz"  action="/productApp/class/add.action" method="post">
     <table width="100%" border="0">
      <tr>
        <td align="right" class="hui1">产品名称：</td>
        <td align="left" valign="middle"><input name="addname" type="text" class="input validate[required] text-input" id="addname"/></td>
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
 <div class="modal hide fade xin2">
  <div class="xin1_1">
   <div class="whitea">修改分类</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd">基本信息</div>
    <div class="cd1">
    
    <form id="updateClazz"  action="/productApp/class/update.action" method="post">
     <table width="100%" border="0">
      <tr>
        <td align="right" class="hui1">产品名称：</td>
        <td align="left" valign="middle"><input  name="updatename" type="text" class="input validate[required] text-input" id="updatename" />
        <input type="hidden" class="input" id="pcid"  name="pcid" />
        </td>
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
  <!-- 弹窗 开始 -->
<div class="pop_sure modal hide fade">
  <div class="title0">确认框<a class="x" href="javascript:void(0)"  data-dismiss="modal"></a></div>
  <div class="text0">你确定删除吗？</div>
  <div class="w100">
    <ul class="r50">
      <li><a class="button mar" href="javascript:void(0)" value=false><span>确定</span></a><a class="button" 

href="javascript:void(0)"  data-dismiss="modal"><span>取消</span></a></li>
    </ul>
</div>
<!-- 弹窗 结束 -->

</html>