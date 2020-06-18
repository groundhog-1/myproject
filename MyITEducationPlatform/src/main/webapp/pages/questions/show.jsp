<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-13
  Time: 14:05
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


    <title>${question.title}</title>




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
        <li><a href="${pageContext.request.contextPath}/question/findAllDiscuss">讨论区</a></li>

        <li><a href="/question/findAllDiscuss">课程问答</a></li>

        <li class="active">
            <a href="/questions/8641">
                ${question.title}
            </a>
        </li>
    </ol>

    <div class="row">
        <div class="col-md-9 layout-body">

            <div class="content question-detail">
                <div class="question-headline">
                    <span class="question-title">${question.title} </span>
                    <span class="question-figure">3 回复</span><span class="question-figure">17 查看</span>
                </div>
                <div class="question-author">




                    <div class="user-avatar ">
                        <a class="avatar" href="/user/347060" target="_blank">
                            <img src="${pageContext.request.contextPath}/pages/img/${question.userInfo.userDetail.avatar}">
                        </a>

                    </div>





                    <div class="user-username ">
                        <a class="username" href="/user/347060" target="_blank">${question.userInfo.userDetail.username}</a>
                        <span class="user-level">L4</span>
                    </div>

                    <span>${question.pubdateStr}</span>

                    <span><a href="/questions/?area_type=course">课程问答</a></span>


                    <span class="question-from">来自： <a href="">${question.course_context_name} </a></span>


                    <a href="#sign-modal" data-toggle="modal" data-sign="signin" class="btn btn-primary collectBtn">收藏</a>




                </div>
                <div class="question-content markdown-body">
                    <p>${question.content}
                    </p>



                    <div class="labreport-detail-like">

                        <span class="btn btn-default btn-weiboshare">
                            <i class="fa fa-share-alt"></i>
                        </span>
                    </div>

                </div>

                <p class="ptilte">全部回复</p>
                <hr/>
                <div class="question-answers">

                    <c:forEach items="${question.question_replies}" var="reply">
                        <div class='answer-item'>
                            <div class='answer-head'>




                                <div class='user-avatar '>
                                    <a class='avatar' href='/user/212008' target='_blank'>
                                        <img src='${pageContext.request.contextPath}/pages/img/${reply.userInfo.userDetail.avatar}'>
                                    </a>

                                    <a class='member-icon' href='/vip' target='_blank'>

                                        <img src='
                                    ${pageContext.request.contextPath}/pages/img/vip-icon.png
                                  '>

                                    </a>

                                </div>

                            </div>
                            <div class='answer-detail'>
                                            <span class='comment-reply'>




                                                <div class='user-username '>
                                                    <a class='username' href='/user/212008' target='_blank'>${reply.userInfo.userDetail.username}</a>
                                                    <span class='user-level'>L234</span>
                                                </div>

                                            </span>
                                <c:if test="${reply.buserInfo!=null && reply.brespondent_id!=reply.respondent_id}">
                                    <span class='comment-parent'>
                                                    回复




                                <div class='user-username '>
                                    <a class='username' href='/user/347060' target='_blank'>

                                            ${reply.buserInfo.userDetail.username}


                                    </a>
                                    <span class='user-level'>L4</span>
                                </div>

                                </span>
                                </c:if>


                                <div class='answer-content markdown-body'>
                                            <%--<textarea style='display:none;'>开始实验后，如图所示：--%>

                                <%--![图片描述](https://dn-simplecloud.xxxxxx.com/uid/212008/1483688692465.png-wm)</textarea>--%>
                                    <p>${reply.content}</p>
                                </div>



                                <div>

                                        <span class='create-time'>${reply.pubdateStr}</span>
                                    <c:if test="${user!=null}">
                                        <input hidden value="${question.userInfo.id}">
                                        <span style='float: right;cursor: pointer;margin-right: 20px' onclick='replyQue(this)'>回复</span>

                                    </c:if>
                                    <hr/>
                                </div>
                            </div>
                        </div>
                    </c:forEach>



                </div>
                <div class="your-answer words-ctrl">
                    <c:if test="${user==null}">
                        <p style="text-align: center;font-weight: 300; font-size: 18px;">
                            <a href="#sign-modal" data-toggle="modal" data-sign="signin" data-next="/questions/8641">登录</a>后回复帖子
                        </p>
                    </c:if>
                    <c:if test="${user!=null}">
                        <textarea id="text1" style="width: 786px;height:204px"></textarea>
                        <input hidden value="${question.id}">
                        <input hidden value="0">
                        <button onclick="releaseC(this)" class="btn btn-primary">发布</button>
                    </c:if>


                </div>
            </div>

        </div>
        <jsp:include page="${pageContext.request.contextPath}/pages/right-aside.jsp"/>
    </div>
</div>





<jsp:include page="${pageContext.request.contextPath}/pages/askquestion.jsp"/>


<div class="modal fade askquestion-modal" id="edit-question-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role=document>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">发帖</h4>
            </div>
            <div class="modal-body words-ctrl">
                <form class="form-horizontal" action="/questions/">
                    <input name="_csrf_token" type=hidden value="1483797676##818560cdc39a2ed99c488cf67125c1f53c60ad03">
                    <div class="form-group">
                        <label class="col-md-2 control-label">标题</label>
                        <div class="col-md-10">
                            <input type="text" name="title" min="5" max="100" class="form-control" placeholder="至少输入5个字" value="好心人可以告诉我怎么截屏吗。。。">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">描述</label>
                        <div class="col-md-10">



                            <div class="tabpanel mkeditor">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active">
                                        <a href="#edit-question-editor" role="tab" data-toggle="tab">编辑</a>
                                    </li>
                                    <li role="presentation">
                                        <a class="mkeditor-btn-view" href="#edit-question-viewer" role="tab" data-toggle="tab">预览</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active mkeditor-editor" id="edit-question-editor" role="tabpanel">

                                        <div class="btn-group" role="group">

                                            <button type="button" class="btn btn-default mkeditor-btn-bold">
                                                <i class="fa fa-bold"></i>

                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-italic">
                                                <i class="fa fa-italic"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-link">
                                                <i class="fa fa-link"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-quote">
                                                <i class="fa fa-quote-left"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-code">
                                                <i class="fa fa-code"></i>
                                            </button>
                                            <button id="mkeditor-edit-question" type="button" class="btn btn-default mkeditor-btn-img">
                                                <i class="fa fa-image"></i>
                                            </button>

                                            <button type="button" class="btn btn-default mkeditor-btn-listol">
                                                <i class="fa fa-list-ol"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-listul">
                                                <i class="fa fa-list-ul"></i>
                                            </button>
                                        </div>
                                        <div class="btn-group pull-right" role="group">
                                            <a style="font-size:12px; color:#666; text-decoration:underline;" href="/questions/764" target="_blank">
                                                <i class="fa fa-question-circle"></i>Markdown 语法
                                            </a>
                                        </div>
                                        <textarea name="content" class="content"
                                                  min="0" max="20000"
                                                  placeholder="推荐使用 Markdown 语法，至少输入 5 个字"></textarea>
                                        <div class="help-block"></div>
                                    </div>
                                    <div class="tab-pane mkeditor-viewer markdown-body" id="edit-question-viewer" role="tabpanel">
                                        <div></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <label class="col-md-2 control-label">板块</label>
                        <div class="col-md-10">
                            <div class="q-types" data-type="1">
                            </div>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <a type="button" class="submit-question btn btn-primary" href="/vip" target="_blank" style="background:#FFFFFF;color:#00CC99;border:none;float:left;padding-left:0;"><img src="https://static.xxxxxx.com/img/senior-vip-icon.png" alt=""> 加入高级会员获得助教答疑</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="submit-question btn btn-primary" data-dismiss="modal">提交</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="delete-question-modal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">确定删除</h4>
            </div>
            <div class="modal-body">
                <p>删除后不可恢复</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-confirm" data-dismiss="modal">确定</button>
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


<textarea id="qcontent" style="display:none"></textarea>
<div id="jinja-data"
     data-question-form="/questions/meta"
     data-is-authenticated="false"
     data-login-url="/login?next=%2Fquestions%2F"
     data-qiniu-token-url="/api/qiniu/token"
     data-userid=""
     data-site-type="0"
     data-top-question-url = "/questions/8641/top"
     data-untop-question-url = "/questions/8641/untop"
     data-related-questions='/questions/related?course_id=115&tag_name=[]&question_id=8641'
     data-select="/questions/8641/select"
     data-unselect="/questions/8641/unselect"
     data-question-collected="false"
     data-collect-question-url="/questions/8641/favorite"
     data-cancel-collect-url="/questions/8641/favorite"
></div>
<script src="${pageContext.request.contextPath}/pages/app/dest/question/details.js?=2016121272249"></script>


<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>


<script>
    function releaseC(t) {
        var respondent_id="${user.id}";
        var brespondent_id=$(t).prev().val();
        var content=$(t).parent().find("textarea").val();
        var question_course_id=$(t).prev().prev().val();
        $.post("${pageContext.request.contextPath}/question/reply",
            {respondent_id:respondent_id,content:content,question_course_id:question_course_id,brespondent_id:brespondent_id},
            function (question_reply) {
            var reply="<div class='answer-item'>\n" +
                "                        <div class='answer-head'>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "                            <div class='user-avatar '>\n" +
                "                                <a class='avatar' href='/user/212008' target='_blank'>\n" +
                "                                    <img src='${pageContext.request.contextPath}/pages/img/"+question_reply.userInfo.userDetail.avatar+"'>\n" +
                "                                </a>\n" +
                "\n" +
                "                                <a class='member-icon' href='/vip' target='_blank'>\n" +
                "\n" +
                "                                    <img src='\n" +
                "                                    https://static.xxxxxx.com/img/vip-icon.png\n" +
                "                                  '>\n" +
                "\n" +
                "                                                        </a>\n" +
                "\n" +
                "                                                    </div>\n" +
                "\n" +
                "                                                </div>\n" +
                "                                                <div class='answer-detail'>\n" +
                "                                            <span class='comment-reply'>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "                                                <div class='user-username '>\n" +
                "                                                    <a class='username' href='/user/212008' target='_blank'>" +question_reply.userInfo.userDetail.username+
                "</a>" +
                "                                                    <span class='user-level'>L234</span>\n" +
                    
                "                                                </div>\n" +
                "\n" +
                "                                            </span>\n" ;
                if(question_reply.respondent_id!=question_reply.respondent_id && question_reply.buserInfo!=null){
                    reply+="<span class='comment-parent'>\n" +
                        "                                                    回复\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "                                <div class='user-username '>\n" +
                        "                                    <a class='username' href='/user/347060' target='_blank'>\n" +
                        "\n" +
                        "                                           "+question_reply.buserInfo.userDetail.username+"\n" +
                        "\n" +
                        "\n" +
                        "                                    </a>\n" +
                        "                                    <span class='user-level'>L4</span>\n" +
                        "                                </div>\n" +
                        "\n" +
                        "                                </span>";
                }
                reply+="\n" +
                "                                                    <div class='answer-content markdown-body'>\n" +
                "  <p>"+question_reply.content+"</p>                                                  </div>\n" +
                "\n" +
                "\n" +
                "\n" +
                "                                                    <div>\n" +
                "                                                        <span class='create-time'>"+question_reply.pubdateStr+"</span>\n" +
                "\n" +
                "      <span style='float: right;cursor: pointer;margin-right: 20px' onclick='replyQue(this)'>回复</span>                          <hr/>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                    </div>\n";
            $(".question-answers").prepend(reply);
            $("#text1").val("");

        });
    }
    function replyQue(t) {
        var brep_id= $(t).prev().val();
        console.log(brep_id);
        var brep_name=$(t).parents(".answer-detail").find("a[class='username']").text();
        console.log(brep_name);
        $("#text1").next().next().attr("value",brep_id);
        $("#text1").val(" 回复 "+brep_name+" : ");

    }
</script>

</body>
</html>

