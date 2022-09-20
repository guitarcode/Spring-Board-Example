<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostReturnDTO" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jsp_board.post.SearchVO" %>

<style>
    #main {
        display: grid;
        column-gap: 25px;
        width: 610px;
        margin: 100px auto;
        border: 1px solid #ebebeb;
        box-shadow: 0 1px 20px 0 rgba(0,0,0,0.1);
        padding: 50px 50px 50px 20px;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main">
        <table>
            <tr>
                <td>제목</td>
                <td>날짜</td>
                <td>글쓴이</td>
                <td>카테고리</td>
            </tr>
            <%
                PostDAO postDAO = new PostDAO();
                SearchVO searchVO = SearchVO.builder()
                        .searchQuery("제목")
                        .build();
                System.out.println(searchVO.getSearchQuery());
                System.out.println(searchVO.getOffset());
                System.out.println(searchVO.getEndDate());
                System.out.println(searchVO.getStartDate());
                List<PostReturnDTO> posts = postDAO.postList(searchVO);
                for (PostReturnDTO post : posts) {
            %>

            <tr>
                <td><%= post.getTitle()%></td>
                <td><%= post.getCreatedAt()%></td>
                <td><%= post.getWriter()%></td>
                <td><%= post.getCategoryId()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
