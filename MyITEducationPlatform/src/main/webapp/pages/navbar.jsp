<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-05
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  .li-a a{
      margin-top: 11px;
  }

</style>
<nav class="navbar navbar-default navbar-fixed-top header" id="nav">
    <div class="container"  >
        <div class="navbar-header" >
            <div style="width: 120px;height: 60px;margin-top: 25px;font-size: 18px;color: #ccc">
                <span class="glyphicon glyphicon-globe"></span>
                <span>飞升教育网</span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="header-navbar-collapse"   >
            <ul class="li-a nav navbar-nav" id="mynav"  >
                <li class="dropdown active"  >
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        课程
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="active"
                               href="${pageContext.request.contextPath}/course/findAll">全部课程</a></li>
                        <li><a class=""
                               href="#">即将上线</a>
                        </li>
                        <%--<li><a class="" href="${pageContext.request.contextPath}/pages/developer/index.html">开发者</a>--%>
                        </li>
                    </ul>
                </li>
                <li class="">
                    <a href="${pageContext.request.contextPath}/paths/findAll">路径</a>
                </li>
                <li class="">
                    <a href="${pageContext.request.contextPath}/question/findAllDiscuss">讨论区</a>
                </li>
                <%--<li class=" bootcamp new-nav logo-1111">--%>
                    <%--<a href="${pageContext.request.contextPath}/pages/bootcamp/index.html">训练营</a>--%>

                <%--</li>--%>
                <li class=" new-nav logo-1111">
                    <a href="${pageContext.request.contextPath}/pages/vip/index.jsp">会员</a>

                </li>

            </ul>


            <div class="navbar-right btns" style="line-height: 72px;">

                <c:if test="${user==null}">
                    <a class="btn btn-default navbar-btn sign-in" data-sign="signin" href="#sign-modal" data-toggle="modal">登录</a>
                    <a class="btn btn-default navbar-btn sign-up" data-sign="signup" href="#sign-modal" data-toggle="modal">注册</a>
                </c:if>
                <c:if test="${user!=null}">
                       <div class="btn-group mycourse">
                            <span  style="font-size: 15px;color: white;margin-right: 20px;cursor: pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">我的课程</span>
                            <ul class="dropdown-menu" style="margin-top: 0px">
                                <c:if test="${user.courses.size()>4}">
                                    <c:forEach var="course" items="${user.courses}" begin="0" end="3" >
                                        <li >
                                            <a href="${pageContext.request.contextPath}/course/findByCourseId?courseId=${course.id}" style="width: 300px;height: 85px;padding: 20px;box-sizing: border-box;cursor: pointer;display: block">
                                                <img src="${pageContext.request.contextPath}/pages/img/${course.courseimg}" width="114px" height="65px" style="float: left">
                                                <div style="overflow: hidden; height: 65px;line-height: 20px">${course.title}</div>


                                            </a>

                                        </li>

                                    </c:forEach>
                                </c:if>
                                <c:if test="${user.courses.size()<=4}">
                                    <c:forEach var="course" items="${user.courses}"  >
                                        <li >
                                            <a href="${pageContext.request.contextPath}/course/findByCourseId?courseId=${course.id}"  style="width: 300px;height: 85px;padding: 20px;box-sizing: border-box;cursor: pointer;display:block;">
                                                <img src="${pageContext.request.contextPath}/pages/img/${course.courseimg}" width="114px" height="65px" style="float: left" >
                                                <div style="width:130px;height:  65px;overflow:hidden; line-height: 20px;display: block">${course.title}</div>

                                            </a>

                                        </li>

                                    </c:forEach>
                                </c:if>



                                <hr style="margin: 20px 5px 5px 5px">
                                <li style="text-align: center"><a href="${pageContext.request.contextPath}/course/studied?users_id=${user.id}&catagory=study&page=1" >查看更多</a></li>
                            </ul>
                       </div>

                            <span style="font-size: 20px;color: white;margin-right: 20px" class="glyphicon glyphicon-bell"></span>
                       <div class="btn-group myinfo">
                            <%--<img class=" img-circle" style="cursor: pointer"  src="${pageContext.request.contextPath}/pages/img/c01.jpg"
                             width="50px" height="50px" alt="..."  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                           <%--<c:if test="${user.permission!=null && user.permission.name=='vip'}">--%>
                               <%--<img src='${pageContext.request.contextPath}/pages/img/vip-icon.png'>--%>
                           <%--</c:if>--%>
                                <div class='user-avatar '>
                                    <a class='avatar' href='' target='_blank'>
                                        <img class=" img-circle" style="cursor: pointer"  src="${pageContext.request.contextPath}/pages/img/${user.userDetail.avatar}"
                                             width="50px" height="50px" alt="..."  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    </a>
                                    <c:if test="${user.permission!=null && user.permission.name=='vip'}">
                                        <a class='member-icon' href='/vip' target='_blank'>

                                            <img src='${pageContext.request.contextPath}/pages/img/vip-icon.png' style="margin-top:30px">

                                        </a>
                                    </c:if>
                                </div>
                            <ul class="dropdown-menu" style="margin-top: 0px">
                                <li><a href="${pageContext.request.contextPath}/pages/user/index.jsp">个人中心</a></li>
                                <li><a href="${pageContext.request.contextPath}/pages/vip/index.jsp">会员中心</a></li>
                                <c:if test="${user.teacher==null}">
                                    <li><a href="${pageContext.request.contextPath}/pages/teachers/index.jsp">我要投稿</a></li>
                                </c:if>
                                <c:if test="${user.teacher!=null}">
                                    <li><a href="${pageContext.request.contextPath}/pages/teachers/course.jsp">我要投稿</a></li>
                                </c:if>

                                <li role="separator" class="divider"></li>
                                <li><a href="javascript:void(0)" onclick="loginout(this)">退出</a></li>
                            </ul>
                        </div>


                </c:if>



            </div>
            <form class="navbar-form navbar-right" style="margin-top: 19px;">
                <div class="form-group" style="font-size:0px;">
                    <input type="text" placeholder="搜索 课程/问答" style="margin-right: 0px;border-right:0px;border-bottom-right-radius: 0px;border-top-right-radius: 0px"  value="" class="mr-sm-2 form-control" id="__BVID__33">
                    <button type="button" style="margin-left: 0px;border-left:0px;border-bottom-right-radius: 5px;border-top-right-radius: 5px" class="btn btn-default "><i class="fa fa-search"></i>
                    </button>
                </div>
            </form>
            <%--<form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/pages/search" method="get" role="search">
                <div class="form-group">

                    <input type="text" class="form-control" name="search" autocomplete="off" placeholder="搜索 课程/问答">
                </div>
            </form>--%>
        </div>
    </div>
</nav>
<script src="${pageContext.request.contextPath}/pages/static/jquery/2.2.4/jquery.min.js"></script>
<script id="login-js">
    console.log(123)
    console.log("${user.permission.name}");
    $(function () {
        //给下拉框添加效果
        $(".mycourse").mouseover(function () {

            $(this).addClass("open");
        }).mouseout(function () {
            $(this).removeClass("open");
        })

        $(".myinfo").mouseover(function () {

            $(this).addClass("open");
        }).mouseout(function () {
            $(this).removeClass("open");
        })
        $("#mynav li").click(function () {
            $(this).parent().find(".active").removeClass("active");
            $(this).addClass("active");
        })
    })

</script>