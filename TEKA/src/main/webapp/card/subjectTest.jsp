<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 라이브러리등록 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="../css/subjectSelect.css">
</head>
<body>

<!-- 주제, 카드제목, 카드소개글 -->
	
	<div id="choose">
		<!-- 주제선택 -->
		<div id="subjectSelect" class="radio">
			
			<p>학습세트 주제선택</p>
			<!-- 주제선택 라디오버튼(단일선택) : 체크된 항목 전송-->
			<label for="1"><input type="radio" name="s_idx" id="1" chekced>운영체제</label><br>
			<label for="2"><input type="radio" name="s_idx" id="2">네트워크</label><br>
			<label for="3"><input type="radio" name="s_idx" id="3">알고리즘</label><br>
			<label for="4"><input type="radio" name="s_idx" id="4">자료구조</label><br>
			<label for="5"><input type="radio" name="s_idx" id="5">자바</label><br>
			<label for="6"><input type="radio" name="s_idx" id="6">스프링</label><br>
		</div>
		
		<!-- 카드제목  -->
		<div id="cardTitle"  class="form-group">
		  <label for="title"><p>내 학습세트 제목</p></label>
	      <textarea class="form-control" rows="5" id="title"></textarea>
		</div>
		
		<!-- 카드소개글  -->
		<div id="cardInfo">
		  <label for="info"><p>내 학습세트 소개</p></label>
	      <textarea class="form-control" rows="10" id="info"></textarea>
		</div>
		
	</div>
	
	<div style="float:left; width:70%; height:1000px;">
		<h1>카드추가영역</h1>
	</div>

</body>
</html>