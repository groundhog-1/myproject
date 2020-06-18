<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-15
  Time: 17:23
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


    <title>老师合作 - 实验楼</title>




    <meta content="实验楼课程分为基础课和项目课，内容涵盖了Linux、Python、Java、C语言、Ruby、Android、IOS开发、大数据、信息安全等IT技术领域。" name="description">
    <meta content="实验楼课程,IT培训课程,IT实训课程,IT在线课程,all" name="keywords">

    <meta content="" name="author">

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="../static/font-awesome//4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../static/highlight.js/9.8.0/monokai-sublime.min.css">
    <link rel="stylesheet" href="../app/css/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../app/css/libs/katex/0.6.0/katex.min.css">
    <link rel="stylesheet" href="../app/css/libs/videojs/5.11.7/video-js.min.css">
    <link rel="stylesheet" href="../app/css/dest/styles.css?=2016121272249">

    <style>
        @font-face {
            font-family: "lantingxihei";
            src: url("../fonts/FZLTCXHJW.TTF");
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



<div class="laboratory-header layout-no-margin-top">
    <h1 class="laboratory-title">在线实验，让计算机教学灵活高效</h1>
</div>
<div class="laboratory-des-con">
    <div class="container">
        <div class="laboratory-des col-md-6">
            <div class="media laboratory-des-item">
                <div class="media-left media-middle">
                    <a><img src="../img/laboratory-higheffic.png"></a>
                </div>
                <div class="media-body">
                    <h4 class="laboratory-des-title">实验设计不受局限</h4>
                    <p class="laboratory-des-text">在线环境1秒启动，环境可定制，预装软件</p>
                </div>
            </div>
            <div class="media laboratory-des-item">
                <div class="media-left media-middle">
                    <a><img src="../img/laboratory-nimble.png"></a>
                </div>
                <div class="media-body">
                    <h4 class="laboratory-des-title">随时随地动手实验</h4>
                    <p class="laboratory-des-text">云端代码库随时同步，实验报告自动生成</p>
                </div>
            </div>
            <div class="media laboratory-des-item">
                <div class="media-left media-middle">
                    <a><img src="../img/laboratory-proper.png"></a>
                </div>
                <div class="media-body">
                    <h4 class="laboratory-des-title">教学管理简单有序</h4>
                    <p class="laboratory-des-text">在线管理学生代码、实验报告，远程协作指导</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="laboratory-apply-con">
                <h4 class="laboratory-apply-title">开设在线实验课，可以做什么？</h4>
                <div class="laboratory-apply-text">
                    <p>如果您是高校教师，可定制私有课，学生随时随地实验，老师一键下载学习数据</p>
                    <p>如果您是技术工程师，可分享最新的IT实战技术，与粉丝畅聊互动</p>
                    <p>如果您是计算机MOOC老师，在线实验可以让学生边学边练，获得学生真实的学习效果反馈</p>
                    <p>......</p>
                </div>
                <a href="${pageContext.request.contextPath}/pages/teachers/index.jsp" class="laboratory-apply-btn" target="_blank">填写表单，申请开课</a>
                <div class="laboratory-apply-warning">欢迎高校老师 / 机构讲师 / 技术博主申请。</div>
            </div>
        </div>
    </div>
</div>
<div class="laboratory-teachers-con">
    <div class="container">
        <div class="row">
            <div class="laboratory-teachers-header">
                <img src="../img/laboratory-flag.png" class="laboratory-teachers-flag">
                <span class="laboratory-teachers-here">他们都在这里</span>
                <span class="laboratory-teachers-tri"></span>
                <span class="laboratory-here-text">他们在这里开设了专属实验室</span>
            </div>
        </div>
        <div class="row laboratory-tea-panel">

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarDFKL7L25TBCL.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									严老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">河北交通职业技术学院</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarW6LVY88YVFK6.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									陆卫忠
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">苏州科技学院</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarKTH9MTLYNWL7.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									王老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">武汉理工大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarNTY0MzE5MTY0OTA0.png?v=1463643389748&amp;imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									吴老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">防灾科技学院</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarXWCQHTH6G8GJ.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									赵老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">北京工商大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;2&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarA4S4ZEPKNH6H.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									毛典辉
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">北京工商大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarNSX55853FV4D.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									董老师
								</span>&nbsp;
                                <span class="tectitle">副教授</span>
                            </p>

                            <p><span class="tecnschool">河北师范大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;2&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatar78E6XYYPTDY9.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									张华
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">哈尔滨工业大学（威海）</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;3&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarNTY0MzE5MTMwMzk1.png?v=1471616297554&amp;imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									黑板客
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">网易云课堂讲师</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;2&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="../user/13/study.html">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.qbox.me/gravatar25.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									张老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">沈阳航空航天大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;2&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/74224">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarXKHBK8QBLTAT.jpg?imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									溪老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">华中科技大学武昌分校</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/65531">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatarNTY0MzE5MDc4MjA2.png?v=1463563574054&amp;imageView2/1/w/200/h/200"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									李远辉
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">湖南工程学院</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;5&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/55546">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatar40.jpg?imageView2/1/w/100/h/100"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									杨浚
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">常州开放大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/51209">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/seedlab_v2.png"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									SEEDLabs
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">Syracuse University</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;19&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/48058">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatar48.jpg?imageView2/1/w/100/h/100"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									丁宋涛
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">南京工程学院</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/36061">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/chenyu.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									陈渝
								</span>&nbsp;
                                <span class="tectitle">副教授</span>
                            </p>

                            <p><span class="tecnschool">清华大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/34822">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/StudyGolang社区logo1.png"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									Go语言中文网
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <div class="tecname"></div>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/30757">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/清华大学出版社社标.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									清华大学出版社
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <div class="tecname"></div>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;2&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/28022">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.qbox.me/gravatar46.jpg?imageView2/1/w/100/h/100"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									娄嘉鹏
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">北京电子科技学院</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;5&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/27791">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/jixiegongye.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									机械工业出版社
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <div class="tecname"></div>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/26709">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher人邮透明社标1.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									人民邮电出版社
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <div class="tecname"></div>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;3&nbsp;
								</span>
								门课程
								</span>

                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/25536">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/linuxcn.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									Linux中国
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <div class="tecname"></div>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;4&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/20637">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatar55.jpg?imageView2/1/w/100/h/100"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									王和兴
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">东北大学秦皇岛分校</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;2&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/19614">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/lizhijun.png"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									李治军
								</span>&nbsp;
                                <span class="tectitle">副教授</span>
                            </p>

                            <p><span class="tecnschool">哈尔滨工业大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/19301">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/mengning.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									孟宁
								</span>&nbsp;
                                <span class="tectitle">高级工程师</span>
                            </p>

                            <p><span class="tecnschool">中国科学技术大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;3&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/19216">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.qbox.me/gravatar7.jpg?imageView2/1/w/100/h/100"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									王老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">烟台大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/17773">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher/43_avatar_middle.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									郑莉
								</span>&nbsp;
                                <span class="tectitle">副教授</span>
                            </p>

                            <p><span class="tecnschool">清华大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/12501">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-anything-about-doc.qbox.me/teacher.jpg"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									郑晓薇
								</span>&nbsp;
                                <span class="tectitle">教授</span>
                            </p>

                            <p><span class="tecnschool">辽宁师范大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;3&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/12145">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatar61.jpg?imageView2/1/w/100/h/100"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									岳亚伟
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">山西农业大学</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;1&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/teacher/12132">
                    <div class="laboratory-box">
                        <div class="col-md-6">

                            <img class="headimg" src="https://dn-simplecloud.xxxxxx.com/gravatar44.jpg?imageView2/1/w/100/h/100"/>

                        </div>
                        <div class="col-md-6 top-13">
                            <p>
								<span class="tecname">
									关老师
								</span>&nbsp;
                                <span class="tectitle"></span>
                            </p>

                            <p><span class="tecnschool">南昌师范学院</span></p>

                            <p>
								<span class="coursenum">已发布
								<span style="color:#eb6877;font-weight:bold;">
									&nbsp;2&nbsp;
								</span>
								门课程
								</span>
                            </p>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>
</div>




<%--

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


--%>









<div class="modal fade" id="sign-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <button type="button" class="close-modal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#signin-form" aria-controls="signin-form" role="tab" data-toggle="tab">登录</a>
                    </li>
                    <li role="presentation">
                        <a href="#signup-form" aria-controls="signup-form" role="tab" data-toggle="tab">注册</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="signin-form">
                        <form action="/login" method="post">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-envelope" style="margin:0;"></i>
                                    </div>
                                    <input type="email" name="login" class="form-control" placeholder="请输入邮箱">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-lock" style="margin:0;"></i>
                                    </div>
                                    <input type="password" name="password" class="form-control" placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-inline verify-code-item" style="display:none;">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" name="captcha_v" class="form-control" placeholder="请输入验证码">
                                    </div>
                                </div>
                                <img class="verify-code" src="" source="/captcha.gif">
                            </div>
                            <div class="form-group remember-login">
                                <input name="remember" type="checkbox" value="y"> 下次自动登录
                                <a class="pull-right" href="/reset_password">忘记密码？</a>
                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" name="submit" type="submit" value="进入实验楼">
                            </div>
                            <div class="form-group widget-signin">
                                <span>快速登录</span>
                                <a href="/auth/qq?next="><i class="fa fa-qq"></i></a>
                                <a href="/auth/weibo?next="><i class="fa fa-weibo"></i></a>
                                <a href="/auth/weixin?next="><i class="fa fa-weixin"></i></a>
                                <a href="/auth/github?next="><i class="fa fa-github"></i></a>
                                <a href="/auth/renren?next="><i class="fa fa-renren"></i></a>
                            </div>
                            <div class="form-group error-msg">
                                <div class="alert alert-danger" role="alert"></div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="signup-form">
                        <form action="/register" method="post">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-envelope" style="margin:0;"></i>
                                    </div>
                                    <input type="email" name="email" class="form-control" placeholder="请输入邮箱">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-lock" style="margin:0;"></i>
                                    </div>
                                    <input type="password" name="password" class="form-control" placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" name="captcha_v" class="form-control" placeholder="请输入验证码">
                                    </div>
                                </div>
                                <img class="verify-code" src="" source="/captcha.gif">
                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" name="submit" type="submit" value="注册">
                            </div>
                            <div class="form-group agree-privacy">
                                注册表示您已经同意我们的<a href="/privacy" target="_blank">隐私条款</a>
                            </div>
                            <div class="form-group widget-signup">
                                <span>快速注册</span>
                                <a href="/auth/qq?next="><i class="fa fa-qq"></i></a>
                                <a href="/auth/weibo?next="><i class="fa fa-weibo"></i></a>
                                <a href="/auth/weixin?next="><i class="fa fa-weixin"></i></a>
                                <a href="/auth/github?next="><i class="fa fa-github"></i></a>
                                <a href="/auth/renren?next="><i class="fa fa-renren"></i></a>
                            </div>
                            <div class="form-group error-msg">
                                <div class="alert alert-danger" role="alert"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="base-data"


     data-flash="false"



     data-is-login=false

     data-is-jwt=true
     data-socket-url="wss://comet.xxxxxx.com"
     data-msg-user=""
     data-msg-system=""
></div>

<script src="../app/dest/lib/lib.js?=2016121272249"></script>
<script src="../static/jquery/2.2.4/jquery.min.js"></script>
<script src="../static/ace/1.2.5/ace.js"></script>
<script src="../static/aliyun/aliyun-oss-sdk-4.3.0.min.js"></script>
<script src="../static/highlight.js/9.8.0/highlight.min.js"></script>
<script src="../static/jspdf/1.2.61/jspdf.min.js"></script>
<script src="../static/plupload/2.1.9/js/plupload.full.min.js"></script>
<script src="../static/zeroclipboard/2.2.0/ZeroClipboard.min.js"></script>
<script src="../static/videojs/video.min.js"></script>
<script src="../static/bootstrap-tour/0.11.0/js/bootstrap-tour.min.js"></script>
<script src="../static/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
<script src="../static/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="../static/bootstrap-table/1.11.0/extensions/filter-control/bootstrap-table-filter-control.min.js"></script>

<script src="../static/ravenjs/3.7.0/raven.min.js"></script>
<script>
    Raven.config('https://bc3878b7ed0a4468a65390bd79e6e73f@sentry.xxxxxx.com/5', {
        release: '3.12.13'
    }).install();
</script>


<script src="../app/dest/base/index.js?=2016121272249"></script>


<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 clearfix footer-col">
                <img src="../img/logo_03.png">
                <div class="footer-slogan">动手做实验，轻松学编程</div>
                <div class="col-xs-2">
                    <div class="social-item footer-weixin-item">
                        <i class="fa fa-weixin"></i>
                        <div class="footer-weixin">
                            <img src="../img/footer-weixin.png">
                        </div>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="social-item footer-qq-item">
                        <i class="fa fa-qq"></i>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="social-item footer-weibo-item">
                        <a href="#" target="_blank">
                            <i class="fa fa-weibo"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">公司</div>
                <a href="../aboutus/index.html" target="_blank">关于我们</a><br>
                <a href="../contact/index.html" target="_blank">联系我们</a><br>
                <a href="#" target="_blank">加入我们</a><br>
                <a href="#" target="_blank">技术博客</a><br>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">合作</div>
                <a href="../contribute/index.html" target="_blank">我要投稿</a><br>
                <a href="../labs/index.html" target="_blank">教师合作</a><br>
                <a href="../edu/index.html" target="_blank">高校合作</a><br>
                <a href="../friends/index.html" target="_blank">友情链接</a>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">服务</div>
                <a href="../bootcamp/index.html" target="_blank">实战训练营</a><br>
                <a href="../vip/index.html" target="_blank">会员服务</a><br>
                <a href="../courses/reports/index.html" target="_blank">实验报告</a><br>
                <a href="../questions/index.html?tag=%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98" target="_blank">常见问题</a><br>
                <a href="../privacy/index.html" target="_blank">隐私条款</a>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">学习路径</div>
                <a href="../paths/python/index.html" target="_blank">Python学习路径</a><br>
                <a href="../paths/linuxdev/index.html" target="_blank">Linux学习路径</a><br>
                <a href="../paths/bigdata/index.html" target="_blank">大数据学习路径</a><br>
                <a href="../paths/java/index.html" target="_blank">Java学习路径</a><br>
                <a href="../paths/php/index.html" target="_blank">PHP学习路径</a><br>
                <a href="../paths/index.html", target="_blank">全部</a>
            </div>
        </div>
    </div>
    <div class="text-center copyright">
        <span>Copyright @2013-2016 在线教育</span>
        <span class="ver-line"> | </span>
        <a href="#" target="_blank">蜀ICP备00000000号</a>

    </div>
</div>




</body>
</html>
