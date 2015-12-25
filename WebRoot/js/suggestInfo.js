//建议
var suggestInfo = {
	//请求url
	toAddUrl:"/tgSuggestBugInfo/toAdd.action", //去添加页面地址
	addUrl:"/tgSuggestBugInfo/add.action", //添加地址
	onlyName :  $("#onlyName"), //修改，唯一验证时需要添加此属性
	m_title : $(".m_title"),//页面标题
	_title_val : "建议",
	
	addform : jQuery("#addform"), //添加form
	queryfrom :jQuery("#queryForm"), //查询form
	addBtn : $("#addBtn"),//添加按钮
	queryBtn : $("#queryBtn"),//查询按钮
	left_menu_selected_id : "tgSuggestBugInfo_list",   //左侧菜单选择id
	suggestModalId : "suggestModal",


	//属性
	
	suggestId : $("#suggestId"), //主键
	projectType : $("#projectType"), //项目类型
	currentUrl : $("#currentUrl"), //当前访问的url
	title : $("#title"), //标题
	content : $("#content"), //内容
	address : $("#address"), //用户所在地
	agent : $("#agent"), //浏览器类型和版本
	userOs : $("#userOs"), //用户使用的操作系统
	operationType : $("#operationType"), //操作类型
	inPerson : $("#inPerson"), //录入人
	inTime : $("#inTime"), //录入时间
	inPersonName : $("#inPersonName"),
	
	toAddSuggestInfo : function (){
		var self = this;
		self.suggestModal = $("#"+self.suggestModalId); 
		$.post(self.toAddUrl, function(doc) {
			self.suggestModal.html(doc);
			self.suggestModal.modal().css({
				  'width':'658px',
		             'margin-top': '-150px',	                
		             'margin-left': function () {
		            	 return -($(this).width()/2);
		             }
			}
		);
		});
	},
	
	//建议 添加 
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
	}
   
}
