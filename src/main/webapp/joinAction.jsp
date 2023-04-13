<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>   <!-- 자바스크립트 문장을 작성하기 위함. -->
<% request.setCharacterEncoding("UTF-8"); %>
   <!-- 건너오는 모든 데이터를 UTF-8로 받기 위함. -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<!-- 로그인페이지에서 넘겨준 userId를 받아 한 명의 사용자 userId에 넣어줌. -->
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
		 || user.getUserGender() == null || user.getUserEmail() == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 되지 않은 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1) {  // 이미 존재하는 아이디일 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 사용 중인 아이디입니다.')");
				script.println("history.back()");
				// 이전 페이지로 사용자를 돌려보냄. (로그인 페이지)
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");  
				// 회원가입에 성공하면 메인페이지로 이동
				script.println("</script>");
			}
		}
	%>
</body>
</html>