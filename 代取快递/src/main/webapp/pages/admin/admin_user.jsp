<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-05-01
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-condensed">
    <tr>
        <td>用户名</td>
        <td>电话</td>
        <td>地址</td>
        <td>邮箱</td>
        <td>真实姓名</td>
        <td>是否作废</td>


        <td>操作</td>
    </tr>
    <c:forEach items="${pageinfo.list}" var="user">


        <tr>
            <td>${user.username}</td>
            <td>${user.phone}</td>
            <td>${user.address}</td>
            <td>${user.email}</td>
            <td>${user.realName}</td>
            <td>${user.isvalid}</td>
            <td><button type="button" id="modify" class="btn btn-primary" disabled>修改</button>
                <button type="button" id="modify" class="btn btn-primary" onclick="deleteUser(this,${user.id})">删除</button>
                <c:set var="contains" value="no" />
                <c:forEach items="${user.roles}" var="role">
                    <c:if test="${role.name == 'USER'}">
                        <c:set var="contains" value="no" />
                    </c:if>
                    <c:if test="${role.name == 'EMPLOYEE'}">
                        <c:set var="contains" value="yes"/>
                    </c:if>
                    <c:if test="${role.name == 'ADMIN'}">
                        <c:set var="contains" value="admin"/>
                    </c:if>
                </c:forEach>
                <c:if test="${contains == 'no'}">
                    <button type="button" id="modify" class="btn btn-primary" onclick="addRole(this,'${user.username}')">授权</button>
                </c:if>
                <c:if test="${contains == 'yes'}">
                    <button type="button" id="modify" class="btn btn-primary" onclick="removeRole(this,'${user.username}')">撤权</button>
                </c:if>
                <c:if test="${contains == 'admin'}">

                </c:if>


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
