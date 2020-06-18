<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-28
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-26
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>

    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="${pageContext.request.contextPath}/css/user.css">
</head>
<body style="font-size: 16px;font-weight: bold;">

<div id="parent">

    <jsp:include page="header.jsp"/>
    <div id="content">
        <div id="user_release">
            <div class="rele"  style="margin: 50px auto;width: 400px;height:auto;border: 1px solid #dddddd;box-sizing: border-box">
                <%--<span class="glyphicon glyphicon-remove"  style="float: right;color: #fff"></span>--%>
                <div style="margin: 20px 20px 20px 20px">
                    <div class="panel-body">
                        <table class="tab" width="100%">

                            <tr>
                                <td>订单编号:</td>
                                <td class="td_input" >${order.orderId}</td>
                            </tr>
                            <tr>
                                <td>发布时间:</td>
                                <td class="td_input" ><fmt:formatDate value="${order.release.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                            <tr>
                                <td>快递地址:</td>
                                <td class="td_input" >${order.release.delivery_address}</td>
                            </tr>
                            <tr>
                                <td>快递单号:</td>
                                <td class="td_input" >${order.release.deliveryNos}</td>
                            </tr>
                            <tr>
                                <td>备注:</td>
                                <td class="td_input" >${order.release.represent}</td>
                            </tr>
                            <tr>
                                <td>发布人:</td>
                                <td class="td_input" >${order.release.username}</td>
                            </tr>
                            <tr>
                                <td>收件人:</td>
                                <td class="td_input" >${order.release.recipient}</td>
                            </tr>
                            <tr>
                                <td>收件地址:</td>
                                <td class="td_input" >${order.release.address}</td>
                            </tr>
                            <tr>
                                <td>价格:</td>
                                <td class="td_input" >${order.price}</td>
                            </tr>
                            <tr>
                                <td>数量:</td>
                                <td class="td_input" >${order.amount}</td>
                            </tr>
                            <tr>
                                <td>派送员:</td>
                                <td class="td_input" >${order.employeeName}</td>
                            </tr>
                            <tr>
                                <td>派送员电话:</td>
                                <td class="td_input" >${order.phone}</td>
                            </tr>
                            <tr>
                                <td>接单时间:</td>
                                <td class="td_input" ><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                            <tr>
                                <td>订单状态:</td>
                                <td class="td_input" >${order.orderStatus}</td>
                            </tr>

                        </table>

                    </div>
                </div>

            </div>
        </div>



    </div>

    <hr>
    <div id="bottom">
    </div>



</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖.text() jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<script>
    //提交
    function submit(e) {
        $.post("${pageContext.request.contextPath}/rel/release",$(e).parents("#rel").serialize(),function (data) {
            if (data == "ok"){
                $(e).parents(".rele").fadeOut("slow");
            }
        })
    }
    //返回
    function back(e) {
        //window.history.back(-1);
    }
</script>




</body>
</html>

