<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null) {
			userID = (String)session.getAttribute("userID");
		}
	%>
	<!-- 네비게이션 구현(바) -->
	<nav class="navbar navbar-default"> <!-- 네비게이션 -->
		<div class="navbar-header"> <!-- 네이게이션 상단 부분 -->
			<!-- 네비게이션 상단 박스 영역 -->
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">  <!-- 모바일 상태에서 오른쪽에 메뉴가 나옴. -->
			
			<!-- 오른쪽 메뉴 바에서 선 3개 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav"> <!-- 네비게이션 바의 메뉴 -->
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<!-- 메인과 게시판으로 이동 -->
			</ul>
			<%
				if(userID == null) {
			%>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class=dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<!-- 임시주소링크 #을 기재함. -->
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a><li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>		
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class=dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
						<!-- 임시주소링크 #을 기재함. -->
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>				
			<%		
				}
			%>
		</div>
	</nav>
	<script src="//code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>