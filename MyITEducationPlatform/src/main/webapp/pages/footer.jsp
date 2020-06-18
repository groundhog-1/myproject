<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-09-07
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 clearfix footer-col">
                <div style="width: 120px;height: 60px;margin-top: 25px;font-size: 18px;color: #ccc">
                    <span class="glyphicon glyphicon-globe"></span>
                    <span>飞升教育网</span>
                </div>
                <div class="col-xs-2">
                    <div class="social-item footer-weixin-item">
                        <i class="fa fa-weixin"></i>
                        <div class="footer-weixin">
                            <img src="${pageContext.request.contextPath}/pages/img/footer-weixin.png">
                        </div>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="social-item footer-qq-item">
                        <i class="fa fa-qq"></i>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="social-item footer-weibo-item">
                        <a href="#" target="_blank">
                            <i class="fa fa-weibo"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">公司</div>
                <a href="${pageContext.request.contextPath}/pages/aboutus/index.html" target="_blank">关于我们</a><br>
                <a href="${pageContext.request.contextPath}/pages/contact/index.html" target="_blank">联系我们</a><br>
                <a href="#" target="_blank">加入我们</a><br>
                <a href="#" target="_blank">技术博客</a><br>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">合作</div>
                <a href="${pageContext.request.contextPath}/pages/contribute/index.html" target="_blank">我要投稿</a><br>
                <a href="${pageContext.request.contextPath}/pages/labs/index.html" target="_blank">教师合作</a><br>
                <a href="${pageContext.request.contextPath}/pages/edu/index.html" target="_blank">高校合作</a><br>
                <a href="${pageContext.request.contextPath}/pages/friends/index.html" target="_blank">友情链接</a>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">服务</div>
                <a href="${pageContext.request.contextPath}/pages/bootcamp/index.html" target="_blank">实战训练营</a><br>
                <a href="${pageContext.request.contextPath}/pages/vip/index.html" target="_blank">会员服务</a><br>
                <a href="${pageContext.request.contextPath}/pages/courses/reports/index.html" target="_blank">实验报告</a><br>
                <a href="${pageContext.request.contextPath}/pages/questions/index.html?tag=%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98" target="_blank">常见问题</a><br>
                <a href="${pageContext.request.contextPath}/pages/privacy/index.html" target="_blank">隐私条款</a>
            </div>
            <div class="col-xs-6 col-sm-3 col-md-2 footer-col">
                <div class="col-title">学习路径</div>
                <a href="${pageContext.request.contextPath}/pages/paths/python/index.html" target="_blank">Python学习路径</a><br>
                <a href="${pageContext.request.contextPath}/pages/paths/linuxdev/index.html" target="_blank">Linux学习路径</a><br>
                <a href="${pageContext.request.contextPath}/pages/paths/bigdata/index.html" target="_blank">大数据学习路径</a><br>
                <a href="${pageContext.request.contextPath}/pages/paths/java/index.html" target="_blank">Java学习路径</a><br>
                <a href="${pageContext.request.contextPath}/pages/paths/php/index.html" target="_blank">PHP学习路径</a><br>
                <a href="${pageContext.request.contextPath}/pages/paths/index.html", target="_blank">全部</a>
            </div>
        </div>
    </div>
    <div class="text-center copyright">
        <span>Copyright @2013-2016 在线教育</span>
        <span class="ver-line"> | </span>
        <a href="#" target="_blank">蜀ICP备00000000号</a>

    </div>
</div>