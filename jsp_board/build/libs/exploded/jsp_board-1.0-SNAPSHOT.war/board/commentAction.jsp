<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.example.jsp_board.post.CommentDAO" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comment" class="com.example.jsp_board.post.CommentCreateDTO" scope="page" />
<jsp:setProperty name="comment" property="content" />
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        CommentDAO commentDAO = new CommentDAO();
        if(!comment.getContent().equals("")){
            comment.setCreatedAt(LocalDateTime.now());
            comment.setPostId(Integer.parseInt(request.getParameter("id")));
            commentDAO.createComment(comment);
        }
        else{

        }
    %>
    <%
        PrintWriter script = response.getWriter();
        script.println("<script>" +
                "location.href=window.location.origin+'/board/detail?id=" +
                request.getParameter("id") + "'" +
                "</script>'");
    %>
</body>
</html>
