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
	margin-top : 50px;
	margin-bottom : 100px;
	width :600px;
	height:800px;
	border : 3px solid black;
	display : none;
	position   : absolute;
	background-color : white;
	z-index : 100;
	position:fixed;
	top:150px;
	left:30px;
	box-shadow : rgba(0,0,0,0.7) 0 0 0 9999px, rgba(0,0,0,0.7) 2px 2px 3px 3px;
	overflow:auto;
}

#container{
	margin-left:8px;
	font-family: 윤고딕700;
}

#preTitle{
	margin-top:30px;
	font-size: 30px;
	height : 80px;
}

.qnaText{
	font-size: 25px;
	font-weight:550;
}

.question{
	margin-top : 10px;
	font-size:18px;
	
}

.answer{
	font-size:18px;
}

#madeBy{
	font-size: 15px;
	text-align: right;
	margin-right : 10px;
	font-weight:550;
}

#btnArea{
	text-align:center;
	margin-top : 10px;
	margin-bottom : 30px;
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

<div id="container">
<!-- 카드제목 -->	
	<div id="preTitle">
		<p>제목: ${card.c_title}</p>
	</div>

<c:forEach var="pre" items="${previewList}" begin="1" end="3">
	
	
		<div class="question">
			<p class="qnaText">질문</p>
			${pre.q_question}
			<hr><br>
		</div>
	
		<div class="answer">
			<p class="qnaText">답변</p>
			${pre.q_answer}
			<hr><br>
		</div>
</c:forEach>	
<!-- 만든사람 user.m_nickname -->
		<div id="madeBy">
			<p>made by ${card.m_nickname}</p>
		</div>
<!-- 팝업닫기버튼  -->
	<div id="btnArea">
		<input type="button" id="hideBtn" value="닫기" onclick="hidePopup();">
	</div>
	</div>
</div>
</body>
</html>