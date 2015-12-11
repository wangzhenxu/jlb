//推荐流程
var headhunterInterface = {
	//请求url
	listUrl:"/zpRecommendFlowInfo/headhunterInterfaceList.action", //列表地址
	toAddUrl:"/zpRecommendFlowInfo/toAdd.action", //去添加页面地址
	addUrl:"/zpRecommendFlowInfo/add.action", //添加地址
	toEditUrl:"/zpRecommendFlowInfo/toEdit.action?id=", //去修改页面地址
	editUrl:"/zpRecommendFlowInfo/edit.action", //去修改页面地址
	deleteUrl :"/zpRecommendFlowInfo/delete.action?id=", //删除页面地址
	toViewUrl:"/zpRecommendFlowInfo/toView.action?id=", //详细页面地址
	getByIdUrl : "/zpRecommendFlowInfo/getById.action", //根据id查询对象
	modifyDeleteStatusUrl:"/zpRecommendFlowInfo/modifyDeleteStatus.action", //停用 或启用
	checkNameExitsUrl : "/zpRecommendFlowInfo/checkNameExits.action", //检验唯一性
	addAuditUrl : "/zpRecommendFlowInfo/addAudit.action", //添加评审,
	headhunterNotifyFeedbackUrl : "/zpRecommendFlowInfo/headhunterNotifyFeedback.action", //求职者反馈,
	companyRecommandFeedbackUrl : "/zpRecommendFlowInfo/companyRecommandFeedback.action", //公司反馈,
	isGotoInterviewFeedbackUrl : "/zpRecommendFlowInfo/isGotoInterviewFeedback.action", //公司反馈,
	interviewerFeedbackUrl : "/zpRecommendFlowInfo/interviewerFeedback.action", //公司反馈,


	

	onlyName :  $("#onlyName"), //修改，唯一验证时需要添加此属性
	m_title : $(".m_title"),//页面标题
	_title_val : "企业对接",
	
	addform : jQuery("#addform"), //添加form
	queryfrom :jQuery("#queryForm"), //查询form
	addBtn : $("#addBtn"),//添加按钮
	queryBtn : $("#queryBtn"),//查询按钮
	left_menu_selected_id : "zpRecommendFlowInfo_list",   //左侧菜单选择id  


	//属性
	
	auditId : $("#auditId"), //auditId
	companyJobId : $("#companyJobId"), //公司职位
	jlId : $("#jlId"), //简历id
	enterpriseName : $("#enterpriseName"), //enterpriseName
	technicianAuditPerson : $("#technicianAuditPerson"), //技术审核人
	technicianAuditContent : $("#technicianAuditContent"), //技术评审内容
	technicianAuditTime : $("#technicianAuditTime"), //技术评审时间
	technicianAuditStatus :$("#technicianAuditStatus"),//技术评审状态
	enterpriseDockingPerson : $("#enterpriseDockingPerson"), //企业对接人
	enterpriseDockingStatus : $("#enterpriseDockingStatus"), //企业对接状态
	enterpriseDockingTime : $("#enterpriseDockingTime"), //企业对接人反馈时间
	enterpriseReplyStatus : $("#enterpriseReplyStatus"), //企业反馈状态
	enterpriseReplyContent : $("#enterpriseReplyContent"), //企业反馈内容
	enterpriseReplyTime : $("#enterpriseReplyTime"), //企业反馈时间
	hrNoticePerson : $("#hrNoticePerson"), //hr通知人
	hrNoticeStatus : $("#hrNoticeStatus"), //hr通知状态
	hrNoticeTime : $("#hrNoticeTime"), //hr_通知时间
	hrNoticeFeedbackContent : $("#hrNoticeFeedbackContent"), //hr_通知后的反馈内容
	enterpriseInvitationTime : $("#enterpriseInvitationTime"), //企业要求面试时间
	hrBeforeNotifyHunterStatus : $("#hrBeforeNotifyHunterStatus"), //hr提前通知状态
	hrBeforeNotifyHunterTime : $("#hrBeforeNotifyHunterTime"), //hr提前通知时间
	hrBeforeNotifyHunterPerson : $("#hrBeforeNotifyHunterPerson"), //hrBeforeNotifyHunterPerson
	hunterGotoInterviewStatus : $("#hunterGotoInterviewStatus"), //求职者是否已经去面试
	hunterReplayContent : $("#hunterReplayContent"), //求职者反馈
	lastUpdateTime : $("#lastUpdateTime"), //最后更新时间
	lastUpdatePerson : $("#lastUpdatePerson"), //最后更新人
	inTime : $("#inTime"), //录入时间
	flowStatus : $("#flowStatus"), //流程状态
	inPerson : $("#inPerson"), //录入人
	inPersonName : $("#inPersonName"),
	//页面初始化
	initPage : function (){
		var self = this;
		self.currPage = common.getCurrPageFlag();
		//common.initLeftMenuSelected(self.left_menu_selected_id);

		//初始化标题
		common.initPageTitle(self._title_val,self.m_title);
		//列表页面
		self.currPage="list";
		if(self.currPage!="list"){
			self.addform.validationEngine({scroll:false});
			self.addBtn.click(function(){
				self.add();
			});
		}
		if(self.currPage=="list"){
			self.initSeletePage();
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
		var serializeObj = common.serializeJson("queryForm");
		var jsonStr = JSON.stringify(serializeObj)
		location.href=this.listUrl+"?jsonParam="+jsonStr;
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
	//初始化添加页面
	initAddPage : function (){
		var self = this;
		self.addform.attr("action",self.addUrl);
		//检验名称唯一性
		/*self.name.blur(function(){
				if($.trim(this.value).length>0){
					var param = {flag : common.getCurrPageFlag(),name:this.value};
					self.checkNameExits(param,self.checkNameExitCallBack);
				} 
		});*/
		
		
	},
	//初始化详情页面数据
	initDetailPage : function(){
		   var self = this;
			self.getById(self.auditId.val(),function (result){
				if (result.s > 0) {
					self.setForm(result.data);
					$("input").attr("disabled",true);
					self.addBtn.hide();
					$("._detail").show();
				}//不存在
				else if (result.s==-1000) {
					location.href = common.notFindUrl;
				}  
				else {
					common.alert(result.d);
				}
			});
	   },
	
	//推荐流程 添加 
	add : function (){
			var self = this;
			var b = self.addform.validationEngine('validate');
			if(!b){
				return false;
			}
			//$("#desc").val(CKEDITOR.instances.desc1.getData());
			//$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
			if(self.currPage=="edit"){
				   common.openModal("delete_sure","确定修改信息吗？");
				   $("#delete_sure_a").click(function(){
					   self.ajaxSubmitForm();
				   });
			} else {
					self.ajaxSubmitForm();
		    }
	},
	//提交表单
	ajaxSubmitForm  : function (f_callback){
		var self = this;
		if(f_callback && typeof f_callback == "function"){
			self.addform.ajaxSubmit(f_callback);
		} else {
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
		}
		
		
	},
	//初始化修改页面数据
	initEditPage : function (){
		var self = this;
		self.getById(this.auditId.val(),function (result){
			if (result.s > 0) {
				self.setForm(result.data);
			}//不存在
			else if (result.s==-1000) {
				location.href = common.notFindUrl;
			}  
			else {
				common.alert(resp.d);
			}
		});
		self.addform.attr("action",self.editUrl);
		//检验名称唯一性
		/*self.name.blur(function(){
				if($.trim(this.value).length>0){
					var param = {flag : common.getCurrPageFlag(),name:this.value,oldname:self.onlyName.val()};
					self.checkNameExits(param,self.checkNameExitCallBack);
				} 
		});*/
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
   //删除
   toDelete : function(id){
	   var self = this;
	   common.openModal("delete_sure","确定删除吗？");
	   $("#delete_sure_a").click(function(){
		  location.href= self.deleteUrl+id; 
	   });
   },
   //更新删除状态
   modifyDeleteStatus : function (id,status){
	   var self = this;
	   var delTitle = "";
	   if(status==1){
		   status=2;
		   delTitle="确定暂停吗?";
	   } else 
	   if(status==2){
		   status=1;
		   delTitle="确定启用吗？";
	   }	   
	   common.openModal("delete_sure",delTitle);
	   $("#delete_sure_a").click(function(){
		  location.href= self.modifyDeleteStatusUrl+"?id="+id+"&deleteStatus="+status; 
	   });
   },
   //填充表单数据
   setForm : function (obj){
	   var self = this;
	    //唯一验证时需要记录原来的名称
	   self.onlyName.val(obj.name);
	   //赋值
		self.auditId.val(obj.auditId); //auditId
		
		//用户详情显示信息
		$("input[name='companyJobId'][value='"+obj.companyJobId+"']").attr("checked",true); //公司职位
		$("input[name='jlId'][value='"+obj.jlId+"']").attr("checked",true); //简历id
		self.enterpriseName.val(obj.enterpriseName); //enterpriseName
		self.technicianAuditPerson.val(obj.technicianAuditPerson); //技术审核人
		self.technicianAuditContent.val(obj.technicianAuditContent); //技术评审内容
		if(obj.technicianAuditTime && obj.technicianAuditTime>0){
			var new1 = new Date(obj.technicianAuditTime).format("yyyy-MM");
			self.technicianAuditTime.val(new1); //技术评审时间
		}
		self.enterpriseDockingPerson.val(obj.enterpriseDockingPerson); //企业对接人
		$("input[name='enterpriseDockingStatus'][value='"+obj.enterpriseDockingStatus+"']").attr("checked",true); //企业对接状态
		if(obj.enterpriseDockingTime && obj.enterpriseDockingTime>0){
			var new1 = new Date(obj.enterpriseDockingTime).format("yyyy-MM");
			self.enterpriseDockingTime.val(new1); //企业对接人反馈时间
		}
		self.enterpriseReplyStatus.val(obj.enterpriseReplyStatus); //企业反馈状态
		self.enterpriseReplyContent.val(obj.enterpriseReplyContent); //企业反馈内容
		if(obj.enterpriseReplyTime && obj.enterpriseReplyTime>0){
			var new1 = new Date(obj.enterpriseReplyTime).format("yyyy-MM");
			self.enterpriseReplyTime.val(new1); //企业反馈时间
		}
		self.hrNoticePerson.val(obj.hrNoticePerson); //hr通知人
		$("input[name='hrNoticeStatus'][value='"+obj.hrNoticeStatus+"']").attr("checked",true); //hr通知状态
		if(obj.hrNoticeTime && obj.hrNoticeTime>0){
			var new1 = new Date(obj.hrNoticeTime).format("yyyy-MM");
			self.hrNoticeTime.val(new1); //hr_通知时间
		}
		self.hrNoticeFeedbackContent.val(obj.hrNoticeFeedbackContent); //hr_通知后的反馈内容
		if(obj.enterpriseInvitationTime && obj.enterpriseInvitationTime>0){
			var new1 = new Date(obj.enterpriseInvitationTime).format("yyyy-MM");
			self.enterpriseInvitationTime.val(new1); //企业要求面试时间
		}
		if(obj.hrBeforeNotifyHunterStatus && obj.hrBeforeNotifyHunterStatus>0){
			var new1 = new Date(obj.hrBeforeNotifyHunterStatus).format("yyyy-MM");
			self.hrBeforeNotifyHunterStatus.val(new1); //hr提前通知状态
		}
		if(obj.hrBeforeNotifyHunterTime && obj.hrBeforeNotifyHunterTime>0){
			var new1 = new Date(obj.hrBeforeNotifyHunterTime).format("yyyy-MM");
			self.hrBeforeNotifyHunterTime.val(new1); //hr提前通知时间
		}
		self.hrBeforeNotifyHunterPerson.val(obj.hrBeforeNotifyHunterPerson); //hrBeforeNotifyHunterPerson
		$("input[name='hunterGotoInterviewStatus'][value='"+obj.hunterGotoInterviewStatus+"']").attr("checked",true); //求职者是否已经去面试
		self.hunterReplayContent.val(obj.hunterReplayContent); //求职者反馈
		if(obj.lastUpdateTime && obj.lastUpdateTime>0){
		  var new1 = new Date(obj.lastUpdateTime).format("yyyy-MM-dd HH:mm");
		  self.lastUpdateTime.html(new1); //最后更新时间
		}
			
		//其它属性
		self.lastUpdatePerson.val(obj.lastUpdatePerson); //最后更新人
		if(obj.inTime && obj.inTime>0){
		  var new1 = new Date(obj.inTime).format("yyyy-MM-dd HH:mm");
		  self.inTime.html(new1); //录入时间
		}
			
		//其它属性
		$("input[name='flowStatus'][value='"+obj.flowStatus+"']").attr("checked",true); //流程状态
		self.inPerson.html(obj.inPerson);
			
		//其它属性
		self.inPersonName.html(obj.inPersonName);
   },
   //检查名称唯一性
   checkNameExits : function (param,callBack){
	   var self =this;
		$.ajax({
			url : self.checkNameExitsUrl,
			data : param,// 
			success :callBack
		});
   },
   //检查名称，回调
   checkNameExitCallBack : function (result){
	   if (result.s < 0) {
		   common.alert(result.d,2000);
	   }  
   },
  
   initAddAudit : function (){
	   var self = this;
	   self.addform.validationEngine({scroll:false});
	   self.addform.attr("action",self.addAuditUrl);
		self.addBtn.click(function(){
			var b = self.addform.validationEngine('validate');
			if(!b){
				return false;
			}
		   self.ajaxSubmitForm(self.callback_initAddAudit);
		});
   },
   callback_initAddAudit : function (resp){
	   if (resp.s > 0) {
		   common.alert("谢谢你评审哦！");
		   location.reload();
		} else {
			 common.alert(resp.d);
		}
   },
   disableTechnicianAuditInput : function (){
	   $("input[name=technicianAuditStatus]").attr("disabled",true);
	   $("textarea[name=technicianAuditContent]").attr("disabled",true);
   },
   //评审
	audit : function (auditId,name){
		var self =this
		$("#audit_name").html(name);
		 $("#auditPersonPop").modal().css({
             'width':'798px',
             'margin-top': '-150px',	                
             'margin-left': function () {
            	 return -($(this).width()/2);
             }
		});
		 $("#addAuditBtn").unbind("click").click(function(){
			var hrNoticeStatus=$("#hrNoticeStatus :selected").val();
			var hrNoticeFeedbackContent = $("#hrNoticeFeedbackContent").val();
			if(hrNoticeStatus==""){
				common.alert("请选择状态");
				return;
			}
			if(hrNoticeStatus=="119" && hrNoticeFeedbackContent==""){
				common.alert("请输入反馈内容");
				return;
			}
			common.openModal("delete_sure","确定无误吗？");
		    $("#delete_sure_a").click(function(){
				self.headhunterNotifyFeedback(auditId,hrNoticeStatus,hrNoticeFeedbackContent);
		    });
		});
	},
	
	headhunterNotifyFeedback : function (auditId,hrNoticeStatus,hrNoticeFeedbackContent){
		var self =this;
		$.post(self.headhunterNotifyFeedbackUrl,{auditId:auditId,hrNoticeStatus:hrNoticeStatus,hrNoticeFeedbackContent:hrNoticeFeedbackContent},function(result){
			if (result.s > 0) {
				location.reload();
			}  
			else {
				common.alert(result.d);
			}
		});
	},
	recommandJlToCompany : function(auditId){
	   var self = this;
	   common.openModal("delete_sure","确定已经推荐过去了？");
	   $("#delete_sure_a").click(function(){
			location=self.recommandJlToCompanyUrl+"?auditId="+auditId;
	   });
	},
	
	//是否面试弹层
	openIsGotoInterviewPopFeedbackPop : function (auditId,name){
		var self =this
		$("#isGotoInterviewPop_audit_name").html(name);
		 $("#isGotoInterviewPop").modal().css({
             'width':'798px',
             'margin-top': '-150px',	                
             'margin-left': function () {
            	 return -($(this).width()/2);
             }
		});
		 $("#isGotoInterviewAddAuditBtn").unbind("click").click(function(){
			var hunterGotoInterviewStatus=$("input[name=hunterGotoInterviewStatus]:checked");
			var hunterReplayContent = $("#hunterReplayContent").val();
			if(hunterGotoInterviewStatus.length==0){
				common.alert("请选择状态");
				return;
			}
			if(hunterGotoInterviewStatus.val()=="9" && hunterReplayContent==""){
				common.alert("请输入反馈内容");
				return;
			}
			common.openModal("delete_sure","确定无误吗？");
		    $("#delete_sure_a").click(function(){
				self.isGotoInterviewFeedback(auditId,hunterGotoInterviewStatus.val(),hunterReplayContent);
		    });
		});
	},
	//是否面试反馈
	isGotoInterviewFeedback : function (auditId,hunterGotoInterviewStatus,hunterReplayContent){
		var self =this;
		$.post(self.isGotoInterviewFeedbackUrl,{auditId:auditId,hunterGotoInterviewStatus:hunterGotoInterviewStatus,hrNoticeFeedbackContent:hunterReplayContent},function(result){
			if (result.s > 0) {
				location.reload();
			}  
			else {
				common.alert(result.d);
			}
		});
	},
	
	//面试反馈弹层
	openInterviewerFeedbackPop : function (auditId,name){
		var self =this
		$("#audit_name").html(name);
		 $("#interviewerPop").modal().css({
             'width':'798px',
             'margin-top': '-150px',	                
             'margin-left': function () {
            	 return -($(this).width()/2);
             }
		});
		 $("#interviewerAddAuditBtn").unbind("click").click(function(){
			var hunterInterviewStatus=$("input[name=hunterInterviewStatus]:checked");
			var hunterInerviewReplayContent = $("#hunterInerviewReplayContent").val();
			if(hunterInterviewStatus.length==0){
				common.alert("请选择状态");
				return;
			}
			if(hunterInterviewStatus.val()=="11" && hunterInerviewReplayContent==""){
				common.alert("请输入反馈内容");
				return;
			}
			common.openModal("delete_sure","确定无误吗？");
		    $("#delete_sure_a").click(function(){
				self.interviewerFeedback(auditId,hunterInterviewStatus.val(),hunterInerviewReplayContent);
		    });
		});
	},
	//面试反馈
	interviewerFeedback : function (auditId,hunterInterviewStatus,hunterInerviewReplayContent){
		var self =this;
		$.post(self.interviewerFeedbackUrl,{auditId:auditId,hunterInterviewStatus:hunterInterviewStatus,hunterInerviewReplayContent:hunterInerviewReplayContent},function(result){
			if (result.s > 0) {
				location.reload();
			}  
			else {
				common.alert(result.d);
			}
		});
	}
}
