<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-27
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户-登录</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body >
<div id="login_main" style="background-color: #ffffff">
    <div id="login_title">
        DQKD快递系统
    </div>
    <div id="error_msg1">
        <div id="error_msg">用户名或密码错误</div>
    </div>
    <div id="login_form">
        <!---->
        <form class="form-horizontal" action="/login.do" method="post">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" name="username" value="${username}">
            </div>


            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                <input type="password" class="form-control" placeholder="password" aria-describedby="basic-addon2" name="password">
            </div>

            <div class="col-sm-6">
                <input type="text" class="form-control"  placeholder="验证码" name="code">
            </div>
            <div class="col-sm-6">
                <img src="${pageContext.request.contextPath}/user/code" class="refresh_code" id="img">
                <%--<span data-icon="&#xe02a" ></span>--%>
            </div>




            <div  class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">登录</button>
                <a href="${pageContext.request.contextPath}/pages/register.jsp" class="btn btn-default " role="button" style="margin-left: 50px">注册</a>
            </div>



        </form>
    </div>


</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<script>
    $(function () {
        $(".refresh_code").click(function () {
            var date=new Date().getTime();
            $("#img").attr("src","${pageContext.request.contextPath}/user/code?date="+date);
        });
        if("${error_msg}".length>0){
            $("#error_msg").css("visibility","visible");
            $("#error_msg").fadeOut(3000);
        }


    });
</script>
</body>
</html>
