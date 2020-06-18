<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-21
  Time: 16:22
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


    <title>实验课程 - 实验楼</title>




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

    <style>
        a:hover,
        a:focus {
            text-decoration: none;
        }
        span.label {
            display: inline-block;
            margin: 10px 3px 16px 3px;
            padding: 6px 16px;
            border: none;
            font-size: 14px;
            font-weight: 100;
        }
        span.label-default {
            color: #999;
            background: none;
        }
        span.label-success {
            color: #0c9;
            background: #E7F8F2;
        }
        .userinfo-banner [data-toggle="tooltip"] {
            display: inline-block;
            border-bottom: dashed 1px #999;;
            color: #999 !important;
        }
        .certificate-item {
            padding-top: 10px;
        }
        .certificate-item a {
            color: #444;
        }
    </style>
</head>

<body>


<jsp:include page="${pageContext.request.contextPath}/pages/navbar.jsp"/>



<div class="userinfo-banner layout-no-margin-top">
    <div class="container layout">
        <div class="row">
            <div class="col-md-9 clearfix">
                <div class="pull-left userinfo-banner-avatar">




                    <div class="user-avatar ">
                        <a class="avatar" href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/pages/img/${user.userDetail.avatar}">
                        </a>
                        <c:if test="${user.permission.name=='vip'}">
                            <a class="member-icon" href="${pageContext.request.contextPath}/pages/vip/index.html" target="_blank">

                                <img src="
            ${pageContext.request.contextPath}/pages/img/vip-icon.png
          ">

                            </a>
                        </c:if>


                    </div>


                </div>
                <div class="pull-left userinfo-banner-details">
                    <div class="userinfo-banner-meta">




                        <div class="user-username ">
                            <a class="username" href="#" target="_blank">

                                ${user.userDetail.username}


                            </a>
                            <%--<span class="user-level">L195</span>--%>
                        </div>







                    </div>
                    <div class="userinfo-banner-status">


                        <span>学生</span>

                        <a href="/edu/1" target="_blank">北京大学</a>



                    </div>
                </div>
            </div>
            <%--
            <div class="col-md-3 userinfo-banner-labinfo">
                <div class="userinfo-banner-level">
                    <img src="${pageContext.request.contextPath}/pages/img/lou-level.png">
                    <div class="userinfo-current-level"><span>195</span> 楼</div>
                    <div class="userinfo-level-more" data-toggle="tooltip" data-placement="bottom" title="在实验环境中动手输入代码或命令时才计入有效学习时间">

                        距 196 楼还需 16 分钟有效学习时间
                    </div>
                </div>
            </div>
            --%>
        </div>
    </div>
