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
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style type="text/css">
#headContainer{
	width: 100%;
	height: 80px;
	background-color: pink;
	display: flex;
	justify-content: space-between;
}

#nav{
	width:14%;
	height: 100%;
	margin-left: 20px;
	cursor: pointer;
	display: flex;
	line-height: 80px;
	font-size: 30px;
}

html, body, hr{
	margin: 0;
	padding: 0;
}

.dropDownItem{
	display: none;
	position: absolute;
	z-index: 1;
	width: 300px;
	height: 165px;
	background-color: #efa4b1;
	top:80px;
}

.dropDownItem a {
	display: block;
	font-size: 20px;
	height: 40px;
	text-decoration: none;
	line-height: 40px;
	color: white;
}

.drop{
	display: block;
}

#dropDownContainer{
	margin: auto;
	width: 100%;
}

#dropDown{
	display: inline-block;
}

#dropDown:hover{
	border-radius: 5px;
	background-color: #f8dde2;
}

.dropDownItem a:hover {
	background-color: #f8dde2;
}

.icon{
	display:inline-block;
	margin-left: 5px;
	width: 25px;
	height: 25px;
}

#cancelBtn{
	width: 50px;
	height: 50px;
	border: 2px solid black;
	margin-top: 15px;
	margin-right: 50px;
	border-radius: 5px;
	background-color: #f8dde2;
	color: black;
	font-size: 20px;
}

#prg{
	font-size: 20px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#dropDown").click(function(){
		$(".dropDownItem").toggleClass("drop");
	});	
});
</script>

</head>
<body>
<div id="headContainer">
	<div id="nav">
		<div id="dropDownContainer">
			<span><i class="fas fa-clipboard"></i></span>
			<div id="dropDown">
				<span class="dropDownBtn">낱말카드</span>
				<div class="dropDownItem">
					<a href="#"><span class="icon"><i class="fas fa-school"></i></span>학습하기</a>
					<a href="#"><span class="icon"><i class="fas fa-bomb"></i></span>테스트</a>
					<a href="#"><span class="icon"><i class="fas fa-question"></i></span>?????</a>
					<hr>
					<a href="#"><span class="icon"><i class="fas fa-home"></i></span>홈</a>
				</div>
				<span><i class="fas fa-chevron-circle-down"></i></span>
			</div>
		</div>
	</div>
	
	<div id="prg" style="line-height: 40px;">
		<div id="status" style="text-align: center;"></div>
		<div id="title" style="text-align: center;">${list[0].c_title }</div>
	</div>
	<div id="cancel">
		<input id="cancelBtn" type="button" value="x" onclick="location.href='studyCardMain.do?c_idx=${param.c_idx}'">
	</div>
</div>
</body>
</html>