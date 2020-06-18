<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-08
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


    <title>学习路径 - 实验楼</title>




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



<jsp:include page="${pageContext.request.contextPath}/pages/navbar.jsp"/>







<div class="container layout layout-margin-top">


    <div class="row">
        <div class="col-md-9 layout-body">

            <div class="content">
                <div class="row">

                    <c:forEach var="coursemodule" items="${coursemodules}">
                        <div class="col-sm-6">
                            <a href="${pageContext.request.contextPath}/paths/findAllByCourseModuleId?id=${coursemodule.id}" target="_blank">
                                <div class="path-item">
                                    <div class="col-xs-5 col-md-4  path-img">
                                        <img src="${pageContext.request.contextPath}/pages/img/${coursemodule.img}">
                                    </div>
                                    <div class="col-xs-7 col-md-8">
                                        <div class="path-name">${coursemodule.name}</div>
                                        <div class="path-course-num"><span>${coursemodule.courses.size()}</span> 门课程</div>
                                    </div>
                                    <!--<div class="desc-layer">
                                        <div class="center">新手入门路径帮助对 IT 技术感兴趣的新手0基础入门计算机编程。本路径通过新手入门、Linux 及 Vim课程熟悉实验楼的实践学习环境，再以 C 语言和一个简单的项目引导你一步步进入计算机技术的殿堂。</div>
                                    </div>-->
                                </div>
                            </a>
                        </div>
                    </c:forEach>



                </div>
            </div>

        </div>
      <jsp:include page="${pageContext.request.contextPath}/pages/right-aside.jsp"/>
    </div>
</div>


<div class="modal fade" id="invite-user" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">邀请好友，双方都可获赠实验豆！</h4>
            </div>
            <div class="modal-body">

                <p><h4><a href="#sign-modal" data-toggle="modal" data-sign="signin">登录</a>后邀请好友注册，您和好友将分别获赠3个实验豆！</h4></p>

                <div id="msg-modal"></div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="flash-message" tabindex="-1" role="dialog">
    <div class="modal-dialog" rolw="document">
    </div>
</div>
<div class="modal fade" id="modal-message" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">注意</h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary confirm" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>










<jsp:include page="${pageContext.request.contextPath}/pages/login.jsp"/>


<div id="base-data"


     data-flash="false"



     data-is-login=false

     data-is-jwt=true
     data-socket-url="wss://comet.xxxxxx.com"
     data-msg-user=""
     data-msg-system=""
></div>
<script src="${pageContext.request.contextPath}/pages/app/dest/lib/lib.js?=2016121272249"></script>
<script src="${pageContext.request.contextPath}/pages/static/jquery/2.2.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/ace/1.2.5/ace.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/aliyun/aliyun-oss-sdk-4.3.0.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/highlight.js/9.8.0/highlight.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/jspdf/1.2.61/jspdf.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/plupload/2.1.9/js/plupload.full.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/zeroclipboard/2.2.0/ZeroClipboard.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/videojs/video.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/bootstrap-tour/0.11.0/js/bootstrap-tour.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/static/bootstrap-table/1.11.0/extensions/filter-control/bootstrap-table-filter-control.min.js"></script>

<script src="${pageContext.request.contextPath}/pages/static/ravenjs/3.7.0/raven.min.js"></script>
<script>
    Raven.config('https://bc3878b7ed0a4468a65390bd79e6e73f@sentry.xxxxxx.com/5', {
        release: '3.12.13'
    }).install();
</script>


<script src="${pageContext.request.contextPath}/pages/app/dest/base/index.js?=2016121272249"></script>
<script>
    $('.org-body-courses .media h4').each(function() {
        var h = $(this).height();
        if (h > 25) {
            $(this).css({
                width: $(this).width(),
                'white-space': 'nowrap',
                'text-overflow': 'ellipsis',
                overflow: 'hidden'
            });
        }
    });
</script>


<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>




</body>
</html>
