<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-12
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade askquestion-modal" id="askquestion" tabindex="-1" role="dialog">
    <div class="modal-dialog" role=document>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">发帖</h4>
            </div>
            <div class="modal-body words-ctrl">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-2 control-label">标题</label>
                        <div class="col-md-10">
                            <input type="text" name="title" min="5" max="100" class="form-control" placeholder="至少输入5个字" value="">
                            <span class="help-block"></span>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-2 control-label">描述</label>
                        <div class="col-md-10">



                            <div class="tabpanel mkeditor">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active">
                                        <a href="#mkeditor-editor" role="tab" data-toggle="tab">编辑</a>
                                    </li>
                                    <li role="presentation">
                                        <a class="mkeditor-btn-view" href="#mkeditor-viewer" role="tab" data-toggle="tab">预览</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active mkeditor-editor" id="mkeditor-editor" role="tabpanel">

                                        <div class="btn-group" role="group">

                                            <button type="button" class="btn btn-default mkeditor-btn-bold">
                                                <i class="fa fa-bold"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-italic">
                                                <i class="fa fa-italic"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-link">
                                                <i class="fa fa-link"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-quote">
                                                <i class="fa fa-quote-left"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-code">
                                                <i class="fa fa-code"></i>
                                            </button>
                                            <button id="mkeditor-pickfile" type="button" class="btn btn-default mkeditor-btn-img">
                                                <i class="fa fa-image"></i>
                                            </button>

                                            <button type="button" class="btn btn-default mkeditor-btn-listol">
                                                <i class="fa fa-list-ol"></i>
                                            </button>
                                            <button type="button" class="btn btn-default mkeditor-btn-listul">
                                                <i class="fa fa-list-ul"></i>
                                            </button>
                                        </div>
                                        <div class="btn-group pull-right" role="group">
                                            <a style="font-size:12px; color:#666; text-decoration:underline;" href="/questions/764" target="_blank">
                                                <i class="fa fa-question-circle"></i>Markdown 语法
                                            </a>
                                        </div>
                                        <textarea name="content" class="content"
                                                  min="0" max="20000"
                                                  placeholder="推荐使用 Markdown 语法，至少输入 5 个字"></textarea>
                                        <div class="help-block"></div>
                                    </div>
                                    <div class="tab-pane mkeditor-viewer markdown-body" id="mkeditor-viewer" role="tabpanel">
                                        <div></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group" >
                        <label class="col-md-2 control-label">板块</label>
                        <div class="col-md-10" id="btnChange">

                            <button type="button" onclick="btnChange(this)" class="btn btn-default active" discuss="1" style="border-radius: 25px">课堂问答</button>
                            <button type="button" onclick="btnChange(this)" class="btn btn-default" discuss="2"  style="border-radius: 25px">交流讨论</button>

                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <a type="button" class="submit-question btn btn-primary" href="/vip" target="_blank" style="background:#FFFFFF;color:#00CC99;border:none;float:left;padding-left:0;"><img src="${pageContext.request.contextPath}/pages/img/senior-vip-icon.png" alt=""> 加入高级会员获得助教答疑</a>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
                <button type="button" onclick="question()" class="btn btn-primary" data-dismiss="modal">提交</button>
            </div>
        </div>
    </div>
</div>
