<%--
  Created by IntelliJ IDEA.
  User: choisemin
  Date: 2022/09/18
  Time: 1:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="post" class="com.example.jsp_board.post.PostCreateDTO" scope="page" />
<jsp:setProperty name="post" property="categoryId" />
<jsp:setProperty name="post" property="writer" />
<jsp:setProperty name="post" property="title" />
<jsp:setProperty name="post" property="content" />
<jsp:setProperty name="post" property="password" />

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%= post.getCategoryId() %>
    <%= post.getWriter() %>
    <%= post.getContent()%>
    <%
        PostDAO postDao = new PostDAO();
        postDao.createPost(post);
    %>
</body>
</html>
