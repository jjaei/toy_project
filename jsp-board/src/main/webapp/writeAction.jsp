<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>   <!-- 자바스크립트 문장을 작성하기 위함. -->
<% request.setCharacterEncoding("UTF-8"); %>
   <!-- 건너오는 모든 데이터를 UTF-8로 받기 위함. -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null) { 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");  // 로그인이 되지 않은 사람은 로그인 페이지로 이동하게 함.
			script.println("</script>");
		} else {
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){  // 사용자가 제목이나 글을 입력하지 않았을 경우
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력이 되지 않은 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if(result == -1) {  // 데이터베이스 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다..')");
					script.println("history.back()");
					// 이전 페이지로 사용자를 돌려보냄. (로그인 페이지)
					script.println("</script>");
				} else { 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");  
					// 게시글 작성에 성공했을 경우
					script.println("</script>");
				}
			}
		}
		
	%>
</body>
</html>