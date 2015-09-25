var jlInfo ={
	
	initAddPage : function (){
		jQuery("#addform").validationEngine({scroll:false});
		$("#addBtn").click(function(){
			jlInfo.add();
		});
	},
	add : function (){
		var b = $('#addform').validationEngine('validate');
		if(!b){
			return false;
		}
		$('#addform').ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			location="/zpJlInfo/list.action";
		} else {
			//坐席类型存在
			if(resp.s==-100301) {
				 $("#name").validationEngine("showPrompt",resp.d,"error");
			}
		}
		});		
	},
	
	upload :function (sender){
		 var oldForm=$(sender).closest("form");
		   $.ajaxFileUpload({
			url:'/zpJlInfo/paseWord.action', //需要链接到服务器地址
			type:"POST",
			async:false,
			secureuri:false,
		 	fileElementId:'ui-upload-input', //文件选择框的id属性
			oldForm:oldForm,// 原formID
			success:function(result,status){ //相当于java中try语句块的用法 data是从服务器返回来的值 
				//{"data":{"name":null,"inTime":null,"jlId":null,"sex":1,"jobId":null,"emal":null,"phone":null,"maritalId":null,"schoolTag":null,"inPersion":null,"identityCard":"130221199102064850","salaryRequireId":null,"famousCompanyUpdateStatus":null,"educationId":null,"lastOperatorTime":null,"jobStartTime":null,"importStatus":null,"jobPositionId":null,"jobPositionLevelId":null},"s":1,"d":"ok"}
				var result=eval('(' +$(result.body).html()+ ')');
				var st=result.s;
				var sd=result.d;
					if(st==1){
						jlInfo.setForm(result.data);
					}
					else{
						$.validationEngine.buildPrompt('#ui-upload-holder','请上传大小在1M以内的图片','error');
					}
		 	}, 
		 });
	},
	
	setForm : function (obj){
		if(obj.name && obj.name.length>0 ){
			$("#name").val(obj.name);
		}
		if(obj.emal && obj.emal.length>0 ){
			$("#emal").val(obj.emal);
		}
		if(obj.phone && obj.phone.length>0 ){
			$("#phone").val(obj.phone);
		}
		if(obj.sex && obj.sex!=0){
			$("input[name=sex][value="+obj.sex+"]").attr("checked",true);
		}
		if(obj.identityCard && obj.identityCard.length>0){
			$("#identityCard").val(obj.identityCard);
		}
		if(obj.schoolTag && obj.schoolTag.length>0){
			$("#schoolTag").val(obj.schoolTag);
		}
		
		
		
		
	}

}
