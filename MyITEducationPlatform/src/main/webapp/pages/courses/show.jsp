<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-04
  Time: 21:47
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
    <script src="${pageContext.request.contextPath}/pages/static/jquery/2.2.4/jquery.min.js"></script>


    <title> ${course.title} - 实验楼</title>



    <meta content="" name="author">

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/static/font-awesome//4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/static/highlight.js/9.8.0/monokai-sublime.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/katex/0.6.0/katex.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/videojs/5.11.7/video-js.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/dest/styles.css?=2016121272249">

    <style>
        .comment{
            font-size: 15px;
        }
        .comment a{
            text-decoration: none;
            cursor: pointer;
            display: block;
            float: right;
            color: #5e5e5e;
            font-size: 15px;
        }
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/restatic/js/libs/marked/katex/katex.min.css">
    <style>
        .bootcamp-infobox {
            margin: 50px 0 0;
        }
        .invite-friends-link {
            margin-top:10px;
            padding-left:8px;
        }
        .invite-friends-link input {
            margin-left:-5px;
        }
        .invite-friends-link button {
            float:left;
            margin-top:5px;
            margin-left:-5px;
        }
        .invite-friends-link .copy-msg {
            float:left;
            margin-top:10px;
            margin-left:20px;
            color:#42b1ad;
        }
        p.join-vip-faq {
            margin-top:20px;
            margin-bottom:-50px;
            font-size:13px;
        }
        p.join-vip-faq img {
            height:13px;
            width:13px;
            margin-top:-2px;
        }
        a.vip-without-bean {
            font-size:18px;
            line-height:30px;
        }

        .gold{
            color: gold;
        }


    </style>



</head>

<body>





<jsp:include page="${pageContext.request.contextPath}/pages/navbar.jsp"></jsp:include>










<div class="container layout layout-margin-top">

    <ol class="breadcrumb">
        <li><a href="/courses/">全部课程</a></li>

        <li>

            <a href="/courses/?tag=Linux">Linux</a>

        </li>

        <li class="active">
            <a href="/courses/1">
                ${course.title}
            </a>
        </li>
    </ol>

    <div class="row">
        <div class="col-md-9 layout-body">



            <div class="side-image side-image-mobile">
                <img src="https://dn-simplecloud.xxxxxx.com/ncn1.jpg?imageView2/0/h/300">
            </div>
            <div class="content course-infobox">
                <div class="clearfix course-infobox-header">
                    <h4 class="pull-left course-infobox-title">

                        <span>${course.title}</span>

                    </h4>
                    <div class="pull-right course-infobox-follow"
                         data-follow-url="/courses/1/follow"
                         data-unfollow-url="/courses/1/unfollow">
                        <span class="course-infobox-followers">${course.attentions}</span>
                        <span>人关注</span>
                        <c:if test="${user==null}">
                            <a href="#sign-modal" data-toggle="modal" data-sign="signin"><span class="fa fa-star-o" href="#" style="cursor: pointer;font-size: 18px"></span></a>
                        </c:if>
                        <c:if test="${user!=null && attention_flag==true}">

                                <a href="javascript:void(0)" onclick="changeAttention(this)"><span class="fa fa-star-o gold" href="#" style="cursor: pointer;font-size: 18px;"></span></a>

                        </c:if>
                        <c:if test="${user!=null && attention_flag==false}">

                            <a href="javascript:void(0)" onclick="changeAttention(this)"><span class="fa fa-star-o " href="#" style="cursor: pointer;font-size: 18px;"></span></a>

                        </c:if>

                    </div>
                </div>
                <div class="clearfix course-infobox-body">
                    <div class="course-infobox-content">
                        <p>${course.introduction}</p>

                    </div>

                    <div class="course-infobox-progress">
                        <c:if test="${user==null}">
                            <a class="link btn btn-primary" href="#sign-modal" data-toggle="modal" data-sign="signin">加入学习</a>
                        </c:if>
                        <c:if test="${user!=null && course.category==1 }">
                            <c:if test="${flag==false}">
                                <button onclick="addCourse(this)" class="btn btn-primary" >加入学习</button>
                            </c:if>
                            <c:if test="${flag==true}">
                                <button  class="btn btn-primary" disabled>已加入课程</button>
                            </c:if>
                        </c:if>

                        <c:if test="${user!=null && course.category==2 && user.permission.name=='vip'}">
                            <c:if test="${flag==false}">
                                <button onclick="addCourse(this)" class="btn btn-primary" >加入学习</button>
                            </c:if>
                            <c:if test="${flag==true}">
                                <button  class="btn btn-primary" disabled>已加入课程</button>
                            </c:if>
                        </c:if>

                        <c:if test="${user!=null &&course.category==2 && user.permission==null}">
                            <a class="link" href="${pageContext.request.contextPath}/pages/vip/index.jsp">加入会员，才能学习</a>
                        </c:if>

