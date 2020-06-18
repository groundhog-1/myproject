<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-12
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class='pagination-container'>
    <ul class='pagination' id="Page">

        <li >
            <a href='#' aria-label='Previous'>
                <span aria-hidden='true'>上一页</span>
            </a>
        </li>
        <c:forEach begin='1' end='${courses.pages}' var='page'>
            <c:if test="${page==1}">
                <li class="active">
                    <a href='#'>${page}</a>
                </li>
            </c:if>
            <c:if test="${page!=1}">
                <li >
                    <a href='#'>${page}</a>
                </li>
            </c:if>


        </c:forEach>

        <li class=''>
            <a aria-label='Next' href='javascript:void(0)'>
                <span aria-hidden='true'>下一页</span>
            </a>
        </li>

    </ul>
</nav>
