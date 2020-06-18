<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-15
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Lei Shi">
    <meta http-equiv="Cache-Control" content="o-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="csrf-token" content="1483780974##87f89328c5616669f00302a263fe9061bb852818">


    <title>教师资格申请</title>




    <meta content="实验楼课程分为基础课和项目课，内容涵盖了Linux、Python、Java、C语言、Ruby、Android、IOS开发、大数据、信息安全等IT技术领域。" name="description">
    <meta content="实验楼课程,IT培训课程,IT实训课程,IT在线课程,all" name="keywords">

    <meta content="" name="author">

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/static/font-awesome//4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/static/highlight.js/9.8.0/monokai-sublime.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/katex/0.6.0/katex.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/videojs/5.11.7/video-js.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/dest/styles.css?=2016121272249">

    <style>
        @font-face {
            font-family: "lantingxihei";
            src: url("${pageContext.request.contextPath}/pages/fonts/FZLTCXHJW.TTF");
        }

        /* modal 模态框*/
        #invite-user .modal-body {
            overflow: hidden;
        }
        #invite-user .modal-body .form-label {
            margin-bottom: 16px;
            font-size:14px;
        }
        #invite-user .modal-body .form-invite {
            width: 80%;
            padding: 6px 12px;
            background-color: #eeeeee;
            border: 1px solid #cccccc;
            border-radius: 5px;
            float: left;
            margin-right: 10px;
        }
        #invite-user .modal-body .msg-modal-style {
            background-color: #7dd383;
            margin-top: 10px;
            padding: 6px 0;
            text-align: center;
            width: 100%;
        }
        #invite-user .modal-body .modal-flash {
            position: absolute;
            top: 53px;
            right: 74px;
            z-index: 999;
        }
        /* end modal */

        .en-footer {
            padding: 30px;
            text-align: center;
            font-size: 14px;
        }
    </style>





</head>

<body>










<jsp:include page="${pageContext.request.contextPath}/pages/navbar.jsp"></jsp:include>


<div style="width: 800px;height: 800px;margin: 200px auto">
    <form>
        <div class="form-group" style="text-align: right">
            <button type="button" class="btn btn-link">返回<span class="glyphicon glyphicon-arrow-left"></span></button>

        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">真实姓名</label>
            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="真实姓名">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">职业</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="可填过去的职业  可验证">
        </div>
        <div class="form-group">
            <label >工作经验</label>
            <textarea class="form-control" rows="3" placeholder="工作经验需有相关证明 可验证"></textarea>
        </div>
        <%--<div class="checkbox">--%>
        <%--<label>--%>
        <%--<input type="checkbox"> Check me out--%>
        <%--</label>--%>
        <%--</div>--%>
        <div class="form-group" style="text-align: center">
            <button type="submit"  class="btn btn-primary">提交申请</button>
        </div>

    </form>

</div>

<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/pages/static/jquery/2.2.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/pages/static/bootstrap/bootstrap.min.js"></script>

</body>
</html>

