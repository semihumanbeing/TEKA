<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-theme="dark">
<head>
<meta charset="UTF-8">
<title>QuizTis 카드만들기</title>

<!-- 부트스트랩 라이브러리등록 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- css파일 연결 -->
<link rel="stylesheet" href="css/mainmenu_header.css">
<link rel="stylesheet" href="css/main_insert_card.css">
<link rel="stylesheet" href="css/insert_card_top_content.css">
<link rel="stylesheet" href="css/insert_card_bottom_content.css">

</head>
<body>

	<!-- header -->
	<div id="header">
		<%@include file="header/mainmenu.jsp" %>>
	</div>
	
	<!-- top-content -->
	<div id="top_content">
		<%@include file="content/insert_card_top_content.jsp" %>
	</div>
	
	<!-- content2 -->
	<div id="bottom_content">
		<%@include file="content/insert_card_bottom_content.jsp" %>
	</div>
	

</body>
</html>