
<!-- 
	列表地址：${Const.CTX}/zpCompanyJobInfo/list.action
	去添加页面地址 ：${Const.CTX}/zpCompanyJobInfo/toAdd.action
	去修改页面地址 ：${Const.CTX}/zpCompanyJobInfo/toEdit.action?id=
	删除页面地址 ：${Const.CTX}/zpCompanyJobInfo/delete.action?id=
	详细页面地址 ：${Const.CTX}/zpCompanyJobInfo/toView.action?id=
	
-->
<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>


<script>
	//删除  公司职位
	function del(id) {
	if(window.confirm("确定要删除吗？")){
				location='${Const.CTX}/zpCompanyJobInfo/delete.action?id'= +id ;
	}
}
</script>