</div>
<div class="container layout">
    <div class="row">
        <div class="col-md-9 layout-body">

            <div class="content" role="tabpanel">


                <ul class="nav nav-tabs" rolw="tablist">
                    <li role="presentation" class="active">
                        <a href="#" role="tab">实验课程</a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#" role="tab">实验讨论</a>
                    </li>

                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active">
                        <div class="row">
                            <div class="col-md-12" id="category">
                                <a value="study" style="cursor: pointer">
                                    <span class="label label-default label-success">学过的</span>
                                </a>
                                <a value="attention" style="cursor: pointer">
                                    <span class="label label-default">关注的</span>
                                </a>
                                <a value="studied" style="cursor: pointer">
                                    <span class="label label-default">已加入学习</span>
                                </a>

                                <a value="publish" style="cursor: pointer">
                                    <span class="label label-default">发布的</span>
                                </a>

                            </div>



                            <div id="row_course">

                            <c:forEach var="course" items="${courses.list}">

                                <div class='col-md-4 col-sm-6  course'>
                                    <a class='course-box' href='${pageContext.request.contextPath}/course/findByCourseId?courseId=${course.id}'>
                                        <div class='sign-box'>



                                            <i class='fa fa-star-o course-follow pull-right'
                                               data-follow-url='/courses/63/follow'
                                               data-unfollow-url='/courses/63/unfollow'  style='display:none'  ></i>

                                        </div>
                                        <div class='course-img'>

                                            <img alt='新手指南之玩转实验楼' src='/pages/img/${course.courseimg}'>

                                        </div>

                                        <div class='course-body'>
                                            <span class='course-title' data-toggle='tooltip' data-placement='bottom' title='新手指南之玩转实验楼'>${course.title}</span>
                                        </div>
                                        <div class='course-footer'>
                                <span class='course-per-num pull-left'>
                                    <i class='fa fa-users'></i>

                                    ${course.studys}

                                </span>

                                            <c:if test='${course.category==2}'>
                                                <span class='course-money pull-right'>会员</span>
                                            </c:if>

                                        </div>
                                    </a>
                                </div>
                            </c:forEach>


                            <jsp:include page="${pageContext.request.contextPath}/pages/pages.jsp"/>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </div>
       <%--
        <div class="col-md-3 layout-side">




            <a class="side-sda apply-git" href="http://git.xxxxxx.com/shilei" target="_blank">
                <img src="${pageContext.request.contextPath}/pages/img/my-git.png">
                <span>代码库</span>
            </a>









            <div class="sidebox user-visitors">
                <div class="sidebox-header">
                    <h4 class="sidebox-title">最近来访</h4>
                </div>
                <div class="sidebox-body">

                    <div class="col-dm-12">
                        <a class="row" href="/user/345538">
                            <div class="col-xs-2">
                                <img src="https://dn-simplecloud.xxxxxx.com/gravatar345538.png?v=1483141057082&amp;imageView2/1/w/200/h/200">
                            </div>
                            <div class="col-xs-10">
                                <div>PKU_Hao</div>
                                <div>12分钟前</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-dm-12">
                        <a class="row" href="/user/237882">
                            <div class="col-xs-2">
                                <img src="https://dn-simplecloud.xxxxxx.com/gravatarDQJPW4T4RJZF.jpg">
                            </div>
                            <div class="col-xs-10">
                                <div>vanxv</div>
                                <div>2小时前</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-dm-12">
                        <a class="row" href="/user/262386">
                            <div class="col-xs-2">
                                <img src="https://dn-simplecloud.xxxxxx.com/gravatarKAYZQC5G6TJY.jpg">
                            </div>
                            <div class="col-xs-10">
                                <div>LIKIKI</div>
                                <div>5小时前</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-dm-12">
                        <a class="row" href="/user/126970">
                            <div class="col-xs-2">
                                <img src="https://dn-simplecloud.xxxxxx.com/gravatarRKEXQSX3FDLK.jpg">
                            </div>
                            <div class="col-xs-10">
                                <div>星_尘</div>
                                <div>6小时前</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-dm-12">
                        <a class="row" href="/user/309116">
                            <div class="col-xs-2">
                                <img src="https://dn-simplecloud.xxxxxx.com/gravatarM8EVLA6XFKRH.jpg">
                            </div>
                            <div class="col-xs-10">
                                <div>大风车</div>
                                <div>10小时前</div>
                            </div>
                        </a>
                    </div>

                    <div class="col-dm-12">
                        <a class="row" href="/user/140480">
                            <div class="col-xs-2">
                                <img src="https://dn-simplecloud.xxxxxx.com/gravatar9UBRP2BQR68H.jpg">
                            </div>
                            <div class="col-xs-10">
                                <div>lushengwen</div>
                                <div>1天前</div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </div>
        --%>
    </div>
</div>


<div id="jinja-data"
     data-userlab-id=""
     data-authenticated="false"
     data-infotype=""
     data-request-friend-url="/user/friends/add"
     data-sendmessage-url="/user/messages/send"
     data-site-type="0"
     data-search-user-url="/user/search"
     data-request-friend-url="/user/friends/add"
     data-send-message-url="/user/messages/send"
     data-messages-url="/user/messages"
     data-accept-friend-request-url="/user/friends/accept"
     data-reject-friend-request-url="/user/friends/reject"

     data-user-email=""
     data-can-startlab="false"
     data-is-email-validated="false"
     data-qiniu-token-url="/api/qiniu/token"
     data-gravatar-url="/user/profile/gravatar"
     data-resend-email="/resendemail"
     data-site-type="0"

     data-current-username=""
     data-current-userid=""
     data-username="石头山"
     data-userid="13"
     data-code-url="/user/sms/code"
     data-account-phone="/user/account/phone"
     data-account-email="/user/account/email"
     data-account-password="/user/account/password"
     data-account-git="/user/account/git"


