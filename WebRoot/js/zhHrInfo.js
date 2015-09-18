
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