<%--
                        <c:forEach var="i" items="${course.course_contexts}">
                            <div class="course-progress-new"></div>
                        </c:forEach>

                        <span>（0/${course.course_contexts.size()}）</span>--%>
                    </div>





                    <div class="pull-right course-infobox-price">

                    </div>

                </div>

                <div class="clearfix course-infobox-footer">

                    <div class="pull-right course-infobox-learned">${course.studys} 人学过</div>
                </div>

            </div>
            <div id="c1" class="content">
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active">
                        <a href="#labs" aria-controls="labs" role="tab" data-toggle="tab">实验列表</a>
                    </li>

                    <li role="presentation">
                        <a href="#comments" onclick="showCom(this)" class="stat-event" aria-controls="comments" role="tab" data-stat="course_comment" data-toggle="tab">课程评论(1194)</a>
                    </li>
                   <%-- <li role="presentation">
                        <a href="#reports" class="stat-event" data-stat="course_report" aria-controls="reports" role="tab" data-toggle="tab">实验报告(3417)</a>
                    </li>--%>
                    <li role="presentation">

                        <a href="#questions"  onclick="showQues(this)" class="stat-event" data-stat="course_question" aria-controls="questions" role="tab" data-toggle="tab">实验问答(1108)</a>

                    </li>
                </ul>
                <ul class="tab-content">

                    <div role="tabpanel" class="tab-pane active" id="labs">


                        <c:forEach items="${course.course_contexts}" var="context">

                            <div class="lab-item ">
                                <div class="lab-item-status">

                                    <img src="${pageContext.request.contextPath}/pages/img/lab-not-ok.png">

                                </div>
                                <div class="lab-item-index">第${context.sectionnumber}节</div>
                                <div class="lab-item-title" data-toggle="tooltip" data-placement="bottom" title="Linux 系统简介">${context.title}</div>
                                <div class="pull-right lab-item-ctrl" >
                                    <%--<a onclick="showDoc(this)" class="btn btn-default" href="#" data-toggle="modal" data-sign="signin" data-next="/courses/1">查看文档</a>--%>
                                    <%--<input type="text" hidden value="${context.video}">--%>
                                    <%--<a onclick="showMovie(this)" class="link btn btn-default" data-toggle="modal" data-sign="signin"  >--%>
                                    <%--<span class="glyphicon glyphicon-play" aria-hidden="true"></span></a>--%>
                                    <c:if test="${user==null}">
                                        <%--<a class="btn btn-default" href="#sign-modal" data-toggle="modal" data-sign="signin" data-next="/courses/1">查看文档</a>--%>
                                        <a href="#sign-modal" class="link btn btn-default" data-toggle="modal" data-sign="signin">
                                            <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a>
                                    </c:if>
                                    <c:if test="${user!=null && course.category==1}">
                                        <%--<a class="btn btn-default" href="#" data-toggle="modal" data-sign="signin" data-next="/courses/1">查看文档</a>--%>
                                        <input type="text" hidden value="${context.video}">
                                        <a href="#myModal" onclick="video_src(this)" class="link btn btn-default" data-toggle="modal" data-sign="signin">
                                            <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a>
                                        <input hidden value="${context.id}">
                                    </c:if>
                                    <c:if test="${user!=null && course.category==2 && user.permission.name==null}">
                                        <%--<a class="btn btn-default" href="#" data-toggle="modal" data-sign="signin" data-next="/courses/1">查看文档</a>--%>
                                        <input type="text" hidden value="${context.video}">
                                        <a href="${pageContext.request.contextPath}/pages/vip/index.jsp"  class="link " data-toggle="modal" data-sign="signin">
                                            请加入会员</a>
                                        <input hidden value="${context.id}">
                                    </c:if>
                                    <c:if test="${user!=null && course.category==2 && user.permission.name=='vip'}">
                                        <%--<a class="btn btn-default" href="#" data-toggle="modal" data-sign="signin" data-next="/courses/1">查看文档</a>--%>
                                        <input type="text" hidden value="${context.video}">
                                        <a href="#myModal" onclick="video_src(this)" class="link btn btn-default" data-toggle="modal" data-sign="signin">
                                            <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a>
                                        <input hidden value="${context.id}">
                                    </c:if>

                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <div id="myModal" style="margin: 100px auto;height: 720px;width: 720px" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                        <video style="position: absolute;right: 0;top: 0px;width: 720px;height:720px" class="movie" controls playbackRate>

                            <source   type="video/mp4">
                        </video>
                        <span id="close_model" style="color: black;position: absolute;right: 0;top: 0px" class="close glyphicon glyphicon-remove "  aria-hidden="true"></span>

                    </div>

                    <div role="tabpanel" class="tab-pane course-comment" id="comments">
                        <div class="comment-box">
                            <c:if test="${user==null}">
                                <div class="comment-form">
                                    <div class="comment-form-unlogin">
                                        请
                                        <a href="#sign-modal" data-toggle="modal" data-sign="signin" data-next="/courses/1"> 登录 </a>
                                        后发表评论
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${user!=null}">
                                <div class="comment-list" >
                                    <div id="nn">

                                    </div>

                                    <textarea id="course-comment-textarea" placeholder="输入你想说的话" rows="4" class="form-control" style="resize:none;"  wrap="soft"></textarea>

                                    <div class="btn-actions text-right"><!---->
                                        <input id="course_context_id"  hidden value="${course.id}">
                                        <button type="button" onclick="releaseComment(this)" class="btn btn-primary btn-submit" >
                                            发表评论
                                        </button>
                                    </div>
                                    <div class="comments">
                                 <%--       <div class='comment' style='margin-top: 20px'>
                                            <div style='float: left;height: 88px;'>
                                                <img class='img-circle' width='60px' height='60px' src='${pageContext.request.contextPath}/pages/img/c01.jpg'>
                                            </div>
                                            <div style='float: left;height: 100px;margin-left: 20px;'>
                                                <div style='height: 25%;line-height: 25%;color: #FFCC00;'>title</div>
                                                <div style='height: 50%;line-height: 25%'>title</div>
                                                <div style='height: 25%;line-height: 25%'>title <a style='float: right'>回复</a></div>
                                            </div>
                                        </div>--%>
                                      <%--  <div class='reply' style='margin-top: 20px;border-bottom: 1px solid #cccccc;'>
                                            <div style='float: left;height: 60px;'>
                                                <img class='img-circle' width='50px' height='50px' src='${pageContext.request.contextPath}/pages/img/c01.jpg'>
                                            </div>
                                            <div style='float: left;margin-left: 20px'>
                                                title <a style='float: right'>回复</a>
                                            </div>
                                            <div style='clear:both'></div>

                                        </div>--%>



                                    </div>
                                </div>
                            </c:if>
                            <%--<div style='width: 90%;float: right'>

                                <textarea placeholder='输入你想说的话'  rows='4' class='form-control' style='height:60px;resize: none;margin-bottom: 5px'  wrap='soft'></textarea>
                                <button class='btn btn-default' style='float: right;margin-right: 10px;border-radius: 5px'>发表</button>

                            </div>
