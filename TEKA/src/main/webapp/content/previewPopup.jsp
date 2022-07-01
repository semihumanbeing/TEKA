<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드세트팝업창</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	
#popupBox{
	margin : auto;
	width : 500px;
	min-height:600px;
	border : 3px solid black;
	display : none;
	position   : absolute;
	background-color : white;
	
	
	/*  background: rgba(0, 0, 0, 0.7);
	 height: 100%;
	 background-position: center;
	 background-repeat: no-repeat;
	 background-size: cover;
	 background-blend-mode: darken; */
	/*  -webkit-backface-visibility: hidden; */
}	

</style>

<script type="text/javascript">

	function hidePopup(){
		
		$("#popupBox").hide();
	}	
	
	//윈도우 중앙배치
	function centerBox(){
		
		var wWidth  = $(window).width();
		var wHeight = $(window).height();
		
		var pWidth  = $("#popupBox").width();
		var pHeight = $("#popupBox").height();
		
		var left = (wWidth/2) - (pWidth/2);
		var top  = (wHeight/2) - (pHeight/2);
		
		$("#popupBox").css({"left" : left, "top" : top});
	}
	
	
</script>

</head>
<body>


<div id="popupBox">
	
<!-- 카드제목 -->	
	<div id="title">
		<p>카드제목</p>
	</div>
	

<c:forEach var="vo" items="${list}" begin="1" end="3">
	<div id="question">
		<hr>
			<p>질문<br>
			${vo.q_question}
			</p>
		<hr>
		<br>
		<p>답변<br>
		${vo.q_answer}
		</p>
	</div>
</c:forEach>

<!-- 만든사람 user.m_nickname -->
	<div id="made">
		<p>made by ${user.m_nickname}</p>
	</div>


<!-- 팝업닫기버튼  -->
	<div>
		<input type="button" id="hideBtn" value="닫기" onclick="hidePopup();">
	</div>
</div>

</body>
</html>