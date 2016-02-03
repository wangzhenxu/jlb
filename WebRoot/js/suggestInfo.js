//建议
var suggestInfo = {
	//请求url
	toAddUrl:"/tgSuggestBugInfo/toAdd.action", //去添加页面地址
	addUrl:"/tgSuggestBugInfo/add.action", //添加地址
	onlyName :  $("#onlyName"), //修改，唯一验证时需要添加此属性
	m_title : $(".m_title"),//页面标题
	_title_val : "建议",
	
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
				  'width':'758px',
		             'margin-top': '-350px',	                
		             'margin-left': function () {
		            	 return -($(this).width()/2);
		             }
			}
			
		);
			self.initAdd();
		});
	},
	
	initAdd:function (){
		var self =this;
		$(".ke-container-default").css({"width":"475px"});
		self.editor = KindEditor.create('textarea[name="sug_content_edit"]',{
		//allowPreviewEmoticons : false,
		 uploadJson : '/file/kindEditorUplad.action', //上传
		 fileManagerJson : 'file_manager.do', // 文件管理
		 allowFileManager : true,
		items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
		
		self.addBtn = $("#addSuggestInfo");
		self.addform=$("#saveSuggestForm");
		
		self.addform.attr("action",self.addUrl);
		
		self.suggestModal.on('hidden.bs.modal', function (e) {
			self.addform.validationEngine("hide");
	    });
		
		self.addBtn.unbind("click").click(function (){
			self.add();
		});
		
		
	},
	
	//建议 添加 
	add : function (){
			var self = this;
			var b = self.addform.validationEngine('validate');
			if(!b){
				return false;
			}
			if(self.editor.isEmpty()){
				common.alert("内容不允许为空!");
				return;
			}
			$("#sug_content").val(self.editor.html());
			//$("#desc").val(CKEDITOR.instances.desc1.getData());
			//$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
		
			self.ajaxSubmitForm();
		
	},
	//提交表单
	ajaxSubmitForm  : function (){
		var self = this;
		self.addform.ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				common.alert("感谢你的建议，我们会越做越好的！");
				setTimeout(function(){
					$("#cancelAddSuggestInfo").unbind("click").click();
				},1000); 
			} else {
				common.alert(resp.d);
			}
		});	
	}
   
}
