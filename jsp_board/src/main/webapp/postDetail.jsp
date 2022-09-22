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
<%@ page import="com.example.jsp_board.post.CommentReturnDTO" %>
<%@ page import="com.example.jsp_board.post.CommentDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    int postId = Integer.parseInt(request.getParameter("id"));
    CommentDAO commentDAO = new CommentDAO();
    List<CommentReturnDTO> comments = commentDAO.getComments(postId);
    PostDAO postDAO = new PostDAO();
    PostReturnDTO post = postDAO.postDetail(postId);
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
    span {
        padding-left: 8px;
    }
    #content{
        width: 85%;
        height: 60px;
    }
    .writer-date {
        display: inline-block;
    }
    .right-container {
        margin-bottom: 2px;
        float: right;
    }
    .left-container {
        margin-bottom: 2px;
        float: left;
    }
    .title {
        font-weight: bold;
        font-size : 24px;
        border-bottom: black solid 2px;
        padding-bottom: 4px;
    }
    .content {
        border: black solid 1px;
    }
    .comment-form {
        padding: 16px;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 0px;
        align-content: center;
    }
    .comment-container{
        display: flex;
        flex-direction: column;
        background: bisque;
    }
    .comment-text{
        margin: 4px;
    }
    .comment-span{
        margin-left: 16px;
        margin-right: 16px;
        margin-bottom: 12px;
        padding-bottom: 8px;
        border-bottom: black dashed 1px;
    }
    .created-time {
        font-size: 12px;
    }


</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main">
        <span class = "title">
        <pre class="left-container">[<%=post.getCategoryName()%>] </pre>
        <pre class="left-container"><%=post.getTitle()%></pre>
        </span>
        <span class="writer-date">
            <pre class="left-container">작성자: <%=post.getWriter()%></pre>
            <pre class="right-container">수정 일시 <%=post.getCreatedAt().toString()%></pre>
            <pre class="right-container">등록 일시 <%=post.getCreatedAt().toString()%>    </pre>
        </span>
        <span class = "content">
            <p><%=post.getContent()%></p>
        </span>
        <p>n개의 댓글이 있습니다.</p>
        <div class="comment-container">
            <form class= "comment-form" method="post" action="/board/detail/comment?id=<%=post.getPostId()%>">
                <input id="content" name="content" minlength="1" maxlength="400"></input>
                <input type="submit" class = "comment-btn">
            </form>
            <%
                for (CommentReturnDTO comment : comments) {
            %>
            <span class="comment-span">
                <p class="comment-text created-time"><%=comment.getCreatedAt().format(DateTimeFormatter.ofPattern("yyyy.MM.dd H:mm"))%></p>
                <p class="comment-text"><%=comment.getContent()%></p>
            </span>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
