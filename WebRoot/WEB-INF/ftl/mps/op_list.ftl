<head>
<#include "../include/pager.ftl">
 <script src="/js/url.js"></script>
</head>

<script>
    topMenuNum=3;
    left_menu_class_num=3;
    leftMenuNum=1;
    /*   left_second_MenuNum=3*/
</script>

<script language="javascript" type="text/javascript">

    $(function(){

        $(".but0").click(function(){
            var mpcount=$("#mpcount").val();
         /* 判断是否含有公众帐号*/
            if(mpcount<=0)
            {
                return false;
            }  else{
                var mi=$("#mp").val();
                 var ty=$("#ty").val();
                var  kw=$("#kw").val();
                var pi ;

            <#if pager??>
                pi=${pager.pageIndex!0} ;
            <#else>
                pi=0;
            </#if>

                location.href="/mp/opls.action?mi="+mi+"&kw="+kw+"&ty="+ty+"&cat=1";
            }
        });
    });

</script>

<!-- 右侧 开始 -->
<div class="content">
    <div class="w100">
        <!-- __________内容 开始__________ -->
        <div class="title blue_bd">
            <div>操作记录</div>
        </div>
        <div class="blue_bd">
            <div class="title2"></div>
        </div>
        <div class="blue_bd0 pad20 clearfix">
            <ul class="search search0 clearfix">

                <li style="padding-top:5px;">公众账号：</li>
                <li style="padding:4px 20px 0 3px;">
                    <input id="mpcount" type="hidden" value="${mps?size}"/>
                <#if  mps?size gt 0 >
                    <select id="mp">
                        <#list mps as mp>
                            <option value="${mp.mcId}">${mp.name}</option>
                        </#list>
                    </select>
                <#else>
                    <input name="input" type="text"  class="input">没有相关微信公众平台帐号</input>
                </#if>

                </li>
                <li style="padding-top:5px;">消息类型：</li>
                <li style="padding:4px 20px 0 3px;">
                    <select id="ty">
                        <option value="100">全部消息</option>
                        <option value="0">常规消息</option>
                        <option value="1">订阅消息</option>
                        <option value="2">取消订阅消息</option>
                        <option value="3">自定义菜单消息</option>
                        <option value="4">公众帐号关键字消息</option>
                    </select>
                </li>
                <li style="padding-top:5px;">发送关键字：</li>
                <li style="padding:4px 20px 0 3px;">
                    <input type="text" id="kw" class="input_text w200" value="${kw!''}" >
                </li>
                <li><a href="javascript:void(0);" class="but0"></a></li>
            </ul>
        </div>


    <#if  pager??>
    <div class="blue_bd0 clearfix">
        <div class="blue_bd0 clearfix">
            <div class="title2">公众帐号： ${mp.name!""}</div>
        </div>
            <table class="table01">
                <tr>

                    <th>序号</th>
                    <th>OpenID</th>
                    <th>LOIOT授权用户</th>
                    <th>消息类型</th>
                    <th>发送关键字</th>
                    <th>触发规则</th>
                    <th>操作时间</th>
                </tr>
                <#list pager.data as op>
                    <tr>
                        <td class="hui">${op_index+1} </td>
                        <td class="hui">${op.openid!""}</td>
                        <td class="hui">${op.loginName!""}</td>
                        <td class="hui">${op.type!""}</td>
                        <td class="hui">${op.keyword!""}</td>
                        <td class="hui">${op.rule!""}</td>
                        <td class="hui"><#if op.createtime??> ${op.createtime?string("yyyy-MM-dd HH:mm:ss")}</#if></td>

                    </tr>
                </#list>


            </table>
        </div>
        <!-- 翻页 开始 -->

        <div class="manu"> <@pageBar pager=pager url="/mp/opls.action?kw="+kw+"&mi="+mi+"&ty="+ty+"&cat=1" join="&"></@pageBar></div>
        <!-- 翻页 结束 -->
    </#if>
        <!-- __________内容 结束__________ -->
    </div>
</div>

<script type="text/javascript">

    var mi= $.getUrlVar('mi')  ;
    var ty= $.getUrlVar('ty')  ;
    if(mi>0)
    {
        $("#mp").val(mi);
    }

    if(ty>0)
    {
        $("#ty").val(ty);
    }

</script>