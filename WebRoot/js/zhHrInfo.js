
function toadd(){
	$("#xin1").modal().css({
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
});
}

function toupdate(qqName,qqNumber,hrId){
	$('#updateform').find("#qqNumber").val(qqNumber);
	$('#updateform').find("#qqName").val(qqName);
	$('#updateform').find("#inPerson").val(qqNumber);
	$("#hrId").val(hrId);
	$("#xin2").modal().css({
	'width':'432px',
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
}); 
}

function update(){
	var b = jQuery('#updateform').validationEngine('validate');
	if(!b){
		return false;
	}
	$('#updateform').ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			location.reload();
		} else {
		 	$('#updateform').find("#qqNumber").validationEngine("showPrompt",resp.d,"error");
		}
	});
}

function add(){
	var b = jQuery('#addform').validationEngine('validate');
	if(!b){
		return false;
	}
	$('#addform').ajaxSubmit(function(resp) {
		if (resp.s > 0) {
			location.reload();
		} else {
		 	$('#addform').find("#qqNumber").validationEngine("showPrompt",resp.d,"error");
		}
	});
}

function onUploadImgChange(sender){ 
       var oldForm=$(sender).closest("form");
	   $.ajaxFileUpload({
		url:'/product/management/checkImage.action', //需要链接到服务器地址
		type:"POST",
		async:false,
		secureuri:false,
	 	fileElementId:'ui-upload-input', //文件选择框的id属性
		oldForm:oldForm,// 原formID
	 	dataType:'text', //服务器返回的格式，可以是json
		success:function(data,status){ //相当于java中try语句块的用法 data是从服务器返回来的值 
		var data=T.json.parse(data);
		var st=data.s;
		var sd=data.d;
			if(st==1){
				samllPicbool=true;
				$.validationEngine.closePrompt('.ui-upload-holderformError',true);
			}
			else{
				samllPicbool=false;
				$.validationEngine.buildPrompt('#ui-upload-holder','请上传大小在1M以内的图片','error');
			}
	 	},
		error:function(data,status){ //相当于java中catch语句块的用法
				samllPicbool=false;
				$.validationEngine.buildPrompt('#ui-upload-holder','请上传大小在1M以内的图片','error');
			
		}
	 });
    
}   

function query(){
	var name=$("#name").attr("value");
	var q_qqName=$("#q_qqName").attr("value");
	var sendStatus=$("#sendStatus").attr("value");
	
	location.href="/zpHrInfo/list.action?qqNumber="+name+"&qqName="+q_qqName+"&sendStatus="+sendStatus;
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
					$.get("/zpHrInfo/ajaxDelete.action",{id:pcid},function(resp) {
							if (resp.s > 0) {
							  location.reload();
							} else {
								hiOverAlert(resp.d,1000);
							}
						});
        });
}
function hiddeninput(){
$("#ProductClazz").validationEngine("hide");
}

function hiddenupdate(){
$("#updateClazz").validationEngine("hide");
}