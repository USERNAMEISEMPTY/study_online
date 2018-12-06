<%@ page import="bean.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.postcomment" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 18-11-26
  Time: 下午6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<head>
    <title>Show Post</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js" ></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/kindeditor-simple.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.js"></script>
    <link href="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.css"  rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function(K) {
            var editor1 = K.create('textarea[name="content1"]', {
                cssPath : '${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.css',
                uploadJson : '${pageContext.request.contextPath }/Upload_json',
                fileManagerJson : '${pageContext.request.contextPath }/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                afterCreate : function() {
                    var self = this;
                    K.ctrl(document, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
</head>
<body style="background: url(${pageContext.request.contextPath}/images/spbg.png) repeat">
<%
    Post p =(Post) request.getAttribute("Post");
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Study Online</a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/usercenter/usercenter.jsp">用户中心</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }//ShowMyPostServlet">我的帖子</a>
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
        <hr style="color: black;border-top: 1px solid rgba(0, 0, 0);margin-bottom: 20px">
        <div style="margin: 0px 30px 0px 30px;padding-bottom: 30px;">
            <p>发布评论：</p>
            <div>
                <form name="example" method="post" action="${pageContext.request.contextPath}/addPostCommentsServlet">
                    <textarea name="content1" cols="100" rows="8" style="width:100%;height:200px;visibility:hidden;font-size:30;margin-bottom: 0px;"><%=htmlspecialchars(htmlData)%></textarea>
                    <input type="submit" name="button" style="width: 100%" value="发布评论" />
                    <input type="hidden" name="pid" value="<%out.print(p.getPostid());%>">
                </form>
            </div>
        </div>
        <hr style="color: black;border-top: 1px solid rgba(0, 0, 0);">
        <div style="margin: 0px 30px 0px 30px;padding-bottom: 30px;">
            <p>其他评论：</p>
            <%
                ArrayList<postcomment> pcs=(ArrayList<postcomment>)request.getAttribute("commments");
                int floor=0;
                for (postcomment c:pcs
                     ) {
            %>
            <div style="margin: 10px;position:relative;width: 100%;border: 1px black solid;background: #acdcff;">
                <div>&nbsp;&nbsp;#<%out.println(++floor);%></div>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;<%out.println(c.getUsername());%>
                </div>
                <div style="margin: 20px;width: 100%;">
                    <%out.println(c.getCommentcontent());%>
                </div>
                <div style="position: absolute;bottom: 0px;width:100%;text-align: right;"><%out.println(c.getCommentdatetime());%>&nbsp;&nbsp;&nbsp;</div>
            </div>
            <%
                }
            %>

        </div>
    </div>
</div>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>