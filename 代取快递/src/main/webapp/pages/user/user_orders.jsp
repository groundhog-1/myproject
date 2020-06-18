<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-29
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-condensed">
    <tr>
        <td>订单号</td>

        <td>取件地点</td>
        <td>取件人</td>
        <td>手机号码</td>
        <td>取件单号</td>
        <td>备注</td>

        <td>派送人</td>
        <td>派送人电话</td>
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

            <td>${order.employeeName}</td>
            <td>${order.phone}</td>
            <td>${order.amount}</td>
            <td>${order.price}</td>
            <td><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <c:if test="${order.isPay == 0}">
                    <button type="button" id="pay" class="btn btn-primary" onclick="pay(this,'${order.orderId}')">付款</button>
                </c:if>
                <c:if test="${order.orderStatus == 0 or order.orderStatus == 1}">
                    <button type="button" id="modify" class="btn btn-primary" onclick="reminder('${order.employeeName}')">提醒派送</button>
                </c:if>
                <c:if test="${order.orderStatus == 2 or order.orderStatus == 3}">
                    <button type="button" class="btn btn-primary" data-toggle="modal"  onclick="complaint(this,'${order.orderId}','${order.employeeName}')">投诉</button>
                </c:if>
                <button type="button" id="detial" onclick="detail(this,'${order.orderId}')" class="btn btn-primary">详情</button>
            </td>

        </tr>
    </c:forEach>




</table>
<!-- Modal -->


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
