<%--
  Created by IntelliJ IDEA.
  User: choisemin
  Date: 2022/09/18
  Time: 12:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.CategoryDAO" %>
<%@ page import="com.example.jsp_board.post.CategoryVO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="writeAction.jsp">
        <select name="categoryId">
            <%
                CategoryDAO categoryDAO = new CategoryDAO();
                List<CategoryVO> categoryList = categoryDAO.categoryList();
                for (CategoryVO category : categoryList) {
            %>
            <option value="<%= category.getCategoryId() %>"><%= category.getName() %></option>
            <%
                }
            %>
        </select>
        </br>
        <input type="text" name="writer" minlength="3" maxlength="4" placeholder="작성자">
        </br>
        <input type="password" name="password" maxlength="16" placeholder="비밀번호">
<%--        <input type="password" name="password-confirm" placeholder="비밀번호 확인">--%>
        </br>
        <input type="text" name="title" minlength="4" maxlength="100" placeholder="제목">
        </br>

        <input type="text" name="content" placeholder="내용" >
        <input type="submit" value="작성">
    </form>
</body>
</html>
