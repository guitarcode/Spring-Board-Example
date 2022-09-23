<%--
  Created by IntelliJ IDEA.
  User: choisemin
  Date: 2022/09/18
  Time: 1:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.jsp_board.post.PostCreateDTO" %>
<%@ page import="java.time.LocalDateTime" %>
<%  request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        PostCreateDTO post = PostCreateDTO.builder()
                .categoryId(Integer.parseInt(request.getParameter("categoryId")))
                .writer(request.getParameter("writer"))
                .title(request.getParameter("title"))
                .content(request.getParameter("content"))
                .password(request.getParameter("password"))
                .passwordConfirm(request.getParameter("passwordConfirm"))
                .createdAt(LocalDateTime.now())
                .build();
        PostDAO postDao = PostDAO.getInstance();
        boolean success = postDao.createPost(post);
        PrintWriter script = response.getWriter();
    %>
    <%
        if(success) {
            script.println("<script>" +
                    "location.href=window.location.origin+'/board/list'" +
                    "</script>'");
        }
        else {
            script.println("<script>" +
                    "alert('유효성 검사 실패') \n"  +
                    "window.history.back() \n" +
                    "</script>");

    %>
    <p>게시글 작성에 실패했습니다.</p>
    <%
        }
    %>
</body>
</html>
