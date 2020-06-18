<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-14
  Time: 16:25
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


    <title>会员 - 实验楼</title>



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

    <style>
        div.tooltip {
            position:absolute;
            top:0;
        }
    </style>
</head>

<body>

<jsp:include page="${pageContext.request.contextPath}/pages/navbar.jsp"/>


<div class="vip-header layout-no-margin-top" style="min-height:215px;">
    <h1 class="vip-header-title">加入实验楼会员，拥有自己的实验机</h1>
    <h4 class="vip-header-description">精品课程 + 环境保存 + 实验联网 + 会员客户端</h4>
</div>
<div class="vip-details">
    <div class="container">
        <div class="row vip-row hidden-xs">
            <div class="vip-item">
                <ul class="list-group">
                    <li class="list-group-item"><h4>&nbsp;</h4></li>
                    <li class="list-group-item">免费课程</li>
                    <li class="list-group-item">会员课程</li>
                    <li class="list-group-item">
                        <span style="border-bottom:1px dashed" data-toggle="tooltip" data-placement="bottom" title="会员可以保存实验环境，普通用户实验结束后环境删除">实验环境保存</span>
                    </li>
                    <li class="list-group-item">
                        <span style="border-bottom:1px dashed" data-toggle="tooltip" data-placement="bottom" title="会员环境可以连接互联网，普通用户环境仅连接实验楼内网">实验环境联网</span>
                    </li>
                    <li class="list-group-item"><a href="#vip-clients" title="" class="link-clients">会员客户端</a></li>
                    <li class="list-group-item">SSH直连</li>
                    <li class="list-group-item">WebIDE</li>
                    <li class="list-group-item">训练营优惠</li>
                    <li class="list-group-item">
                        <span style="border-bottom:1px dashed" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="在讨论区提问，可以收到专职助教答疑回复">会员课程答疑</span>
                    </li>
                    <li class="list-group-item" style="height:190px;">&nbsp;</li>
                </ul>
            </div>
            <div class="vip-item">
                <ul class="list-group">
                    <li class="list-group-item"><h4 class="is-vip-user">会员 <img src="../img/icon-vip.png" alt=""></h4></li>
                    <li class="list-group-item"><img src="../img/vip-service-status.png" alt=""></li>
                    <li class="list-group-item"><img src="../img/vip-service-status.png" alt=""></li>
                    <li class="list-group-item"><img src="../img/vip-service-status.png" alt=""></li>
                    <li class="list-group-item"><img src="../img/vip-service-status.png" alt=""></li>
                    <li class="list-group-item"><img src="../img/vip-service-status.png" alt=""></li>
                    <li class="list-group-item"><img src="../img/vip-service-status.png" alt=""></li>
                    <li class="list-group-item"><img src="../img/vip-service-status.png" alt=""></li>
                    <li class="list-group-item rebate-number"><span class="number-eight"><span style="color: #FC9F0E;font-size: 23px">8</span> 折</span></li>
                    <li class="list-group-item">&nbsp;</li>
                    <li class="list-group-item item-vip-footer" style="height:195px">
                        <strong class="vip-price" style="font-size: 15px;display:block;margin-bottom: -10px"><span style="font-size:40px;color:#FC9F0E">￥299</span> / 年</strong>
                        <del style="font-size: 12px;color: #999;">原价 599元</del>
                        <br>
                        <c:if test="${user==null}">

                            <a type="button" class="btn btn-bigger btn-all" href="#sign-modal" data-toggle="modal" data-sign="signin" data-next="/vip">加入</a>

                        </c:if>
                        <c:if test="${user!=null && user.permission.name!='vip'}">
                            <a type="button" class="btn btn-bigger btn-all" href="#vip-modal"  data-toggle="modal" data-sign="signin" data-next="/vip">加入</a>

                        </c:if>
                        <c:if test="${user.permission.name=='vip'}">
                            <a type="button" class="btn btn-bigger btn-all" href="#vip-modal" disabled="true" data-toggle="modal" data-sign="signin" data-next="/vip">已加入</a>

                        </c:if>
                        <p style=""> 实验豆可抵扣现金</p>
                    </li>
                </ul>
            </div>
        </div>

        <div class="row visible-xs">
            <div class="col-md-4">
                <div class="vip-details-item">
                    <div class="vip-details-header is-free-user">
                        <h4>免费</h4>
                    </div>
                    <div class="vip-details-body">
                        <div class="vip-details-content">
                            <div>免费课程 <span class="glyphicon glyphicon-ok"></span></div>
                            <div>实验结束后环境删除 <span class="glyphicon glyphicon-ok"></span></div>
                            <div>连接内网 <span class="glyphicon glyphicon-ok"></span></div>
                            <div class="disabled">会员课程 <span class="glyphicon glyphicon-remove"></span></div>
                            <div class="disabled">可保存实验环境 <span class="glyphicon glyphicon-remove"></span></div>
                            <div class="disabled">连接互联网 <span class="glyphicon glyphicon-remove"></span></div>
                            <div class="disabled">会员客户端 <span class="glyphicon glyphicon-remove"></span></div>
                            <div></div>
                        </div>
                        <div class="vip-details-price is-free-user" style="margin-top: 10px;margin-bottom:21px">
                            <strong>免费</strong>
                        </div>
                    </div>
                    <div class="vip-details-footer is-free-user" style="padding:28px 0 58px 0;">

                        <a class="btn btn-primary" href="#sign-modal" data-toggle="modal" data-sign="signup" >立即注册</a>

                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="vip-details-item">
                    <div class="vip-details-header">
                        <h4>会员 <img class="icon-vip" src="../img/icon-vip.png" alt=""></h4>
                    </div>
                    <div class="vip-details-body">
                        <div class="vip-details-content">
                            <div>160+ 会员课程 <span class="glyphicon glyphicon-ok"></span></div>
                            <div>可保存实验环境 <span class="glyphicon glyphicon-ok"></span></div>
                            <div>连接互联网 <span class="glyphicon glyphicon-ok"></span></div>
                            <div><a href="#vip-clients">会员客户端</a> <span class="glyphicon glyphicon-ok"></span></div>
                            <div>SSH 直连 + WebIDE <span class="glyphicon glyphicon-ok"></span></div>
                            <div style="padding:10px 20px">训练营<span style="color: red;font-weight:bold;font-size: 20px"> 8 </span>折优惠 <span class="glyphicon glyphicon-ok"></span></div>
                            <div class="disabled">讨论区助教答疑 <span class="glyphicon glyphicon-remove"></span></div>
                            <div></div>
                        </div>
                        <div class="vip-details-price">
                            <strong>￥299</strong>
                            <span>/ 年</span>
                            <div><del>原价 599元</del></div>
                        </div>
                    </div>
                    <div class="vip-details-footer">

                        <a class="btn btn-warning" data-level="12" href="#sign-modal" data-toggle="modal" data-sign="signin" data-next="/vip">立即加入</a>

                        <div>实验豆可抵现金</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="vip-details-item">
                    <div class="vip-details-header">
                        <h4 style="color: #1A93B4">高级会员 <img class="icon-vip" src="../img/icon-vip-advance.png" alt=""></h4>
                    </div>
                    <div class="vip-details-body">
                        <div class="vip-details-content">
                            <div>160+ 会员课程 <span class="glyphicon glyphicon-ok"></span></div>
                            <div>可保存实验环境 <span class="glyphicon glyphicon-ok"></span></div>
                            <div>连接互联网 <span class="glyphicon glyphicon-ok"></span></div>
                            <div><a href="#vip-clients">会员客户端</a> <span class="glyphicon glyphicon-ok"></span></div>
                            <div>SSH 直连 + WebIDE <span class="glyphicon glyphicon-ok"></span></div>
                            <div style="padding:10px 20px">训练营<span style="color: red;font-weight:bold;font-size: 20px "> 5 </span>折优惠 <span class="glyphicon glyphicon-ok"></span></div>
                            <div>讨论区助教答疑 <span class="glyphicon glyphicon-ok"></span></div>
                            <div></div>
                        </div>
                        <div class="vip-details-price">
                            <strong>￥599</strong>
                            <span>/ 年</span>
                            <div><del>原价 1099元</del></div>
                        </div>
                    </div>
                    <div class="vip-details-footer">

                        <a class="btn btn-warning" data-level="12" href="#sign-modal" data-toggle="modal" data-sign="signin" data-next="/vip">立即加入</a>

                        <div>实验豆可抵现金</div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="vip-hots">
    <div class="container">
        <div class="vip-hots-header">
            <h4>已有 <span>350,000</span> 人在实验楼完成了 <span>6,000,000+</span> 次实验</h4>
        </div>
        <div class="row vip-hots-body">
            <div class="col-md-4">
                <div class="media">
                    <div class="media-left">
                        <img class="media-object" src="../img/vip-allcourses.png">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">课程畅学</h4>
                        <p>会员专属精品课程，每周不断更新，给你最快的成长</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="media-left">
                        <img class="media-object" src="../img/vip-24.png">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">随时实践</h4>
                        <p>独享实验机，长期保存，在线开发代码，24小时随时继续</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="media-left">
                        <img class="media-object" src="../img/vip-internet.png">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">优质体验</h4>
                        <p>环境联网，会员客户端+SSH直连+WebIDE，更优实验体验</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="vip-clients" id="vip-clients">
    <div class="container">
        <div class="vip-clients-header">
            <h4>即开即用的会员客户端，随时随地远程访问实验桌面</h4>
        </div>
        <div class="row vip-clients-body">
            <div class="col-md-4">
                <div class="vip-clients-windows vip-clients-logo"></div>
                <div class="vip-clients-title">Windows - Windows 7 及以上</div>
                <a href="http://labfile.oss-cn-hangzhou.aliyuncs.com/shiyanlou_desktop/shiyanlou-desktop-v1.0.3-win64.exe">立即下载（64位）</a><br/><a href="http://labfile.oss-cn-hangzhou.aliyuncs.com/shiyanlou_desktop/shiyanlou-desktop-v1.0.3-win32.exe">立即下载（32位）</a>
                <div class="text-danger" style="font-size:14px;">（安装过程中如果遇到 360 的警告可以忽视）</div>
            </div>
            <div class="col-md-4">
                <div class="vip-clients-mac vip-clients-logo"></div>
                <div class="vip-clients-title">MacOS - MacOS 10.11 及以上 </div>
                <a href="http://labfile.oss-cn-hangzhou.aliyuncs.com/shiyanlou_desktop/shiyanlou-desktop-v1.0.3-macos.dmg">立即下载</a>
            </div>
            <div class="col-md-4">
                <div class="vip-clients-linux vip-clients-logo"></div>
                <div class="vip-clients-title">Linux - Ubuntu 14.04 及以上</div>
                <a href="http://labfile.oss-cn-hangzhou.aliyuncs.com/shiyanlou_desktop/shiyanlou-desktop-v1.0.3-linux64.deb">立即下载（64位）</a><br/><a href="http://labfile.oss-cn-hangzhou.aliyuncs.com/shiyanlou_desktop/shiyanlou-desktop-v1.0.3-linux32.deb">立即下载（32位）</a>
            </div>
            <div class="video">
                <video controls="controls">
                    <source src="http://labfile.oss-cn-hangzhou.aliyuncs.com/shiyanlou_desktop/desktop.ogg" type="video/ogg">
                    <source src="http://labfile.oss-cn-hangzhou.aliyuncs.com/shiyanlou_desktop/desktop.mp4" type="video/mp4">
                    你的浏览器不支持播放视频
                </video>
                <div class="video-play">
                    <i class="fa fa-play-circle-o fa-2x"></i>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="vip-faq">
    <div class="container">
        <div class="vip-faq-header">
            <img src="../img/vip-faq.png">
            FAQ
            <span></span>
        </div>
        <div class="vip-faq-body">
            <h4>会员课程和免费课程有什么区别？</h4>
            <div>1. 会员课程多为项目课，免费课程多为基础课。</div>
            <div>2. 会员课程主要由实验楼团队制作及维护，免费课程由实验楼及合作伙伴共同维护。</div>
            <div>3. 会员可联网并保存环境，会员课程内容不受网络及时间限制。</div>
            <div>4. 会员课程更新频率更高，难度会更大。</div>
        </div>
        <div class="vip-faq-body">
            <h4>会员客户端是什么？</h4>
            <div>实验楼会员专属的桌面端软件，即开即用，自动连接云端实验桌面，特点:</div>
            <div>1. 易用：即开即用，随时远程访问实验桌面</div>
            <div>2. 安全：数据云端保存，HTTPS加密传输</div>
            <div>3. 跨平台：支持Windows，Mac OSX 及 Linux平台</div>
            <div>4. 更多功能：实验工具中提供查看文档及一键SSH连接实验环境等</div>
        </div>
        <div class="vip-faq-body">
            <h4>什么情况下需要保存实验环境？</h4>
            <div>1. 当时间不多或实验耗时较长，无法连续完成一个实验时。</div>
            <div>2. 当实验遇到问题但无法及时解决时。</div>
            <div>3. 当需要一台在线开发环境时。</div>
        </div>
        <div class="vip-faq-body">
            <h4>环境联网有什么好处？</h4>
            <div>1. 实验中随时连接站外资源，例如Github等。</div>
            <div>2. 支持大量联网课程，例如微信微博开发及SaaS开发。</div>
        </div>
        <div class="vip-faq-body">
            <h4>成功购买会员服务后，是否可以退款？</h4>
            <div>支付购买成功后，暂不接受退款申请，请详细查看会员服务内容后进行购买，如有任何不清楚的地方欢迎在 <a href="/questions/">讨论区</a> 发帖询问。</div>
        </div>
        <div class="vip-faq-body">
            <h4>高级会员与普通会员有什么不同？</h4>
            <div>1. 实验楼提供专职助教，在讨论区为高级会员提供答疑服务，回答学习会员课程过程中遇到的问题。</div>
            <div>2. 购买训练营享受5折优惠。</div>
        </div>
        <div class="vip-faq-footer">
            <a href="/questions/1440">更多疑问，查看这里></a>
        </div>
    </div>
