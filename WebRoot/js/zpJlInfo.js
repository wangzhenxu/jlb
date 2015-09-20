var jlInfo :{
	
	initAddPage : function (){
		jQuery("#addform").validationEngine({scroll:false});
	}

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
	}
}
