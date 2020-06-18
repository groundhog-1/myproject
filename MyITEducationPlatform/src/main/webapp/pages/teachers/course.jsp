<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-15
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Lei Shi">
    <meta http-equiv="Cache-Control" content="o-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="csrf-token" content="1483780974##87f89328c5616669f00302a263fe9061bb852818">


    <title>开授课程</title>




    <meta content="实验楼课程分为基础课和项目课，内容涵盖了Linux、Python、Java、C语言、Ruby、Android、IOS开发、大数据、信息安全等IT技术领域。" name="description">
    <meta content="实验楼课程,IT培训课程,IT实训课程,IT在线课程,all" name="keywords">

    <meta content="" name="author">

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/static/font-awesome//4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/static/highlight.js/9.8.0/monokai-sublime.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/katex/0.6.0/katex.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/libs/videojs/5.11.7/video-js.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/app/css/dest/styles.css?=2016121272249">

    <style>
        @font-face {
            font-family: "lantingxihei";
            src: url("${pageContext.request.contextPath}/pages/fonts/FZLTCXHJW.TTF");
        }

        /* modal 模态框*/
        #invite-user .modal-body {
            overflow: hidden;
        }
        #invite-user .modal-body .form-label {
            margin-bottom: 16px;
            font-size:14px;
        }
        #invite-user .modal-body .form-invite {
            width: 80%;
            padding: 6px 12px;
            background-color: #eeeeee;
            border: 1px solid #cccccc;
            border-radius: 5px;
            float: left;
            margin-right: 10px;
        }
        #invite-user .modal-body .msg-modal-style {
            background-color: #7dd383;
            margin-top: 10px;
            padding: 6px 0;
            text-align: center;
            width: 100%;
        }
        #invite-user .modal-body .modal-flash {
            position: absolute;
            top: 53px;
            right: 74px;
            z-index: 999;
        }
        /* end modal */

        .en-footer {
            padding: 30px;
            text-align: center;
            font-size: 14px;
        }
    </style>





</head>

<body>










<jsp:include page="${pageContext.request.contextPath}/pages/navbar.jsp"></jsp:include>

<div style="width: 1082px;height: 800px;margin: 100px auto;">
    <form class="form-horizontal" enctype='multipart/form-data' action="${pageContext.request.contextPath}/teacher/saveCourse" method="post">
        <div style="width: 400px;height: 800px;float: left">
            <div class="form-group">
                <label  class="col-sm-3 control-label">课程标题</label>
                <div class="col-sm-9">
                    <input hidden type="text" name="teacher_id" value="${user.teacher.id}">
                    <input type="text" class="form-control" name="title"  placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">课程简介</label>
                <div class="col-sm-9">
                    <textarea class="form-control" rows="3" name="introduction" placeholder="工作经验需有相关证明 可验证"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">开课时间</label>
                <div class="col-sm-9">
                    <input type="datetime-local" name="classStart" class="form-control"  placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">展示图片</label>
                <div class="col-sm-9">
                    <input type="file" name="course_img" >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">所属类别</label>
                <div class="col-sm-9">
                    <select class="form-control" name="category">
                        <option value="1">免费</option>
                        <option value="2">会员</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">所属标签</label>
                <div class="col-sm-9">
                    <select class="form-control" name="labelName">
                        <c:forEach items="${labels}" var="label">
                            <option value="${label}">${label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">所属模块</label>
                <div class="col-sm-9">
                    <select class="form-control" name="cm_id">
                        <c:forEach items="${courseModules}" var="coursemodule">
                            <option value="${coursemodule.id}">${coursemodule.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-3 control-label">所属阶段</label>
                <div class="col-sm-9">
                    <select class="form-control" name="stage">
                        <option value="1">初级阶段</option>
                        <option value="2">中级阶段</option>
                        <option value="3">高级阶段</option>
                    </select>
                </div>
            </div>
            <div class="form-group" style="text-align: center">
                <button class="btn btn-primary" type="submit">提交</button>
            </div>


        </div>
        <div style="width: 650px;height: 800px;float: left;margin-left: 30px" id="addCourse_Context" >
            <div  class="form-group">
                <label  class="col-sm-6 control-label">请选择你的课程节数</label>

                <div class="col-sm-6">
                    <input type="text" class="count"  onchange="text_change(this)" value="1" style="padding-left: 10px; height: 34px;width: 80px;float: left;border: 1px solid  #ccc;border-radius:5px 0px 0px 5px"   >

                    <div style="float: left;height: 38px; " >
                        <div class="add glyphicon glyphicon-plus" id="add" onclick="add(this)" style="cursor: pointer; height: 17px;width: 17px;border: 1px solid  #ccc;display: block"></div>
                        <div class="minus glyphicon glyphicon-minus" style="cursor: pointer; height: 17px;width: 17px;border: 1px solid  #ccc;" onclick="minus(this)"></div>

                    </div>
                </div>

            </div>
            <div class='form-inline'>
                <label >第1节</label>
                <div class='form-group' style='margin-left: 20px'>
                    <label >标题</label>
                    <input type='text' class='form-control' name="cc_title"  placeholder=''>
                </div>
                <div class='form-group' style='margin-left: 20px'>
                    <label >资源文件</label>
                    <input type='file' name='upload'   style='display: inline'>
                </div>
            </div>

        </div>
    </form>
</div>

<jsp:include page="${pageContext.request.contextPath}/pages/footer.jsp"/>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/pages/static/jquery/2.2.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/pages/static/bootstrap/bootstrap.min.js"></script>
<script>
    var flag=1;
    function add(t) {
        var input=$(t).parent().parent().find("input");
        var count=input.val();
        count= parseInt(count)+1;
        input.val(count);
        flag+=1;
        $("#addCourse_Context").append("<div style='margin-top: 10px' class='form-inline' value='"+flag+"'>\n" +
            "            <label >第"+flag+"节</label>\n" +
            "            <div class='form-group' style='margin-left: 20px'>\n" +
            "                <label >标题</label>\n" +
            "                <input type='text' class='form-control' name='cc_title' placeholder=''>\n" +
            "            </div>\n" +
            "            <div class='form-group' style='margin-left: 20px'>\n" +
            "                <label >资源文件</label>\n" +
            "                <input type='file' name='upload'  class='' placeholder='' style='display: inline'>\n" +
            "            </div>\n" +
            "        </div>")

    }
    function minus(t) {
        var input=$(t).parent().parent().find("input");
        var count=input.val();
        if(parseInt(count)>1){
            count= parseInt(count)-1;
        }
        input.val(count);
        console.log(flag);
        var c= $("#addCourse_Context").find("div[value='"+flag+"']");
        c.remove();
        flag-=1;


    }
    function text_change(t) {
        var input=$(t);
        var count=parseInt(input.val());

        if(count<1 || count>30){
            input.val(1);
        }
        input.val(1);
        flag=1;
        $("#addCourse_Context").find("div[value]").nextAll().remove();
        var a=$("#add");
        for(var i=1;i<count;i++){
            add(a);
        }

    }

</script>
</body>
</html>


