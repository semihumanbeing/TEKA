<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuizTIS</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#box{
	
}

#mainmenu{
	height: 80px;
}
#content{
	margin: auto;
	width: 1000px;
	min-height: 700px;
	background-color: white;
}
#footer{
	padding: 10px;
	color: white;
	height: 200px;
	background-color: black;
	clear:both;
}
</style>
</head>
<body>
<div id="box">
<div id="mainmenu">
<%@ include file="mainmenu.jsp" %>
</div>
<div id="content">
<%@ include file="content.jsp" %>
</div>
<div id="footer">
foooooooooooooooooooooooooooooooooooooooooooooter
</div>
</div>
</body>
</html>
