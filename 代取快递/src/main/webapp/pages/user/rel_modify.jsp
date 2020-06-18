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
<body>

<div id="parent">

    <jsp:include page="../header.jsp"/>
    <div id="content">
        <div id="user_release">
            <div class="rele"  style="margin: 50px auto;width: 400px;height:420px;border: 1px solid #dddddd;box-sizing: border-box">
                <%--<span class="glyphicon glyphicon-remove"  style="float: right;color: #fff"></span>--%>
                <form id="rel">
                    <div style="margin: 20px 20px 20px 20px">
                        <input hidden name="releaseId" value="${release.releaseId}">
                        <div class="" style="height: 34px;" >
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control"  placeholder="请填写收件人姓名" value="${release.recipient}" name="recipient">
                            </div>
                        </div>
                        <hr style="margin: 5px 5px 5px 5px">
                        <div class="" style="height: 34px;margin-top: 10px">
                            <label class="col-sm-3 control-label">手机号码</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control"  placeholder="请填写手机号码" value="${release.phone}" name="phone">
                            </div>
                        </div>
                        <hr style="margin: 5px 5px 5px 5px">
                        <div class="" style="height: 34px;margin-top: 10px">
                            <label class="col-sm-3 control-label">收件地址</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control"  placeholder="请填写收件地址" value="${release.address}" name="address">
                            </div>
                        </div>
                        <hr style="margin: 5px 5px 5px 5px">
                        <div class="" style="height: 34px;margin-top: 10px">
                            <label  class="col-sm-3 control-label">取件地址</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="delivery_address">
                                    <c:forEach items="${addresses}" var="address">
                                        <c:if test="${release.address == address}">
                                            <option selected>${address.address}</option>
                                        </c:if>
                                        <c:if test="${release.address != address}">
                                            <option>${address.address}</option>
                                        </c:if>

                                    </c:forEach>

                                </select>
                            </div>
                        </div>
                        <hr style="margin: 5px 5px 5px 5px">
                        <div class="" style="height: 34px;margin-top: 10px">
                            <label for="inputPassword3" class="col-sm-3 control-label">取件单号</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputPassword3" placeholder="多件以，分开" value="${release.deliveryNos}" name="deliveryNos">
                            </div>
                        </div>
                        <hr style="margin: 5px 5px 5px 5px">
                        <div class="form-group"  style="height: 34px;margin-top: 10px">
                            <label class="col-sm-3 control-label">备注</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="${release.represent}" placeholder="不能超过30个字符">
                            </div>
                        </div>
                        <hr style="margin: 5px 5px 5px 5px">

                        <div style="height: 34px;text-align: center">
                            <button type="button" onclick="submit1(this)" class="btn btn-default">提交</button>

                        </div>
                    </div>
                </form>


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
    function submit1(e) {
        $.post("${pageContext.request.contextPath}/rel/modify",$(e).parents("#rel").serialize()+"&_method=put",function (data) {
            if (data == "ok"){
                $(e).parents(".rele").fadeOut("slow");
            }
        })
    }

</script>




</body>
</html>

