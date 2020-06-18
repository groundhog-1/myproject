<%@ page import="java.util.List" %>
<%@ page import="com.oyyb.domain.Course" %>
<%@ page import="com.oyyb.dao.CourseDao" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-04
  Time: 20:23
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


    <title>全部 - 课程 - 实验楼</title>




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












<div class="container layout layout-margin-top">


    <div class="row">
        <div class="col-md-9 layout-body">

            <div class="content">
                <div class="row course-cates">
                    <div class="col-md-1 course-cates-title">类别：</div>
                    <div class="col-md-11 course-cates-content" id="category">
                        <a class="active" href="javascript:void(0)" onclick="findAllCourse(this)">全部</a>
                        <a class="" href="javascript:void(0)" onclick="findAllCourse(this)" value="1">免费</a>
                        <div class="course-cates-vip" onclick="findAllCourse(this)" value="2" >
                            <a target="_blank" href="javascript:void(0)"><img src="${pageContext.request.contextPath}/pages/img/vip-icon.png"></a>
                            <a class="" href="javascript:void(0)" >会员</a>
                        </div>
                    </div>
                </div>
                <div class="row course-cates">
                    <div class="col-md-1 course-cates-title">标签：</div>
                    <div class="col-md-11 course-cates-content" id="labelName">
                        <a class="active" href="javascript:void(0)" onclick="findAllCourse(this)" >全部</a>
                        <c:forEach items="${labels}" var="label">
                            <a class="" href="javascript:void(0)" onclick="findAllCourse(this)"  >${label}</a>
                        </c:forEach>



                    </div>
                </div>
            </div>
            <div class="content position-relative">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#">已上线</a></li>
                    <li class="disabled"><a href="#" class="stat-event" data-stat="preview_course" >即将上线</a></li>
                </ul>
                <div class="clearfix"></div>
                <div class="courses-sort" id="course-order" >
                    <a  href="javascript:void(0)" class="active">最新</a>
                    /
                    <a  href="javascript:void(0)">最热</a>
                </div>
                <div class="search-result"></div>
                <div class="row" id="row_courses">

                    <div id="row_course">

                        <c:forEach items="${requestScope.courses.list}" var="course">

                            <div class='col-md-4 col-sm-6  course'>
                                <a class='course-box' href='${pageContext.request.contextPath}/course/findByCourseId?courseId=${course.id}'>
                                    <div class='sign-box'>



                                        <i class='fa fa-star-o course-follow pull-right'
                                           href="${pageContext.request.contextPath}/user/addCourse?userid=${user.id}&courseid=${course.id}"
                                             style='display:none'  ></i>

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
                        <%--<nav class='pagination-container'>
                            <ul class='pagination' id="Page">

                                <li >
                                    <a href='#' aria-label='Previous'>
                                        <span aria-hidden='true'>上一页</span>
                                    </a>
                                </li>
                                <c:forEach begin='1' end='${courses.pages}' var='page'>
                                    <c:if test="${page==1}">
                                        <li class="active">
                                            <a href='#'>${page}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page!=1}">
                                        <li >
                                            <a href='#'>${page}</a>
                                        </li>
                                    </c:if>


                                </c:forEach>

                                <li class=''>
                                    <a aria-label='Next' href='javascript:void(0)'>
                                        <span aria-hidden='true'>下一页</span>
                                    </a>
                                </li>

                            </ul>
                        </nav>--%>
                        <jsp:include page="${pageContext.request.contextPath}/pages/pages.jsp"/>
                    </div>



                </div>


                </div>

            </div>
          <jsp:include page="${pageContext.request.contextPath}/pages/right-aside.jsp"/>
        </div>
    </div>


   <jsp:include page="${pageContext.request.contextPath}/pages/invite-user.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/pages/flash-message.jsp"/>
   <jsp:include page="${pageContext.request.contextPath}/pages/modal-message.jsp"/>










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
         data-loginurl="/login"
         data-private-course-url="/courses/join"
         data-site-type="0">

    </div>

    <script src="${pageContext.request.contextPath}/pages/app/dest/course/index.js?=2016121272249"></script>






   <jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>
<script>
    function findAllCourse(t) {


        ajaxFindAll(t,1);

    }
    function ajaxFindAll(t,page) {
        $(t).parent().find(".active").removeClass("active");
        $(t).addClass("active");
        var category= $("#category .active").attr("value");
        var param="?";
        if (category!=undefined){
            param=param+"category="+category;
        }
        var labelName= $("#labelName .active").text();
        var label_name=escape(encodeURIComponent(labelName));
        if(labelName!="全部"){
            param=param+"&label_name="+label_name;
        }
        var courseOrder= $("#course-order").find(".active").text();
        //解决中文乱码
        courseOrder=escape(encodeURIComponent(courseOrder));
        param=param+"&courseOrder="+courseOrder+"&page="+page;

        $.post("${pageContext.request.contextPath}/course/ajaxFindAll"+param,function (pageInfo) {
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
                if(course.category==3){
                    console.log(course.category)
                    c+= "                                            <span class='course-money pull-right'>训练营</span>\n" ;
                }
                c+= "                                    </div>\n" +
                    "                                </a>\n" +
                    "                            </div>";

                $("#row_course").append(c);
            });
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
                        "                                        <a  href='#'>"+page+"</a>\n" +
                        "                                    </li>\n" ;
                }else{
                    p=p+"                                    <li >\n" +
                        "                                        <a href='#'>"+page+"</a>\n" +
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
        });
    }
    $("#course-order a").click(function () {
        findAllCourse(this);
    })
    $("#Page li").click(function () {
        Page(this);
    });

    function Page(t) {
        var page=$(t).find("a").text();
       ajaxFindAll(t,page);
    }



</script>




</body>
</html>

