<#macro gmc_common_js  from="">
	<#include "../include/bootstrap.ftl"/>

	<#if from="add">
 		<script type="text/javascript" src="/js/source/jquery.validationEngine.js"></script>
		<script type="text/javascript" src="/js/source/jquery.validationEngine.min.js"></script>
		<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
		<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>
 	</#if>
 	<#if from="select">
		<#include "../include/pager.ftl">
		<script src="/js/source/jquery.validationEngine.js"></script>
		<script src="/js/source/jquery.validationEngine.min.js"></script>
		<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
		body {
			background-image: url(/images/erji_22.jpg);
			background-repeat: repeat-x;
			}
	</style>
 	</#if>
</#macro>
