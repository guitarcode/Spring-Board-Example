<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostReturnDTO" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jsp_board.post.SearchVO" %>

<%
    PostDAO postDAO = new PostDAO();
    SearchVO searchVO = new SearchVO(request);
    int postCount =postDAO.getPostCount(searchVO);
%>
<script>
    const url = new URL(window.location)
    const params = new URLSearchParams(location.search)

    function search_by_query() {
        const query = document.getElementById("search_query").value
        params.set("query", query)
        params.delete("offset")
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
        params.delete("offset")
        url.search = params.toString()
        location.href = url.toString()
    }
</script>
<style>
    #main {
        display: flex;
        flex-direction: column;
        column-gap: 25px;
        width: 90%;
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
    span {
        display: flex;
        margin-top : 8px;
        margin-bottom : 8px;
    }
    .rightItem{
        margin-left: auto;
    }
    .page-btn-container{
        justify-content: center;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main">
        <p>
        <input id="start_date" value="<%=searchVO.getStartDayValue()%>" type="date">
        <input id="end_date" value="<%=searchVO.getEndDayValue()%>" type="date">
        <button onclick="search_by_date()">검색</button>
        </p>
        <p>
        <input id="search_query" type="text" value="<%=searchVO.getSearchQueryValue()%>"/>
        <button onclick="search_by_query()">검색</button>
        </p>
        <p> 총 <%=postCount%> 개의 게시물이 조회되었습니다. </p>
        <button class = "rightItem"><a href="/post/create">글 작성</a></button>
        <table>
            <tr id="table_title">
                <td>제목</td>
                <td>날짜</td>
                <td>글쓴이</td>
                <td>카테고리</td>
            </tr>
            <%
                List<PostReturnDTO> posts = postDAO.postList(searchVO);
                for (PostReturnDTO post : posts) {
            %>

            <tr>
                <td><a href="/post/detail?id=<%=post.getPostId()%>"><%= post.getTitle()%></a></td>
                <td><%= post.getCreatedAt()%></td>
                <td><%= post.getWriter()%></td>
                <td><%= post.getCategoryName()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <span class="page-btn-container">
            <button disabled="true">
                < 이전
            </button>
            <%
                int offsetStart = searchVO.getPage() - (searchVO.getPage() % 10) + 1;
                for (int i = offsetStart ; i < offsetStart + 10 && i <= (postCount / 10) + 1; i++) {

            %>
            <button>
                <%=i%>
            </button>
            <%
                }
            %>
            <button disabled="true">
                다음 >
            </button>
        </span>
    </div>
</body>
</html>