--%>
                    <%--        <div class='reply' style='margin-top: 5px;margin-bottom5px;border-bottom: 1px solid #cccccc;'>
                                <div style='float: left;height: 45px;'>
                                    <img class='img-circle' width='40px' height='40px' src='${pageContext.request.contextPath}/pages/img/c01.jpg'>
                                </div>
                                <div style='float: left;margin-left: 20px;'>
                                    title @ title:
                                </div>
                                <div style='float: right;' ><a style='margin-top: 40%;margin-right: 20px'>回复</a></div>
                                <div style='clear:both'></div>

                            </div>--%>
                        </div>
                    </div>
             <%--       <div role="tabpanel" class="tab-pane" id="reports">
                        <span class="lab-id active" data-lab-id="None">全部</span>

                        <span class="lab-id" data-lab-id="1">第1节</span>

                        <span class="lab-id" data-lab-id="2">第2节</span>

                        <span class="lab-id" data-lab-id="3">第3节</span>

                        <span class="lab-id" data-lab-id="59">第4节</span>

                        <span class="lab-id" data-lab-id="60">第5节</span>

                        <span class="lab-id" data-lab-id="61">第6节</span>

                        <span class="lab-id" data-lab-id="62">第7节</span>

                        <span class="lab-id" data-lab-id="1917">第8节</span>

                        <span class="lab-id" data-lab-id="1918">第9节</span>

                        <span class="lab-id" data-lab-id="63">第10节</span>

                        <span class="lab-id" data-lab-id="337">第11节</span>

                        <span class="lab-id" data-lab-id="346">第12节</span>

                        <span class="lab-id" data-lab-id="354">第13节</span>

                        <span class="lab-id" data-lab-id="356">第14节</span>

                        <span class="lab-id" data-lab-id="1943">第15节</span>

                        <span class="lab-id" data-lab-id="1944">第16节</span>

                        <span class="lab-id" data-lab-id="1945">第17节</span>

                        <div class="report-owner">
                            <span class="owner-list" data-user-id="">我的报告</span> / <span class="owner-list active" data-user-id="None">所有报告</span>
                        </div>
                        <div class="row report-items"></div>
                        <div class="pagination-container"></div>
                    </div>--%>
                    <div role="tabpanel" class="tab-pane" id="questions">
                        <c:if test="${user==null}">
                            <a class="btn btn-success" href="#sign-modal" data-toggle="modal" data-sign="">我要提问</a>
                            <hr>
                        </c:if>
                        <c:if test="${user!=null}">
                            <a class="btn btn-success" href="#askquestion"  data-toggle="modal" data-sign="">我要提问</a>


                        <hr>
                        <div id="question-items" class="row question-items">
                         <%--   <li class='question-item'>
                                <div class='col-md-10'>
                                    <div class='col-sm-2 question-item-author'>
                                        <div class='user-avatar '>
                                            <a class='avatar' href='../user/13/study.html' target='_blank'>
                                                <img src='https://dn-simplecloud.xxxxxx.com/gravatarNTY0MzE5MjcwNTg4.png?v=1472709990977&amp;imageView2/1/w/200/h/200'>
                                            </a>

                                            <a class='member-icon' href='/vip' target='_blank'>

                                                <img src='&#10;            ../img/vip-icon.png&#10;          '>

                                            </a>

                                        </div>

                                    </div>
                                    <div class='col-sm-10'>
                                        <h4>

                                            <a class='question-item-title' href='show.html' target='_blank'> '模型（一）' 实验报告</a>

                                        </h4>
                                        <div class='question-item-summary'>
                                            <div class='user-username '>
                                                <a class='avatar' href='../user/13/study.html' target='_blank'>

                                                    Unchained_Coder


                                                </a>
                                                <span class='user-level'>L52</span>
                                            </div>


                                            <span class='question-item-date'>5分钟前</span>


                                            <span class='question-item-course'>
                来自
                <a href='/questions/courses/30' target='_blank'>Python Django Web框架</a>
            </span>



                                        </div>
                                    </div>
                                </div>
                                <div class='col-md-2 question-item-rank'>
                                    <div class=''>
                                        <div>0</div>
                                        <div>回复</div>
                                    </div>
                                    <div class='question-item-views'>
                                        <div>0</div>
                                        <div>查看</div>
                                    </div>
                                </div>
                            </li>--%>
                        </div>
                        <div class='pagination-container'>

                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        <div class="col-md-3 layout-side">

            <div class="side-image side-image-pc">
                <img src="${pageContext.request.contextPath}/pages/img/${course.courseimg}">
            </div>





            <div class="sidebox mooc-teacher">
                <div class="sidebox-header mooc-header">
                    <h4 class="sidebox-title">课程教师</h4>
                </div>
                <div class="sidebox-body mooc-content">
                    <a href="/user/20406" target="_blank">
                        <img src="${pageContext.request.contextPath}/pages/img/${userDetail.avatar}" class="img-circle" width="60px" height="60px">
                    </a>
                    <div class="mooc-info">
                        <div class="name"><strong>${userDetail.username}</strong> </div>

                        <div class="courses">共发布过<strong>${teacher.count}</strong>门课程</div>
                    </div>
                    <div class="mooc-extra-info">
                        <div class="word long-paragraph">
                            ${teacher.experience}
                        </div>
                    </div>
                </div>
                <div class="sidebox-footer mooc-footer">
                    <a href="#" >查看老师的所有课程 ></a>
                </div>
            </div>




            <div class="side-image">
                <a href="${pageContext.request.contextPath}/pages/vip/index.jsp" target="_blank">
                    <img src="${pageContext.request.contextPath}/pages/img/banner-vip.png">
                </a>
            </div>




