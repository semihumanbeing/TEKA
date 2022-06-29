<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="../css/addCardRow.css">
<script type="text/javascript">
//div 추가	
	function addRow(){
		
		/* 추가할 div html코드 json배열 저장 */
		var jsonHTML = {
						row: "<div class=\"row\">",	
						delBtn: "<div><input type=\"button\" value=\"삭제\" id=\"delBtn\" onclick=\"delRow();\">",
						qArea: "<div class=\"tArea\"><div class=\"qArea\"><div class=\"cnt\"></div><p>질문</p><textarea COLS=35 ROWS=3 name=\"q_question\"></textarea></div>",
						aArea: "<div class=\"aArea\"><p>답변</p><textarea COLS=65 ROWS=8 name=\"q_answer\"></textarea></div></div>",
						closeDiv: "</div>"	
					  };
		
		var add = ''; //반복문 안에서 선언하면 누적 못함
		//json배열에 있는 요소 누적
		for(i in jsonHTML){
			add += jsonHTML[i];
		}
		//추가할 영역 지정
		$(".list").append(add);
	}
//div 삭제	
	//오류 : 마지막행 삭제버튼 클릭시, -1 행의 div 삭제
	function delRow(){ //.row의 this를 넘겨주니까 밑에서부터 삭제됨 -> this 뺴고 index를 구해서 해당 index삭제하도록 변경
		
		var index = $(".list .row").index();
		
		/* list내의 row클래스의 index와 동일하면 삭제 */
		$(".list .row").eq(index).remove();
		
	}//delRow() end
	
//학습세트추가	
	function addCardSet(f){
		
		var q_question = f.q_question.value.trim();	
		var q_answer   = f.q_answer.value.trim();	
		
		//같은 name으로 전송하게되면 서버에서 배열로 받을 수 있다.
		//대신, checkbox와 radio속성을 제외하고는 값이 비어있어도 넘어가기때문에 값의 유무에대한 확인 후에 서버로 전송한다.
		if(q_question==''){
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
		}
		
		f.action = "";		
		f.submit();
	}
</script>
</head>
<body>

<!-- 
할 일 
textarea 서버 엔터처리
-->

<div id="box">

<!-- list영역 행추가 -->
<form> 	
	<div class="list" style="display:table;">
		<div class="row">
			<!-- div 삭제 : this의 정보를 넘겨야 해당 행만 삭제가능 -->
			<div><!-- input img로 휴지통 이미지 삽입 예정 -->
				<input type="button" value="삭제" id="delBtn" onclick="delRow();">
			</div>
			
			<div class="tArea">
				<!-- 텍스트영역 추가 -->
				<div class="qArea">
					<div class="cnt"></div>
					<p>질문</p>
					<textarea COLS=35 ROWS=3 name="q_question"></textarea>
				</div>
				<div class="aArea">
					<p>답변</p>
					<textarea COLS=65 ROWS=8 name="q_answer"></textarea>
				</div>			
			</div>
			
		</div><!-- row end  -->
	</div>
<!-- list영역 종료 -->
	<!-- draggable -->
	<div id="insert_btn">
		<a href="#" onclick="addRow();">카드추가</a>
	</div>
	
	
	<div id="insert_btn">
		<a href="#" onclick="addCardSet(this.form);">학습세트 만들기</a>
	</div>
<form>

<!-- box종료 -->	
</div>

</body>
</html>