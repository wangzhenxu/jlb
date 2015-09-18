

function disable(){
	if($(".qxTitle").prev().attr("type")=="checkbox"){
		$(".qxTitle").prev().attr("disabled",true);
	}
	
	$(".qxTitle").each(function (i,data){
		if($(data).parent().prev().attr("type")=="checkbox"){
			$(data).parent().prev().attr("disabled",true);
			if($(data).parent().parent().next().is("div")){
				$(data).parent().parent().next().find(":checkbox").attr("disabled",true);
			}
		}
	});
}

$(function() {
	disable();
	//showModal();
	//一级 权限
	$(":checkbox[level=one]").click(function(){
			if ($(this).attr("checked")) {
				
			} else {
				var li = $(this).parents("li");
				li.find(":checkbox[level=two]").attr("checked",false);
				li.find(":checkbox[level=three]").attr("checked",false);
				li.find(":checkbox[level=four]").attr("checked",false);
			}
	});
	
	//二级 权限
	$(":checkbox[level=two]").not("[name=gzsd]").click(function(){
		if ($(this).attr("checked")) {
			var li = $(this).parents("li");
			li.find(":checkbox[level=one]").attr("checked",true);
		} else {
			var div = $(this).parent("div").next();
			div.find(":checkbox[level=three]").not("[name=gzsd]").attr("checked",false);
			
			//如果二级，没有被选中，一级，也被取消选中
			var li = $(this).parents("li");
			if(li.find(":checkbox[level=two][checked]").length==0) {
				li.find(":checkbox[level=one]").attr("checked",false);
			}
		}
   });
	
	//三级 权限
	$(":checkbox[level=three]").not("[name=gzsd]").click(function(){
		if ($(this).attr("checked")) {
			var li = $(this).parents("li");
			li.find(":checkbox[level=one]").attr("checked",true);
			var div = $(this).parent("div").prev();
			
			div.find(":checkbox[level=two]").attr("checked",true);
			
		} else {
			
		}
   });
	
	
	//规则设定
	
	
	//二级 权限
	$(":checkbox[level=two][name=gzsd]").click(function(){
		if ($(this).attr("checked")) {
			var li = $(this).parents("li");
			li.find(":checkbox[level=one]").attr("checked",true);
		} else {
			var div = $(this).parents().parent().next();
			div.find(":checkbox[level=three]").attr("checked",false);
			
			//如果二级，没有被选中，一级，也被取消选中
			var li = $(this).parents("li");
			if(li.find(":checkbox[level=two][checked]").length==0) {
				li.find(":checkbox[level=one]").attr("checked",false);
			}
		}
   });
	
	//三级 权限
	$(":checkbox[level=three][name=gzsd]").click(function(){
		if ($(this).attr("checked")) {
			var li = $(this).parents("li");
			li.find(":checkbox[level=one]").attr("checked",true);
			var div = $(this).parent().parent().prev();
			div.find(":checkbox[level=two]").attr("checked",true);
		} else {
			var div = $(this).parent().parent().next();
			div.find(":checkbox[level=four]").attr("checked",false);
		}
   });
	//四级 权限
	$(":checkbox[level=four][name=gzsd]").click(function(){
		if ($(this).attr("checked")) {
			var li = $(this).parents("li");
			li.find(":checkbox[level=one]").attr("checked",true);
			li.find(":checkbox[level=two][name=gzsd]").attr("checked",true);
			//li.find(":checkbox[level=three][name=gzsd]").attr("checked",true);
			
			var div = $(this).parent().prev();
			div.find(":checkbox[level=three][name=gzsd]").attr("checked",true);
			
		} else {
			
		}
   });	
	
	
	
});

function saveRole() {
	$("#rolename").blur();
	if ($(".error-field").size()) {
	} else {
		var counti=0;
		// 处理checkbox的值
		$("#saveRoleForm input:checked").each(function(i, data) {
			
			if($(this).val().length>0 && $(this).val()!="on") {
				
				        $("#permissionList").append("<input type='hidden' value="
						+ $(this).val() + " name='permissionList[" + counti
						+ "].permissionId'/>");
				        counti++;
				        //alert(counti);
			} 
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
						location.href = "/customer/account/role/list.action";
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
	
	$("select[name=projectId]").attr("disabled",false);
	$("select[id=projectId] option").each(function(i,o){
		if(i==0){
		   this.selected="selected";	
		 }
	});
	
	disable();
}

function initAdd() {
	showModal();
	$("#roleModalTitle").text("添加角色");
	
	//$("select[name=projectId]").get(0).selectedIndex=2;
}

function initEdit(roleId,projectId) {

	$("#roleModalTitle").text("修改角色");
	
	$("select[id=projectId] option[value='"+projectId+"']").attr("selected","selected");

	// 获得数据
	$.post("/customer/account/role/get.action", {
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

function initView(roleId,projectId) {

	$("#roleModalTitle").text("查看角色");

	// 隐藏确定按钮
	$("#btnOkModal").hide();
	
	
	$("select[name=projectId] option[value='"+projectId+"']").attr("selected","selected");
	$("select[id=projectId]").attr("disabled",true);
	
	

	// 获得数据
	$.post("/customer/account/role/get.action", {
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

function getAllRoleByRole(roleId,projectId) {
	
	$("#roleModal2").modal().css({
		'margin-top': function () {
			return -($(this).height()/2)},		
		'margin-left' : function() {
			return -($(this).width() / 2);
		}
	});
	
 
	// 获得数据
	$.post("/customer/account/role/getRoleDistribution.action", {
				roleId : roleId,projectId : projectId
			}, function(resp) {
				
				
				var roleHtml = "";
				for(var i=0;i<resp.roleList.length;i++) {
					var role = resp.roleList[i];
					//alert(role.roleName);
					
					var checkeElement = "";
					if(role.isChecked=="yes"){
						checkeElement = "checked=checked";
					}
					var  roleHtml= roleHtml+ '<li><input type="checkbox"  name="addRoleIdList" id="checkbox" '+checkeElement+' style="vertical-align:middle" value="'+role.roleId+'" />'
				          +' <span class="hui">'+role.roleName+'</span> </li> ';
				}
				
				$("#roleAll").html("");
				$("#roleAll").html(roleHtml);
				$("#roleId").val(resp.roleId);
				
			});
	
}

function giveRole(){
	$('#giveRoleForm').ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			$("#closepop").click();
		} else {
			alert("分配失败，请联系管理员");
			//$("#name").validationEngine("showPrompt",resp.d,"error");
		}
    });
	
}