<%--

            <div class="sidebox adv-course">
                <div class="sidebox-header">
                    <h4 class="sidebox-title">进阶课程</h4>
                </div>
                <div class="sideobx-body course-content">

                    <a href="/courses/204">实用Linux Shell编程</a>

                    <a href="/courses/2">Vim编辑器</a>

                    <a href="/courses/68">Linux命令实例练习</a>

                </div>
            </div>
--%>




        </div>
    </div>


</div>






<jsp:include page="${pageContext.request.contextPath}/pages/askquestion.jsp"/>

<jsp:include page="${pageContext.request.contextPath}/pages/invite-user.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/pages/flash-message.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/pages/modal-message.jsp"/>
<%--


    <div class="modal fade" id="start-newlab">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>开始新实验</h3>
                </div>
                <div class="modal-body" style="text-align:center">
                    <p> 一个实验正在进行，是否停止它，开始新实验？</p>

                </div>
                <div class="modal-footer" style="margin-top:0px">

                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                    <a class="btn btn-primary start-newlab-confirm">确定</a>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="start-evaluation-course">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>开始评估课实验</h3>
                </div>
                <div class="modal-body">
                    <div>
                        <p>为了让评估结果更加准确，请注意以下操作：</p>
                        <ul>
                            <li>完成实验后点击「停止实验」按钮</li>
                            <li>将代码提交到代码库</li>
                            <li>尽可能详尽的撰写实验报告</li>
                            <li>尽可能在实验操作的关键步骤截图</li>
                            <li>尽可能减少无用操作</li>
                            <li>尽可能高效的利用内存/CPU资源</li>
                        </ul>
                        <p>评估课还在不断完善中，我们真挚希望你能通过我们提供的这个平台，找到更好的发展机会。</p>
                    </div>
                    <br>
                    <div class="start-newlab"></div>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                    <a class="btn btn-primary start-confirm">确定</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="vip-startlab-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>开始实验</h3>
                </div>
                <div class="modal-body">
                    <div class="start-newlab"></div>
                    <br>
                    <div class="text-center vip-vm">
                        <a class="btn btn-default btn-lg newvm">创建新环境</a>

                    </div>
                    <br>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="bean-course-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">激活项目课：Linux 基础入门（新版）</h4>
                </div>
                <div class="modal-body">
                    <div style="font-size:14px; font-weight:thin;">
                        要在实验楼愉快地学习，先要熟练地使用 Linux，本实验介绍 Linux 基本操作，shell 环境下的常用命令。
                    </div>
                    <div style="margin:36px 0 18px; font-size:16px; font-weight:bold;">
                        您有 <span style="color:#f66;"><strong></strong></span> 个实验豆，激活本课程需要消耗 <span style="color:#f66;"><strong>0</strong></span> 个实验豆！
                    </div>
                    <div style="color:#84B61A; font-size:14px; font-weight:bold;">激活后可不限次数学习本课。<a href="/faq#shiyandou" style="font-weight:normal;" target="_blank">如何获得实验豆？</a></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

                    <a class="btn btn-primary getshiyandou" href="/faq#shiyandou" target="_blank" data-dismiss="modal">获取实验豆</a>

                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="charge-course-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h4 class="modal-title">课程报名</h4>
                </div>
                <div class="modal-body">
                    <form class="row form-horizontal">
                        <input name="_csrf_token" type=hidden value="1483794941##be4fb68b276c5f7cb970936cb25985cd53b943d1">
                        <div class="form-group">
                            <label class="col-md-2 control-label">邮箱</label>
                            <div class="col-md-10">
                                <input type="email" class="form-control" name="email" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">手机号码</label>
                            <div class="col-md-10">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="phone_no">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default charge-course-phone-code" type="button" style="padding:7px 12px;">获取验证码</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">验证码</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="verify_code">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary charge-course-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="paid-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="text-align:center;">支付确认</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <button class="btn btn-primary paid-confirm" type="button">支付成功</button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-primary paid-method" type="button" style="background:none; color:#0c9">选择支付方式</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

