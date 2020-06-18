//点击用户中心时 移除conten中的内容添加用户中心的jsp

function user_center() {
    $("#content").html("");
    //添加user_center内容
    $("#content").load("${pageContext.request.contextPath}/pages/"+"user_center_content"+".jsp")
}