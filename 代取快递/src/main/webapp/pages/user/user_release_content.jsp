<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-27
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<div id="user_release">
    <ul class="nav nav-tabs ">
        <li role="presentation" class="active" ><a href="javascript:void(0)">发布订单</a></li>
        <li role="presentation" onclick="user_release(this)"><a href="javascript:void(0)">等待接单</a></li>

    </ul>

    <div style="margin:20px 20px 20px 20px;">
        <div class="" style="height: 34px;line-height: 34px;margin-left: 30%" >
            <label style="float: left">请选择你所需发布的订单数量:</label>

            <input type="text" class="form-control" disabled style="width: 200px;float: left;margin-left: 20px"  placeholder="请填写发布订单表格数量" >

            <button class="btn btn-default " onclick="add_release(this)" style="float: right;margin-right: 20%">添加</button>
        </div>


    </div>
    <hr style="margin: 30px 20px 0px 20px;border: 1px solid #B3F5A3">
    <div class="template" style="display: none">
        <div class="rele"  style="margin: 50px 30px;width: 400px;height:420px;display:inline-block;border: 1px solid #dddddd;box-sizing: border-box">
            <span class="glyphicon glyphicon-remove" onclick="remove_release(this)" style="float: right;color: #fff"></span>
            <div style="margin: 20px 20px 20px 20px">
                <div class="" style="height: 34px;" >
                    <label class="col-sm-3 control-label">姓名</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control"  placeholder="请填写收件人姓名" value="${userinfo.realName}" name="recipient">
                    </div>
                </div>
                <hr style="margin: 5px 5px 5px 5px">
                <div class="" style="height: 34px;margin-top: 10px">
                    <label class="col-sm-3 control-label">手机号码</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control"  placeholder="请填写手机号码" value="${userinfo.phone}" name="phone">
                    </div>
                </div>
                <hr style="margin: 5px 5px 5px 5px">
                <div class="" style="height: 34px;margin-top: 10px">
                    <label class="col-sm-3 control-label">收件地址</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control"  placeholder="请填写收件地址" value="${userinfo.address}" name="address">
                    </div>
                </div>
                <hr style="margin: 5px 5px 5px 5px">
                <div class="" style="height: 34px;margin-top: 10px">
                    <label  class="col-sm-3 control-label">取件地址</label>
                    <div class="col-sm-9">
                        <select class="form-control" name="delivery_address">
                            <c:forEach items="${addresses}" var="address">
                                <option>${address.address}</option>
                            </c:forEach>

                        </select>
                    </div>
                </div>
                <hr style="margin: 5px 5px 5px 5px">
                <div class="" style="height: 34px;margin-top: 10px">
                    <label for="inputPassword3" class="col-sm-3 control-label">取件单号</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputPassword3" placeholder="多件以，分开" name="deliveryNos">
                    </div>
                </div>
                <hr style="margin: 5px 5px 5px 5px">
                <div class="form-group"  style="height: 34px;margin-top: 10px">
                    <label class="col-sm-3 control-label">备注</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control"  placeholder="不能超过30个字符">
                    </div>
                </div>
                <hr style="margin: 5px 5px 5px 5px">

                <div style="height: 34px;text-align: center">
                    <button type="button" class="btn btn-default" onclick="release(this)">发布</button>
                </div>
            </div>

        </div>
    </div>
    <div class="releases">
        <div class="rele"  style="margin: 50px 30px;width: 400px;height:420px;display:inline-block;border: 1px solid #dddddd;box-sizing: border-box">
            <span class="glyphicon glyphicon-remove" onclick="remove_release(this)" style="float: right;color: #fff"></span>
            <form  id="rel">
                <div style="margin: 20px 20px 20px 20px">
                    <div class="" style="height: 34px;" >
                        <label class="col-sm-3 control-label">姓名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control"  placeholder="请填写收件人姓名" value="${userinfo.realName}" name="recipient">
                        </div>
                    </div>
                    <hr style="margin: 5px 5px 5px 5px">
                    <div class="" style="height: 34px;margin-top: 10px">
                        <label class="col-sm-3 control-label">手机号码</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control"  placeholder="请填写手机号码" value="${userinfo.phone}" name="phone">
                        </div>
                    </div>
                    <hr style="margin: 5px 5px 5px 5px">
                    <div class="" style="height: 34px;margin-top: 10px">
                        <label class="col-sm-3 control-label">收件地址</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control"  placeholder="请填写收件地址" value="${userinfo.address}" name="address">
                        </div>
                    </div>
                    <hr style="margin: 5px 5px 5px 5px">
                    <div class="" style="height: 34px;margin-top: 10px">
                        <label  class="col-sm-3 control-label">取件地址</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="delivery_address">
                                <c:forEach items="${addresses}" var="address">
                                    <option>${address.address}</option>
                                </c:forEach>

                            </select>
                        </div>
                    </div>
                    <hr style="margin: 5px 5px 5px 5px">
                    <div class="" style="height: 34px;margin-top: 10px">
                        <label for="inputPassword3" class="col-sm-3 control-label">取件单号</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputPassword3" placeholder="多件以，分开" name="deliveryNos">
                        </div>
                    </div>
                    <hr style="margin: 5px 5px 5px 5px">
                    <div class="form-group"  style="height: 34px;margin-top: 10px">
                        <label class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control"  placeholder="不能超过30个字符" name="represent">
                        </div>
                    </div>
                    <hr style="margin: 5px 5px 5px 5px">

                    <div style="height: 34px;text-align: center">
                        <button type="button" class="btn btn-default" onclick="release(this)">发布</button>
                    </div>
                </div>
            </form>


        </div>
    </div>





