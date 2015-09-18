
<head>
	<title>网站后台管理系统-产品分类</title>
    <#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
    <script src="http://www.loiot.com/c/My97DatePicker/WdatePicker.js" type="text/javascript" > </script>
    <script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine.pack.js"></script>
    <script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine-cn.js"></script>
    <link href="http://www.loiot.com/c/validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <link href="/css/weixin.css" rel="stylesheet" type="text/css" />
    <script src="/js/url.js"></script>

<script  language="javascript">

    var cdate;

/*    判断是否有 授权记录*/
    $(function(){


        $("#appFull").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"});

          $.each($("table .record"),function(i,v){
               if($(this).parent().parent().find(".grantedSum").text()==0){
                   $(this).attr("onClick"," alert('没有用户授权记录！')");
                  // alert("没有用户授权记录！");
                  }else{
                   $(this).attr("onClick","");
                   $(this).bind("click",function(){
                       location.href="/mp/grantedLs.action?mcId=" +$(this).parent().find(".mcId").text()  ;
                   });

               }
          }) ;






    }) ;




    function dateChange()
    {
        cdate= $("#date").val();
    }

   function query()
   {

       cdate= $("#date").val();
       <#if ci??>
           location.href="/mps/list.action?ct="+cdate+"&ci=${ci}";
           <#else>
               location.href="/mps/list.action?ct="+cdate;
       </#if>

   }



     /*公众帐号  启用状态修改*/
    function disabled(tr,mcId)
    {
        var  tx=$(tr).text();
        var disabled=0;
          if(tx=="停用"){
              disabled=1 ;
          }
        $.get("/mps/disabled.action",
                {
                     mcId : mcId,
                     disabled: disabled
                }  ,
                function(data,status)
                {
                     if(data.s)
                     {
                         var tp= (tx=="停用"?"启用":"停用");
                         $(tr).text(tp);
                     } else{
                         alert("请重试！") ;
                     }

                }
              )  ;
    }


    /**
     * 弹出 完善信息弹窗
     */

    function fnFullMp(mcid)
    {
        $("#mcIdH").val(mcid);

        $(".pop").modal().css({
            'width':'430px',
            'margin-top': function () {
                return -($(this).height()/2);
            },
            'margin-left': function () {
                return -($(this).width()/2);
            }
        });
    }


    /**
     * 完善信息弹窗 提交保存
     */
    function fnFullMpOk()
    {
        $("#ai").blur();
        $("#as").blur();
        if($(".error-field").size()){
            alert("填入信息不能为空！");
        }else{
            var mcid=$("#mcIdH").val();
            var ai=$("#ai").val();

            var as=$("#as").val();

            var ct=$("#ct").val();


            var pi=0;
        <#if pager??>
            pi=${pager.pageIndex!0} ;
        </#if>

            $.get("/mps/updateApp.action",
                    {
                        mi : mcid,
                        ai: ai,
                        as:as
                    }  ,
                    function(data,status)
                    {
                        if(data.s)
                        {
                        <#if ci??>
                            location.href="/mps/list.action?ct="+ct+"&pi="+pi+"&ci=${ci}";
                        <#else>
                            location.href="/mps/list.action?ct="+ct+"&pi="+pi;
                        </#if>

                        } else{
                            alert("请重试！") ;
                        }

                    }
            )  ;
        }

    }

</script>
</head>

<div class="right">
    <div class="location">
        <div class="location01">您现在的位置是：首页 &gt; 微服务 &gt; <strong>公众帐号管理</strong></div>
    </div>
    <div class="sort">
        <div class="sort1">公众帐号管理</div>
        <div class="query">
            <ul>
                <li><span class="classify">对应账号系统：</span>
                    <input name="" type="text"  class="input"/></li>
                <li><a href="#"><img src="images/erji_06.jpg" width="64" height="26" /></a></li>
            </ul>
        </div>
    </div>
    <div class="form">
        <div class="form2">
            <table class="table_style03">
                <tr>
                    <th width="7%" valign="middle"><input type="checkbox" name="checkbox" id="checkbox" style="vertical-align:middle " />
                        &nbsp;全选</th>
                    <th width="9%">序列号</th>
                    <th width="15%">公众帐号</th>
                    <th width="19%">对应系统帐号</th>
                    <th width="15%">关注用户数</th>
                    <th width="9%">授权用户数</th>
                    <th width="10%">申请时间</th>
                    <th width="16%">操作</th>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkbox2" id="checkbox2" style="vertical-align:middle " /></td>
                    <td class="hui">1</td>
                    <td class="hui">&nbsp;</td>
                    <td class="hui">&nbsp;</td>
                    <td class="hui">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><a class="blue" href="weixin1.html">查看</a> <a class="blue" href="weixin2.html">授权记录 </a><a class="blue" href="#">停用</a></td>
                </tr>
                <tr class="e">
                    <td><input type="checkbox" name="checkbox3" id="checkbox3"/></td>
                    <td class="hui">2</td>
                    <td class="hui">&nbsp;</td>
                    <td class="hui">&nbsp;</td>
                    <td class="hui">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><a class="blue" href="#">查看</a> <a class="blue" href="#">授权记录 </a><a class="blue" href="#">停用</a></td>
                </tr>
                <tr>
                    <td colspan="8" valign="middle" class="d"><a href="#"><img src="images/del.jpg" width="74" height="26" /></a></td>
                </tr>
            </table>
        </div>
        <div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>
    </div>
