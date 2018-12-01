<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Study Online</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="bookmark" href="/favicon.ico">
    <link rel="bookmark" href="/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="css/main.css">
    <noscript>
        <link rel="stylesheet" href="css/noscript.css"/>
    </noscript>
</head>
<c:if test="${1==error_status}">
    <script>
        window.location.hash = "#login";
    </script>
</c:if>
<body class="">
<div id="wrapper">
    <!--首页开始-->
    <header id="header">
        <!-- <div class="logo">
        </div> -->
        <div class="content">
            <div class="inner">
                <h1>Study Online</h1>
                <!--
                    如果想自定义文本请删除下面这段script代码,格式为
                    <p>自定义文本</p>
                -->
                <div id="lwlhitokoto">
                    <script>lwlhitokoto()</script>
                    翻转课堂，在线学习
                </div>
            </div>
        </div>
        <nav class="use-middle">
            <ul>
                <li><a href="#1">简介</a></li>
                <%
                    if (request.getSession().getAttribute("user") != null) {
                %>
                <li><a href="#">文件分享</a></li>
                <li><a href="${pageContext.request.contextPath}/usercenter/usercenter.jsp">用户中心</a></li>
                <li><a href="${pageContext.request.contextPath}/LogoutServlet">注销</a></li>
                <%
                } else {
                %>
                <li><a href="#login">登录</a></li>
                <%
                    }
                %>
            </ul>
        </nav>

    </header>
    <!--首页结束-->
    <div id="main" style="display: none;">
        <!--标签1开始-->
        <article id="1" style="display: none;">
            <h2 class="major">简介</h2>
            <p>Study
                Online是一种手段，增加了学生和教师之间的互动和个性化的学习时间；是让学生对自己学习负责的环境；是为了让教师成为学生身边的“教练”而不是在讲台上的“圣人”；是混合了直接讲解与建构主义的学习；是学生虽课堂缺席但不被甩在后面的学习；是课堂的内容得以永久存档，可用于复习或补课的学习；是所有的学生都积极学习的课堂；更是让所有学生都能得到个性化教育的学习。</p>
            <div class="close">Close</div>
        </article>
        <!--
        简介修改示例:
        <p> 123</p>
        一个  <p> 123</p>  为一行，请不要删除 </article>
      -->

        <!--标签5开始-->
        <article id="login" style="display: none;">

            <h2 class="major">Login</h2>
            <form method="post" action="${pageContext.request.contextPath }/LoginServlet">
                <div class="field half first">
                    <label for="uid">UserId</label>
                    <input type="text" name="userid" id="uid">
                </div>
                <div class="field half">
                    <label for="passwd">password</label>
                    <input type="password" name="password" id="passwd">
                </div>

                <ul class="actions">
                    <li><input id="login" type="submit" value="submit" class="special"></li>
                    <li><input type="reset" value="清空"></li>
                    <span style="color: red">${register_message}</span>
                </ul>
            </form>


            <div class="field half">
                <input value="week" id="remember_me" name="remember_me" type="checkbox" checked="">
                <label for="remember_me">Remerber me</label>
            </div>
            <br>
            <div id="result" role="dialog">
                <p color="" class="h5 margin-top-sm text-black-hint" id="msg"></p>
            </div>
            <div class="close">Close</div>
        </article>
        <!--全部标签结束-->

    </div>
    <!-- 版权底部 -->
    <footer id="footer">
        <p class="copyright">©2018 Study Online</p>
    </footer>
    <!-- 版权结束 -->
</div>
<!-- BG -->
<div id="bg"></div>
<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>
</body>
</html>