<%--
  Created by IntelliJ IDEA.
  User: choisemin
  Date: 2022/09/23
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="main">
        <span>
            <form method="post" action="/board/update">
            <p>비밀번호 확인</p>
            <input name="password">
            </form>
        </span>
    </div>
</body>
</html>
