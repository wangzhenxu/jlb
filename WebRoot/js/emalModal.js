var emalModal ={
	changeTemplateInfo : function(select){
		var option = $(select).find("option:selected");
		$("#templateSubject").val(option.attr("subject"));
	    CKEDITOR.instances.desc.setData(option.attr('content'));
	},
	openTemplateModal : function (){
		if($(".check:checked").length==0){
			hiOverAlert("请选择发送的邮箱",1000);
			return;
		}
		
		var boxarr = $(".check:checked").get();
		var ids ="";
		for(i=0;i<boxarr.length;i++){
		 	var id = boxarr[i].value;
		 	if(i==0){
		 		ids=id;
		 	}else {
		 		ids = ids+","+id;
		 	}
		}
		$("#ids").val(ids);
		common.openModal("xin4");
	},
	sendMail : function (){
		var b = jQuery('#sendform').validationEngine('validate');
		if(!b){
			return false;
		}
		if(ttype=="hr"){
			$('#sendform').attr("action","/zpHrInfo/sendMail.action");
		}
		$('#sendform').ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location.reload();
			} else {
				hiOverAlert(resp.d,1000);
			}
		});
	}
	
    
	
	
}