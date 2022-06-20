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
<link rel="stylesheet" href="../css/mainmenuHeader.css">
<link rel="stylesheet" href="../css/mainInsertCard.css">

</head>
<body>

	<!-- header -->
	<div id="header">
		<%@include file="../header/mainmenu.jsp" %>>
	</div>
	
	<!-- top-content -->
	<div id="top_content">
		<%@include file="../content/insertCardTopContent.jsp" %>
	</div>
	
	<!-- bottom-content -->
	<div id="bottom_content">
		<%@include file="../content/insertCardBottomContent.jsp" %>
	</div>
	
</body>
</html>