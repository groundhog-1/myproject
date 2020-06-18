<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-28
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<button class="btn btn-default" style="margin-left: 40%;margin-top: 5px;" onclick="o_refresh(this)">刷新</button>
<div class="panel-body">
    <div class="tab-order">
        <c:forEach items="${pageinfo.list}" var="release">
            <div class="tab1">

                <table >

                    <tr>
                        <td>数量:</td>
                        <td>${release.amount}</td>
                        <td rowspan="4"><button class="btn btn-default" onclick="order(this,${release.releaseId})">接单</button></td>
                    </tr>
                    <td>价格:</td>
                    <td>${release.price} </td>
                    </tr>
                    <tr>
                        <td>收获地址:</td>
                        <td>${release.address}</td>
                    </tr>

                    <tr>
                        <td>发单时间:</td>
                        <td><fmt:formatDate value="${release.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>

                </table>

            </div>
        </c:forEach>





    </div>
</div>
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
                    <a class="page-link" href="javascript:void(0)" tabindex="-1" onclick="page(${pageinfo.pageNum}-1)" aria-disabled="false">上一页</a>
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

