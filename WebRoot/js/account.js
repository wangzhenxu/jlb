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
	if($(".error-field").size()){
	}else{
	// 提交form表单
	$form.ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			closeModal();
			location.href="/account/list.action";
		} else {
			if(resp.s==-100301){
				$username.next().text(resp.d);
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