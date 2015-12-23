//职位匹配信息
var jobMatchInfo = {
	//请求url
	listUrl:"/zpJobMatchingInfo/list.action", //列表地址
	toAddUrl:"/zpJobMatchingInfo/toAdd.action", //去添加页面地址
	toEditUrl:"/zpJobMatchingInfo/toEdit.action?id=", //去修改页面地址
	deleteUrl :"/zpJobMatchingInfo/delete.action?id=", //删除页面地址
	toViewUrl:"/zpJobMatchingInfo/toView.action?id=", //详细页面地址
	showMatchJlDetailUrl:"/zpJobMatchingInfo/showMatchJlDetail.action?id=", //匹配简历详情页面地址

	
    
	//属性
	
	matchId : $("#matchId"), //主建匹配id
	jobId : $("#jobId"), //职位id
	companyId : $("#companyId"), //公司id
	sexId : $("#sexId"), //性别
	sexStatus : $("#sexStatus"), //sexStatus
	jobPositionId : $("#jobPositionId"), //职位类型
	jobPositionIdStatus : $("#jobPositionIdStatus"), //jobPositionIdStatus
	jobPositionLevelId : $("#jobPositionLevelId"), //职位级别
	jobPositionLevelIdStatus : $("#jobPositionLevelIdStatus"), //jobPositionLevelIdStatus
	maritalId : $("#maritalId"), //婚否
	maritalIdStatus : $("#maritalIdStatus"), //maritalIdStatus
	salaryRequireId : $("#salaryRequireId"), //薪水要求id
	salaryRequireIdStatus : $("#salaryRequireIdStatus"), //salaryRequireIdStatus
	educationId : $("#educationId"), //学历id
	educationIdStatus : $("#educationIdStatus"), //educationIdStatus
	englishLevelId : $("#englishLevelId"), //英语等级
	englishLevelIdStatus : $("#englishLevelIdStatus"), //englishLevelIdStatus
	topSpecialty : $("#topSpecialty"), //专业
	topSpecialtyStatus : $("#topSpecialtyStatus"), //topSpecialtyStatus
	birthday : $("#birthday"), //年龄
	birthdayStatus : $("#birthdayStatus"), //birthdayStatus
	jobStarttime : $("#jobStarttime"), //工作年薪
	jobStarttimeStatus : $("#jobStarttimeStatus"), //jobStarttimeStatus
	matchKeword : $("#matchKeword"), //匹配关键字
	noMatchKeyword : $("#noMatchKeyword"), //未匹配关键字
	distance : $("#distance"), //distance
	distanceStatus : $("#distanceStatus"), //distanceStatus
	inDatetime : $("#inDatetime"), //录入时间
	inPerson : $("#inPerson"), //录入人
	
	//初始化添加页面
	initAddPage : function (){
		jQuery("#addform").validationEngine({scroll:false});
		$("#addBtn").click(function(){
			jobMatchInfo.add();
		});
	},
	//列表查询
	query : function(){
		location.href=this.listUrl+"?";
	},
	//跳转到添加页面
	toAdd : function (){
		location.href=this.toAddUrl;
	},
	toMatchJlDetail:function(id){
		location.href=this.showMatchJlDetailUrl+id;
	},
	//职位匹配信息 添加 
	add : function (){
			var b = $('#addform').validationEngine('validate');
			if(!b){
				return false;
			}
			//$("#desc").val(CKEDITOR.instances.desc1.getData());
			//$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
			
			$('#addform').ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location=this.listUrl;
			} else {
				//唯一判断
				if(resp.s==-100301) {
					 $("#name").validationEngine("showPrompt",resp.d,"error");
				}
			}
			});		
	}
		
}
