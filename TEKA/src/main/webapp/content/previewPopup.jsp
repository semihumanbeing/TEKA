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
	margin-bottom : 100px;
	width :1350px;
	height:750px;
	overflow : auto;
	border : 3px solid black;
	display : none;
	position   : absolute;
	background-color : white;
	z-index : 100;
	position:fixed;
	top:150px;
	left:30px;
	box-shadow : rgba(0,0,0,0.7) 0 0 0 9999px, rgba(0,0,0,0.7) 2px 2px 2px 3px;
	border-radius: 10px;
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
	font-size: 20px;
	font-weight:500;
	color : gray;
}

.question, .q, .answer, .a{
	margin-top : 10px;
	margin-left : 12px;
	font-size:18px;
	float : left;
	width : 45%;
}

#m_nickname{
	font-size: 33px;
	text-align: left;
	font-weight:550;
	height : 100px;
	margin-bottom : 25px;
	margin-top : 60px;
	margin-left : 25px;
}

#btnArea{
	margin-bottom : 30px;
}

#hideBtn{
	cursor : pointer;
	text-decoration: none;
	font-size: 30px;
	color : gray;
	position : fixed;
	/* fixed는 뷰포인트로 위치지정 */
	right : 140px;
	top : 85px;
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

<!-- 팝업닫기버튼  -->
	<div id="btnArea">
		<!-- <input type="button" id="hideBtn" value="닫기" onclick="hidePopup();"> -->
		<a onclick="hidePopup();" id="hideBtn">X</a>
	</div>
	
<!-- 만든사람 -->
		<div id="m_nickname"></div>
		
		<div>
			<div class="q">
				<p class="qnaText">질문</p><br>
			</div>
			<div class="a">
				<p class="qnaText">답변</p><br>
			</div>
		</div>
<!-- 동적 요소 추가 -->
	<div class="res"></div>

	</div>
</div>
</body>
</html>