--%>

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
     data-userlab-id=""
     data-course-id="1"
     data-is-authenticated="false"
     data-user-joined="false"
     data-user-logined="false"
     data-show-student-info-modal="false"
     data-login-url="/login?next=%2Fcourses%2F1"
     data-start-newlab-url="/courses/clear"

     data-faq="/faq"
     data-comment-post="/courses/1/comments"
     data-loginurl="/login?next=%2Fcourses%2F1"
     data-site-type="0"
     data-report-post="/courses/1/reports"
     data-recomment-img="${pageContext.request.contextPath}/pages/img/recommentReport.png"
     data-charge-course-phone-code="/user/sms/code"
     data-join-private-course="/courses/join"
     data-current-user-id=""
     data-vip-icon="${pageContext.request.contextPath}/pages/img/vip-icon.png"
     data-vip-index="/vip"
     data-get-question-url="/courses/1/questions"
     data-real-price = ""

     data-query-bill="/purchase/bill/query"
     data-question-form="/questions/meta"
     data-qiniu-token-url="/api/qiniu/token"
></div>
<script src="${pageContext.request.contextPath}/pages/app/dest/course/labs.js?=2016121272249"></script>




<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>
<script>
    function changeAttention(t) {

        var a=$(t).find("span");
        var users_id="${user.id}";
        var course="${course.id}";
        if(a.hasClass("gold")){
            a.removeClass("gold");

            $.post("${pageContext.request.contextPath}/course/removeAttention",{course_id:course,users_id:users_id},function (data) {
                alert("取消关注");
            })
        }else{
            a.addClass("gold");
            $.post("${pageContext.request.contextPath}/course/addAttention",{course_id:course,users_id:users_id},function (data) {
                alert("关注成功");
            })
        }
    }
