<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-05
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div class="modal fade" id="sign-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <button type="button" class="close-modal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#signin-form" aria-controls="signin-form" role="tab" data-toggle="tab">登录</a>
                    </li>
                    <li role="presentation">
                        <a href="#signup-form" aria-controls="signup-form" role="tab" data-toggle="tab">注册</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="signin-form">
                        <form  >
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-envelope" style="margin:0;"></i>
                                    </div>
                                    <input type="email" name="email" class="form-control" placeholder="请输入邮箱">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-lock" style="margin:0;"></i>
                                    </div>
                                    <input type="password" name="password" class="form-control" placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-inline verify-code-item" style="display:block;">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" id="checkCode" class="form-control" placeholder="请输入验证码">
                                    </div>
                                </div>
                                <%--<img class="verify-code" src="" source="${pageContext.request.contextPath}/checkCode/getCheckCode">--%>
                                <img src="${pageContext.request.contextPath}/checkCode/getCheckCode" id="img">
                                <span class="glyphicon glyphicon-repeat refresh_code" style="cursor: pointer"></span>
                            </div>
                            <div class="form-group remember-login">
                                <input name="remember" type="checkbox" value="y"> 下次自动登录
                                <a class="pull-right" href="${pageContext.request.contextPath}/pages/reset_password/index.html">忘记密码？</a>
                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" name="submit" onclick="login(this)"  value="进入实验楼" >
                            </div>
                            <div class="form-group widget-signin">
                                <span>快速登录</span>
                                <a href="/auth/qq?next="><i class="fa fa-qq"></i></a>
                                <a href="/auth/weibo?next="><i class="fa fa-weibo"></i></a>
                                <a href="/auth/weixin?next="><i class="fa fa-weixin"></i></a>
                                <a href="/auth/github?next="><i class="fa fa-github"></i></a>
                                <a href="/auth/renren?next="><i class="fa fa-renren"></i></a>
                            </div>
                            <div class="form-group error-msg">
                                <div class="alert alert-danger" role="alert"></div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="signup-form">
                        <form >
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-envelope" style="margin:0;"></i>
                                    </div>
                                    <input type="email" id="email" name="email" class="form-control" placeholder="请输入邮箱">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-lock" style="margin:0;"></i>
                                    </div>
                                    <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="form-group" style="float:left;margin-bottom:20px">
                                    <div class="input-group ">
                                        <input type="text" name="captcha_v" id="captcha_v" style="float: left;width: 154px" class="form-control" placeholder="请输入验证码">
                                    </div>
                                </div>
                                <button class="btn btn-default " style="width:100px;margin-left:10px;float:left" type="button" id="send_checkCode">发送验证码</button>
                                <div id="timer" style="display: none;float:left;line-height: 34px;margin-left: 10px;font-size: 15px;color: red">
                                    有效时间为 0<span id="minutes">5</span>:<span id="seconds">00</span></div>

                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" id="register" value="注册">
                            </div>
                            <div class="form-group agree-privacy">
                                注册表示您已经同意我们的<a href="${pageContext.request.contextPath}/pages/privacy/index.html" target="_blank">隐私条款</a>
                            </div>
                            <div class="form-group widget-signup">
                                <span>快速注册</span>
                                <a href="/auth/qq?next="><i class="fa fa-qq"></i></a>
                                <a href="/auth/weibo?next="><i class="fa fa-weibo"></i></a>
                                <a href="/auth/weixin?next="><i class="fa fa-weixin"></i></a>
                                <a href="/auth/github?next="><i class="fa fa-github"></i></a>
                                <a href="/auth/renren?next="><i class="fa fa-renren"></i></a>
                            </div>
                            <div class="form-group error-msg">
                                <div class="alert alert-danger" role="alert"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>


    function login(t) {
        var form= $(t).parent().parent();
        var email=form.find("input[name='email']").val();
        var password=form.find("input[name='password']").val();
        var cli_checkCode=$("#checkCode").val();
        var url = location.pathname;
        $.post("${pageContext.request.contextPath}/user/login",{email:email,password:password,cli_checkCode:cli_checkCode},function (data) {
            if(data=="ok"){
                $("#sign-modal").modal("hide");
                $("#nav").load("${pageContext.request.contextPath}/pages/navbar.jsp .container");

                if(url=="/course/findByCourseId"){
                    location.reload(true);
                }
                location.reload(true);

            }else{
                var err_msg=form.find(".alert-danger");
                err_msg.html(data);
                err_msg.parent().removeClass("error-msg");
                var date=new Date().getTime();
                $("#img").attr("src","${pageContext.request.contextPath}/checkCode/getCheckCode?"+date);
                setTimeout(function () {
                    err_msg.parent().addClass("error-msg");
                },3000)
            }
        })

    }
    function loginout(t) {
        var url = location.pathname;
        $.post("${pageContext.request.contextPath}/user/loginout",function (data) {
            if(data=="ok"){
                $("#nav").load("${pageContext.request.contextPath}/pages/navbar.jsp .container");
                if(url=="/course/findByCourseId"){
                    location.reload(true);
                }
            }
            location.reload(true);
        });
    }

    $("#send_checkCode").click(function () {
        var email= $("#email").val();
        console.log(email)
        $.post("${pageContext.request.contextPath}/user/sendEmailCode",{email:email},function (data) {
            if(data=="ok"){
                $("#send_checkCode").next().css("display","block");
                $("#send_checkCode").attr('disabled',true);
                timer();
            }
            });

    })
    function timer() {
        var sil= setInterval(function () {
            var minute= $("#minutes").text();
            var seconds=$("#seconds").text();

            if(seconds>10){
                $("#seconds").html(seconds-1);
            }else if(seconds>0){
                var t=seconds-1;
                $("#seconds").html("0"+t);
            }else   if(seconds=="00"){
                if(minute==0){
                    $("#send_checkCode").attr('disabled',false);
                    $("#minutes").html(5);
                    $("#seconds").html("00");
                    $("#send_checkCode").next().css("display","none");
                    clearInterval(sil);
                }else{
                    $("#minutes").html(minute-1);
                    $("#seconds").html(59);

                }

            }


        },1000);
    }
    $(function () {
        $(".refresh_code").click(function () {
            var date=new Date().getTime();
            $("#img").attr("src","${pageContext.request.contextPath}/checkCode/getCheckCode?"+date);
        });
        if("${error_msg}".length>0){
            $("#error_msg").css("visibility","visible");
            $("#error_msg").fadeOut(3000);
        }
        $("#register").click(function () {
            var email=$("#email").val();
            var password=$("#password").val();
            var cli_checkCode=$("#captcha_v").val();
            $.post("${pageContext.request.contextPath}/user/register",
                {email:email,password:password,cli_checkCode:cli_checkCode},
                function (flag) {
                if(flag){
                    location.reload(true);
                }else {
                    alert(flag)
                }
            })
        })


    });



</script>
