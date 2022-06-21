<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 스크립트 -->
<script type="text/javascript">

	function card_insert(){
		
		var select = $("select").val();
		var q_text = $("#q_text").val().trim();
		var a_text = $("#a_text").val().trim();
		
		if(select==''){
			alert('주제를 선택하세요.');
			$("#select").val('');
			$("#select").focus();
			return;
		}
		
		if(q_text==''){
			alert('질문을 입력하세요.');
			$("#q_text").val('');
			$("#q_text").focus();
			return;
		}
		
		if(a_text==''){
			alert('답변을 입력하세요.');
			$("#a_text").val('');
			$("#a_text").focus();
			return;
		}
	}//card_insert() end
</script>
<!-- 스크립트 종료 -->
</head>
<body>

<div class="panel panel-default">
  <div class="panel-heading">카드추가</div>
</div>

<div id="box">
	<div id="subject_area">
		<label for="sel2">카드주제</label>
		<select id="subject" multiple class="form-control">
			<option value="네트워크">네트워크</option>
			<option value="운영체제">운영체제</option>
			<option value="자료구조">자료구조</option>
			<option value="알고리즘">알고리즘</option>
			<option value="스프링">스프링</option>
			<option value="자바">자바</option>
		</select>	
	</div>
	
	<div id="text_area">
		<label for="sel2">질문</label>
			<textarea id="q_text" class="form-control"></textarea>
		<label for="sel2">답변</label>
			<textarea id="a_text" class="form-control"></textarea>
		
		<div id="btn_insert">
			<input type="button" value="카드추가" class="btn btn-success navbar-btn navbar-left" onclick="card_insert();">
		</div>
	</div>
	
	<!-- 부유속성해제 -->
	<div style="clear:both;"></div>
</div>


</body>
</html>