</div>

<div id="query_release">
    <ul class="nav nav-tabs">
        <li role="presentation" onclick="query_release(this)" ><a href="javascript:void(0)">发布订单</a></li>
        <li role="presentation" class="active"><a href="javascript:void(0)">等待接单</a></li>

    </ul>
    <div id="condition">
        <form class="form-inline" style="margin: 20px">
            <div class="form-group">
                <label class="sr-only" for="exampleInputEmail3">Email address</label>
                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="取货人" disabled>
            </div>


            <button type="submit" class="btn btn-default" disabled>查询</button>
            <button type="button" class="btn btn-default" onclick="refresh(this)">刷新</button>
        </form>
    </div>
    <div id="tab_release">
        <table class="table table-condensed">
            <tr>
                <td>发布单号</td>
                <td>发布时间</td>
                <td>取货号</td>
                <td>取件地址</td>
                <td>取货人</td>
                <td>电话号码</td>
                <td>发布人</td>
                <td>备注</td>
                <td>操作</td>
            </tr>

            <c:forEach items="${pageinfo.list}" var="release">
                <tr>
                    <td >${release.releaseId}</td>
                    <td><fmt:formatDate value="${release.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${release.deliveryNos}</td>
                    <td>${release.address}</td>
                    <td>${release.recipient}</td>
                    <td>${release.phone}</td>
                    <td>${release.username}</td>
                    <td>${release.represent}</td>
                    <td><button type="button" onclick="modify(this,${release.releaseId})" class="btn btn-primary">修改</button>
                        <button type="button" onclick="cacel(this,${release.releaseId})" class="btn btn-primary">取消</button>

                </tr>
            </c:forEach>



        </table>
        <div id="order_nav">
            <nav aria-label="...">
                <ul class="pagination">
                    <c:if test="${pageinfo.pageNum == 1}">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageinfo.pageNum != 1}">
                        <li class="page-item ">
                            <a class="page-link" href="#" tabindex="-1" onclick="page(${pageinfo.pageNum}-1)" aria-disabled="false">上一页</a>
                        </li>
                    </c:if>

                    <%--小于5--%>
                    <c:if test="${pageinfo.pages <= 5}">
                        <c:forEach begin="1" end="${pageinfo.pages}" var="pageNum">

                            <c:if test="${pageinfo.pageNum == pageNum}">
                                <li class="page-item active"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageinfo.pageNum != pageNum}">
                                <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                            </c:if>


                        </c:forEach>
                    </c:if>
                    <%--大于5--%>

                    <c:if test="${pageinfo.pages > 5}">
                        <%--在5以类--%>
                        <c:if test="${pageinfo.pages - 2 <= 1} ">

                            <c:forEach begin="1" end="${pageinfo.pages}" var="pageNum">
                                <c:if test="${pageNum <= 5}">
                                    <c:if test="${pageinfo.pageNum == pageNum}">
                                        <li class="page-item active"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                                    </c:if>
                                    <c:if test="${pageinfo.pageNum != pageNum}">
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                                    </c:if>
                                </c:if>

                            </c:forEach>

                        </c:if>

                        <%--在中间--%>
                        <c:if test="${pageinfo.pages - 2 > 1 and pageinfo.pages + 2 < pageinfo.pages}">
                            <c:forEach begin="${pageinfo.pageNum - 2}" end="${pageinfo.pageNum + 2}" var="pageNum">
                                <c:if test="${pageinfo.pageNum == pageNum}">
                                    <li class="page-item active"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                                </c:if>
                                <c:if test="${pageinfo.pageNum != pageNum}">
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                                </c:if>
                            </c:forEach>
                        </c:if>

                        <%--在最后--%>
                        <c:if test="${pageinfo.pages + 2 >= 1} ">
                            <c:forEach begin="${pageinfo.pageNum - 4}" end="${pageinfo.pages}" var="pageNum">
                                <c:if test="${pageinfo.pageNum == pageNum}">
                                    <li class="page-item active"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                                </c:if>
                                <c:if test="${pageinfo.pageNum != pageNum}">
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="page(${pageNum})">${pageNum}</a></li>
                                </c:if>
                            </c:forEach>
                        </c:if>



                    </c:if>






                    <c:if test="${pageinfo.pageNum == pageinfo.pages}">
                        <li class="page-item disabled" >
                            <a class="page-link" href="#">下一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageinfo.pageNum != pageinfo.pages}">
                        <li class="page-item" >
                            <a class="page-link" href="#" onclick="page(${pageinfo.pageNum }+1)">下一页</a>
                        </li>
                    </c:if>

                </ul>
            </nav>
        </div>

    </div>