</script>

<script>
    $('#askquestion').on('shown.bs.modal', function () {
        $(this).find("input[name='title']").val("");
        $(this).find("textarea").val("");
        // 执行一些动作...
    })
    function btnChange(t) {
        $(t).parent().find(".active").removeClass("active");
        $(t).addClass("active");
    }

    function showQues(t) {
        var course_id="${course.id}";
        $.post("${pageContext.request.contextPath}/question/findAll",{course_id:course_id},function (data) {
            var qt= $("#question-items");
            qt.empty();
            for(var i=0;i<data.length;i++){
                var question=data[i];
                var que="   <li class='question-item'>\n" +
                    "                                <div class='col-md-10'>\n" +
                    "                                    <div class='col-sm-2 question-item-author'>\n" +
                    "                                        <div class='user-avatar '>\n" +
                    "                                            <a class='avatar' href='../user/13/study.html' target='_blank'>\n" +
                    "                                                <img src='${pageContext.request.contextPath}/pages/img/"+question.userInfo.userDetail.avatar+"'>\n" +
                    "                                            </a>\n" +
                    "\n" +
                    "                                            <a class='member-icon' href='/vip' target='_blank'>\n" +
                    "\n" +
                    "                                                <img src='&#10;            ../img/vip-icon.png&#10;          '>\n" +
                    "\n" +
                    "                                            </a>\n" +
                    "\n" +
                    "                                        </div>\n" +
                    "\n" +
                    "                                    </div>\n" +
                    "                                    <div class='col-sm-10'>\n" +
                    "                                        <h4>\n" +
                    "\n" +
                    "                                            <a class='question-item-title' href='${pageContext.request.contextPath}/question/"+question.id+"' target='_blank'> "+question.title+"</a>\n" +
                    "\n" +
                    "                                        </h4>\n" +
                    "                                        <div class='question-item-summary'>\n" +
                    "                                            <div class='user-username '>\n" +
                    "                                                <a class='avatar' href='../user/13/study.html' target='_blank'>\n" +
                    "\n" +
                    "                                                    "+question.userInfo.userDetail.username+"\n" +
                    "\n" +
                    "\n" +
                    "                                                </a>\n" +
                    "                                                <span class='user-level'>L52</span>\n" +
                    "                                            </div>\n" +
                    "\n" +
                    "\n" +
                    "                                            <span class='question-item-date'>"+question.pubdateStr+"</span>\n" +
                    "\n" +
                    "\n" +
                    "                                            <span class='question-item-course'>\n" +
                    "                来自\n" +
                    "                <a href='/questions/courses/30' target='_blank'>Python Django Web框架</a>\n" +
                    "            </span>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <div class='col-md-2 question-item-rank'>\n" +
                    "                                    <div class=''>\n" +
                    "                                        <div>0</div>\n" +
                    "                                        <div>回复</div>\n" +
                    "                                    </div>\n" +
                    "                                    <div class='question-item-views'>\n" +
                    "                                        <div>0</div>\n" +
                    "                                        <div>查看</div>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </li>";
                qt.prepend(que);
            }
        })
    }

    function question() {
        var q=$("#askquestion");
        var title= q.find("input[name='title']").val();
        var content=q.find("textarea").val();
        var course_context_id=$("#course_context_id").attr("value");
        var users_id="${user.id}";
        var discuss=$("#btnChange").find(".active").attr("discuss");

        $.post("${pageContext.request.contextPath}/question/submitQuestion",
            {title:title,content:content,course_context_id:course_context_id,users_id:users_id,discuss:discuss},
            function (question) {
            var que="   <li class='question-item'>\n" +
                "                                <div class='col-md-10'>\n" +
                "                                    <div class='col-sm-2 question-item-author'>\n" +
                "                                        <div class='user-avatar '>\n" +
                "                                            <a class='avatar' href='../user/13/study.html' target='_blank'>\n" +
                "                                                <img src='${pageContext.request.contextPath}/pages/img/"+question.userInfo.userDetail.avatar+"'>\n" +
                "                                            </a>\n" +
                "\n" +
                "                                            <a class='member-icon' href='/vip' target='_blank'>\n" +
                "\n" +
                "                                                <img src='&#10;            ../img/vip-icon.png&#10;          '>\n" +
                "\n" +
                "                                            </a>\n" +
                "\n" +
                "                                        </div>\n" +
                "\n" +
                "                                    </div>\n" +
                "                                    <div class='col-sm-10'>\n" +
                "                                        <h4>\n" +
                "\n" +
                "                                            <a class='question-item-title' href='show.html' target='_blank'> "+question.title+"</a>\n" +
                "\n" +
                "                                        </h4>\n" +
                "                                        <div class='question-item-summary'>\n" +
                "                                            <div class='user-username '>\n" +
                "                                                <a class='avatar' href='../user/13/study.html' target='_blank'>\n" +
                "\n" +
                "                                                    "+question.userInfo.userDetail.username+"\n" +
                "\n" +
                "\n" +
                "                                                </a>\n" +
                "                                                <span class='user-level'>L52</span>\n" +
                "                                            </div>\n" +
                "\n" +
                "\n" +
                "                                            <span class='question-item-date'>"+question.pubdateStr+"</span>\n" +
                "\n" +
                "\n" +
                "                                            <span class='question-item-course'>\n" +
                "                来自\n" +
                "                <a href='/questions/courses/30' target='_blank'>Python Django Web框架</a>\n" +
                "            </span>\n" +
                "\n" +
                "\n" +
                "\n" +
                "                                        </div>\n" +
                "                                    </div>\n" +
                "                                </div>\n" +
                "                                <div class='col-md-2 question-item-rank'>\n" +
                "                                    <div class=''>\n" +
                "                                        <div>0</div>\n" +
                "                                        <div>回复</div>\n" +
                "                                    </div>\n" +
                "                                    <div class='question-item-views'>\n" +
                "                                        <div>0</div>\n" +
                "                                        <div>查看</div>\n" +
                "                                    </div>\n" +
                "                                </div>\n" +
                "                            </li>";
                $("#question-items").prepend(que);
        });
        // var json='{"username":"张三","password":"23456"}';

    }

    function video_src(t) {
        var src=$(t).prev().val();
        $("#myModal video").attr("src","${pageContext.request.contextPath}/video/"+src);
        var course_context_id= $(t).next().attr("value");
        $("#course_context_id").attr("value",course_context_id);
        console.log(course_context_id);
    }

    function releaseComment(t) {
        var content= $("#course-comment-textarea").val();
        var course_id= $(t).prev().attr("value");
        var users_id="${user.id}";

        $.post("${pageContext.request.contextPath}/comment/releaseComment",{content:content,course_context_id:course_id,users_id:users_id},function (data) {
            $("#course-comment-textarea").val("");
            showCom(1);
        })
    }
    function showCom(t) {
        var course_id="${course.id}";
       $.post("${pageContext.request.contextPath}/comment/getCommentsByCourseId",{course_id:course_id},function (cou_com_list) {
            $(".comments").empty();
            $.each(cou_com_list,function (i,item) {
                var comment="       <div class='comment' style='margin-top: 20px;border-bottom: 1px solid #cccccc;width:100%;'>\n" +
                    "                                            <div style='float: left;height: 88px;'>\n" +
                    "<input class='users_id' type='text' hidden value='"+item.userDetail.users_id+"'>"+
                    "<input class='cm_id' type='text' hidden value='"+item.id+"'>"+
                    "                                                <img class='img-circle' width='60px' height='60px' src='${pageContext.request.contextPath}/pages/img/"+item.userDetail.avatar+"'>\n" +
                    "                                            </div>\n" +
                    "                                            <div style='float: left;width:85%;height: 88px;margin-left: 20px;margin-bottom:10px'>\n" +
                    "                                                <div style='height: 25%;line-height: 100%;color: #FFCC00;'>"+item.userDetail.username+"</div>\n" +
                    "                                                <div style='height: 50%;line-height: 100%;'>"+item.content+"</div>\n" +
                    "                                                <div style='height: 25%;line-height: 100%'>发布于 "+item.pubdateStr;
                    if(item.course_context_name!=null){
                        comment+=" 来自 "+item.course_context_name;
                    }
                    comment+=" <a style='float: right' onclick='showReply(this)'><img src='${pageContext.request.contextPath}/pages/img/xx.png'>123 回复</a></div>\n" +
                        "                                            </div>\n" +
                        " <div class='pagination-container'>\n" +
                        "\n" +
                        "                        </div>"+
                        "<div style='clear: both;'></div>"+
                        "                                        </div>";



                $(".comments").prepend(comment);
            });

        });

    }


    $('#myModal #close_model').click(function () {
        $(this).prev().get(0).pause();
        $('#myModal').modal('hide');

    });

    function showReply(t) {
        var reply= $(t).parent().parent().next();
        if($.trim(reply.html())){
            reply.empty();
        }else{
            var coursecomment_id=$(t).parents(".comment").find(":first").find("input[class='cm_id']").attr("value");
            $.post("${pageContext.request.contextPath}/comment/reply",{coursecomment_id:coursecomment_id},function (course_Replys) {
                reply.append("<div class='replys' style='margin-left:20%;border-top: 1px solid #cccccc;'>" +
                        "<input hidden >"+
                    "  <textarea placeholder='输入你想说的话'  rows='4' class='form-control' style='height:60px;resize: none;margin-bottom: 5px;margin-top:5px'  wrap='soft'></textarea>"+
                    "<button class='btn btn-default' style='margin-left: 70%;margin-bottom:10px;border-radius: 5px' onclick='publish(this)'>发表</button>"+
                    "</div>");
               for(var i=0; i< course_Replys.length;i++){
                   var course_Reply=course_Replys[i];
                   var course_reply="<div class='reply' style='margin-top: 5px;margin-bottom5px;border-bottom: 1px solid #cccccc;'>\n" +
                       "                                <div style='float: left;height: 45px;'>\n" +
                       "                                    <img class='img-circle' width='40px' height='40px' src='${pageContext.request.contextPath}/pages/img/"+course_Reply.respondent.avatar+"'>\n" +
                       "                                </div>\n" +
                       "                                <div style='float: left;margin-left: 20px;'>\n" +
                       "                                    <span class='username'>"+course_Reply.respondent.username+"</span> ";
                   if(course_Reply.brespondent!=null){
                       course_reply+= "<span style='color:gold'>@</span> "+course_Reply.brespondent.username;
                   }
                   course_reply=course_reply+":  \n"+
                       course_Reply.content+
                       "                                </div>\n" +
                       "                                <div style='float: right;' ><input hidden value='"+course_Reply.respondent_id+"'><a style='margin-top: 40%;margin-right: 20px' onclick='reply2(this)'>回复</a></div>\n" +
                       "                                <div style='clear:both'></div>"

                    reply.find(".replys").prepend(course_reply);
                }
            })




        }



    }
    function publish(t) {
        var respondent_id="${user.id}";

        var content=$(t).prev().val();
        var coursecomment_id=$(t).parents(".comment").find(":first").find("input[class='cm_id']").attr("value");
        var brespondent_id=0;
        if(content==""){
             brespondent_id=$(t).parents(".comment").find(":first").find("input[class='users_id']").attr("value");
        }else{
             brespondent_id=$(t).prev().prev().attr("values");
        }

        $.post("${pageContext.request.contextPath}/comment/publish",
            {respondent_id:respondent_id,brespondent_id:brespondent_id,content:content,commentcourse_id:coursecomment_id},
            function (course_Reply) {
              var course_reply="<div class='reply' style='margin-top: 5px;margin-bottom5px;border-bottom: 1px solid #cccccc;'>\n" +
                "                                <div style='float: left;height: 45px;'>\n" +
                "                                    <img class='img-circle' width='40px' height='40px' src='${pageContext.request.contextPath}/pages/img/"+course_Reply.respondent.avatar+"'>\n" +
                "                                </div>\n" +
                "                                <div style='float: left;margin-left: 20px;'>\n" +
                "                                    <span class='username'>"+course_Reply.respondent.username+"</span> ";
               if(course_Reply.brespondent!=null){
                 course_reply+= "<span style='color:gold'>@</span> "+course_Reply.brespondent.username;
               }
                course_reply=course_reply+":  \n"+
                       course_Reply.content+
                "                                </div>\n" +
                "                                <div style='float: right;' ><input hidden value='"+course_Reply.respondent_id+"'><a style='margin-top: 40%;margin-right: 20px' onclick='replay2(this)'>回复</a></div>\n" +
                "                                <div style='clear:both'></div>"
                $(t).parent().prepend(course_reply);
                $(t).prev().val("");

        })
    }
    function reply2(t) {
        var username=$(t).parents(".reply").find(".username").text();
        $(t).parents(".replys").find("textarea").val("回复 "+username+" : ");
        var respondent_id= $(t).prev().val()
        $(t).parents(".replys").find("textarea").prev().attr("values",respondent_id);

    }
    function addCourse(t) {
        $.post("${pageContext.request.contextPath}/user/addCourse?userid=${user.id}&courseid=${course.id}",function (data) {
            if(data=="ok"){
                $(t).text("已加入课程");
                $(t).attr("disabled",true);
            }
        })
    }


</script>


</body>
</html>

