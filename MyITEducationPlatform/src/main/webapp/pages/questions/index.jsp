<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-12
  Time: 15:02
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



    <title>讨论区 - 实验楼</title>



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

                <ul class="nav nav-tabs question-types" role="tablist" id="discuss" style="cursor: pointer">


                    <li role="presentation" class="active">
                        <a  aria-controls="all" role="tab" toggle="tab" value="0">全部</a>
                    </li>

                    <li role="presentation" >
                        <a  aria-controls="course" role="tab" toggle="tab" value="1">课程问答</a>
                    </li>

                    <li role="presentation" >
                        <a aria-controls="discussion" role="tab" toggle="tab" value="2">交流讨论</a>
                    </li>

                    <%--<li role="presentation" >--%>
                        <%--<a href="#sharing" aria-controls="sharing" role="tab" toggle="tab">技术分享</a>--%>
                    <%--</li>--%>

                    <%--<li role="presentation" >--%>
                        <%--<a href="#notice" aria-controls="notice" role="tab" toggle="tab">站内公告</a>--%>
                    <%--</li>--%>



                    <div class="question-sort" style="cursor:pointer">
                        <a class="active" onclick="changeBtn(this)"  >最新</a>
                        /
                        <a   onclick="changeBtn(this)">最热</a>
                        <%--/
                        <a  href="#unanswered" >未回复</a></li>--%>
                    </div>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="category">

                        <ul  class="row question-items">

<%--
                            <li class="question-item">
                                <div class="col-md-10">
                                    <div class="col-sm-2 question-item-author">




                                        <div class="user-avatar ">
                                            <a class="avatar" href="${pageContext.request.contextPath}/pages/user/13/study.html" target="_blank">
                                                <img src="https://dn-simplecloud.xxxxxx.com/gravataradmin.png?imageView2/1/w/100/h/100">
                                            </a>

                                        </div>

                                    </div>
                                    <div class="col-sm-10">
                                        <h4>

                                            <img src="${pageContext.request.contextPath}/pages/img/topQuestion.png">

                                            <a class="question-item-title" href="show.html" target="_blank"> 实验楼百楼俱乐部成立，欢迎100楼的你加入！</a>

                                        </h4>
                                        <div class="question-item-summary">





                                            <div class="user-username ">
                                                <a class="avatar" href="${pageContext.request.contextPath}/pages/user/13/study.html" target="_blank">

                                                    shiyanlouadmin


                                                </a>
                                                <span class="user-level">L14</span>
                                            </div>


                                            <span class="question-item-date">3小时前</span>

                                            最后回复 <span class="question-item-date">



    <div class="user-username ">
        <a class="username" href="/user/256544" target="_blank">

                芃逆明


        </a>
        <span class="user-level">L38</span>
    </div>
 </span>




                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 question-item-rank">
                                    <div class="question-item-answered">
                                        <div>89</div>
                                        <div>回复</div>
                                    </div>
                                    <div class="question-item-views">
                                        <div>2409</div>
                                        <div>查看</div>
                                    </div>
                                </div>
                            </li>
                            --%>
                            <c:forEach var="question_course" items="${courses.list}">
                                <li class='question-item'>
                                    <div class='col-md-10'>
                                        <div class='col-sm-2 question-item-author'>




                                            <div class='user-avatar '>
                                                <a class='avatar' href='' target='_blank'>
                                                    <img src='${pageContext.request.contextPath}/pages/img/${question_course.userInfo.userDetail.avatar}'>
                                                </a>

                                                <a class='member-icon' href='/vip' target='_blank'>

                                                    <img src='${pageContext.request.contextPath}/pages/img/vip-icon.png'>

                                                </a>

                                            </div>

                                        </div>
                                        <div class='col-sm-10'>
                                            <h4>

                                                <a class='question-item-title' href='${pageContext.request.contextPath}/question/${question_course.id}' target='_blank'> ${question_course.title}</a>

                                            </h4>
                                            <div class='question-item-summary'>





                                                <div class='user-username '>
                                                    <a class='username' href='/user/147396' target='_blank'>

                                                        ${question_course.userInfo.userDetail.username}


                                                    </a>
                                                    <span class='user-level'>L8</span>
                                                </div>


                                                <span class='question-item-date'>${question_course.pubdateStr}</span>

                                                最后回复 <span class='question-item-date'>



                                                    <div class='user-username '>
                                                        <a class='username' href='/user/272204' target='_blank'>

                                                                taichu


                                                        </a>
                                                        <span class='user-level'>L2</span>
                                                    </div>
                                                 </span>



                                                <span class='question-item-tags'>

                                                    <a class='tagStyle2' href='/questions/?tag=Python' target='_blank'>Python</a>

                                                </span>


                                            </div>
                                        </div>
                                    </div>
                                    <div class='col-md-2 question-item-rank'>
                                        <div class='question-item-answered'>
                                            <div>2</div>
                                            <div>回复</div>
                                        </div>
                                        <div class='question-item-views'>
                                            <div>132</div>
                                            <div>查看</div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>


                        </ul>




                        <jsp:include page="${pageContext.request.contextPath}/pages/pages.jsp"/>



                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="${pageContext.request.contextPath}/pages/right-aside.jsp"/>
    </div>
