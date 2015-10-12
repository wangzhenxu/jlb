var companyInfo = {
	
	companyId : $("#companyId"), //主建
	name : $("#name"), //公司名称
	address : $("#address"), //公司详细地址
	desc : $("#desc"), //desc
	moreDesc : $("#moreDesc"), //更多描述
	scaleId : $("#scaleId"), //公司规模
	regtime : $("#regtime"), //注册时间
	financingLevelId : $("#financingLevelId"), //融资规模
	industryId : $("#industryId"), //所属行业
	companyNature : $("#companyNature"), //公司性质
	inPerson : $("#inPerson"), //录入人
	lastUpdateTime : $("#lastUpdateTime"), //更新时间
	isDelete : $("#isDelete"), //1 未删除  2 以删除
	coordX : $("#coordX"), //坐标x
	coordY : $("#coordY"), //坐标y
	areaId : $("#areaId"), //公司所在城区

	query : function(){
		var serializeObj = common.serializeJson("queryForm");
		var jsonStr = JSON.stringify(serializeObj)
		location.href="/zpCompanyInfo/list.action?jsonParam="+jsonStr;
	},
	tolist : function (){
		location.href="/zpCompanyInfo/list.action";
	},
	initAddPage : function (){
		CKEDITOR.replace('desc1', {
			height : 150,
			width : 720,
			filebrowserUploadUrl:'/upload.action'
		});
		CKEDITOR.replace('desc2', {
			height : 150,
			width : 720,
			filebrowserUploadUrl:'/upload.action'
		});
		jQuery("#addform").validationEngine({scroll:false});
		$("#addBtn").click(function(){
			companyInfo.add();
		});
	},
	toAdd : function (){
		location.href="/zpCompanyInfo/toAdd.action";
	},
	toAddJob : function (companyId){
		location.href="/zpCompanyJobInfo/toAdd.action?companyId="+companyId;
	},
	//公司信息 添加 
	add : function (){
			var b = $('#addform').validationEngine('validate');
			if(!b){
				return false;
			}
			var desc = CKEDITOR.instances.desc1.getData();
			var desc2 =CKEDITOR.instances.desc2.getData();
			if(desc.length==0 || desc==""){
				common.alert("请填写公司介绍");
				return;
			}
			$("#desc").val(desc);
			$("#moreDesc").val(desc2);
			
			$('#addform').ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location="/zpCompanyInfo/list.action";
			} else {
				//唯一判断
				if(resp.s==-100301) {
					 $("#name").validationEngine("showPrompt",resp.d,"error");
				}
			}
			});		
		
	},
	
   toEdit : function (id){
		location.href="/zpCompanyInfo/toEdit.action?id=" + id;
   }
		
}


