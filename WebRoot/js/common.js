var common = {
	//bt弹出
	openModal : function (id){
			$("#"+id).modal().css({
				'margin-top': function () {
			        return -($(this).height()/2)},
			    'margin-left': function () {
			        return -($(this).width()/2);
			    }
			});
	}
}