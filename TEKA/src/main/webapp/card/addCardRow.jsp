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
						qArea: "<div class=\"tArea\"><div class=\"qArea\"><div class=\"cnt\"></div><p>질문</p><textarea COLS=35 ROWS=3 name=\"q_question\" class=\"form-control\"></textarea></div>",
						aArea: "<div class=\"aArea\"><p>답변</p><textarea COLS=65 ROWS=8 name=\"q_answer\" class=\"form-control\"></textarea></div></div>",
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
	function delRow(){ //.row의 this를 넘겨주니까 밑에서부터 삭제됨 -> this 빼고 index를 구해서 해당 index삭제하도록 변경
		
		var index = $(".list .row").index();
		
		/* list내의 row클래스의 index와 동일하면 삭제 */
		$(".list .row").eq(index).remove();
		
	}//delRow() end
</script>
</head>
<body>

<div id="box">

<!-- list영역 행추가 -->
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
					<textarea COLS=35 ROWS=3 name="q_question" class="form-control"></textarea>
				</div>
				<div class="aArea">
					<p>답변</p>
					<textarea COLS=65 ROWS=8 name="q_answer" class="form-control"></textarea>
				</div>			
			</div>
			
		</div><!-- row end  -->
	</div>
<!-- list영역 종료 -->
	<!-- draggable -->
	<div id="insert_btn">
		<!-- <a href="#" onclick="addRow();">카드추가</a> : href # -->
		<input type="button" value="카드추가" onclick="addRow();">
	</div>
	
	<div id="cardSet_btn">
		<!-- <a href="addCardSet(this.form);">학습세트 만들기</a> -->
		<input type="button" value="학습세트 만들기" onclick="addCardSet(this.form);">
	</div>

<!-- box종료 -->	
</div>

</body>
</html>