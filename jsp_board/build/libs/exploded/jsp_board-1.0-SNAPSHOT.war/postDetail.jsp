<%--
  Created by IntelliJ IDEA.
  User: choisemin
  Date: 2022/09/21
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostReturnDTO" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%
    PostDAO postDAO = new PostDAO();
    PostReturnDTO post = postDAO.postDetail(Integer.parseInt(request.getParameter("id")));
%>
<style>
    #main {
        display: flex;
        flex-direction: column;
        column-gap: 25px;
        width: 90%;
        margin: 100px auto;
        border: 1px solid #ebebeb;
        box-shadow: 0 1px 20px 0 rgba(0, 0, 0, 0.1);
        padding: 50px 50px 50px 20px;
    }
    #content{
        width: 80%;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main">
        <p>category:<%=post.getCategoryName()%></p>
        <br>
        <p><%=post.getTitle()%></p>
        <br>
        <p><%=post.getWriter()%></p>
        <br>

        <p><%=post.getContent()%></p>
        <br>
        <span>
            <p>n개의 댓글이 있습니다.</p>
            <form method="post" action="">
                <textarea id="content" name="content"></textarea>
            </form>
        </span>
    </div>
</body>
</html>
