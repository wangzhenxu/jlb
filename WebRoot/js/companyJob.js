//公司职位
var companyJob = {
		//请求url
		listUrl:"/zpCompanyJobInfo/list.action", //列表地址
		toAddUrl:"/zpCompanyJobInfo/toAdd.action", //去添加页面地址initPage
		addUrl:"/zpCompanyJobInfo/add.action", //添加地址
		toEditUrl:"/zpCompanyJobInfo/toEdit.action?id=", //去修改页面地址
		editUrl:"/zpCompanyJobInfo/edit.action", //去修改页面地址
		deleteUrl :"/zpCompanyJobInfo/delete.action?id=", //删除页面地址
		toViewUrl:"/zpCompanyJobInfo/toView.action?id=", //详细页面地址
		getByIdUrl : "/zpCompanyJobInfo/getById.action", //根据id查询对象
		modifyDeleteStatusUrl:"/zpCompanyJobInfo/modifyDeleteStatus.action", //停用 或启用

		
		onlyName :  $("#onlyName"), //修改，唯一验证时需要添加此属性
		m_title : $(".m_title"),//页面标题
		
		addform : jQuery("#addform"), //添加form
		queryfrom :jQuery("#queryForm"), //查询form
		addBtn : $("#addBtn"),//添加按钮
		queryBtn : $("#queryBtn"),//查询按钮
		left_menu_selected_id : "zpCompanyJobInfo_list",
		keyWordLable :$("#keyWordLable"),
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
	 
	 inPersonName : $("#inPersonName"), //录入人
	 companyName : $("#companyName"),
	 
	 coordX : $("#coordX"), //坐标x
	 coordY : $("#coordY"), //坐标y
	 address : 	$("#address"), //工作地点
	 
	 //页面初始化
	 initPage : function (){
			var self = this;
			self.currPage = common.getCurrPageFlag();
			//初始化标题
			common.initPageTitle();
			common.initLeftMenuSelected(self.left_menu_selected_id);
			//列表页面
			if(self.currPage!="list"){
				self.addform.validationEngine({scroll:false});
				self.addBtn.click(function(){
					self.add();
				});
			}
			//查询数据
			if(self.currPage=="list"){
				self.initSeletePage();
			}else
			if(self.currPage=="edit"){
				self.initEditPage();
			} else 
			if(self.currPage=="add"){
				self.initAddPage();
			}else 
			if(self.currPage=="detail"){
				self.initDetailPage();
			}
		},
		
		initSeletePage : function (){
			var self =this;
			self.queryfrom.validationEngine({scroll:false});
			self.queryBtn.click(function(){
				self.query();
			});
	    },
	//列表查询
	query : function(){
		var self = this;
		var b = self.queryfrom.validationEngine('validate');
		if(!b){
			return false;
		}
		
		if(this.expectedYearMoneyStart.val().length>0){
			this.expectedYearMoneyStart.val(parseFloat(this.expectedYearMoneyStart.val())*10000);
		}
		if(this.expectedYearMoneyEnd.val().length>0){
			this.expectedYearMoneyEnd.val(parseFloat(this.expectedYearMoneyEnd.val())*10000);
		}
		var typeId = "";
		if(self.typeId.length!=0){
			typeId=this.typeId.val();
		}
		
		location.href=this.listUrl+"?typeId=" + typeId+"&name=" + this.name.val()+
		"&jobPositionLevelId="+this.jobPositionLevelId.val()+
		"&workTermStart="+this.workTermStart.val()+
		"&workTermEnd="+this.workTermEnd.val()+
		"&expectedYearMoneyStart="+this.expectedYearMoneyStart.val()+
		"&expectedYearMoneyEnd="+this.expectedYearMoneyEnd.val()+
		"&zpUrgencyStatusId="+this.zpUrgencyStatusId.val()+
		"&areaId="+this.areaId.val()
		;
	},
	//跳转列表页面
	tolist : function (){
		location.href=this.listUrl;
	},
	//跳转到添加页面
	toAdd : function (){
		location.href=this.toAddUrl;
	},
	 //跳转修改页面
	toEdit : function (id){
		location.href=this.toEditUrl +id;
   },
   //跳转详情页面
   toDetail : function (id){
		location.href=this.toViewUrl+id;
	},
	//公司职位 添加 
	add : function (){
			var self = this;
			var b = self.addform.validationEngine('validate');
			if(!b){
				return false;
			}
			var desc = CKEDITOR.instances.desc1.getData();
			if(desc.length==0 || desc==""){
				common.alert("请填写职位描述");
				return;
			}
			if(self.coordX.val().length==0){
				common.alert("工作地点无效");
				return;
			}
			if(this.expectedYearMoneyStart.val().length>0){
				this.expectedYearMoneyStart.val(parseFloat(this.expectedYearMoneyStart.val())*10000);
			}
			if(this.expectedYearMoneyEnd.val().length>0){
				this.expectedYearMoneyEnd.val(parseFloat(this.expectedYearMoneyEnd.val())*10000);
			}
			$("#desc").val(desc);
			$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
			
			var keyword = self.getKeyWord();
			//技术评审
			if(employeeType==2){
				if(self.getKeyWordSize()<5){
					common.alert("至少添加5个关键字");
					return;
				}
			}
			self.zpRequire.val(keyword);
			
			
			if(self.currPage=="edit"){
				   common.openModal("delete_sure","确定修改信息吗？");
				   $("#delete_sure_a").click(function(){
					   self.ajaxSubmitForm();
				   });
			} else {
					self.ajaxSubmitForm();
		    }
	},
	//初始化添加页面
	initAddPage : function (){
		var self = this;
		self.address.blur();
		self.addform.attr("action",self.addUrl);
	},
	//初始化详情页面数据
	initDetailPage : function(){
		   var self = this;
			self.getById(self.jobId.val(),function (result){
				if (result.s > 0) {
					self.setForm(result.data);
					self.address.blur();
					$("input").attr("disabled",true);
					self.addBtn.hide();
					$("._detail").show();
					
				}  
				else {
					common.alert(result.d);
				}
			});
	   },
	//提交表单
	ajaxSubmitForm  : function (){
		var self = this;
		self.addform.ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location.href=self.listUrl;
			} else {
				//唯一判断
				if(resp.s==-100) {
					 $("#name").validationEngine("showPrompt",resp.d,"error");
				}
			}
		});	
	},
	//初始化修改页面数据
	initEditPage : function (){
		   var self = this;
			self.getById(this.jobId.val(),function (result){
				if (result.s > 0) {
					self.setForm(result.data);
					self.address.blur();
				}  
				else {
					common.alert(resp.d);
				}
			});
			self.addform.attr("action",self.editUrl);
	   },
	   //根据id查询信息
   getById : function (id,callBack){
		   var self = this;
		   var obj = null;
		   var rData={"id" : id};
			$.ajax({
				url : self.getByIdUrl,
				data : rData,// 
				success :callBack
			});
	   },
	   toDelete : function(id){
		   var self = this;
		   common.openModal("delete_sure","确定删除吗？");
		   $("#delete_sure_a").click(function(){
			  location.href= self.deleteUrl+id; 
		   });
	   },
	   modifyDeleteStatus : function (id,status){
		   var self = this;
		   var delTitle = "";
		   if(status==1){
			   status=2;
			   delTitle="确定暂停吗";
		   } else 
		   if(status==2){
			   status=1;
			   delTitle="确定启用吗?";
		   }	   
		   common.openModal("delete_sure",delTitle);
		   $("#delete_sure_a").click(function(){
			  location.href= self.modifyDeleteStatusUrl+"?id="+id+"&deleteStatus="+status; 
		   });
	   },
	   //填充表单数据
   setForm : function (obj){
	   var self =this;
		    //唯一验证时需要记录原来的名称
		   //this.onlyName.val(obj.name);
		  //赋值
	   //用户详情显示信息
	   self.jobId.val(obj.jobId); //职位id
		$("input[name='companyId'][value='"+obj.companyId+"']").attr("checked",true); //所属公司
		$("input[name='typeId'][value='"+obj.typeId+"']").attr("checked",true); //职位类型
		self.name.val(obj.name); //职位名称
		self.reportObject.val(obj.reportObject); //汇报对象
		$("input[name='jobPositionLevelId'][value='"+obj.jobPositionLevelId+"']").attr("checked",true); //职位级别
		self.zpPersonCount.val(obj.zpPersonCount); //招聘人数
		
		if(obj.expectedYearMoneyStart && obj.expectedYearMoneyStart>0){
			obj.expectedYearMoneyStart = obj.expectedYearMoneyStart/10000;
		}
		
		if(obj.expectedYearMoneyEnd && obj.expectedYearMoneyEnd>0){
			obj.expectedYearMoneyEnd = obj.expectedYearMoneyEnd/10000;
		}
		
		self.expectedYearMoneyStart.val(obj.expectedYearMoneyStart); //预计年薪开始
		self.expectedYearMoneyEnd.val(obj.expectedYearMoneyEnd); //预计年薪结束
		self.workTermStart.val(obj.workTermStart); //工作年限开始
		self.workTermEnd.val(obj.workTermEnd); //工作年限结束
		self.downTeamPersonCount.val(obj.downTeamPersonCount); //团队人数
		
		self.zpRequire.val(obj.zpRequire); //招聘要求
		for(i=0;i<obj.keys.length;i++){
			self.addKeywordLable(obj.keys[i].keyword);
		}
		
		$("input[name='sex'][value='"+obj.sex+"']").attr("checked",true); //要求性别
		$("input[name='educationId'][value='"+obj.educationId+"']").attr("checked",true); //要求学历
		$("input[name='englishLevelId'][value='"+obj.englishLevelId+"']").attr("checked",true); //要求英语等级
		self.ageStart.val(obj.ageStart); //年龄开始
		self.ageEnd.val(obj.ageEnd); //年龄结束
		$("input[name='maritalId'][value='"+obj.maritalId+"']").attr("checked",true); //婚否
		self.topSpecialty.val(obj.topSpecialty); //要求专业
		self.jobTemptText.val(obj.jobTemptText); //职位诱惑
		self.jobTemptItem.val(obj.jobTemptItem); //诱惑都好项,逗号分隔
		
		
		CKEDITOR.instances.desc1.setData(obj.desc);
		CKEDITOR.instances.desc2.setData(obj.moreDesc);
		
		//self.desc.val(obj.desc); //职位描述
		//self.moreDesc.val(obj.moreDesc); //更多描述
		
		self.inPerson.html(obj.inPerson);
		
		if(obj.inDatetime && obj.inDatetime>0){
		  var new1 = new Date(obj.inDatetime).format("yyyy-MM-dd HH:mm");
		  self.inDatetime.html(new1); //录入时间
		}
		
		if(obj.lastUpdateTime && obj.lastUpdateTime>0){
		  var new1 = new Date(obj.lastUpdateTime).format("yyyy-MM-dd HH:mm");
		  self.lastUpdateTime.html(new1); //最后更新时间
		}
		
                //启用状态
		if(obj.isDelete && obj.isDelete==1){
			self.isDelete.html("启用");
        	}else
    	 //停用状态
		if(obj.isDelete && obj.isDelete==2){
			self.isDelete.html("暂停");
			}
		$("input[name='zpUrgencyStatusId'][value='"+obj.zpUrgencyStatusId+"']").attr("checked",true); //招聘紧急状态
		$("input[name='areaId'][value='"+obj.areaId+"']").attr("checked",true); //所在城区
		
		self.inPersonName.html(obj.inPersonName); //录入人
		self.companyName.html(obj.companyName);
		
		self.coordX.val(obj.coordX); //坐标x
		self.coordY.val(obj.coordY); //坐标y
		self.address.val(obj.address);//所在地
		

   },
   setLgltInfo : function (val){
		var self =this
		if(val.length==0){
			self.coordX.val("");
			self.coordY.val("");
	}else {
			geocoder(val,function(status, result){
				if (status === 'complete' && result.info === 'OK')
				{
					  var geocode = new Array();
					    geocode = result.geocodes;
					    for (var i = 0; i < geocode.length; i++) {
					    	self.coordX.val(geocode[i].location.getLng());
					        self.coordY.val(geocode[i].location.getLat());
					        addmarker(i, geocode[i]);
					    }
					    map.setFitView();
	            }else 
            	if(status === 'no_data'){
            		self.coordX.val("");
        			self.coordY.val("");
        			common.alert("工作地点无效");
    				return;
	            }
			});
	}
	},
	//添加关键字标签
	addKeywordLable:function(value){
		value=$.trim(value);
		if(value.length==0){
			common.alert("请添加关键字");
			return;
		}
		var self = this;
		if(!self.checkkeywordExits(value)){
			var lable = '<button type="button" style="margin-left:10px;" class="btn btn-small" ondblclick="$(this).remove();">'+value+'</button>';
			self.keyWordLable.append(lable);
		}
	},
	checkkeywordExits:function(keyword){
		var self = this;
		var flag = false;
		var buttons = self.keyWordLable.find("button");
		if(buttons.length==0){
			return false;
		}
		var butArr = buttons.get();
		for(i=0;i<butArr.length;i++){
			if(butArr[i].innerHTML==keyword){
				return true;
			}
		}
		return false;
	},
	getKeyWord:function(){
		var self = this;
		var keys="";
		var buttons = self.keyWordLable.find("button");
		if(buttons.length==0){
			return keys;
		}
		var butArr = buttons.get();
		for(i=0;i<butArr.length;i++){
			if(i==0){
				keys=butArr[i].innerHTML;
			}else{
				keys=keys+","+butArr[i].innerHTML;
			}
		}
		return keys;
	},
	
	getKeyWordSize:function(){
		var self = this;
		return self.keyWordLable.find("button").length;
	}
}
