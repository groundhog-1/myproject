<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-09
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3 layout-side">


    <div class="panel panel-default panel-userinfo">
        <div class="panel-body body-userinfo">
            <c:if test="${user==null}">


                <div class="media userinfo-header">
                    <div class="media-left">
                        <div class="user-avatar">

                            <a class="avatar" href="#sign-modal" data-toggle="modal" data-sign="signin">
                                <img class="circle" src="${pageContext.request.contextPath}/pages/img/logo-grey.png">
                            </a>

                        </div>
                    </div>
                    <div class="media-body">

                        <span class="media-heading username">欢迎来到飞升教育</span>
                        <p class="vip-remain">看视频，学编程</p>

                    </div>
                </div>

                <div class="row userinfo-data">

                    <hr>
                    <div class="btn-group-lr">
                        <a href="#sign-modal" type="button" class="btn btn-success col-md-5 col-xs-6 login-btn" data-toggle="modal" data-sign="signin">登录</a>
                        <a href="#sign-modal" type="button" class="btn btn-success col-md-5 col-xs-6 col-md-offset-1 register-btn" data-toggle="modal" data-sign="signup">注册</a>
                    </div>

                </div>
            </c:if>

            <div class="userinfo-footer row">
                <div class="col-md-6 col-xs-6 pos-left">

                    <%--<a href="#sign-modal" data-toggle="modal" data-sign="signin"><span class="glyphicon glyphicon-bookmark"></span> 加入私有课</a>--%>

                </div>
                <div class="col-md-6 col-xs-6 pos-right">
                    <c:if test="${user==null}">
                        <%--<a href="${pageContext.request.contextPath}/teacher/startcourse" target="_blank"><span class="glyphicon glyphicon-send"></span> 我要投稿</a>--%>
                        <a href="#sign-modal" data-toggle="modal" data-sign="signin" ><span class="glyphicon glyphicon-send"></span> 我要投稿</a>

                    </c:if>
                    <c:if test="${user!=null && user.teacher==null}">
                        <a href="${pageContext.request.contextPath}/pages/teachers/index.jsp" target="_blank"><span class="glyphicon glyphicon-send"></span> 我要投稿</a>

                    </c:if>
                    <c:if test="${user!=null && user.teacher!=null}">
                        <a href="${pageContext.request.contextPath}/teacher/startcourse" target="_blank"><span class="glyphicon glyphicon-send"></span> 我要投稿</a>

                    </c:if>
                       </div>

                <div id="join-private-course" class="modal fade words-ctrl" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">加入私有课</h4>
                            </div>
                            <div class="modal-body">
                                <div style="margin:15px 0; font:16px;">输入教师提供的私有课程码可以加入教师的私有课程。</div>
                                <form id="private-course-form" method="POST" action="/courses/join">
                                    <div class="form-group">
                                        <label for="code">邀请码</label>
                                        <input class="form-control" id="code" name="code" type="text" value="">
                                        <input name="_csrf_token" type=hidden value="1483780974##87f89328c5616669f00302a263fe9061bb852818">
                                    </div>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" onclick="document.getElementById('private-course-form').submit();">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="sidebox">

        <div class="sidebox-header">
            <h4 class="sidebox-title">最热路径</h4>
        </div>
        <div class="sidebox-body course-content side-list-body">
            <a href="${pageContext.request.contextPath}/paths/findAllByCourseModuleId?id=2"><img style="width:25px;height:25px" src="${pageContext.request.contextPath}/pages/img/1471513769430.png"> Python 研发工程师</a>
            <a href="${pageContext.request.contextPath}/paths/findAllByCourseModuleId?id=4"><img style="width:25px;height:25px" src="${pageContext.request.contextPath}/pages/img/1471513926288.png"> 大数据工程师</a>
            <a href="${pageContext.request.contextPath}/paths/findAllByCourseModuleId?id=3"><img style="width:25px;height:25px" src="${pageContext.request.contextPath}/pages/img/1471513793360.png"> C++ 研发工程师</a>
            <a href="${pageContext.request.contextPath}/paths/findAllByCourseModuleId?id=5"><img style="width:25px;height:25px" src="${pageContext.request.contextPath}/pages/img/1471513867033.png"> 信息安全工程师</a>
            <a href="${pageContext.request.contextPath}/paths/findAllByCourseModuleId?id=6"><img style="width:25px;height:25px" src="${pageContext.request.contextPath}/pages/img/1471514004752.png"> Linux 运维工程师</a>
        </div>

    </div>

    <div class="side-image side-qrcode">
        <img src="${pageContext.request.contextPath}/pages/img/oyyb.jpg">
        <div class="side-image-text">关注公众号，手机看教程</div>
    </div>

</div>
