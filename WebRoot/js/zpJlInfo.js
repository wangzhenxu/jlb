var jlInfo ={
		//请求url
		listUrl:"/zpJlInfo/list.action", //列表地址
		toAddUrl:"/zpJlInfo/toAdd.action", //去添加页面地址
		addUrl:"/zpJlInfo/add.action", //添加地址
		toEditUrl:"/zpJlInfo/toEdit.action?id=", //去修改页面地址
		editUrl:"/zpJlInfo/edit.action", //去修改页面地址
		deleteUrl :"/zpJlInfo/delete.action?id=", //删除页面地址
		toViewUrl:"/zpJlInfo/toView.action?id=", //详细页面地址
		getByIdUrl : "/zpJlInfo/getById.action", //根据id查询对象
		modifyDeleteStatusUrl:"/zpJlInfo/modifyDeleteStatus.action", //停用 或启用
		getAuditPersonsUrl:"/zpJlInfo/getAuditPersons.action", //获取评审列表
		assignAuditPersonUrl:"/zpJlInfo/assignAuditPerson.action", //设置评审人
		checkJlCountUrl : "/zpJlInfo/checkJlCount.action",
		


		onlyName :  $("#onlyName"), //修改，唯一验证时需要添加此属性
		phoneT :  $("#phoneT"), //phone
		
		m_title : $(".m_title"),//页面标题
		_title_val : "简历",
		
		addform : jQuery("#addform"), //添加form
		queryfrom :jQuery("#queryForm"), //查询form
		addBtn : $("#addBtn"),//添加按钮
		left_menu_selected_id : "zpJlInfo_list",    
		//属性
		
		jlId : $("#jlId"), //jlId
		name : $("#name"), //姓名
		sex : $("#sex"), //性别 0 男 1女
		jobId : $("#jobId"), //jobId
		emal : $("#emal"), //邮箱
		phone : $("#phone"), //手机号
		identityCard : $("#identityCard"), //身份证
		maritalId : $("#maritalId"), //婚否
		salaryRequireId : $("#salaryRequireId"), //薪水要求
		famousCompanyUpdateStatus : $("#famousCompanyUpdateStatus"), //知名企业分析状态
		educationId : $("#educationId"), //学历id
		schoolTag : $("#schoolTag"), //最高毕业学校
		lastOperatorTime : $("#lastOperatorTime"), //最后更新时间
		jobStartTime : $("#jobStartTimeT"), //工作开始时间
		importStatus : $("#importStatus"), //导入状态
		jobPositionId : $("#jobPositionId"), //职位id
		jobPositionLevelId : $("#jobPositionLevelId"), //职位级别id
		nowAddress : $("#nowAddress"), //现住址
		englishLevelId : $("#englishLevelId"), //英语等级
		topSpecialty : $("#topSpecialty"), //专业
		birthday : $("#birthday"), //生日（年月）
		coordX : $("#coordX"), //坐标x
		coordY : $("#coordY"), //坐标y
		isDistanceRequired : $("#isDistanceRequired"), //距离要求
		inTime : $("#inTime"), //录入时间
		inPersion : $("#inPersion"), //录入人
		inPersonName : $("#inPersonName"), //录入人
		jlContent2 :$("#jlContent2"),
		
		oldFilePath : $("#oldFilePath"), //原来的文件路径
		//页面初始化
		initPage : function (){
			var self = this;
			self.currPage = common.getCurrPageFlag();
			common.initLeftMenuSelected(self.left_menu_selected_id);
			self.addform.validationEngine({scroll:false});
			self.addBtn.click(function(){
				self.add();
			});
			//初始化标题
			self.initPageTitle();
			//查询数据
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
		//初始化页面标题
		initPageTitle : function (){
			var self = this;
			var attrVal = self._title_val;
			if(self.currPage=="edit"){
				this.m_title.html("修改"+attrVal+"信息");
			} else 
			if(self.currPage=="add"){
				this.m_title.html("添加"+attrVal);
			}else 
			if(self.currPage=="detail"){
				this.m_title.html(attrVal+"详情");
			}else 
			if(self.currPage=="list"){
				this.m_title.html(attrVal+"管理");
			}	
		},
		//列表查询
		query : function(){
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
		},
		//初始化详情页面数据
		initDetailPage : function(){
			   var self = this;
				self.getById(self.jlId.val(),function (result){
					if (result.s > 0) {
						self.setForm(result.data);
						$("input").attr("disabled",true);
						self.addBtn.hide();
						$("._detail").show();
					}  //不存在
					else if (result.s==-1000) {
						location.href = common.notFindUrl;
					}
					else {
						common.alert(result.d);
					}
				});
		   },
		
		//简历信息 添加 
		add : function (){
				var self = this;
				var b = self.addform.validationEngine('validate');
				if(!b){
					return false;
				}
				var jobPositionLevelIds = common.getCheckbox("jobPositionLevelId");
				$("#jobPositionLevelIds").val(jobPositionLevelIds);
				//$("#desc").val(CKEDITOR.instances.desc1.getData());
				//$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
				//设置坐标信息
				if(self.currPage=="edit"){
					   common.openModal("delete_sure","确定修改信息吗？");
					   $("#delete_sure_a").click(function(){
						   self.ajaxSubmitForm();
					   });
				} else {
				    if($("#jlFilePath").val().length==0){
				    	common.alert("请先上传简历");
				    	return;
				}
						self.ajaxSubmitForm();
			    }
		},
		//提交表单
		ajaxSubmitForm  : function (){
			var self = this;
			self.addform.ajaxSubmit(function(resp) {
				if (resp.s > 0) {
					location.href=self.listUrl;
				} else
				{
					common.alert(resp.d);
					return;
				}
			});	
		},
		//初始化修改页面数据
		initEditPage : function (){
			var self = this;
			self.getById(this.jlId.val(),function (result){
				if (result.s > 0) {
					self.setForm(result.data);
				} else
				//不存在
				if (result.s==-1000) {
					location.href = common.notFindUrl;
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
		   self.onlyName.val(obj.emal);
		   self.phoneT.val(obj.phone);
		   self.oldFilePath.val(obj.jlFilePath);
		   
		   //赋值
			self.jlId.val(obj.jlId); //jlId
			
			//用户详情显示信息
			self.name.val(obj.name); //姓名
			$("input[name='sex'][value='"+obj.sex+"']").attr("checked",true); //性别 0 男 1女
			$("input[name='jobId'][value='"+obj.jobId+"']").attr("checked",true); //jobId
			self.emal.val(obj.emal); //邮箱
			self.phone.val(obj.phone); //手机号
			self.identityCard.val(obj.identityCard); //身份证
			$("input[name='maritalId'][value='"+obj.maritalId+"']").attr("checked",true); //婚否
			$("input[name='salaryRequireId'][value='"+obj.salaryRequireId+"']").attr("checked",true); //薪水要求
			self.famousCompanyUpdateStatus.val(obj.famousCompanyUpdateStatus); //知名企业分析状态
			$("input[name='educationId'][value='"+obj.educationId+"']").attr("checked",true); //学历id
			self.schoolTag.val(obj.schoolTag); //最高毕业学校
			if(obj.lastOperatorTime && obj.lastOperatorTime>0){
				var new1 = new Date(obj.lastOperatorTime).format("yyyy-MM");
				self.lastOperatorTime.val(new1); //最后更新时间
			}
			if(obj.jobStartTime && obj.jobStartTime>0){
				var new1 = new Date(obj.jobStartTime).format("yyyy-MM");
				self.jobStartTime.val(new1); //工作开始时间
			}
			self.importStatus.val(obj.importStatus); //导入状态
			$("input[name='jobPositionId'][value='"+obj.jobPositionId+"']").attr("checked",true); //职位id
			
			for(var i=0;i<obj.zpJlJobLevels.length;i++){
				var jobLevel = obj.zpJlJobLevels[i];
				$("input[name='jobPositionLevelId'][value='"+jobLevel.jobLevelId+"']").attr("checked",true); //职位级别id
			}
			//$("input[name='jobPositionLevelId'][value='"+obj.jobPositionLevelId+"']").attr("checked",true); //职位级别id
			
			self.nowAddress.val(obj.nowAddress); //现住址
			$("input[name='englishLevelId'][value='"+obj.englishLevelId+"']").attr("checked",true); //英语等级
			self.topSpecialty.val(obj.topSpecialty); //专业
			if(obj.birthday && obj.birthday>0){
				var new1 = new Date(obj.birthday).format("yyyy-MM");
				self.birthday.val(new1); //生日（年月）
			}
			self.coordX.val(obj.coordX); //坐标x
			self.coordY.val(obj.coordY); //坐标y
			$("input[name='isDistanceRequired'][value='"+obj.isDistanceRequired+"']").attr("checked",true); //距离要求
			if(obj.inTime && obj.inTime>0){
			  var new1 = new Date(obj.inTime).format("yyyy-MM-dd HH:mm");
			  self.inTime.html(new1); //录入时间
			}
				
			//其它属性
			self.inPersonName.html(obj.inPersonName); //录入人
			if(obj.jlContent && obj.jlContent.length>0){
				self.jlContent2.html(obj.jlContent);
			}
	   },
	upload :function (sender){
		if(!sender.value.endWith("doc") && !sender.value.endWith("docx") ){
			hiOverAlert("目前只支持上传word文件",1000);
			return;
		}
		 var oldForm=$(sender).closest("form");
		   $.ajaxFileUpload({
			url:'/zpJlInfo/paseWord.action?jlId='+this.jlId.val(), //需要链接到服务器地址
			type:"POST",
			async:false,
			secureuri:false,
		 	fileElementId:'ui-upload-input', //文件选择框的id属性
			//oldForm:oldForm,// 原formID
			success:function(result,status){ //相当于java中try语句块的用法 data是从服务器返回来的值 
				//{"data":{"name":null,"inTime":null,"jlId":null,"sex":1,"jobId":null,"emal":null,"phone":null,"maritalId":null,"schoolTag":null,"inPersion":null,"identityCard":"130221199102064850","salaryRequireId":null,"famousCompanyUpdateStatus":null,"educationId":null,"lastOperatorTime":null,"jobStartTime":null,"importStatus":null,"jobPositionId":null,"jobPositionLevelId":null},"s":1,"d":"ok"}
				/*if(!result || result.length==0){
					common.alert("无法解析此文档，请另存为word2003，在上传",2000);
					return;
				}*/
					/*try{
					eval('(' +$(result.body).html()+ ')');
					} catch(error){
						//alert(error);
						common.alert("此文档不是标准文档，解析不了",2000);

						return;
					}*/
				result= eval('(' +$(result.body).html()+ ')');
				var st=result.s;
				var sd=result.d;
					if(st==1){
						$("#addform").resetForm();
						jlInfo.setFormT(result.data);
					}
					else if(st==-100 || st==-2){
						common.alert(sd,2000);
						return;
					}
					else{
						$.validationEngine.buildPrompt('#ui-upload-holder','请上传大小在1M以内的图片','error');
					}
		 	}, 
		 });
	},
	
	setFormT : function (obj){
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
		if(obj.topSpecialty && obj.topSpecialty.length>0){
			$("#topSpecialty").val(obj.topSpecialty);
		}
		if(obj.birthday && obj.birthday>0){
			var new1 = new Date(obj.birthday).format("yyyy-MM");
			$("#birthday").val(new1);
		}
		if(obj.educationId && obj.educationId>0){
			$("input[name=educationId][value="+obj.educationId+"]").attr("checked",true);
		}
		if(obj.englishLevelId && obj.englishLevelId>0){
			$("input[name=englishLevelId][value="+obj.englishLevelId+"]").attr("checked",true);
		}
		if(obj.jobStartTime && obj.jobStartTime>0){
			var new1 = new Date(obj.jobStartTime).format("yyyy-MM");
			$("#jobStartTimeT").val(new1);
		}
		if(obj.jlFilePath && obj.jlFilePath.length>0){
			$("#jlFilePath").val(obj.jlFilePath);
		}
		if(obj.jlContent && obj.jlContent.length>0){
			$("#jlContent").val(obj.jlContent);
		}
	},
	
	matchJob : function (jlId){
		var rData={"jlId" : jlId};
		$.ajax({
			async : true, // 使用同步请求，因为异步请求不能将返回值传给全局变量；
			url : "/zpJobMatchingInfo/matchCheck.action",
			data : rData,// "st=2012-11-01 22:22:10",
			success : function(resp) {
				//resp.s=-100;
				if (resp.s > 0) {
					location.href= "/zpJobMatchingInfo/match.action?jlId="+ jlId;
				}  else
				if (resp.s == -100) {
					common.openModal("match_job_pop","已经匹配过了");
					//查看匹配结果
					$("#selete_match_btn").click(function (){
						location.href="/zpJobMatchingInfo/list.action?jlId="+jlId;
					});
					//重新匹配职位
					$("#match_job_btn").click(function (){
						location.href="/zpJobMatchingInfo/match.action?jlId="+jlId;
					});
				}
				else {
					hiOverAlert(resp.d,1000);
				}
			}
		});
	},
	downJl : function (path){
		window.open(path);
	},
	
	selectAuditPerson: function(){
		var self = this;
		if($(".check:checked").length==0){
			common.alert("请先选择简历");
			return;
		}
		var jls = $(".check:checked").get();
		var idsArr =[];
		var postionArr=[];
		
		
		for(i=0;i<jls.length;i++){
			if($(jls[i]).attr("auditTypeAttr")!=9){
				common.alert($(jls[i]).attr("nameAttr")+"已经评审过了",2000);
				return;
			}
			idsArr.push(jls[i].value);
			postionArr.push($(jls[i]).attr("postionAttr"));
		}
		
		var newArray =postionArr.unique();
		if(newArray.length>1){
			common.alert("请选择相同的职位",2000);
			return;
		}
		
		$.get(self.getAuditPersonsUrl,{"jobPositionId":postionArr.join(",")},function(result){
			if (result.s > 0) {
				if(result.data==null || result.data.length==0){
					return;
				}
				$("#auditPersonPop table tr:not(:first)").remove()
				for(var i=0;i<result.data.length;i++){
					var obj =result.data[i];
					if(obj.lastAuditTime && obj.lastAuditTime>0){
						obj.lastAuditTime = new Date(obj.lastAuditTime).format("yy-MM-dd HH:mm");
					} else {
						obj.lastAuditTime="无";
					}
					//obj.allowAuditCount=0;
					var tr=
					'<tr>'
					+'<td align="center" class="hui"><input type="radio" class="radio" name="auditPerson" value="'+obj.auditPerson+'" /></td>'
					+'<td align="center" class="hui">'+obj.auditPersonName+'</td>'
					+'<td align="center" class="hui">'+obj.allowAuditCount+'</td>'
					+'<td align="center" class="hui">'+obj.waitAuditCount+'</td>'
					+'<td align="center" class="hui">'+obj.auditCount+'</td>'
					+'<td align="center" class="hui">'+obj.lastAuditTime+'</td>'
				   +'</tr>';
					$("#auditPersonPop table").append(tr);
					//已满
					if(obj.allowAuditCount==0){
						$("#auditPersonPop table tr").last().find("input").hide();
					}
				}
			}else {
				hiOverAlert(resp.d,1000);
			}
	    });
		
		 $("#auditPersonPop").modal().css({
             'width':'798px',
             'margin-top': '-150px',	                
             'margin-left': function () {
            	 return -($(this).width()/2);
             }
		});
		 
		$("#addAuditBtn").unbind("click").click(function (){
			if($('[name=auditPerson]:checked').length==0){
				common.alert("请选择技术评审");
				return;
			}
			self.assignAuditPerson(idsArr.join(","),$('[name=auditPerson]:checked').val());
		}); 
	},
	
	assignAuditPerson : function (jlIds,auditPerson){
		var self =this;
		$.post(self.assignAuditPersonUrl,{jlIds:jlIds,auditPerson:auditPerson},function(result){
			if (result.s > 0) {
				location.reload();
			}else {
				hiOverAlert(result.d,1000);
			}
	    });
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
		            }
				});
		}
	},
	
	checkJlCount : function (){
		var self =this;
		$.ajax({
			async : true, // 使用同步请求，因为异步请求不能将返回值传给全局变量；
			url : self.checkJlCountUrl,
			data : {},// "st=2012-11-01 22:22:10",
			success : function(resp) {
				if (resp.s > 0) {
					self.toAdd();
				} 
				else {
					hiOverAlert(resp.d,1000);
				}
			}
		});
	}
}
