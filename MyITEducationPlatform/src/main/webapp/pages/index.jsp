<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-04
  Time: 17:11
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
    <meta name="csrf-token" content="1483758872##fd2cac389b2b7c009a744bcaecaa41d71592cfe8">


    <title>做实验，学编程</title>


    <meta content="" name="author">

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="static/font-awesome//4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/highlight.js/9.8.0/monokai-sublime.min.css">
    <link rel="stylesheet" href="app/css/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="app/css/libs/katex/0.6.0/katex.min.css">
    <link rel="stylesheet" href="app/css/libs/videojs/5.11.7/video-js.min.css">
    <link rel="stylesheet" href="app/css/dest/styles.css?=2016121272249">

    <style>
        @font-face {
            font-family: "lantingxihei";
            src: url("fonts/FZLTCXHJW.TTF");
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

    <style >
        .navbar-banner {
            margin-top: 50px;
            background: url("img/homepage-bg.png");
            background-size: cover;
            backgtound-repeat: no-repeat;
        }
    </style>




</head>

<body>









<jsp:include page="navbar.jsp"/>




<jsp:include page="${pageContext.request.contextPath}/pages/navbar.jsp"/>


<div class="navbar-banner layout-no-margin-top">
    <div class="banner-container">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <a class="container-title">
                        <img src="img/container-title-2.png" />
                    </a>
                    <div style="margin-top:24px;">
                        <a id="course-btn" class="course-btn btn btn-lg" href="${pageContext.request.contextPath}/course/findAll">进入课程</a>
                    </div>
                </div>

                <div class="col-md-5" >

                    <form >
                        <div class="form-group">
                            <input class="form-control" name="name" id="username1" type="text" placeholder="昵称">
                            <%--<div class="help-block text-left">用户名长度必须大于2并且只能包括中文、字母、数字及下划线!</div>--%>
                        </div>
                        <div class="form-group">
                            <input class="form-control" name="email" id="email1" type="email" placeholder="邮箱">
                            <%--<div class="help-block text-left">请填写正确格式的邮箱!</div>--%>
                        </div>
                        <div class="form-group">
                            <input class="form-control" name="password" id="password1" type="password" placeholder="密码">
                            <%--<div class="help-block text-left">密码长度必须为6-16位!</div>--%>
                        </div>
                        <div class="form-inline">
                            <div class="form-group" style="margin-left:45px;float:left;margin-bottom:20px">
                                <div class="input-group ">
                                    <input type="text" name="captcha_v" id="captcha_v1" style="float: left;width: 154px" class="form-control" placeholder="请输入验证码">
                                </div>
                            </div>
                            <button class="btn btn-default " style="width:100px;margin-left:10px;float:left" type="button" id="send_checkCode1">发送验证码</button>
                            <div id="timer" style="display: none;float:left;line-height: 34px;margin-left: 10px;font-size: 15px;color: red">
                                有效时间为 0<span id="minutes1">5</span>:<span id="seconds1">00</span></div>

                        </div>
                        <input class="btn register" type="button" id="register1" value="加入飞天教育">
                        <p class="tip">点击"加入实验楼"，表示您已经同意我们的<a href="privacy/index.html" target="_blank"> 隐私条款</a></p>
                    </form>

                </div>

            </div>
        </div>
    </div>
</div>

<div class="introduce-container" id="fourFeatures">
    <div class="container">
        <div class="row">
            <div class="introduce-unit col-sm-6 col-md-3">
                <div><a class="introduce-img"><img src="img/introduceContainer1.gif" /></a></div>
                <div><span class="introduce-span">丰富全面的计算机实验课程</span></div>
            </div>
            <div class="introduce-unit col-sm-6 col-md-3">
                <div><a class="introduce-img"><img src="img/introduceContainer2.gif" /></a></div>
                <div><span class="introduce-span">在线编程环境，1秒启动</span></div>
            </div>
            <div class="introduce-unit col-sm-6 col-md-3">
                <div><a class="introduce-img"><img src="img/introduceContainer3.gif" /></a></div>
                <div><span class="introduce-span">每天一个项目课，丰富你的项目经验</span></div>
            </div>
            <div class="introduce-unit col-sm-6 col-md-3">
                <div><a class="introduce-img"><img src="img/introduceContainer4.gif" /></a></div>
                <div><span class="introduce-span">有效学习时间，真实记录你的代码生涯</span></div>
            </div>
        </div>
    </div>
</div>

<div class="line-and-laboratory">
    <div class="container">
        <div class="clearfix text-center item-header">
            <span class="line"></span>
            <span class="text-center item-title">学习路径</span>
            <span class="line"></span>
        </div>
        <div class="tab-content">
            <div class="tab-pane clearfix active" id="study-line">


                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471513730333.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">新手入门</div>
                                <div class="path-course-num">
                                    </span>6</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">新手入门路径帮助对 IT 技术感兴趣的新手0基础入门计算机编程。本路径通过新手入门、Linux 及 Vim课程熟悉实验楼的实践学习环境，再以 C 语言和一个简单的项目引导你一步步进入计算机技术的殿堂。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471513769430.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">Python研发工程师</div>
                                <div class="path-course-num">
                                    </span>83</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">Python技术路径中包含入门知识、Python基础、Web框架、基础项目、网络编程、数据与计算及综合项目七个模块。模块中的课程将带着你逐步深入，学会如何使用 Python 实现项目一个博客，桌面词典，微信机器人或网络安全软件等。完成本路径的实验课，将具备独立开发 Python 软件和 Web 应用的能力。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471513793360.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">C++ 研发工程师</div>
                                <div class="path-course-num">
                                    </span>26</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">C++ 学习路径中将通过使用 C++ 语言实现 Web 服务器，Markdown 解析器，内存池以及 Docker 容器管理工具等，学习并实践 C++ 编程基础，C++ 11/14 标准，C++ 图像处理及增强现实技术。完成本路径的所有实验课，将能够使用 C++  独立实现复杂的应用程序。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471513926288.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">大数据工程师</div>
                                <div class="path-course-num">
                                    </span>36</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">大数据学习路径中会学习并实践 Java、Scala、Hadoop、HBase、Mahout、Sqoop及Spark等大数据技术，本路径通过大量的动手实验，在实验数据集上实践各种大数据工具，帮助你成长为具备动手能力的大数据工程师。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471513867033.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">信息安全工程师</div>
                                <div class="path-course-num">
                                    </span>38</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">信息安全学习路径首先完成 Linux、脚本编程、数据库和网络等基础知识学习，然后通过密码学实验、系统安全实验、Web安全实验、网络安全实验四个核心模块的动手实践，强化信息安全工程师必须要掌握的系统防护，Web渗透及网络攻防等基本技能。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471514004752.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">Linux运维工程师</div>
                                <div class="path-course-num">
                                    </span>33</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">Linux运维技术路径中首先学习 Linux 相关的基本操作和系统管理，然后依次学习并实践服务部署、数据库管理、脚本编程、系统监控和安全防护、以及Web服务运维技术。最后学习 Docker 容器服务和 Windows Server的运维知识。本路径的实验将帮助你成为一名合格的 Linux 运维工程师。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471514111981.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">Java研发工程师</div>
                                <div class="path-course-num">
                                    </span>25</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">Java 学习路径中将首先完成 Java基础、JDK、JDBC、正则表达式等基础实验，然后进阶到 J2SE 和 SSH 框架学习。通过使用 Java 语言实现日记本，个人相册、编辑器、通讯录等，学习并实践 Java 编程基础，SSH 项目实战以及Java Web 应用开发。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471514095761.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">PHP研发工程师</div>
                                <div class="path-course-num">
                                    </span>30</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">PHP 技术路径中包含入门知识、PHP 编程基础、PHP Web 框架、项目实战和项目进阶五个模块。模块中的课程将带着你逐步深入，学会如何使用 PHP 实现项目一个博客，聊天室，MVC框架及搜索系统等。完成本路径所有实验课，将具备使用 PHP 独立开发 Web 应用的能力。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471514153000.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">Web前端工程师</div>
                                <div class="path-course-num">
                                    </span>34</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">Web 前端学习路径中首先实践 HTML、CSS、JavaScript、jQuery、HTML5等基础知识，然后完成实现页面特效组件、网页游戏、Web应用等一系列项目，帮助你通过动手实践成长为合格的 Web 前端工程师。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471514037180.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">Linux研发工程师</div>
                                <div class="path-course-num">
                                    </span>27</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">Linux 研发学习路径中首先学习 Linux基础、C语言、Git、GDB、数据结构等基础知识，然后完成 TCP/IP、MySQL 数据库、操作系统等实验课程。项目阶段将实现 cp、ls、touch、ping等一系列Linux命令和端口扫描、Web服务器、聊天室等网络应用，帮助你通过动手实践入门 Linux 系统研发。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471513817808.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">NodeJS研发工程师</div>
                                <div class="path-course-num">
                                    </span>21</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">NodeJS 学习路径中将通过使用 NodeJS 实现博客、在线笔记、爬虫、即时搜索、漂流瓶、端口扫描器等应用，学习并实践 NodeJS 编程基础和Web 应用开发等技术。完成本路径的所有实验课，将能够使用 NodeJS 独立实现 Web 应用程序。</div>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-xs-12 col-sm-6 col-md-4">
                    <a href="paths/show.html">
                        <div class="path-item">
                            <div class="col-xs-5 col-sm-4 path-img">
                                <img src="img/1471514058548.png">
                            </div>
                            <div class="col-xs-7 col-sm-8">
                                <div class="path-name">MongoDB工程师</div>
                                <div class="path-course-num">
                                    </span>6</span>
                                    门课程
                                </div>
                            </div>
                            <div class="desc-layer">
                                <div class="center">MongoDB 技术路径中首先学习 Linux、Bash、MySQL基础知识，然后依次学习并实践 Memcached、Redis 和 MongoDB技术。本路径的实验将帮助你逐步入门 MongoDB 这类 NoSQL 数据库。</div>
                            </div>
                        </div>
                    </a>
                </div>


            </div>
        </div>
    </div>
</div>

<div class="line-and-laboratory">
    <div class="container">
        <div class="clearfix text-center item-header">
            <span class="line"></span>
            <div class="text-center item-title">实验课程</div>
            <span class="line"></span>
        </div>
        <div class="clearfix courses">




            <div class="col-md-3 col-sm-6  course">
                <a class="course-box" href="courses/show.html">
                    <div class="sign-box">



                        <i class="fa fa-star-o course-follow pull-right"
                           data-follow-url="/courses/1/follow"
                           data-unfollow-url="/courses/1/unfollow"  style="display:none"  ></i>

                    </div>
                    <div class="course-img">

                        <img alt="Linux 基础入门（新版）" src="img/ncn1.jpg">

                    </div>

                    <div class="course-body">
                        <span class="course-title" data-toggle="tooltip" data-placement="bottom" title="Linux 基础入门（新版）">Linux 基础入门（新版）</span>
                    </div>
                    <div class="course-footer">
			<span class="course-per-num pull-left">
                <i class="fa fa-users"></i>

                85157

			</span>



                    </div>
                </a>
            </div>





            <div class="col-md-3 col-sm-6  course">
                <a class="course-box" href="courses/show.html">
                    <div class="sign-box">



                        <i class="fa fa-star-o course-follow pull-right"
                           data-follow-url="/courses/11/follow"
                           data-unfollow-url="/courses/11/unfollow"  style="display:none"  ></i>

                    </div>
                    <div class="course-img">

                        <img alt="Go语言编程" src="img/ncn11.jpg">

                    </div>

                    <div class="course-body">
                        <span class="course-title" data-toggle="tooltip" data-placement="bottom" title="Go语言编程">Go语言编程</span>
                    </div>
                    <div class="course-footer">
			<span class="course-per-num pull-left">
                <i class="fa fa-users"></i>

                5741

			</span>



                    </div>
                </a>
            </div>





            <div class="col-md-3 col-sm-6  course">
                <a class="course-box" href="courses/show.html">
                    <div class="sign-box">



                        <i class="fa fa-star-o course-follow pull-right"
                           data-follow-url="/courses/23/follow"
                           data-unfollow-url="/courses/23/unfollow"  style="display:none"  ></i>

                    </div>
                    <div class="course-img">

                        <img alt="PHP编程语言" src="img/ncn23.jpg">

                    </div>

                    <div class="course-body">
                        <span class="course-title" data-toggle="tooltip" data-placement="bottom" title="PHP编程语言">PHP编程语言</span>
                    </div>
                    <div class="course-footer">
			<span class="course-per-num pull-left">
                <i class="fa fa-users"></i>

                8093

			</span>



                    </div>
                </a>
            </div>





            <div class="col-md-3 col-sm-6  course">
                <a class="course-box" href="courses/show.html">
                    <div class="sign-box">



                        <i class="fa fa-star-o course-follow pull-right"
                           data-follow-url="/courses/30/follow"
                           data-unfollow-url="/courses/30/unfollow"  style="display:none"  ></i>

                    </div>
                    <div class="course-img">

                        <img alt="Python Django Web框架" src="img/ncn30.jpg">

                    </div>

                    <div class="course-body">
                        <span class="course-title" data-toggle="tooltip" data-placement="bottom" title="Python Django Web框架">Python Django Web框架</span>
                    </div>
                    <div class="course-footer">
			<span class="course-per-num pull-left">
                <i class="fa fa-users"></i>

                5691

			</span>



                    </div>
                </a>
            </div>


        </div>
        <div class="clearfix item-footer">
            <div class="pull-right watch-all">
                <a href="courses/index.html">查看更多 ></a>
            </div>
        </div>
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



<jsp:include page="login.jsp"/>

<div id="base-data"


     data-flash="false"



     data-is-login=false

     data-is-jwt=true
     data-socket-url="wss://comet.xxxxxx.com"
     data-msg-user=""
     data-msg-system=""
></div>

<script src="app/dest/lib/lib.js?=2016121272249"></script>
<script src="static/jquery/2.2.4/jquery.min.js"></script>
<script src="static/ace/1.2.5/ace.js"></script>
<script src="static/aliyun/aliyun-oss-sdk-4.3.0.min.js"></script>
<script src="static/highlight.js/9.8.0/highlight.min.js"></script>
<script src="static/jspdf/1.2.61/jspdf.min.js"></script>
<script src="static/plupload/2.1.9/js/plupload.full.min.js"></script>
<script src="static/zeroclipboard/2.2.0/ZeroClipboard.min.js"></script>
<script src="static/videojs/video.min.js"></script>
<script src="static/bootstrap-tour/0.11.0/js/bootstrap-tour.min.js"></script>
<script src="static/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
<script src="static/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="static/bootstrap-table/1.11.0/extensions/filter-control/bootstrap-table-filter-control.min.js"></script>

<script src="static/ravenjs/3.7.0/raven.min.js"></script>
<script>
    Raven.config('https://bc3878b7ed0a4468a65390bd79e6e73f@sentry.xxxxxx.com/5', {
        release: '3.12.13'
    }).install();
</script>






<div id="jinja-data"
     data-post-url="/registercheck"
></div>

<script src="app/dest/frontend/index.js?=2016121272249"></script>






<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>
<script>
    function timer1() {
        var sil= setInterval(function () {
            var minute= $("#minutes1").text();
            var seconds=$("#seconds1").text();

            if(seconds>10){
                $("#seconds1").html(seconds-1);
            }else if(seconds>0){
                var t=seconds-1;
                $("#seconds1").html("0"+t);
            }else   if(seconds=="00"){
                if(minute==0){
                    $("#send_checkCode1").attr('disabled',false);
                    $("#minutes1").html(5);
                    $("#seconds1").html("00");
                    $("#send_checkCode1").next().css("display","none");
                    clearInterval(sil);
                }else{
                    $("#minutes1").html(minute-1);
                    $("#seconds1").html(59);

                }

            }


        },1000);
    }

    $(function () {
        $("#send_checkCode1").click(function () {
            var email= $("#email1").val();
            console.log(email)
            $.post("${pageContext.request.contextPath}/user/sendEmailCode",{email:email},function (data) {
                if(data=="ok"){
                    $("#send_checkCode1").next().css("display","block");
                    $("#send_checkCode1").attr('disabled',true);
                    timer1();
                }
            });

        })


        $("#register1").click(function () {
            var email=$("#email1").val();
            var password=$("#password1").val();
            var cli_checkCode=$("#captcha_v1").val();
            var username=$("#username1").val();

            $.post("${pageContext.request.contextPath}/user/register",
                {email:email,password:password,cli_checkCode:cli_checkCode,username:username},
                function (flag) {
                    if(flag){
                        location.reload(true);
                    }else {
                        alert(flag);
                    }
                })
        });
    })
</script>



</body>
</html>

