<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${c.name!''}</title>
<link href="${basePath}/css/interviewExport.css" rel="stylesheet" type="text/css" />


</head>

<body >
	<div class="title">${j.name!''}（${c.name!''}）</div>
	<div class="fenge"></div>
	<div class="title_02">招聘信息<span class="title_en"> / Recruitment information </SPAN>
	  <div class="stars"><img src="${basePath}/images/bg_stars.png" /></div></div>
	<div class="content">
		<ul class="text">
			<li>公司名称：${c.name!''}</li>
			<li>公司地址：${c.address!''}</li>
			<li>汇报对象：${c.reportObject!''}</li>
			<li style="display:none;">工作时间：弹性制工作</li>
		</ul>
		<ul class="text" >
			<li>招聘职位：${j.name!''}</li>
			<li>预计年薪：${JLBUtils.dealExpectedYearMoney(c.expectedYearMoneyStart,c.expectedYearMoneyEnd)}</li>
			<li style="display:none;">面试流程：2面，一面技术，一面HR</li>
		</ul>
		<div class="title_04">职位描述：</div>
		<ul class="box">
			${j.desc!''}
		</ul>
		<div style="clear:both"></div>
	</div>
	<div class="fenge2"></div>
	 <div class="title_02">公司信息<span class="title_en">  / Company information </SPAN>
	  <div class="stars"><img src="${basePath}/images/bg_stars.png" /></div></div>
	<div class="content">
		<ul class="text">
			<li>公司规模： <#if c.scaleId??> 	
    						${DictionaryUtil.getName(c.scaleId)}<#else>
  	 	 				</#if>
  	 	 </li>
			<li>所属行业：<#if c.industryId??> 	
        					${DictionaryUtil.getName(c.industryId)}<#else>无
      	  				</#if>
  	 	 	</li>
			<li>注册时间： <#if c.regtime??>
	         					${c.regtime?string("yyyy-MM-dd")}
	 					</#if>
	 		</li>
		</ul>
		<ul class="text">
			<li>融资阶段：<#if c.financingLevelId??> 	
    						${DictionaryUtil.getName(c.financingLevelId)}<#else>无
  	 	 				</#if>
  	 	 	</li>
			<li>公司性质：<#if c.companyNature??> 	
    						${DictionaryUtil.getName(c.companyNature)}<#else>无
  	 	 				</#if>
  	 	    </li>
		</ul>
		<div class="title_04">公司福利：</div>
		<ul class="box">
			<li style="height:auto">${j.jobTemptText!''}</li>
		</ul>
		<div class="title_04" style="display:none;">公司网站：</div>
		<ul class="box" style="display:none;">
			<li>www.baidu.com</li>
		</ul>
		<div class="title_04">公司简介：</div>
		<ul class="box">
			<li style="height:auto; width:840px;">
			 ${c.desc!''}
			</li>
		</ul>
		<div style="clear:both"></div>
	</div>
	<div class="fenge2"></div>
	 <div class="title_02">礼品<span class="title_en">  / gift</SPAN>
     <div class="stars"><img src="${basePath}/images/bg_stars.png" /></div></div>
	 <div class="content" style="padding-top:40px">
	 	<div class="gift" style="margin-left:150px;"><img src="${basePath}/images/gift.jpg" /><div class="title_g">
	 	书(一本)</div></div>
	    <div class="gift"><img src="${basePath}/images/gift.jpg" /><div class="title_g">8GU盘一个</div></div>
	    <div class="gift"><img src="${basePath}/images/gift.jpg" /><div class="title_g">30元手机充值卡</div></div>
		<div style="clear:both"></div>
	 </div>
	 <div style="height:80px;width:100%"></div>
</body>
</html>
