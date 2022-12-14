<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jsp_board.post.CategoryDAO" %>
<%@ page import="com.example.jsp_board.post.CategoryVO" %>
<%@ page import="java.util.List" %>
<script>
    function pwd_chk(){
        const form = document.getElementById("post-form")
        const pw = document.getElementById("pw").value
        const pw_con = document.getElementById("pw-con").value
        const pw_warn = document.getElementById("pw-warn")
        let regexPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{4,16}$/

        console.log(pw, pw_con)
        if(!(pw === pw_con)){
            pw_warn.innerText = "같은 비밀번호를 입력해야 합니다."
            return false;
        }
        else if(!regexPw.test(pw)) {
            pw_warn.innerText = "숫자, 영어, 특수문자를 포함해야 합니다."
            return false
        }

        return true
    }
</script>
<style>
    .main {
        display: grid;
        column-gap: 25px;
        width: 610px;
        margin: 100px auto;
        border: 1px solid #ebebeb;
        box-shadow: 0 1px 20px 0 rgba(0,0,0,0.1);
        padding: 50px 50px 50px 20px;
    }
    input, select, button,textarea{
        margin: 5px;
    }
    button{
        margin-left: auto;
    }
    #content {
        width: 90%;
        height: 400px;
        vertical-align: top;
    }
    table {
        width: 610px;
    }
    .table-title {
        background: bisque;
    }

    td {
        border-bottom: black solid 1px;
    }


</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="main">
        <h1>게시글 - 등록</h1>
        <form id="post-form" method="post" action="/board/write/action" onsubmit="return pwd_chk()">
            <table>
            <tr>
                <td class="table-title">카테고리<td>
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
                </td>
            </select>
            </tr>
            <tr>
                <td class="table-title">작성자</td>
                <td><input type="text" name="writer" minlength="3" maxlength="4" placeholder="작성자"></td>
            </tr>
            <tr>
                <td class="table-title">비밀번호</td>
                <td>
                    <input id="pw" type="password" name="password" minlength="4" maxlength="16" placeholder="비밀번호">
                    <input id="pw-con" type="password" name="passwordConfirm" minlength="4" maxlength="16" placeholder="비밀번호 확인">
                    <p id="pw-warn" style="color:red; padding-left: 8px; padding: 0px; margin: 0px; font-size: 10px"></p>
                </td>
            </tr>
            <tr>
                <td class="table-title">제목</td>
                <td><input type="text" name="title" minlength="4" maxlength="100" placeholder="제목"></td>
            </tr>
            <tr>
                <td class="table-title">내용</td>
                <td><textarea id="content" name="content" placeholder="내용"></textarea></td>
            </tr>
          </table>

        <input type="submit" value="작성" style="float: right"></button>
        </form>
    </div>
</body>
</html>
