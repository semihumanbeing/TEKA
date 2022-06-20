<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#searchbar{
margin-left: 15%;
}
#makebtn{
margin-left: 1%;
}

#bar{
width: 100%;
padding-top: 15px;
height: 80px;
}
</style>
</head>
<body>
	<nav id="bar" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
		
			<div class="navbar-header">
				<a class="navbar-brand" href="../card/main.do" style="font-size: x-large; font-weight: bolder;">QuizTIS</a>
			</div>
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="../card/main.do">홈페이지</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">주제 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">운영체제</a></li>
						<li><a href="#">네트워크</a></li>
						<li><a href="#">알고리즘</a></li>
						<li><a href="#">자료구조</a></li>
						<li><a href="#">Java</a></li>
						<li><a href="#">Spring</a></li>
					</ul>
				<li><a href="../card/list.do">모든 학습세트</a></li>
				<li><a href="#">내 학습세트</a></li>
			</ul>
			
			<button id="makebtn" class="btn btn-success navbar-btn navbar-left">만들기</button>
			
			<form id="searchbar" class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="카드 찾기">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
			
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${empty user }">
					<li><a href="../member/signUpForm.do"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
					<li><a href="../member/loginForm.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
				</c:if>
				<c:if test="${!empty user }">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>${user.m_nickname }님</a></li>
					<li><a href="../member/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
				</c:if>
			</ul>
			
		</div>
	</nav>
</body>
</html>