></div>












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


<script src="${pageContext.request.contextPath}/pages/app/dest/user/index.js?=2016121272249"></script>

<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>

<script>
    $("#category").find("a").click(function () {
        $(this).parent().find("span").removeClass("label-success");
        $(this).find("span").addClass("label-success");
        var users_id="${user.id}";
        var category=$(this).attr("value");
        ajaxStudy(1,users_id,category);
    });
    function ajaxStudy(page,users_id,catagory) {
        $.post("${pageContext.request.contextPath}/course/ajaxStudy",{page:page,users_id:users_id,catagory:catagory},function (pageInfo) {
            $("#row_course").empty();
            pageInfo.list.forEach(function (course) {
                var c="  <div class='col-md-4 col-sm-6  course'>\n" +
                    "                                <a class='course-box' href='${pageContext.request.contextPath}/course/findByCourseId?courseId="+course.id+"'>\n" +
                    "                                    <div class='sign-box'>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "                                        <i class='fa fa-star-o course-follow pull-right'\n" +
                    "                                           data-follow-url='/courses/63/follow'\n" +
                    "                                           data-unfollow-url='/courses/63/unfollow'  style='display:none'  ></i>\n" +
                    "\n" +
                    "                                    </div>\n" +
                    "                                    <div class='course-img'>\n" +
                    "\n" +
                    "                                        <img alt='新手指南之玩转实验楼' src='/pages/img/"+course.courseimg+"'>\n" +
                    "\n" +
                    "                                    </div>\n" +
                    "\n" +
                    "                                    <div class='course-body'>\n" +
                    "                                        <span class='course-title' data-toggle='tooltip' data-placement='bottom' title='新手指南之玩转实验楼'>"+course.title+"</span>\n" +
                    "                                    </div>\n" +
                    "                                    <div class='course-footer'>\n" +
                    "                                <span class='course-per-num pull-left'>\n" +
                    "                                    <i class='fa fa-users'></i>\n" +
                    "\n" +
                    "                                   "+course.studys+"\n" +
                    "\n" +
                    "                                </span>\n" +
                    "\n" ;
                if(course.category==2){
                    // console.log(course.category)
                    c+=  "                                            <span class='course-money pull-right'>会员</span>\n"
                }

                c+= "                                    </div>\n" +
                    "                                </a>\n" +
                    "                            </div>";

                $("#row_course").append(c);
            })
            var p="<nav class='pagination-container'>\n" +
                "                            <ul class='pagination' id='Page'>\n" +
                "\n" +
                "                                <li class='disabled'>\n" +
                "                                    <a href='#' aria-label='Previous'>\n" +
                "                                        <span aria-hidden='true'>上一页</span>\n" +
                "                                    </a>\n" +
                "                                </li>\n";
            for(var page=1;page<=pageInfo.pages;page++){
                if(page==pageInfo.pageNum){
                    p=p+"                                    <li class='active'>\n" +
                        "                                        <a  href='javascript:void(0)'>"+page+"</a>\n" +
                        "                                    </li>\n" ;
                }else{
                    p=p+"                                    <li >\n" +
                        "                                        <a href='javascript:void(0)'>"+page+"</a>\n" +
                        "                                    </li>\n" ;
                }

            }
            p+="\n" +
                "                                <li class=''>\n" +
                "                                    <a aria-label='Next' href='javascript:void(0)'>\n" +
                "                                        <span aria-hidden='true'>下一页</span>\n" +
                "                                    </a>\n" +
                "                                </li>\n" +
                "\n" +
                "                            </ul>\n" +
                "                        </nav>";
            $("#row_course").append(p);
            $("#Page li").click(function () {
                Page(this);
            });
        })

    }
    $("#Page li").click(function () {
        Page(this);
    });

    function Page(t) {
        var page=$(t).find("a").text();
        var users_id="${user.id}";
        var category=$("#category a").find(".label-success").parent().attr("value");
        console.log(category)
        ajaxStudy(page,users_id,category);
    }

</script>


</body>
</html>

