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

        form.submit()

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
        justify-content: flex-end;
    }
    #content {
        width: 600px;
        height: 400px;
        vertical-align: top;
    }

</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="main">
        <p>글 작성하기</p>
        <form id="post-form" method="post" action="/post/create/action">
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
            <input id="pw" type="password" name="password" minlength="4" maxlength="16" placeholder="비밀번호">
            <p id="pw-warn" style="color:red; padding: 0px; margin: 0px;"></p>
            <input id="pw-con" type="password" name="password_confirm" minlength="4" maxlength="16" placeholder="비밀번호 확인">
            </br>
            <input type="text" name="title" minlength="4" maxlength="100" placeholder="제목">
            </br>

            <textarea id="content" name="content" placeholder="내용"></textarea>
            <button type="button" onclick="pwd_chk()">글 작성</button>
        </form>
    </div>
</body>
</html>
