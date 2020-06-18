
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-09
  Time: 10:56
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


    <title>新手入门 - 学习路径 - 实验楼</title>




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

    <ol class="breadcrumb">
        <li><a href="/paths/">学习路径</a></li>
        <li class="active"><a href="/paths/newhand">新手入门</a></li>
    </ol>

    <div class="row">
        <div class="col-md-9 layout-body">

            <div class="content" style="padding:0px">
                <div class="path-description" style="margin:0px">
                    <div class="path-desc-top clearfix" style="background: url('${pageContext.request.contextPath}/pages/img/1471513740139.png') no-repeat;background-size: cover;">
                        <div class="name-total-box clearfix">
                            <div class="col-md-6 col-sm-6 col-md-offset-1 path-name">
                                <h4>${courses.name}</h4>
                            </div>
                            <div class="col-md-3 col-sm-6 col-md-offset-1 path-total-courses">
                                <span class="total-courses-box">课程 <span class="num">${courses.courses.size()}</span></span>
                            </div>
                        </div>
                        <div class="col-md-10 col-md-offset-1 path-desc-text">${courses.introduction}</div>
                    </div>
                    <div class="path-desc-btm" >
                        <div class="col-sm-12 col-md-4 clearfix learn-time-div">
                            <div class="col-md-12 text-left need-learn-time">预计需要 <span class="num">${courses.courses.size()*5}</span> 小时学习</div>
                        </div>
                        <div class="col-sm-12 col-md-8  clearfix text-right" style="padding-top:0px">
                            <div class="col-xs-12">

                                <a class="btn btn-path-operation btn-join-path" data-sign="signin" href="#sign-modal" data-toggle="modal">加入路径</a>

                                <p style="font-size:10px;margin-top:5px">加入获得路径课程更新提醒</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#path-details" aria-controls="path-details" role="tab" data-toggle="tab">路径详情</a>
                    </li>
                    <li role="presentation">
                        <a href="#path-comments" aria-controls="path-comments" role="tab" data-stat="path_comments" data-toggle="tab">路径评论(<span class="comments-count">0</span>)</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane path-details active" id="path-details">
                        <div class="details-box">
                            <a href="/courses/63" class="btn start-btn">开始学习</a>


                            <div class="clearfix text-center path-title-box">
                                <span class="line hidden-xs"></span>
                                <span>阶段1：基础知识</span>
                                <span class="line hidden-xs"></span>
                            </div>
                            <div class="row">
                                <c:forEach items="${courses.courses}" var="course">
                                    <c:if test="${course.stage==1}">
                                        <div class="col-md-4 col-sm-6  course">
                                            <a class="course-box" href="${pageContext.request.contextPath}/course/findByCourseId?courseId=${course.id}">
                                                <div class="sign-box">



                                                    <i class="fa fa-star-o course-follow pull-right"
                                                       data-follow-url="/courses/63/follow"
                                                       data-unfollow-url="/courses/63/unfollow"  style="display:none"  ></i>

                                                </div>
                                                <div class="course-img">

                                                    <img alt="新手指南之玩转实验楼" src="${pageContext.request.contextPath}/pages/img/${course.courseimg}">

                                                </div>

                                                <div class="course-body">
                                                    <span class="course-title" data-toggle="tooltip" data-placement="bottom" title="新手指南之玩转实验楼">${course.title}</span>
                                                </div>
                                                <div class="course-footer">
                                                <span class="course-per-num pull-left">
                                                    <i class="fa fa-users"></i>

                                                    ${course.studys}

                                                </span>



                                                </div>
                                            </a>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                            <div class="clearfix text-center path-title-box">
                                <span class="line hidden-xs"></span>
                                <span>阶段2：编程语言</span>
                                <span class="line hidden-xs"></span>
                            </div>
                            <div class="row">

                                    <c:forEach items="${courses.courses}" var="course">
                                        <c:if test="${course.stage==2}">
                                            <div class="col-md-4 col-sm-6  course">
                                                <a class="course-box" href="${pageContext.request.contextPath}/course/findByCourseId?courseId=${course.id}">
                                                    <div class="sign-box">



                                                        <i class="fa fa-star-o course-follow pull-right"
                                                           data-follow-url="/courses/63/follow"
                                                           data-unfollow-url="/courses/63/unfollow"  style="display:none"  ></i>

                                                    </div>
                                                    <div class="course-img">

                                                        <img alt="新手指南之玩转实验楼" src="${pageContext.request.contextPath}/pages/img/${course.courseimg}">

                                                    </div>

                                                    <div class="course-body">
                                                        <span class="course-title" data-toggle="tooltip" data-placement="bottom" title="新手指南之玩转实验楼">${course.title}</span>
                                                    </div>
                                                    <div class="course-footer">
                                                <span class="course-per-num pull-left">
                                                    <i class="fa fa-users"></i>

                                                    ${course.studys}

                                                </span>



                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>


                             </div>

                            <div class="clearfix text-center path-title-box">
                                <span class="line hidden-xs"></span>
                                <span>阶段3：入门项目</span>
                                <span class="line hidden-xs"></span>
                            </div>

                             <div class="row">
                                    <c:forEach items="${courses.courses}" var="course">
                                        <c:if test="${course.stage==3}">
                                            <div class="col-md-4 col-sm-6  course">
                                                <a class="course-box" href="${pageContext.request.contextPath}/course/findByCourseId?courseId=${course.id}">
                                                    <div class="sign-box">



                                                        <i class="fa fa-star-o course-follow pull-right"
                                                           data-follow-url="/courses/63/follow"
                                                           data-unfollow-url="/courses/63/unfollow"  style="display:none"  ></i>

                                                    </div>
                                                    <div class="course-img">

                                                        <img alt="新手指南之玩转实验楼" src="${pageContext.request.contextPath}/pages/img/${course.courseimg}">

                                                    </div>

                                                    <div class="course-body">
                                                        <span class="course-title" data-toggle="tooltip" data-placement="bottom" title="新手指南之玩转实验楼">${course.title}</span>
                                                    </div>
                                                    <div class="course-footer">
                                                <span class="course-per-num pull-left">
                                                    <i class="fa fa-users"></i>

                                                    ${course.studys}

                                                </span>



                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>


                              </div>

                            <div class="btn end-pin">完成学习</div>
                        </div>

                        </div>
                    <div role="tabpanel" class="tab-pane path-comment" id="path-comments">
                        <div class="comment-box">
                            <div class="comment-form">

                                <div class="comment-form-unlogin">
                                    请
                                    <a href="#sign-modal" data-toggle="modal" data-sign="signin"> 登录 </a>
                                    后发表评论
                                </div>

                            </div>
                            <div class="comment-title">最新评论</div>
                            <div class="comment-list"></div>
                            <div class="pagination-container"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
       <jsp:include page="${pageContext.request.contextPath}/pages/right-aside.jsp"/>
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


<div id="jinja-data"

     data-user-id="0"
     data-user-in-path= "false"

     data-join-path-url="/jobs/9/join"
     data-leave-path-url ="/jobs/9/leave"
     data-path-comment-url="/jobs/9/comment"
     data-user-logined="false"
></div>
<script src="${pageContext.request.contextPath}/pages/app/dest/path/path.js?=2016121272249"></script>

<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>




</body>
</html>