</div>

<!-- 右侧 开始 -->
<div class="content">
    <div class="w100">
        <!-- __________内容 开始__________ -->
        <div class="title blue_bd">
            <div class="admin3">公众账号管理</div>
        </div>
        <div class="blue_bd">
            <ul class="search clearfix">
                <li style="padding-top:5px;"> 客 户 ：</li>
                <li style="padding:4px 20px 0 3px;">
                    <input id="mpcount" type="hidden" value="${crs?size}"/>
                    <input type="hidden" value="">
                <#if  crs?size gt 0 >
                    <select id="cr">
                        <#list crs as cr>
                            <option value="${cr.customerId!'0'}">${cr.name!""}</option>
                        </#list>
                    </select>
                <#else>
                    <input name="input" type="text"  class="input">没有相关微信公众平台帐号</input>
                </#if>
                </li>

                <li style="padding-top:5px;">创建时间：</li>
                <li style="padding:4px 20px 0 3px;">
                    <input name="date" type="text"  class="Wdate" readonly="true" id="date" onchange="dateChange();" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                    <input type="hidden" id="ct" value="${ct!''}" />
                </li>
                <li><a href="javascript:void(0);"  class="but0" onclick="query();"></a></li>
            </ul>
        </div>


      <#if mps??>

        <div class="blue_bd0">
            <table class="table01">
                <tr>
                    <th>序号</th>
                    <th>公众帐号</th>
                    <th>关注用户数</th>
                    <th>授权用户数</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>

            <#list mps as mp>
                <tr>
                    <td >${mp_index+1}</td>
                    <td>${mp.name}</td>
                    <td>${mp.followSum}</td>
                    <td class="grantedSum">${mp.grantedSum}</td>
                    <td >${mp.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                    <td >
                        <#if (mp.appId??)&&(mp.appSecret??)>
                            <a class="blue" href="/mp/detail.action?mcId=${mp.mcId}">查看</a> <a class="blue" href="/mp/edit.action?mi=${mp.mcId}">修改</a>

                            <a class="blue record" href="javascript:void(0);" onclick="console.log(123)">授权记录</a>
                            <input type="hidden" id="InMcId" class="mcId" value="${mp.mcId}" >

                            <a class="blue" href="javascript:void(0);" onclick="disabled($(this),${mp.mcId});">
                                <#if mp.disabled==0>
                                    停用
                                <#else>
                                    启用
                                </#if>
                            </a>
                            <#else>
                                <a class="blue" href="javascript:void(0);" onclick="fnFullMp(${mp.mcId});">完善信息</a>
                             <input type="hidden" id="mcIdH">
                        </#if>

                    </td>
                </tr>
            </#list>
            </table>
        </div>
        <!-- 翻页 开始 -->
        <#-- 分页栏 -->

        <div class="manu"> <@pageBar pager=pager url="/mp/list.action?ct="+ct  join="&"></@pageBar></div>
      </#if>
        <!-- 翻页 结束 -->
        <!-- __________内容 结束__________ -->
    </div>
</div>
<!-- 右侧 结束 -->



<!-- 弹窗 开始 -->
<div  class="pop modal hide fade" style="width:430px;">
    <div class="title">完善信息<a href="" class="x"></a></div>

   <form id="appFull">
    <div class="pad20">
        <div class="mar_b20">请首先完善公众帐号的信息：</div>
        <div class="clearfix">
            <label class="left"><span class="em_2">App ID：</span></label>
            <div class="left">
                <input id="ai" type="text" class="input_text w200" validate="validate[required,length[1,20]]"/>
            </div>
        </div>
        <div style="padding-top:20px;" class="clearfix">
            <label class="left">App Secret：</label>
            <div class="left">
                <input id="as" type="text" class="input_text w200" validate="validate[required,length[1,32]]" />
            </div>
        </div>
    </div>
    </form>
    <div class="clearfix">
        <ul class="r50">
            <li><a href="javascript:void(0);" class="button mar_r30" data-dismiss="modal" onclick="fnFullMpOk()">确定</a><a href="javascript:void(0);" class="button gray" data-dismiss="modal">取消</a></li>
        </ul>
    </div>
</div>
<!-- 弹窗 结束 -->


<script type="text/javascript">

    var mi= $.getUrlVar('cr')  ;
    if(mi>0)
    {
        $("#cr").val(mi);
    }
</script>


