<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostReturnDTO" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jsp_board.post.SearchVO" %>
<%@ page import="java.time.LocalDate" %>

<%
    SearchVO searchVO = new SearchVO(request);
%>
<script>
    const url = new URL(window.location)
    const params = new URLSearchParams(location.search)

    function search_by_query() {
        const query = document.getElementById("search_query").value
        params.set("query", query)
        url.search = params.toString()

        location.href = url.toString()
    }

    function search_by_date() {
        const start_day = document.getElementById("start_date").value
        const end_day = document.getElementById("end_date").value

        if(start_day !== '') {
            params.set("start_day", start_day)
        }
        if(end_day !== ''){
            params.set("end_day", end_day)
        }
        url.search = params.toString()
        location.href = url.toString()
    }
</script>
<style>
    #main {
        display: grid;
        column-gap: 25px;
        width: 100%;
        margin: 100px auto;
        border: 1px solid #ebebeb;
        box-shadow: 0 1px 20px 0 rgba(0,0,0,0.1);
        padding: 50px 50px 50px 20px;
    }
    #table_title {
        background: antiquewhite;
    }
    input {
        width: 200px;
    }
    button {
        width: 200px;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main">
        <input id="start_date" value="<%=searchVO.getStartDayValue()%>" type="date">
        <input id="end_date" value="<%=searchVO.getEndDayValue()%>" type="date">
        <button onclick="search_by_date()">검색</button>
        <input id="search_query" type="text" value="<%=searchVO.getSearchQueryValue()%>"/>
        <button onclick="search_by_query()">검색</button>
        <table>
            <tr id="table_title">
                <td>제목</td>
                <td>날짜</td>
                <td>글쓴이</td>
                <td>카테고리</td>
            </tr>
            <%
                PostDAO postDAO = new PostDAO();
                List<PostReturnDTO> posts = postDAO.postList(searchVO);
                for (PostReturnDTO post : posts) {
            %>

            <tr>
                <td><a href=""><%= post.getTitle()%></a></td>
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
