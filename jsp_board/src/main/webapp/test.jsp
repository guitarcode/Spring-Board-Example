<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학생 정보 저장 완료</title>
</head>
<body>
<h1>학생 정보 저장 완료</h1>
<%
    // mariaDB 연결
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board_study?allowPublicKeyRetrieval=true","root","chltpals1!");
    System.out.println(conn + "<-- conn");

    // 쿼리
    PreparedStatement stmt = conn.prepareStatement("select * from con_test");
    System.out.println(stmt + "<-- stmt");

    // 쿼리 실행
    ResultSet rs = stmt.executeQuery();

    %>
    <table border="1">
        <tr>
            <td>코드</td>
            <td>내용</td>
        </tr>

        <%
            while(rs.next()){
        %>
        <tr>
            <td><%=rs.getString("test_id") %></td>
            <td><%=rs.getString("name") %></td>
        </tr>

    <%
        }
    %>
</table>
</body>
</html>