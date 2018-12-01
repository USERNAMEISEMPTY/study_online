<%@ page import="bean.Post" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 18-11-26
  Time: 下午6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Post</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js" ></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.js"></script>
    <link href="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.css"  rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.js"></script>
</head>
<body style="background: url(${pageContext.request.contextPath}/images/spbg.png) repeat">
<%
    Post p =(Post) request.getAttribute("Post");
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="#">Study Online</a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">用户中心</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">我的帖子</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">我的收藏</a>
        </li>
    </ul>
</nav>

<div style="border: white solid 1px; height:1180px;width:90%;margin: 0px auto;">
    <div style="background-color: white;width:90%;box-shadow:0 0 2px #000 inset;margin: auto;">
        <div style="margin: 0px 30px 0px 30px;padding-bottom: 30px;">
            <h2 style="text-align: center"><%out.println(p.getPosttitle());%></h2>
            <p>发布日期:<%out.println(p.getPostdatetime());%>&nbsp;&nbsp;作者:<%out.println(p.getUsername());%>&nbsp;&nbsp;阅读数：<%out.println(p.getLook_num());%></p>
            <hr>
            <div><%out.println(p.getPostcontent());%></div>
        </div>
    </div>
</div>
</body>
</html>
