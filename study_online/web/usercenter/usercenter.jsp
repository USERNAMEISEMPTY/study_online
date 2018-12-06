<%@ page import="bean.subject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.User" %>
<%@ page import="bean.Post" %>
<%@ page import="static javax.swing.text.html.CSS.getAttribute" %>
<%@ page import="javafx.geometry.Pos" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-cn" class=" no-touchevents no-touchevents">
<head>
    <title>Study Online</title>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
    <meta name="theme-color" content="#ff9800">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/usercenter/css/base.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/usercenter/css/project.min.css" rel="stylesheet">
    <style>
        body {
            background: #eee;
        }

        @keyframes mysnow {
            0% {
                bottom: 100%;
                opacity: 0;
            }
            50% {
                opacity: 1;
                transform: rotate(1080deg);
            }
            100% {
                transform: rotate(0deg);
                opacity: 0;
                bottom: 0;
            }
        }

        @-webkit-keyframes mysnow {
            0% {
                bottom: 100%;
                opacity: 0;
            }
            50% {
                opacity: 1;
                -webkit-transform: rotate(1080deg);
            }
            100% {
                -webkit-transform: rotate(0deg);
                opacity: 0;
                bottom: 0;
            }
        }

        @-moz-keyframes mysnow {
            0% {
                bottom: 100%;
                opacity: 0;
            }
            50% {
                opacity: 1;
                -moz-transform: rotate(1080deg);
            }
            100% {
                -moz-transform: rotate(0deg);
                opacity: 0;
                bottom: 0;
            }
        }

        @-ms-keyframes mysnow {
            0% {
                bottom: 100%;
                opacity: 0;
            }
            50% {
                opacity: 1;
                -ms-transform: rotate(1080deg);
            }
            100% {
                -ms-transform: rotate(0deg);
                opacity: 0;
                bottom: 0;
            }
        }

        @-o-keyframes mysnow {
            0% {
                bottom: 100%;
                opacity: 0;
            }
            50% {
                opacity: 1;
                -o-transform: rotate(1080deg);
            }
            100% {
                -o-transform: rotate(0deg);
                opacity: 0;
                bottom: 0;
            }
        }

        .roll {
            position: absolute;
            opacity: 0;
            animation: mysnow 5s;
            -webkit-animation: mysnow 5s;
            -moz-animation: mysnow 5s;
            -ms-animation: mysnow 5s;
            -o-animation: mysnow 5s;
            height: 80px;
        }

        .div {
            position: fixed;
        }
        .pagination {
            display: inline-block;
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px
        }

        .pagination > li {
            display: inline
        }

        .pagination > li > a, .pagination > li > span {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd
        }

        .pagination > li:first-child > a, .pagination > li:first-child > span {
            margin-left: 0;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px
        }

        .pagination > li:last-child > a, .pagination > li:last-child > span {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px
        }

        .pagination > li > a:focus, .pagination > li > a:hover, .pagination > li > span:focus, .pagination > li > span:hover {
            color: #23527c;
            background-color: #eee;
            border-color: #ddd
        }

        .pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
            z-index: 2;
            color: #fff;
            cursor: default;
            background-color: #337ab7;
            border-color: #337ab7
        }

        .pagination > .disabled > a, .pagination > .disabled > a:focus, .pagination > .disabled > a:hover, .pagination > .disabled > span, .pagination > .disabled > span:focus, .pagination > .disabled > span:hover {
            color: #777;
            cursor: not-allowed;
            background-color: #fff;
            border-color: #ddd
        }

        .pagination-lg > li > a, .pagination-lg > li > span {
            padding: 10px 16px;
            font-size: 18px
        }

        .pagination-lg > li:first-child > a, .pagination-lg > li:first-child > span {
            border-top-left-radius: 6px;
            border-bottom-left-radius: 6px
        }

        .pagination-lg > li:last-child > a, .pagination-lg > li:last-child > span {
            border-top-right-radius: 6px;
            border-bottom-right-radius: 6px
        }

        .pagination-sm > li > a, .pagination-sm > li > span {
            padding: 5px 10px;
            font-size: 12px
        }

        .pagination-sm > li:first-child > a, .pagination-sm > li:first-child > span {
            border-top-left-radius: 3px;
            border-bottom-left-radius: 3px
        }

        .pagination-sm > li:last-child > a, .pagination-sm > li:last-child > span {
            border-top-right-radius: 3px;
            border-bottom-right-radius: 3px
        }

        .pager {
            padding-left: 0;
            margin: 20px 0;
            text-align: center;
            list-style: none
        }

        .pager li {
            display: inline
        }

        .pager li > a, .pager li > span {
            display: inline-block;
            padding: 5px 14px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 15px
        }

        .pager li > a:focus, .pager li > a:hover {
            text-decoration: none;
            background-color: #eee
        }

        .pager .next > a, .pager .next > span {
            float: right
        }

        .pager .previous > a, .pager .previous > span {
            float: left
        }

        .pager .disabled > a, .pager .disabled > a:focus, .pager .disabled > a:hover, .pager .disabled > span {
            color: #777;
            cursor: not-allowed;
            background-color: #fff
        }

        .pagination > li > a,
        .pagination > li > span {
            border: 1px solid white;
        }

        .pagination > li.active > a {
            background: #f50057;
            color: #fff;
        }

        .pagination > li > a {
            background: white;
            color: #000;
        }

        .pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
            color: #fff;
            background-color: #000;
            border-color: #000;
        }

        .pagination > .active > span {
            background-color: #f50057;
            color: #fff;
            border-color: #fff;
        }

        .pagination > .disabled > span {
            border-color: #fff;
        }

        pre {
            white-space: pre-wrap;import javax.servlet.ServletRequest;
            word-wrap: break-word;
        }

        .progress-green .progress-bar {
            background-color: #f0231b;
        }

        .progress-green {
            background-color: #000;
        }

        .progress-green .progress-bar {
            background-color: #ff0a00;
        }

        .page-orange .ui-content-header {
            background-image: url(${pageContext.request.contextPath}/usercenter/images/headerimg.jpg);
            height: 200px;
        }

        .content-heading {
            font-weight: 300;
            color: #fff;
        }

        li a {
            color: #FFFFFF
        }
    </style>
