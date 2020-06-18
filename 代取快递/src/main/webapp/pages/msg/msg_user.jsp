<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-29
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="my_orders">
    <ul class="nav nav-tabs status">
        <li role="presentation" onclick="change_tab(this)" class="active"><a href="javascript:void(0)" >未读</a></li>
        <li role="presentation" onclick="change_tab(this)" ><a href="javascript:void(0)" >已读</a></li>
        <li role="presentation" onclick="change_tab(this)" ><a href="javascript:void(0)" >已发布</a></li>

    </ul>

    <div id="condition">
        <form class="form-inline" style="margin: 20px">
            <div class="form-group">
                <label class="sr-only" for="exampleInputEmail3">Email address</label>
                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="取货人">
            </div>


            <button type="submit" class="btn btn-default">查询</button>
            <button type="button" class="btn btn-default" onclick="e_refresh(this)">刷新</button>
        </form>
    </div>
    <div class="dispatching">
        <table class="table table-condensed">
            <table class="table table-condensed">



                <tr>

                    <td>发起人</td>
                    <td>内容</td>


                    <td>操作</td>
                </tr>
                <c:forEach items="${pageinfo.list}" var="message">
                    <tr>
                        <td>${message.sponsor}</td>
                        <td>${message.content}</td>
                        <td>
                            <c:if test="${message.isRead == 0 and message.sponsor != username}">
                               <button type="button" onclick="isRead(this,'${message.mid}')" class="btn btn-primary">已读</button>
                            </c:if>
                        </td>


                    </tr>
                </c:forEach>




            </table>



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
        util(status,1)



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
        var url = "${pageContext.request.contextPath}/msg/query?page="+num;


        if (status == "未读"){
            console.log(0);
            url = url + "&read=0" + "&flag=0";
        }else if (status == "已读"){
            console.log(2);
            url = url + "&read=1" + "&flag=1";
        }else if(status == "已发布"){
            console.log(5);
            url = url+"&flag=2";
        }
        $(".dispatching").load(url);
    }
    //已读
    function isRead(e,mid) {
        $.post("${pageContext.request.contextPath}/msg/read",{mid:mid,"_method":"put"},function (data) {
            if(data == "ok"){
                $(e).parent().parent().remove();
            }
        })

    }

</script>
