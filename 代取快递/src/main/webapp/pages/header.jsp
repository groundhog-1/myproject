<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-26
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/emp.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<div id="header">
    <div id="text">
        <div class="discible">
            欢迎您,<security:authentication property="principal.username"/>

        </div>
    </div>
    <div id="nava">
        <ul class="user nav nav-pills">
            <%--用户权限--%>
            <security:authorize access="hasRole('ROLE_USER')">
                <li role="presentation" class="active" onclick="change_jsp_user(this)"><a href="javascript:void(0)" value="main">首页</a></li>
                <li role="presentation" class="" onclick="change_jsp_user(this)"><a href="javascript:void(0)" value="user_order">我的订单</a></li>
                <li role="presentation" onclick="change_jsp_user(this)"><a href="javascript:void(0)" value="user_release">订单发布</a></li>
                <li role="presentation" onclick="change_jsp_user(this)"><a href="javascript:void(0)" value="user_center">用户中心</a></li>

            </security:authorize>
            <security:authorize access="hasRole('ROLE_EMPLOYEE')">
                <li role="presentation" class="active" onclick="change_jsp_emp(this)"><a href="javascript:void(0)" value="main">首页</a></li>
                <li role="presentation" class="" onclick="change_jsp_emp(this)"><a href="javascript:void(0)" value="emp_order_hall">订单大厅</a></li>
                <li role="presentation" onclick="change_jsp_emp(this)"><a href="javascript:void(0)" value="emp_order">已接订单</a></li>
                <li role="presentation" onclick="change_jsp_emp(this)"><a href="javascript:void(0)" value="emp_center" >派送员中心</a></li>
            </security:authorize>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <li role="presentation" class="active" onclick="change_jsp_admin(this)"><a href="javascript:void(0)"value="main">首页设置</a></li>
                <li role="presentation" class="" onclick="change_jsp_admin(this)"><a href="javascript:void(0)" value="admin_order">订单操作</a></li>
                <li role="presentation" onclick="change_jsp_admin(this)"><a href="javascript:void(0)" value="admin_user">用户操作</a></li>
                <li role="presentation" onclick="change_jsp_admin(this)" style="pointer-events: none;"><a href="javascript:void(0)" value="admin_wage" >工资统计</a></li>
            </security:authorize>


        </ul>
    </div>
    <div id="msg">

        <div class="msg" onclick="msg(this)" style="cursor: pointer">
            <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
            <span class="badge badge-light msg_count">0</span>

        </div>
        <div class="btn-group">

            <div  class="avatar dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="${pageContext.request.contextPath}/images/avatar5.png" alt="..." class="img-circle" width="50px" >
            </div>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout.do">注销</a>

            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
  function change_jsp_user(e) {
      $(".user .active").removeClass("active");
      $(e).addClass("active");

      var jsp = $(e).find("a").attr("value");
      $("#content").html("");
      if (jsp == "main"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/pages/"+"announcement_content"+".jsp");
      }else if (jsp == "user_order"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/user/findAll?status=0");
      }else if (jsp == "user_release"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/user/queryUserRlease?page=1");
      }else if (jsp == "user_center"){
          //添加user_center内容
          //$("#content").load("${pageContext.request.contextPath}/pages/user/"+"user_center_content"+".jsp")
          $("#content").load("${pageContext.request.contextPath}/user/query");
      }

  }

  function change_jsp_emp(e) {
      $(".user .active").removeClass("active");
      $(e).addClass("active");

      var jsp = $(e).find("a").attr("value");
      $("#content").html("");
      if (jsp == "main"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/pages/"+"announcement_content"+".jsp")
      }else if (jsp == "emp_order_hall"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/order/hall")
      }else if (jsp == "emp_order"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/emp/findAll?status=0")
      }else if (jsp == "emp_center"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/user/query")
      }

  }

  function msg(e) {
      $("#content").load("${pageContext.request.contextPath}/msg/query");

  }
  //定时刷新消息
  function timingMsg() {
      $.get("${pageContext.request.contextPath}/msg/queryUnread",function (data) {
          $(".msg_count").text(data);
      })
      // alert(1);
  }

  timingMsg();
  setInterval(timingMsg, 1000*60);

  function change_jsp_admin(e) {
      $(".user .active").removeClass("active");
      $(e).addClass("active");

      var jsp = $(e).find("a").attr("value");
      $("#content").html("");
      if (jsp == "main"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/pages/"+"announcement_content"+".jsp")
      }else if (jsp == "admin_order"){
          //添加order_center内容
          $("#content").load("${pageContext.request.contextPath}/order/findAll")
      }else if (jsp == "admin_user"){
          //添加user_center内容
          $("#content").load("${pageContext.request.contextPath}/user/queryAll?flag=0")
      }else if (jsp == "admin_wage"){
          //添加user_center内容

      }
  }


</script>

