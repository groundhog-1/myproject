<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-27
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="my_orders">
    <ul class="nav nav-tabs status">
        <li role="presentation" onclick="change_tab(this)" class="active"><a href="javascript:void(0)" >正在派送</a></li>
        <li role="presentation" onclick="change_tab(this)" ><a href="javascript:void(0)" >已完成</a></li>
        <li role="presentation" onclick="change_tab(this)" ><a href="javascript:void(0)" >未付款</a></li>
    </ul>

    <div id="condition">
        <form class="form-inline" style="margin: 20px">
            <div class="form-group">
                <label class="sr-only" for="exampleInputEmail3">Email address</label>
                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="取货人" disabled>
            </div>


            <button type="submit" class="btn btn-default" disabled>查询</button>
            <button type="button" class="btn btn-default" onclick="e_refresh(this)">刷新</button>
        </form>
    </div>
    <div class="dispatching">
        <table class="table table-condensed">
            <tr>
                <td>订单号</td>

                <td>取件地点</td>
                <td>取件人</td>
                <td>手机号码</td>
                <td>取件单号</td>
                <td>备注</td>

                <td>快递数量</td>
                <td>总价格</td>
                <td>接单时间</td>

                <td>操作</td>
            </tr>
            <c:forEach items="${pageinfo.list}" var="order">
                <tr>
                    <td>${order.orderId}</td>

                    <td>${order.release.address}</td>
                    <td>${order.release.recipient}</td>
                    <td>${order.release.phone}</td>
                    <td>${order.release.deliveryNos}</td>
                    <td>${order.release.represent}</td>

                    <td>${order.amount}</td>
                    <td>${order.price}</td>
                    <td><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                    <td>
                        <c:if test="${order.orderStatus == 0 or order.orderStatus == 1}">
                            <button type="button"  class="btn btn-primary" onclick="finished(this,'${order.orderId}')">完成</button>
                        </c:if>

                        <c:if test="${order.isPay == 0}">
                            <button type="button"   class="btn btn-primary" onclick="reminder('${order.release.username}')">提醒付款</button>
                        </c:if>

                        <c:if test="${order.orderStatus == 0 or order.orderStatus == 1 and order.isPay == 0}">
                            <button type="button"  class="btn btn-primary" onclick="cacel(this,'${order.orderId}')">取消</button>
                        </c:if>

                        <button type="button"  class="btn btn-primary" onclick="detail(this,'${order.orderId}')">详情</button>
                    </td>

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
    function change_tab(e) {
        $(e).parent().find(".active").removeClass("active");
        $(e).addClass("active");

        var status = $(e).find("a").text();

        util(status,0);

    }
    //刷新
    function e_refresh(e) {
        var status = $("#my_orders .status .active").find("a").text();
        util(status,0);
    }
    //页码加载
    function page(num) {
        //查询标签
        var status = $("#my_orders .status .active").find("a").text();
        util(status,num);

    }

    function util(status,num) {
        if (num == 0) num = 1;

        $(".dispatching").html("");
        var url = "${pageContext.request.contextPath}/emp/findAll?flag=1&page="+num;


        if (status == "正在派送"){
            console.log(0);
            url = url+"&status=0";
        }else if (status == "已完成"){
            console.log(2);
            url = url+"&status=2";
        }else if(status == "未付款"){
            console.log(5);
            url = url+"&pay=0";
        }
        $(".dispatching").load(url);
    }
    //详情查询
    function detail(e,oid) {
        <%--window.location.href = "${pageContext.request.contextPath}/order/detail?oid="+oid;--%>
        window.open("${pageContext.request.contextPath}/order/detail?oid="+oid);
    }

    //完成
    function finished(e,oid) {
        $.post("${pageContext.request.contextPath}/emp/finish",{oid:oid,"_method":"put"},function (data) {
            if(data == "ok"){
                $(e).parent().parent().remove();
            }
        })


    }

    //取消
    function cacel(e,oid) {
        $.post("${pageContext.request.contextPath}/emp/cacel",{oid:oid,"_method":"put"},function (data) {
            if(data == "ok"){
                $(e).parent().parent().remove();
            }
        })
    }
    //提醒付款
    function reminder(name) {
        $.post("${pageContext.request.contextPath}/user/reminder",{name:name},function (data) {
            if (data == "ok"){
                confirm("发送成功");
            }
        })
    }
</script>