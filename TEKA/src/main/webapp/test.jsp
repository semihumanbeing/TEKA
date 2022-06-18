<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuizTIS : 카드만들기</title>
<!-- BootStrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- css연결 -->
<link rel="stylesheet" href="css/test.css">
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
<!-- header -->
<div id="header">
	<%@include file="header/mainmenu.jsp" %>

	<div id="card_view" style="background-color: #222222;">
		<div id="text">
			<span style="color:white;">QuizTIS 학습세트를 직접 만들어보세요!</span><br><br>
			<span style="color:white;">카드를 클릭해보세요!</span><br>
		</div>

		<div class="card">
			<div class="card-inner">
				<div class="card-front">Click here!</div>
				<div class="card-back">Welcome QuizTIS!</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div><!-- card_view end -->
	
	
	<div id="subject_view">
		
		<div id="text">
			<span style="color:black;">하나. 원하는 주제별로 카테고리를 설정해요</span><br><br><br>
			
     		 <select multiple class="form-control" id="sel2">
		        <option>네트워크</option>
		        <option>운영체제</option>
		        <option>자료구조</option>
		        <option>알고리즘</option>
		        <option>Spring Framework</option>
		        <option>Java</option>
	     	 </select><br><br><br><br>
	     	 
			<span style="color:black;">둘. 카드를 작성해주세요!</span><br><br><br>
			
			<div id="text_area">
				<label for="sel2" style="color:black; font-size: 20px;">카드앞면</label>
					<textarea id="q_text" class="form-control"></textarea>
				<label for="sel2" style="color:black;  font-size: 20px;">카드뒷면</label>
					<textarea id="a_text" class="form-control"></textarea>
				<div id="btn_insert">
					<input type="button" value="카드만들기" class="btn btn-success navbar-btn navbar-left" onclick="click();">
				</div>
			</div>
			
			<div style="margin-top : 600px;">
				<span style="color:black; margin : auto;">셋. 카드를 클릭하면 뜻을 볼 수 있어요!</span>
			</div>
			
			<div id="card_ex">
				<div class="card">
					<div class="card-inner">
						<div class="card-front"></div>
						<div class="card-back"></div>
					</div>
				</div>
			</div>
			
		</div><!-- text end -->
		
	</div><!-- subject_view end -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</div><!-- header end -->

</body>
</html>