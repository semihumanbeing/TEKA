<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기술 면접 플래시 카드</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-color: #448811;
}

/* main.css */
#header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 80px;
	background-color: #cccccc;
}

#title {
	width: 13%;
	text-align: left;
	float: left;
	font-weight: bold;
	margin-left: 20px;
	margin-top: 0px;
}

#title>h1 {
	margin-top: 15px;
}

#content {
	padding-top: 80px;
	width: 55%;
	border: 1px solid black;
	margin-left: 0px;
	float: left;
}

#sub_content {
	padding-top: 80px;
	width: 35%;
	border: 1px solid black;
	margin-left: 0px;
	float: left;
	margin-top: 120px;
	margin-left: 50px;
}

/* main_menu.css */
#main_menu {
	list-style: none;
	width: 40%;
	float: left;
	padding-left: 0px;
}

#main_menu>li {
	display: inline-block;
	margin: 0 10px;
}

#main_menu li+a {
	width: 50%;
}

#main_menu>li>a {
	display: block;
	text-align: left;
	text-decoration: none;
	line-height: 50px;
	font-size: 15px;
	font-weight: 700;
	color: white;
}

/* content */
.tutorial {
	display: block;
	width: 160px;
	height: 30px;
	margin: auto;
}

/* card */
#card-container{
	background-color: white;
	width: 70%;
	height: 330px; 
	border-radius: 100px;
	margin: auto;
	margin-top: 50px;
}

.card {
	
	line-height: 270px;
	width: 300px;
	height: 270px;
	margin: 0 auto;
}

.card-inner {
	position: relative;
	width: 100%;
	height: 100%;
	text-align: center;
	transition: transform 0.2s;
	transform-style: preserve-3d; 
	
}

.card.flipped .card-inner {
	transform: rotateY(180deg);
}

.card-front, .card-back {
	position: absolute;
	top:30px;
	width: 100%;
	height: 100%;
	background-color: gray;
	border: 1px solid #333;
	box-sizing: border-box;
	backface-visibility: hidden;
}

.card-back {
	transform: rotateY(180deg);
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".card").click(function(){
		$(this).toggleClass("flipped");
	});
	
});

</script>
</head>
<body>
<div id="main-container">
	<div id="header">
	</div>
	
	<div id="content">
		<div id="card-container">
			<div class="card">
				<div class="card-inner">
					<div class="card-front">기술면접</div>
					<div class="card-back">취업을 위해 니가 공부해야 할 것이지~</div>
				</div>
			</div>
		</div><br>
		<input class="tutorial" type="button" value="나도 만들어보기"><br>
		<input class="tutorial" type="button" value="다른 학습세트보기">
	</div>
	
	<div id="sub_content">
		<div id="explain">
			<p style="font-size: 25px; font-weight: 700;">
				QuizTIS<br>
				Technical Interview Study<br>
				지금 바로 다른 사람의 학습법을 공유받으세요.<br>
			</p>
		</div><br>
		<input class="tutorial" type="button" value="로그인">
		<input class="tutorial" type="button" value="회원가입">
	</div>
</div>
</body>
</html>