</div>





<jsp:include page="${pageContext.request.contextPath}/pages/askquestion.jsp"/>

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

     data-question-form="/questions/meta"
     data-is-authenticated="false"
     data-login-url="/login?next=%2Fquestions%2F"
     data-qiniu-token-url="/api/qiniu/token"
     data-userid=""
></div>

<script src="${pageContext.request.contextPath}/pages/app/dest/question/index.js?=2016121272249"></script>

<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>

<script>

    function changeBtn(t) {

        $(t).parent().find(".active").removeClass("active");
        $(t).addClass("active");
        var orderWay=$(t).text();
        var discuss=$("#discuss").find("li[class=active]").find("a").attr("value");
        showQue(1,discuss,orderWay);
    }

    $("#discuss li").click(function () {
        $(this).parent().find("li[class='active']").removeClass("active");
        $(this).addClass("active");
        var discuss=$(this).find("a").attr("value");
        var orderWay=$(this).parent().find(".question-sort").find(".active").text();
        showQue(1,discuss,orderWay);
    });
    function showQue(page,discuss,orderWay) {
        $.post("${pageContext.request.contextPath}/question/findByCategory",
            {page:1,discuss:discuss,orderWay:orderWay},
            function (pageInfos) {
                $("#category .question-items").empty();
                $("#category nav").remove();
                $.each(pageInfos.list,function (i,item) {

                    $("#category .question-items").append(" <li class='question-item'>\n" +
                        "                                    <div class='col-md-10'>\n" +
                        "                                        <div class='col-sm-2 question-item-author'>\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "                                            <div class='user-avatar '>\n" +
                        "                                                <a class='avatar' href='/user/147396' target='_blank'>\n" +
                        "                                                    <img src='${pageContext.request.contextPath}/pages/img/"+item.userInfo.userDetail.avatar+"'>\n" +
                        "                                                </a>\n" +
                        "\n" +
                        "                                                <a class='member-icon' href='/vip' target='_blank'>\n" +
                        "\n" +
                        "                                                    <img src='${pageContext.request.contextPath}/pages/img/vip-icon.png'>\n" +
                        "\n" +
                        "                                                </a>\n" +
                        "\n" +
                        "                                            </div>\n" +
                        "\n" +
                        "                                        </div>\n" +
                        "                                        <div class='col-sm-10'>\n" +
                        "                                            <h4>\n" +
                        "\n" +
                        "                                                <a class='question-item-title' href='${pageContext.request.contextPath}/question/"+item.id+"' target='_blank'> "+item.title+"</a>\n" +
                        "\n" +
                        "                                            </h4>\n" +
                        "                                            <div class='question-item-summary'>\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "                                                <div class='user-username '>\n" +
                        "                                                    <a class='username' href='/user/147396' target='_blank'>\n" +item.userInfo.userDetail.username+
                        "\n" +
                        "                                                    </a>\n" +
                        "                                                    <span class='user-level'>L8</span>\n" +
                        "                                                </div>\n" +
                        "\n" +
                        "\n" +
                        "                                                <span class='question-item-date'>"+item.pubdateStr+"</span>\n" +
                        "\n" +
                        "                                                最后回复 <span class='question-item-date'>\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "                                                    <div class='user-username '>\n" +
                        "                                                        <a class='username' href='/user/272204' target='_blank'>\n" +
                        "\n" +
                        "                                                                taichu\n" +
                        "\n" +
                        "\n" +
                        "                                                        </a>\n" +
                        "                                                        <span class='user-level'>L2</span>\n" +
                        "                                                    </div>\n" +
                        "                                                 </span>\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "                                                <span class='question-item-tags'>\n" +
                        "\n" +
                        "                                                    <a class='tagStyle2' href='/questions/?tag=Python' target='_blank'>Python</a>\n" +
                        "\n" +
                        "                                                </span>\n" +
                        "\n" +
                        "\n" +
                        "                                            </div>\n" +
                        "                                        </div>\n" +
                        "                                    </div>\n" +
                        "                                    <div class='col-md-2 question-item-rank'>\n" +
                        "                                        <div class='question-item-answered'>\n" +
                        "                                            <div>2</div>\n" +
                        "                                            <div>回复</div>\n" +
                        "                                        </div>\n" +
                        "                                        <div class='question-item-views'>\n" +
                        "                                            <div>132</div>\n" +
                        "                                            <div>查看</div>\n" +
                        "                                        </div>\n" +
                        "                                    </div>\n" +
                        "                                </li>");
                });

                var p="<nav class='pagination-container'>\n" +
                    "                            <ul class='pagination' id='Page'>\n" +
                    "\n" +
                    "                                <li class='disabled'>\n" +
                    "                                    <a href='#' aria-label='Previous'>\n" +
                    "                                        <span aria-hidden='true'>上一页</span>\n" +
                    "                                    </a>\n" +
                    "                                </li>\n";
                for(var page=1;page<=pageInfos.pages;page++){
                    if(page==pageInfos.pageNum){
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
                $("#category").append(p);
            });

    }


</script>


</body>
</html>

