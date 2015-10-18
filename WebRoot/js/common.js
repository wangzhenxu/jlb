var common = {
	//bt弹出
	openModal : function (id,title){
			if(title){
				$("#"+id+"_title").html(title);
			}
			$("#"+id).modal().css({
				'margin-top': function () {
			        return -($(this).height()/2)},
			    'margin-left': function () {
			        return -($(this).width()/2);
			    }
			});
			$("#delete_sure_a").click(function(){
				$("#delete_cancle_a").click();
			});
	},
	//获取复选框的值
	getCheckbox : function(name){
		var str="";
        var arr = $("input[name='"+name+"']:checked").get();
        for(var i=0;i<arr.length;i++){
        	if(i==0){
        		str=arr[i].value;
        	}else{
        		str=str+"," + arr[i].value;
        	}
        }
       return str;
	},
	
	serializeJson : function(formId){
		var serializeObj={};
		$($("#"+formId).serializeArray()).each(function(){
			serializeObj[this.name]=this.value;
		});
		return serializeObj;
	},
	
	alert : function (desc,millisecond){
		if(millisecond){
			hiOverAlert(desc,millisecond);
		} else{
			hiOverAlert(desc,1000);
		}
	},
	 //获取当前页面标记
   getCurrPageFlag: function(){
		   var page = "";
		   if(location.href.indexOf("/toEdit.action")!=-1){
			   page="edit"; 
		   }else
		   if(location.href.indexOf("/toAdd.action")!=-1){
			   page="add"; 
		   } else
		  if(location.href.indexOf("/toView.action")!=-1){
			  page="detail"; 
		  }else
		  if(location.href.indexOf("/list.action")!=-1){
			  page="list"; 
		  }
		  return page;
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
		}
}


String.prototype.startWith=function(s){
	if(s==null||s==""||this.length==0||s.length>this.length) {
		return false;
	}
	if(this.substr(0,s.length)==s) {
		return true;
	} else {
		return false;
	}
	return true;
}
String.prototype.endWith=function(s){
	if(s==null||s==""||this.length==0||s.length>this.length) {
		return false;
	}
	if(this.substring(this.length-s.length)==s) {
		return true;
	} else {
		return false;
	}
	return true;
}
/**
 * 字符串日期比较
 * @param {} endTime
 */
String.prototype.compare= function(endTm){
	//将字符串转化为日期
	var startTime = this.formatToDate();
	var endTime = null;
	if(endTm){
		endTime = endTm.formatToDate();
	}
	//调用日期比较
	return startTime.compare(endTime);
}
/**
 * 开始日期,结束日期和当前日期的比较
 * 1.开始日期不能大于结束日期
 * 2.结束日期不能大于当前日期
 * return 
 * 1.开始日期大于结束日期,返回1;
 * 2.结束日期大于当前日期,返回2;
 * 3.指定日期大于当前日期,返回3;
 * 4.符合要求,返回0
 * @param {} endTime
 */
Date.prototype.compare = function(endTime){
	//如果传入了一个日期,则认为是开始日期,结束日期,当前日期相比较
	//如果没有传入参数,则认为是指定日期和当前之日标价
	var startTime = this;
	var now = new Date();
	if(endTime){
		if(startTime.getTime()>=endTime.getTime()){
			return 1;
		}
		if(endTime.getTime()>now.getTime()){
			return 2;
		}
		return 0;
	}else{
		if(startTime.getTime()>now.getTime()){
			return 3;
		}
		return 0;
	}
}

// 对Date的扩展，将 Date 转化为指定格式的String 
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
Date.prototype.format = function(fmt) { //author: meizz 
  var o = { 
    "M+" : this.getMonth()+1,                 //月份 
    "d+" : this.getDate(),                    //日 
    "H+" : this.getHours(),                   //小时 
    "m+" : this.getMinutes(),                 //分 
    "s+" : this.getSeconds(),                 //秒 
    "q+" : Math.floor((this.getMonth()+3)/3), //季度 
    "S"  : this.getMilliseconds()             //毫秒 
  }; 
  if(/(y+)/.test(fmt)) 
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
  for(var k in o) 
    if(new RegExp("("+ k +")").test(fmt)) 
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
  return fmt; 
}
Date.prototype.getMontSize = function() {
	return 32 - new Date(this.getFullYear(), this.getMonth(), 32).getDate();
}
/**
 * 将字符串日期函数格式化为日期格式
 */
String.prototype.formatToDate = function(){
	var pattern_1 = /\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}/;
	var pattern_2 = /\d{4}-\d{2}-\d{2}/;
	var pattern_3 = /\d{4}-\d{2}/;
	var pattern_4 = /\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}/;
	if(pattern_1.test(this)){
		var newDate = new Date(this.replace(/-/g,"/"));
		return newDate;
	} else if (pattern_4.test(this)) {
		var newDate = new Date(this.replace(/-/g,"/")+":00");
		return newDate;
	} else if(pattern_2.test(this)) {
		var newDate = new Date(this.replace(/-/g,"/")+" 00:00:00");
		return newDate;
	} else if(pattern_3.test(this)) {
		var newDate = new Date(this.replace(/-/g,"/")+"/01 00:00:00");
		return newDate;
	}
}


