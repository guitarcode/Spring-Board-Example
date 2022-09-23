<%--
  Created by IntelliJ IDEA.
  User: choisemin
  Date: 2022/09/23
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.jsp_board.post.PostUpdateDTO" %>
<%@ page import="java.time.LocalDateTime" %>
<%  request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    PostUpdateDTO post = PostUpdateDTO.builder()
            .postId(Integer.parseInt(request.getParameter("id")))
            .writer(request.getParameter("writer"))
            .title(request.getParameter("title"))
            .content(request.getParameter("content"))
            .modifiedAt(LocalDateTime.now())
            .build();
    PostDAO postDAO = PostDAO.getInstance();
    int success = postDAO.postUpdate(post);
    PrintWriter script = response.getWriter();
%>
<%
    if(success == 1) {
        script.println("<script>" +
                "location.href=window.location.origin+'/board/detail?id=" +
                request.getParameter("id") + "'" +
                "</script>'");
    }
    else {
        script.println("<script>" +
                "alert('비밀번호가 틀렸습니다.') \n"  +
                "window.history.back() \n" +
                "</script>");

%>
<p>게시글 작성에 실패했습니다.</p>
<%
    }
%>
</body>
</html>