</div>

<script>
    function user_release(e) {
        console.log(2);
        $("#user_release").css("display","none");
        $("#query_release").css("display","block");
        refresh(e);

    }
    function query_release(e) {

        $("#user_release").css("display","block");
        $("#query_release").css("display","none");

    }

    //添加
    function add_release(e) {
        if ($(".releases .rele").length <3 ){
            console.log($(".releases .rele").length)
            $(".releases").append($(".template").html());
        }else{
            confirm("最多添加三个发布单");
        }

    }
    //移除
    function remove_release(e) {
        $(e).parent().remove();

    }

    //发布
    function release(e) {

        $.post("${pageContext.request.contextPath}/rel/release",$(e).parents("#rel").serialize(),function (data) {
            if (data == "ok"){
                $(e).parents(".rele").fadeOut("slow");
                $(e).parents(".rele").remove();
            }
        })

    }

    //修改
    function modify(e,id) {
        <%--window.location.href = "${pageContext.request.contextPath}/rel/query/"+id;--%>
        window.open("${pageContext.request.contextPath}/rel/query/"+id);
    }

    //刷新
    function refresh(e) {
        $("#tab_release").html("");
        $("#tab_release").load("${pageContext.request.contextPath}/rel/query?page=1")
    }

    //页码查询
    function page(num) {
        $("#tab_release").html("");
        $("#tab_release").load("${pageContext.request.contextPath}/rel/query?page="+num);
    }

    //取消
    function cacel(e,rid) {
        $.post("${pageContext.request.contextPath}/rel/cacel",{rid:rid,"_method":"delete"},function (data) {
            if (data == "ok"){
                $(e).parent().parent().remove();
            }
        })

    }






</script>
