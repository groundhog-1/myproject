<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020-04-27
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order_hall">
    <div id="r_drawer">
        <ul class="list-group">
            <li class="list-group-item active">用户信息</li>

        </ul>
    </div>
    <div id="l_orders">
        <div id="modify_user">
            <div class="panel-body">
                <table class="tab" width="100%">

                    <tr>
                        <td>姓名:</td>
                        <td class="td_input" >${userinfo.username}</td>
                    </tr>
                    <tr>
                        <td>电话:</td>
                        <td class="td_input">${userinfo.phone}</td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td class="td_input" >${userinfo.email}</td>
                    </tr>
                    <tr>
                        <td>收货地址:</td>
                        <td class="td_input">${userinfo.address}</td>
                    </tr>
                    <tr>
                        <td>真实姓名:</td>
                        <td class="td_input" >${userinfo.realName}</td>
                    </tr>
                </table>

            </div>
            <div id="btn_moddify">
                <div class="btn_modify1">
                    <button type="button" id="modify"   class="btn btn-primary">修改</button>

                </div>

                <div class="btn_modify2">
                    <button type="button" id="submit"   class="btn btn-primary">提交</button>
                    <button type="button" id="back"   class="btn btn-primary">返回</button>
                </div>




            </div>

        </div>


    </div>

</div>

<script type="text/javascript">
    //修改按钮
    $("#modify").click(function(){
        $(".tab tr .td_input").each(function(i,n){
            //添加input
            var name = "";
            if (i == 0) {
                name = "username";
            }else if(i == 1){
                name = "phone";
            }else if (i == 2){
                name = "email";
            }else if(i == 3){
                name = "address";
            }else if(i == 4){
                name = "realName";
            }
            var text = $(n).text();
            console.log(text);
            $(n).text("");
            $(n).append("<input type='text' class='form-control'  name="+name+" />");

            $(n).find("input").attr("value",text);
            //修改按钮
            $(".btn_modify1").css("display","none");
            $(".btn_modify2").css("display","block");

        });
    });
    //返回按钮
    $("#back").click(function(){
        //重新发送请求
        $("#content").html("");
        $("#content").load("${pageContext.request.contextPath}/user/query");

    });
    //提交按钮
    $("#submit").click(function () {
        var username = $(".tab input[name='username']").val();
        var phone = $(".tab input[name='phone']").val();
        var email = $(".tab input[name='email']").val();
        var address = $(".tab input[name='address']").val();
        var realName = $(".tab input[name='realName']").val();

        console.log(username);

        $.post("${pageContext.request.contextPath}/user/update",{username:username,phone:phone,email:email,address:address,realName:realName,"_method":"put"},function (data) {
            if (data == 'ok'){
                //重新发送请求
                $("#content").html("");
                $("#content").load("${pageContext.request.contextPath}/user/query");
            }
        });

    });



</script>