</head>

<body class="page-orange">
<header class="header header-orange header-transparent header-waterfall ui-header affix-top">
    <ul class="nav nav-list pull-left">
        <div>
            <a data-toggle="menu" href="#ui_menu">
                <span class="icon icon-lg text-white">format_align_justify</span>
            </a>
        </div>
    </ul>
    <ul class="nav nav-list pull-right">
        <div class="dropdown margin-right">
            <a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
                <span class="access-hide">风花雪月</span>
                <span class="icon icon-cd margin-right">account_circle</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
                <li>
                    <a class="padding-right-lg waves-attach waves-effect" href="/user/"><span
                            class="icon icon-lg margin-right">account_box</span>用户中心</a>
                </li>
                <li>
                    <a class="padding-right-cd waves-attach waves-effect"
                       href="${pageContext.request.contextPath}/LogoutServlet"><span
                            class="icon icon-lg margin-right">exit_to_app</span>登出</a>
                </li>
            </ul>
        </div>
    </ul>
</header>
<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
    <div class="menu-scroll" style="background-image:url(${pageContext.request.contextPath}/usercenter/images/bg2.jpg);">
        <div class="menu-content">

            <a class="menu-logo" href="${pageContext.request.contextPath }/index.jsp"><i class="icon icon-lg">account_balance</i>&nbsp;Study
                Onine</a>
            <ul class="nav">
                <li>
                    <a class="waves-attach waves-effect" data-toggle="collapse" href="#ui_menu_me">我的</a>
                    <ul class="menu-collapse collapse in" id="ui_menu_me">
                        <li>
                            <a href="/user">
                                <i class="icon icon-lg">account_balance_wallet</i>&nbsp;用户中心
                            </a>
                        </li>
                        <%
                            User user=(User)request.getSession().getAttribute("user");
                            if(user.getUserstatus()==1){
                        %>
                        <li>
                            <a href="${pageContext.request.contextPath}/post/postedit.jsp">
                                <i class="icon icon-lg">create</i>&nbsp;发布帖子
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/ShowMyPostServlet">
                                <i class="icon icon-lg">library_books</i>&nbsp;我的帖子
                            </a>
                        </li>
                        <%
                            }else{
                        %>
                        <li>
                            <a href="${pageContext.request.contextPath}/post/postedit.jsp">
                                <i class="icon icon-lg">create</i>&nbsp;撰写笔记
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/ShowMyPostServlet">
                                <i class="icon icon-lg">library_books</i>&nbsp;我的笔记
                            </a>
                        </li>
                        <%

                            }
                        %>
                        <li>
                            <a href="${pageContext.request.contextPath}/ShowMyPostServlet">
                                <i class="icon icon-lg">star_rate</i>&nbsp;我的收藏
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/ShowMyPostServlet">
                                <i class="icon icon-lg">autorenew</i>&nbsp;我的关注
                            </a>
                        </li>
                    </ul>
                    <div style="height: 1px;background-color:white;margin-top: 4px"></div>
                    <a class="waves-attach waves-effect" data-toggle="collapse" href="#mysubject">我的课程</a>
                    <ul class="menu-collapse collapse in" id="mysubject">
                        <%
                            for (subject sb : (ArrayList<subject>) request.getSession().getAttribute("subject")
                            //for (subject sb : (ArrayList<subject>) request.getAttribute("subject")
                            ) {
                        %>
                        <li>
                            <a href="${pageContext.request.contextPath}/ShowSubjectServlet?subjectname=<%out.println(sb.getSubjectname());%>">
                                <i class="icon icon-lg">book</i>&nbsp;<%out.println(sb.getSubjectname());%>
                            </a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div style="opacity: 0.6;height:500%;background-color: white;background-image: url(${pageContext.request.contextPath}/usercenter/images/center.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size:100% 100%;-moz-background-size:100% 100%;">
    <div style="background:rgba(255,255,255,0.5);height: 100%">
        <div style="margin-top: 50px;"></div>
        <%
            if(request.getAttribute("MyPost")!=null){
        %>
                <h2 style="text-align: center">我的帖子</h2>
        <%
                for (Post p:(ArrayList<Post>)request.getAttribute("MyPost")
                     ) {
        %>
        <a href="${pageContext.request.contextPath}/ShowPostContent?pid=<%out.print(p.getPostid());%>">
            <div style="margin-left: 250px;margin-top:20px;height: 30px;box-shadow: 5px 5px 3px #888888;">
            <span>
            <i class="icon icon-lg">receipt</i><%out.print(p.getPosttitle());%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon icon-lg">book</i><%out.print(p.getSubject());%>
            </span>
                <span style="float: right;margin-right: 30px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon icon-lg">account_circle</i><%out.print(p.getUsername());%>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon icon-lg">visibility</i><%out.print(p.getLook_num());%>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(p.getPostdatetime());%>
            </span>
            </div>
        </a>
        <%
                }
            }
        %>
        <%
            if(request.getAttribute("SubjectPost")!=null){
        %>
            <h2 style="text-align: center"><%out.print((String)request.getAttribute("subjectname"));%></h2>
        <%
                for (Post p:(ArrayList<Post>)request.getAttribute("SubjectPost")
                ) {
        %>
        <a href="${pageContext.request.contextPath}/ShowPostContent?pid=<%out.print(p.getPostid());%>">
            <div style="margin-left: 250px;margin-top:20px;height: 30px;box-shadow: 5px 5px 3px #888888;">
            <span>
            <i class="icon icon-lg">receipt</i><%out.print(p.getPosttitle());%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon icon-lg">book</i><%out.print(p.getSubject());%>
            </span>
                <span style="float: right;margin-right: 30px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon icon-lg">account_circle</i><%out.print(p.getUsername());%>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon icon-lg">visibility</i><%out.print(p.getLook_num());%>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(p.getPostdatetime());%>
            </span>
            </div>
        </a>
        <%
                }
            }
        %>
    </div>
</div>
<script>alert(parseInt($('#ui_menu').get(0).offsetHeight));</script>
<footer class="ui-footer">
    <div class="container">
        <marquee>© Study Onine</marquee>
        <!-- js -->
        <script src="${pageContext.request.contextPath}/usercenter/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/usercenter/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/usercenter/js/gt.js"></script>
        <script src="${pageContext.request.contextPath}/usercenter/js/base.min.js"></script>
        <script src="${pageContext.request.contextPath}/usercenter/js/project.min.js"></script>
        <script src="${pageContext.request.contextPath}/usercenter/js/clipboard.min.js"></script>
        <script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="${pageContext.request.contextPath}/usercenter/js/canvas-nest.min.js"></script>
        <script src="${pageContext.request.contextPath}/usercenter/js/shake.js"></script>
    </div>
</footer>
</body>
</html>