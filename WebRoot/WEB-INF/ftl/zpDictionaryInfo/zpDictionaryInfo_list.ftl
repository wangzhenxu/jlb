
<!-- 
	列表地址：${Const.CTX}/zpDictionaryInfo/list.action
	去添加页面地址 ：${Const.CTX}/zpDictionaryInfo/toAdd.action
	去修改页面地址 ：${Const.CTX}/zpDictionaryInfo/toEdit.action?id=
	删除页面地址 ：${Const.CTX}/zpDictionaryInfo/delete.action?id=
	详细页面地址 ：${Const.CTX}/zpDictionaryInfo/toView.action?id=
	2.可以引用环境变量: "E:\jdk1.7" or System.properties:
	
-->
<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>


<script>
	//删除  字典信息
	function del(id) {
	if(window.confirm("确定要删除吗？")){
				location='${Const.CTX}/zpDictionaryInfo/delete.action?id'= +id ;
	}
}
</script>