</div>





<div class="modal fade" id="vip-modal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">加入会员</h4>
                <div class="alert-message">
                    <div class="alert alert-danger"></div>
                </div>
            </div>
            <div class="modal-body">
                <div class="vip-modal-item ">
                    <div class="vip-modal-item-header">手机号</div>
                    <div class="vip-modal-item-body">
                        <div class="input-group">
                            <input type="text" class="form-control phone-number"
                                   value=""
                            >
                            <span class="input-group-btn">
                                <button class="btn btn-info get-phone-code "
                                        data-url="/user/sms/code">获取验证码</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="vip-modal-item vip-phone-code" >
                    <div class="vip-modal-item-header">验证码</div>
                    <div class="vip-modal-item-body">
                        <input type="text" class="form-control phone-code">
                        <a class="pull-right text-success" href="/questions/2540" target="_blank">收不到验证码？</a>
                    </div>
                </div>

                <div class="vip-modal-item">
                    <div class="vip-modal-item-header">使用实验豆<span>（最高使用100个实验豆）</span></div>
                    <div class="vip-modal-item-body">
                        <div class="consume-beans">
                            <input type="checkbox">
                            <span>使用</span>
                            <input class="form-control" type="text" disabled value="0">
                            <span>个实验豆抵扣</span>
                            <span class="beans">0</span>
                            <span>元</span>
                            <div class="left-beans">
                                <div>您的实验豆还剩 <strong>0</strong> 个</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vip-modal-item">
                    <div class="vip-modal-item-header">支付方式</div>
                    <div class="vip-modal-item-body">
                        <div class="pay-method pay-method-ali active" data-pay="ALI_WEB">
                        </div>
                        <div class="pay-method pay-method-wx" data-pay="WX_NATIVE">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-body vip-modal-qrcode" style="display:none;">
                <div class="vip-wx-price">付款：<span></span></div>
                <div class="vip-wx-qrcode"></div>
                <a class="vip-wx-method" href="javascript:;">更换支付方式</a>
            </div>
            <div class="modal-footer">
                <div class="pull-left real-price">
                    <div>
                        <div style="float:left"><span>付款：</span><strong>￥</strong><strong class="last-price">299</strong></div>
                        <br class="__web-inspector-hide-shortcut__">

                    </div>


                </div>
                <div class="pull-right ">
                    <a  class="btn btn-primary"  onclick="purchase(this)">确认购买</a>
                    <input type="checkbox" checked>
                    <span>同意<a href="/terms" target="_blank">会员服务条款</a></span>
                </div>
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


<jsp:include page="${pageContext.request.contextPath}/pages/login.jsp"/>

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


<div id="jinja-data"
     data-query-bill="/purchase/bill/query"
     data-need-phone-code="true"
     data-is-member-discount-enabled="false"
     data-member-price="299"
     data-get-member-price="/purchase/member/price"
></div>
<script src="../app/dest/member/index.js?=2016121272249"></script>
<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>
<script>
    function purchase(t) {

        $.post("${pageContext.request.contextPath}/user/vip?userid=${user.id}",function (data) {
            if(data=="ok"){
                location.reload(true);
            }
        })
    }
</script>


</body>
</html>
