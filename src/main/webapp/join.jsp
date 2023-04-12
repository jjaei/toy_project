<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
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
				<li><a href="bbs.jsp">게시판</a></li>
				<!-- 메인과 게시판으로 이동 -->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class=dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<sapn class="caret"></sapn></a>
						<!-- 임시주소링크 #을 기재함. -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a><li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center;">회원가입 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
				</div>
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active"> 
						<!-- active는 기본적으로 선택이 된 것 -->
							<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자 
						</label>
						<label class="btn btn-primary"> 
							<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자 
						</label>
					</div>
				</div>
					<div class="form-group">
					<input type="email" class="form-control" placeholder="아매알" name="userEmail" maxlength="20">
					</div>
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
			</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="//code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>