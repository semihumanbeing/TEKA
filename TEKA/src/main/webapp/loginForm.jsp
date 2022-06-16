<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- BootStrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.mainHeader {
	color: #9a3dff;
	font-weight: bold;
	font-size: 18px;
}


h1{
  margin: 0px;
}
p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;/*글자간격 */
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
	margin-top: -15px;
}

a {
	
	font-size: 14px;
	text-decoration: none;
}

#loginBtn {
	border-radius: 20px;
	border: 1px solid #9a3dff;
	background-color: #9a3dff;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
}
.social{
    color: #9a3dff;
}



#loginForm {
	background-color: #FFFFFF;
	display: flex;				/* element배치 방법 */
	align-items: center;		/* flex container의 자식들 가운데 정렬 */
	justify-content: center;	/* flex container의 가운데에 정렬 */
	flex-direction: column;		/* 메인축을 세로 방향으로 정렬 */
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

#loginForm > input {
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
	margin-top: 100px;
}
.formContainer {
	position: absolute;
	top: 0;
	height: 100%;
}

.logInContainer {
	left: 0;
	width: 50%;
	z-index: 2;
}
.overlayContainer {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
}


.overlay {
	background: #c2b0da;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
}

.overlayPanel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
}


.overlayRight {
	right: 0;
}

.socialContainer {
	margin: 50px 0;
}

.socialContainer a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		setTimeout(showMessage, 100);
	});
	
	function showMessage(){
		if("${param.reason eq 'fail_id'}" == "true"){
			alert('아이디가 틀렸습니다.');
			return;
		}
		
		if("${param.reason eq 'fail_pwd'}" == "true"){
			alert('비밀번호가 틀렸습니다.');
			return;
		}
	}

	function send(f){
		var m_id  = $("#id").val().trim();
		var m_pwd = $("#pwd").val().trim();
		
		if(m_id == ''){
			alert('아이디를 입력하세요.');
			$("#id").val('');
			$("#id").focus();
			return;
		}
		
		//비밀번호는 정규식 추가해야 할 것 같음
		if(m_pwd == ''){
			alert('비밀번호를 입력하세요.');
			$("#pwd").val('');
			$("#pwd").focus();
			return;
		}
		
		f.action="login.do";
		
		f.submit();
		
	}
</script>
</head>
<body>
	<div><%@include file="header/mainmenu.jsp" %></div>
	<div class="container" id="container">
		<div class="formContainer logInContainer">
			<form id="loginForm" action="#">
				<div class="mainHeader">
					<h1>Sign-in</h1>
				</div>
				<div class="socialContainer">
					<a href="#" class="social"><i class="fa fa-facebook fa-2x"></i></a>
					<a href="#" class="social"><i class="fa fa-google fa-2x"></i></a>
				</div>
				<span>or use your account</span> 
				<input type="text"     id="id"  name="m_id"    value="${param.m_id }" placeholder="id" /> 
				<input type="password" id="pwd" name="m_pwd"   placeholder="Password" /> 
				<a href="#">Forgot your password?</a>
				<input id="loginBtn" type="button" value="Sign In" onclick="send(this.form);" />
			</form>
		</div>
		<div class="overlayContainer">
			<div class="overlay">
				<div class="overlayPanel overlayRight">
					<h1>Welcome Back!</h1>
					<p>Study Hard. And then pass the Technical Interview. Let's Go NeKaLiCuBaeDangTo!</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>