<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %> 
<%@ page import="bbs.BbsDAO" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null) {
			userID = (String)session.getAttribute("userID");
		}
		
		// 매개변수 및 기본셋팅		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");	
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
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
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
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
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<!-- 게시판에 글 목록들이 홀수와 짝수가 번갈아가며 색상이 변경됨. -->
			<thead>
				<tr>
					<th colspan="3"style="background-color: #eeeeee; text-align: center;">게시판 글 보기 양식</th>
					<!-- 2개의 열을 사용할 수 있도록 colspan 사용 -->
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;")
							.replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%= bbs.getUserID() %></td>
				</tr>
				<tr>
					<td>작성일자</td>  <!-- 글이 작성된 시간이므로 bbs 페이지에서 그대로 복사해옴. -->
					<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) 
							+ bbs.getBbsDate().substring(11,13) + "시"
							+ bbs.getBbsDate().substring(14,16) + "분" %></td>
				</tr>
				<tr>
					<td>내용</td>
				<td colspan="2" style="min-height: 200px; text-align: left">
					<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;")
					.replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
			</tbody>
		</table> 
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			
			<!-- 해당 글의 작성자가 본인이라면 해당 글을 수정, 삭제할 수 있도록 함. -->
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>		
		</div>
	</div>
	<script src="//code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>