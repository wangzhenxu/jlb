
<!-- 
	列表地址：${Const.CTX}/zpCompanyInfo/list.action
	去添加页面地址 ：${Const.CTX}/zpCompanyInfo/toAdd.action
	去修改页面地址 ：${Const.CTX}/zpCompanyInfo/toEdit.action?id=
	删除页面地址 ：${Const.CTX}/zpCompanyInfo/delete.action?id=
	详细页面地址 ：${Const.CTX}/zpCompanyInfo/toView.action?id=
	
-->
<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>


<script>
	//删除  公司信息
	function del(id) {
	if(window.confirm("确定要删除吗？")){
				location='${Const.CTX}/zpCompanyInfo/delete.action?id'= +id ;
	}
}
</script>
