<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!-- BootStrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="css/slideCard.css">
<!-- 스크립트 -->
<script type="text/javascript">
$(document).ready(function(){
	$(".card").click(function(){
		$(this).toggleClass("flipped");
	});
});
</script>

</head>
<body>

<div id="header">
	<%@include file="header/mainmenu.jsp" %>
</div>

<div class="section">
	<!-- 카드 개수 : input -->
	<input type="radio" name="slide" id="slide1" checked>
	<input type="radio" name="slide" id="slide2">
	<input type="radio" name="slide" id="slide3">

	<div class="slideBox">
		<ul class="slideList">
		
		<!-- 슬라이드 영역 -->
			<li>
				<!-- 이전 페이지로 이동한다.  -->
				<label for="slide3" class="left"></label>
					<div class="card">
						<div class="card-inner">
							<div class="card-front">1</div>
							<div class="card-back">Welcome QuizTIS!</div>
						</div>
					</div>
				<label for="slide2" class="right"></label>
			</li>
			
			<li>
				<!-- 이전 페이지로 이동한다.  -->
				<label for="slide1" class="left"></label>
					<div class="card">
						<div class="card-inner">
							<div class="card-front">2</div>
							<div class="card-back">Welcome QuizTIS!</div>
						</div>
					</div>
				<label for="slide3" class="right"></label>
			</li>
			
			<li>
				<!-- 이전 페이지로 이동한다.  -->
				<label for="slide2" class="left"></label>
					<div class="card">
						<div class="card-inner">
							<div class="card-front">3</div>
							<div class="card-back">Welcome QuizTIS!</div>
						</div>
					</div>
				<label for="slide1" class="right"></label>
			</li>
		<!-- 슬라이드 영역 종료 -->	
		</ul>
		
	</div>
</div><!-- section end -->

</body>
</html>