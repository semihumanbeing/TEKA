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
<link rel="stylesheet" href="../css/addCardRow.css">
<link rel="stylesheet" href="../css/subjectSelect.css">
<!-- 자바스크립트 -->
<script type="text/javascript">

//학습세트추가 (include되어있기때문에 같은 파일임)
	function addCardSet(f){
		
		var c_title    = f.c_title.value.trim(); //trim() : 좌우 공백만 제거
		var c_content  = f.c_content.value.trim();
		var q_question = f.q_question.value.trim();	
		var q_answer   = f.q_answer.value.trim();
		var s_idx      = f.s_idx.value; //checked속성 -> 선택 안 되는 경우는 없음
		
		if(c_title==''){
			alert('학습세트 제목을 입력해주세요.');
			f.c_title.value='';
			f.c_title.focus();
			return;
		}
		if(c_content==''){
			alert('학습세트 소개를 입력해주세요.');
			f.c_content.value='';
			f.c_content.focus();
			return;
		}
		//같은 name으로 전송하게되면 서버에서 배열로 받을 수 있다.
		//대신, checkbox와 radio속성을 제외하고는 값이 비어있어도 넘어가기때문에 값의 유무에대한 확인 후에 서버로 전송한다.
		
		//오류수정예정 : 주석 해제하면 서버 전송 전에 return
		/* if(q_question==''){
			alert('질문을 입력해주세요.');
			f.q_question.value='';
			f.q_question.focus();
			return;
		}
		if(q_answer==''){
			alert('답변을 입력해주세요.');
			f.q_answer.value='';
			f.q_answer.focus();
			return;
		} */
		
		//f.method = "POST";
		f.action = "insertCard.do";		
		f.submit();
	}
</script>
</head>
<body>
<!-- header -->
	<div id="header">
		<%@include file="../header/mainmenu.jsp" %>>
	</div>
<form>	
<input type="hidden" name="m_idx" value="${user.m_idx}">
<!-- 주제, 카드제목, 카드소개글 -->
	<div id="choose" style="position: fixed;">
		<!-- 주제선택 -->
		<div id="subjectSelect" class="radio">
			<p>학습세트 주제선택</p>
			<!-- 주제선택 라디오버튼(단일선택) : 체크된 항목 전송-->
			<label for="1"><input type="radio" name="s_idx" value="1" id="1" checked>운영체제</label><br>
			<label for="2"><input type="radio" name="s_idx" value="2" id="2">네트워크</label><br>
			<label for="3"><input type="radio" name="s_idx" value="3" id="3">알고리즘</label><br>
			<label for="4"><input type="radio" name="s_idx" value="4" id="4">자료구조</label><br>
			<label for="5"><input type="radio" name="s_idx" value="5" id="5">자바</label><br>
			<label for="6"><input type="radio" name="s_idx" value="6" id="6">스프링</label><br>
		</div>
		<!-- 카드제목  -->
		<div id="cardTitle"  class="form-group">
		  <label for="title"><p>내 학습세트 제목</p></label>
	      <textarea class="form-control" rows="5" id="title" name="c_title"></textarea>
		</div>
		<!-- 카드소개글  -->
		<div id="cardInfo">
		  <label for="info"><p>내 학습세트 소개</p></label>
	      <textarea class="form-control" rows="10" id="info" name="c_content"></textarea>
		</div>
	</div>
	
<!-- 카드추가 -->
	<div id="insertCard" style="float:right; width:70%; height:1000px; margin-top:50px;">
		<%@include file="addCardRow.jsp"%>
	</div>
<form>	
	
</body>
</html>