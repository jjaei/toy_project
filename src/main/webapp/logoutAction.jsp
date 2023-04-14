<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>   <!-- 자바스크립트 문장을 작성하기 위함. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		session.invalidate();  
		// 해당 페이지에 접속한 회원은 세션을 빼앗기게 된다.
	%>
	
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>