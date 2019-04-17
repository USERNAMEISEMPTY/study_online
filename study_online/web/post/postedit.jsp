<%@ page import="bean.subject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<html>
<head>
    <meta charset="utf-8" />
    <title>Post Edit</title>
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
<body style="background-color: #9a9a9a">
<%=htmlData%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <a class="navbar-brand" href="#">Study Online</a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">用户中心</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">我的帖子</a>
        </li>
    </ul>
</nav>
<div style="background-color: #9a9a9a;height:1180px;width:70%;margin: 48px auto;">
    <form name="example" method="post" action="${pageContext.request.contextPath}/PostSubmitServlet">
        <input type="text" style="width: 100%;height:40px;margin-top: 10px;" placeholder="文章标题" name="posttitle">
        <textarea name="content1" cols="100" rows="8" style="width:100%;height:1100px;visibility:hidden;margin-bottom: 0px;"><%=htmlspecialchars(htmlData)%></textarea>
        <div style="background-color: white;color: #bd2130;">&nbsp;请选择课程：</div>
        <div class="form-group" style="margin-bottom: 0px;">
            <select class="form-control" name="subject">
                <%
                    for (subject sb : (ArrayList<subject>) request.getSession().getAttribute("subject")
                        //for (subject sb : (ArrayList<subject>) request.getAttribute("subject")
                    ) {
                %>
                     <option>
                             <%out.println(sb.getSubjectname());%>
                     </option>
                <%
                    }
                %>
            </select>
        </div>
        <input type="submit" name="button" value="发布帖子" style="width: 100%;height:40px;">
    </form>
</div>
<script type="text/javascript">

    prettyPrint();

</script>
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