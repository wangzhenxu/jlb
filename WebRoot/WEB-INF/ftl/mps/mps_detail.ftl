<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站后台管理系统-微服务</title>
    <link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>

        <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 微服务 &gt; <strong>公众帐号管理</strong></div>
            </div>
            <div class="form">
                <table class="table_style01">
                    <tr>
                        <td width="17%" align="right" valign="middle" class="hui1">公众帐号：</td>
                        <td width="83%" class="hui">${mp.name!""}</td>
                    </tr>

                    <tr>
                        <td align="right" valign="middle" class="hui1">URL：</td>
                        <td class="hui">${mp.url!""}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">ToKen：</td>
                        <td class="hui">${mp.token!""}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">AppId：</td>
                        <td class="hui">${mp.appId!""}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">AppSecret：</td>
                        <td class="hui">${mp.appSecret!""}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">关注用户数
                            ：</td>
                        <td class="hui">${mp.followSum}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">授权用户数：</td>
                        <td class="hui">${mp.grantedSum}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">创建时间：</td>
                        <td class="hui">>${mp.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                    </tr>
                </table>
                <ul class="r50"><li><a class="but5" href="javascript:void(0);" onclick="javascript:history.go(-1);return false;">返回</a></li></ul>
            </div>
        </div>
    </div>


</body>
</html>
