//提交表单
function update(desc,id){
		var emalId ="";
		var templateSubject ="";
		var templateContent ="";
		if(desc==0){
			templateContent=CKEDITOR.instances.desc0.getData();
		} else
		if(desc==1){
			templateContent=CKEDITOR.instances.desc1.getData();
		} else
		if(desc==2){
			templateContent=CKEDITOR.instances.desc2.getData();
		} else
		if(desc==3){
			templateContent=CKEDITOR.instances.desc3.getData();
		}
		$("#templateSubject").val($("#templateSubject"+desc).val());
		$("#templateContent").val(templateContent);
		$("#emalId").val(id);
		
		$('#addForm').ajaxSubmit(function(resp) {
				if (resp.s > 0) {
					hiOverAlert('更新成功',1000);
				} else {
					hiOverAlert('更新失败',1000);
				}
		    });
		
		
		//$("#desc").val(desc);
		
}