<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-30
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-condensed">
    <tr>
        <td>订单号</td>
        <td>接单人</td>
        <td>数量</td>
        <td>价格</td>
        <td>接单时间</td>
        <td>订单状态</td>

        <td>发布单号</td>
        <td>发布人</td>
        <td>收件人</td>
        <td>收件地址</td>
        <td>取件号</td>


        <td>操作</td>
    </tr>

    <c:forEach items="${pageinfo.list}" var="order">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.employeeName}</td>
            <td>${order.amount}</td>
            <td>${order.price}</td>
            <td><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${order.orderStatus}</td>

            <td>${order.release.releaseId}</td>
            <td>${order.release.username}</td>
            <td>${order.release.recipient}</td>
            <td>${order.release.address}</td>
            <td>${order.release.deliveryNos}</td>
            <td><button type="button"  class="btn btn-primary" disabled>修改</button>
                <button type="button"  class="btn btn-primary" onclick="valid(e,'${order.orderId}')">删除</button>
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
