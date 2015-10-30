$(function() {
	$(":checkbox[class$=parent]").click(function() {
				if ($(this).attr("checked")) {
					// $(this).closest("li").find("[class$=child]").attr(
					// "checked", true);
				} else {
					$(this).closest("li").find("[class$=child]")
							.removeAttr("checked");
				}
			});

	$(":checkbox[class$=child]").click(function() {
		if ($(this).attr("checked")) {
			$(this).closest("li").find("[class$=parent]").attr("checked", true);
		} else {
//			if (0 == $(this).siblings(":checked").length) {
//				$(this).closest("li").find("[class$=parent]")
//						.removeAttr("checked");
//			}
		}
	});
});

function saveRole() {
	$("#rolename").blur();
	if ($(".error-field").size()) {
	} else {
		// 处理checkbox的值
		$("#saveRoleForm input:checked").each(function(i, data) {
			$("#permissionList").append("<input type='hidden' value="
					+ $(this).val() + " name='permissionList[" + i
					+ "].permissionId'/>");
		});

		// 判断是否选择权限
		if ($("#permissionList input").length == 0) {
			$("#permissionListTip").text("请您选择角色权限");
			return;
		} else {
			$("#permissionListTip").text("");
		}

		// 提交form表单
		$('#saveRoleForm').ajaxSubmit(function(resp) {
					if (resp.s > 0) {
						close();
						// 跳转到列表页
						location.href = "/account/role/list.action";
					} else {
						alert(resp.d);
					}
				});
	}
}

$(function() {
			$('#roleModal').on('hidden', function() {
						resetForm();
					})
		});

function showModal() {
	$("#roleModal").modal().css({
				'margin-top': function () {
					return -($(this).height()/2)},		
				'margin-left' : function() {
					return -($(this).width() / 2);
				}
			});
}

function closeModal() {
	$("#roleModal").modal('hide');
}

function resetForm() {
	// 清空Form
	$("#saveRoleForm").clearForm();
	// 角色ID清空
	$("#saveRoleForm input[name=roleId]").val("");
	// 复选框复原
	$("#saveRoleForm input:checkbox").removeAttr("disabled");
	// 隐藏确定按钮
	$("#btnOkModal").show();
	// 删掉文本
	$("#roleNameTip").prev().remove();
	$("#roleNameTip")
			.before('<input name="roleName" type="text" class="input"/>');
}

function initAdd() {
	showModal();
	$("#roleModalTitle").text("添加角色");
}

function initEdit(roleId) {

	$("#roleModalTitle").text("修改角色");

	// 获得数据
	$.post("/account/role/get.action", {
				roleId : roleId
			}, function(resp) {
				if (resp.s > 0) {

					var role = resp.data;

					// 角色ID
					$("#saveRoleForm input[name=roleId]").val(role.roleId);
					// 角色名称
					$("#saveRoleForm input[name=roleName]").val(role.roleName);
					// 选中权限
					$.each(role.permissionList, function(i, permission) {
								$("#saveRoleForm input[value="
										+ permission.permissionId + "]").attr(
										"checked", "true");
							});

					showModal();

				} else {
					alert(resp.d);
				}
			});

}

function initView(roleId) {

	$("#roleModalTitle").text("查看角色");

	// 隐藏确定按钮
	$("#btnOkModal").hide();
	$("#btnCancelModal").hide();
	
	// 获得数据
	$.post("/account/role/get.action", {
				roleId : roleId
			}, function(resp) {
				if (resp.s > 0) {

					var role = resp.data;

					// 角色ID
					$("#saveRoleForm input[name=roleId]").val(role.roleId);
					// 角色名称
					$("#roleNameTip").prev().remove();
					// 添加名成
					$("#roleNameTip").before("<span>" + role.roleName
							+ "</span>")
					// 选中权限
					$.each(role.permissionList, function(i, permission) {
								$("#saveRoleForm input[value="
										+ permission.permissionId + "]").attr(
										"checked", "true");
							});

					showModal();

					// 禁用选择
					$("#saveRoleForm input:checkbox").attr("disabled", true);

				} else {
					alert(resp.d);
				}
			});

}