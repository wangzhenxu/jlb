function toAddAccount() {
	$.post("/account/toAddAccount.action", function(doc) {
		document.getElementById("accountModal").innerHTML=doc;
		$("#accountModal").modal().css({
			'margin-top': function () {
			return -($(this).height()/2)},		
		'margin-left' : function() {
			return -($(this).width() / 2);
		}
	});
	});
}

//列表查询
 function query(){
	var serializeObj = common.serializeJson("queryForm");
	var jsonStr = JSON.stringify(serializeObj)
	location.href="/account/list.action?jsonParam="+jsonStr;
}

function toEditAccount(accountId) {
	$.post("/account/toEditAccount.action", {
		accountId : accountId
	}, function(doc) {
		document.getElementById("accountModal").innerHTML=doc;
		$("#accountModal").modal().css({
			'margin-top': function () {
			return -($(this).height()/2)},		
		'margin-left' : function() {
			return -($(this).width() / 2);
		}
	  });
	});
}

function toViewAccount(accountId) {
	$.post("/account/toViewAccount.action", {
		accountId : accountId
	}, function(doc) {
		document.getElementById("accountModal").innerHTML=doc;
		$("#accountModal").modal().css({
			'margin-top': function () {
			return -($(this).height()/2)},		
		'margin-left' : function() {
			return -($(this).width() / 2);
		}
	  });
	});
}

function closeModal() {
	$("#accountModal").modal("hide");
}

function resetPassword() {
	$("#btnReset")
			.parent()
			.empty()
			.append(
					'<input name="password" type="password" class="input"/><span class="tip"></span>')
			.find("input").focus();
}


	
function addAccount() {

	//表单
	var $form=$("#saveAccountForm");

	$("[name=username]").blur();
	$("[name=password]").blur();
	$("[name=retryPassword]").blur();
	$("[name=retryPassword]").blur();
	$("[name=type]").blur();
	if($("[name=type]:checked").val()==2){
		if($("#auditPositionId").val()==""){
			common.alert("请选择评审职位");
			return;
		}
	}
	if($(".error-field").size()){
	}else{
	// 提交form表单
	$form.ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			closeModal();
			location.href="/account/list.action";
		} else {
			if(resp.s==-100301){
				$("[name=username]").next().text(resp.d);
			}else{
				alert(resp.d);
			}
		}
	});
	}
}


function editAccount() {
	// 表单
	var $form = $("#saveAccountForm");
	var $password = $form.find("[name=password]"); // 密码

	// 清空提示文本
	$form.find(".tip").text("");

	// 密码
	if ($password.length > 0 && !$password.val()) {
		$password.next().text("请您输入用户密码");
		return;
	}
	
	if($("[name=type]:checked").val()==2){
		if($("#auditPositionId").val()==""){
			common.alert("请选择评审职位");
			return;
		}
	}
	// 提交form表单
	$form.ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			closeModal();
			location.href="/account/list.action";
		} else {
			alert(resp.d);
		}
	});
}

function accountTypeSelected(obj){
	if(obj.value==2){
		$("#auditPostion_id").show();
	}else{
		$("#auditPostion_id").hide();
	}
}

modifyDeleteStatusUrl="/account/modifyDeleteStatus.action" //停用 或启用

modifyDeleteStatus = function (id,status){
	   var self = this;
	   var delTitle = "";
	   if(status==1){
		   status=2;
		   delTitle="确定停用账号？此账号将不能登陆哦";
	   } else 
	   if(status==2){
		   status=1;
		   delTitle="确定启用吗？";
	   }
	   
	  var f= window.confirm(delTitle);
	  if(f){
		  location.href= modifyDeleteStatusUrl+"?id="+id+"&deleteStatus="+status;
	  }
	  
}