//公司职位
var companyJob = {
	//请求url
	listUrl:"/zpCompanyJobInfo/list.action", //列表地址
	toAddUrl:"/zpCompanyJobInfo/toAdd.action", //去添加页面地址
	toEditUrl:"/zpCompanyJobInfo/toEdit.action?id=", //去修改页面地址
	deleteUrl : "/zpCompanyJobInfo/delete.action?id=", //删除页面地址
	toViewUrl:"/zpCompanyJobInfo/toView.action?id=", //详细页面地址
    
	//属性
	
	jobId : $("#jobId"), //职位id
	companyId : $("#companyId"), //所属公司
	typeId : $("#typeId"), //职位类型
	name : $("#name"), //公司名称
	jobPositionLevelId : $("#jobPositionLevelId"), //职位级别
	expectedYearMoney : $("#expectedYearMoney"), //预计年薪 逗号分隔
	reportObject : $("#reportObject"), //汇报对象
	zpPersonCount : $("#zpPersonCount"), //招聘人数
	downTeamPersonCount : $("#downTeamPersonCount"), //团队人数
	desc : $("#desc"), //职位描述
	zpRequire : $("#zpRequire"), //招聘要求
	sex : $("#sex"), //要求性别
	educationId : $("#educationId"), //要求学历
	englishLevelId : $("#englishLevelId"), //要求英语等级
	topSpecialty : $("#topSpecialty"), //要求专业
	jobTemptText : $("#jobTemptText"), //职位诱惑
	jobTemptItem : $("#jobTemptItem"), //诱惑都好项,逗号分隔
	moreDesc : $("#moreDesc"), //更多描述
	inPerson : $("#inPerson"), //录入人
	inDatetime : $("#inDatetime"), //录入时间
	lastUpdateTime : $("#lastUpdateTime"), //最后更新时间
	isDelete : $("#isDelete"), //是否删除
	 money1 : $("#money1"),
	 money2 : $("#money2"),
	 expectedYearMoneyStart : $("#expectedYearMoneyStart"),
	 expectedYearMoneyEnd : $("#expectedYearMoneyEnd"),
	 workTermStart: $("#workTermStart"),
	 workTermEnd : $("#workTermEnd"),
	 ageStart: $("#ageStart"), //年龄开始  
	 ageEnd: $("#ageEnd"),   //年龄结束  
	 maritalId: $("#maritalId"),   //婚否 

	 zpUrgencyStatusId : $("#zpUrgencyStatusId"), //招聘紧急状态
	 areaId : $("#areaId"), //所在城区


	//初始化添加页面
	initAddPage : function (){
		jQuery("#addform").validationEngine({scroll:false});
		$("#addBtn").click(function(){
			companyJob.add();
		});
	},
	
	//列表查询
	query : function(){
		if(this.expectedYearMoneyStart.val().length>0){
			this.expectedYearMoneyStart.val(parseFloat(this.expectedYearMoneyStart.val())*10000);
		}
		if(this.expectedYearMoneyEnd.val().length>0){
			this.expectedYearMoneyEnd.val(parseFloat(this.expectedYearMoneyEnd.val())*10000);
		}
		location.href=this.listUrl+"?typeId=" + this.typeId.val()+"&name=" + this.name.val()+
		"&jobPositionLevelId="+this.jobPositionLevelId.val()+
		"&workTermStart="+this.workTermStart.val()+
		"&workTermEnd="+this.workTermEnd.val()+
		"&expectedYearMoneyStart="+this.expectedYearMoneyStart.val()+
		"&expectedYearMoneyEnd="+this.expectedYearMoneyEnd.val()+
		"&zpUrgencyStatusId="+this.zpUrgencyStatusId.val()+
		"&areaId="+this.areaId.val()
		;
	},
	tolist:function (){
		location.href=this.listUrl;
	},
	//跳转到添加页面
	toAdd : function (){
		location.href=this.toAddUrl;
	},
	//公司职位 添加 
	add : function (){
		
			var b = $('#addform').validationEngine('validate');
			if(!b){
				return false;
			}
			if(this.expectedYearMoneyStart.val().length>0){
				this.expectedYearMoneyStart.val(parseFloat(this.expectedYearMoneyStart.val())*10000);
			}
			if(this.expectedYearMoneyEnd.val().length>0){
				this.expectedYearMoneyEnd.val(parseFloat(this.expectedYearMoneyEnd.val())*10000);
			}

			//this.expectedYearMoney.val(this.money1.val() + "-" + this.money2.val());
			$("#desc").val(CKEDITOR.instances.desc1.getData());
			$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
			$('#addform').ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location="/zpCompanyJobInfo/list.action";
			} else {
				//唯一判断
				if(resp.s==-100301) {
					 $("#name").validationEngine("showPrompt",resp.d,"error");
				}
			}
			});		
	}
		
}
