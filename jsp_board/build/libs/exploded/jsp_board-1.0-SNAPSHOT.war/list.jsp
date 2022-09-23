<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.PostReturnDTO" %>
<%@ page import="com.example.jsp_board.post.PostDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jsp_board.post.SearchVO" %>
<%@ page import="com.example.jsp_board.post.CategoryDAO" %>
<%@ page import="com.example.jsp_board.post.CategoryVO" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    PostDAO postDAO = PostDAO.getInstance();
    SearchVO searchVO = new SearchVO(request);
    int postCount =postDAO.getPostCount(searchVO);
%>
<script>
    function search() {
        const url = new URL(window.location)
        const params = new URLSearchParams(location.search)

        const query = document.getElementById("search_query").value
        const start_day = document.getElementById("start_date").value
        const end_day = document.getElementById("end_date").value
        const category = document.getElementById("category")
        const category_id = category.options[category.selectedIndex].value

        console.log(query)
        if(query !== ''){
            params.set("query", query)
        }
        else if(params.get("query")){
            params.delete("query")
        }
        if(start_day !== '') {
            params.set("start_day", start_day)
        }
        else if(params.get("start_day")){
            params.delete("start_day")
        }
        if(end_day !== ''){
            params.set("end_day", end_day)
        }
        else if(params.get("end_day")){
            params.delete("end_day")
        }
        if(category_id !== null && category_id !== "0"){
            params.set("category_id", category_id)
        }
        else if(params.get("category_id")){
            params.delete("category_id")
        }
        params.delete("page")
        url.search = params.toString()

        location.href = url.toString()
    }

    function pageChange(page) {
        const url = new URL(window.location)
        const params = new URLSearchParams(location.search)

        params.set("page", page)
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
        text-align: center;
    }
    input {
        width: 200px;
    }
    button {
        width: auto;
    }
    span {
        display: flex;
        margin-top : 8px;
        margin-bottom : 8px;
    }
    .rightContainer{
        margin-left: auto;
    }
    .page-btn-container{
        justify-content: center;
    }
    .search-container {
        border: black solid 1px;
        padding: 4px 16px;
        font-size: 20px;
    }
    .input-font-size {
        font-size: 16px;
    }
    .table-text-center{
        text-align: center;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main">
        <span class = "search-container">
            <p class="leftContainer">
            등록일
            <input id="start_date" class="input-font-size" value="<%=searchVO.getStartDayValue()%>" type="date"> ~
            <input id="end_date" class="input-font-size" value="<%=searchVO.getEndDayValue()%>" type="date">
            </p>
            <p class="rightContainer">
            <select id="category" name="categoryId" class="input-font-size" >
                <option value="0">카테고리 선택</option>
                <%
                    CategoryDAO categoryDAO = new CategoryDAO();
                    List<CategoryVO> categoryList = categoryDAO.categoryList();
                    String selected = "";
                    for (CategoryVO category : categoryList) {
                        if(searchVO.getCategoryId()!= null && category.getCategoryId() == searchVO.getCategoryId()) {
                            selected = "selected";
                        }
                        else{
                            selected="";
                        }
                %>
                <option value="<%= category.getCategoryId() %>" <%=selected%>><%= category.getName() %></option>
                <%
                    }
                %>
            </select>
            <input id="search_query" class="input-font-size" type="text" value="<%=searchVO.getSearchQueryValue()%>"
                   placeholder="검색어를 입력해 주세요. (제목 + 작성자 + 내용)" style="width: 400px"/>
            <button onclick="search()" class="input-font-size" >검색</button>
            </p>
        </span>

            <span class="inline-content">
        <p> 총 <%=postCount%> 개의 게시물이 조회되었습니다. </p>
        <p class="rightContainer"><a href="/board/write"><button >글 작성</button></a></p>
        </span>
        <table>
            <tr id="table_title">
                <td style="width: 8%">카테고리</td>
                <td style="width: 40%">제목</td>
                <td style="width: 8%">글쓴이</td>
                <td style="width: 6%;">조회수</td>
                <td style="width: 12%">등록 일시</td>
                <td style="width: 12%">수정 일시</td>
            </tr>
            <%
                List<PostReturnDTO> posts = postDAO.postList(searchVO);
                for (PostReturnDTO post : posts) {
            %>

            <tr>
                <td class="table-text-center"><%= post.getCategoryName()%></td>
                <td><a href="/board/detail?id=<%=post.getPostId()%>"><%= post.getTitle()%></a></td>
                <td class="table-text-center"><%= post.getWriter()%></td>
                <td class="table-text-center"><%=post.getHits()%></td>
                <td class="table-text-center"><%= post.getCreatedAt().format(DateTimeFormatter.ofPattern("yyyy.MM.dd H:mm"))%></td>
                <td class="table-text-center"><%=post.getModifiedAt()==null ? "-":post.getModifiedAt().format(DateTimeFormatter.ofPattern("yyyy.MM.dd H:mm"))%></td>
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
                for (int i = offsetStart ; i < offsetStart + 10 && i <= ((postCount - 1) / 10) + 1; i++) {

            %>
            <button onclick="pageChange(<%=i%>)">
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
