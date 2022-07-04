<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function study(c_idx){
	alert(c_idx + "번 카드를 학습합니다.");
	location.href="../studyCard/studyCardMain.do?c_idx="+c_idx;
	
}


</script>
<style type="text/css">
.myCardContainer {
	margin: auto;
	width: 500px;
	height: 300px;
	border: 2px solid navy;
	border-radius: 10px;
 	box-shadow: 1px 1px 4px purple;
}

.myCardTitle{
	border: 1px solid black;
	font-size: 30px;
	font-weight: 700;
}

.myCardSubject{
	font-size: 20px;
	display: inline-block;;
	width: 20%;
}

.myCardWord{
	display: inline-block;;
	text-align:center;
	width: 55%;
}

#grid_container{
	margin: auto;
	width: 1460px;
	padding-top: 15px;
	display: grid;
	grid-template-columns: 725px 725px;
	grid-template-rows: 300px 300px;
	row-gap: 50px;
	column-gap: 20px;
	border: 1px solid gray;
	border-radius: 20px;
	box-shadow: inset 3px 3px 5px 2px black;
}

#filter{
	margin: auto;
	width: 1460px;
	height: 100px;
}

</style>

</head>
<body>

	<c:if test="${!empty subject }">
		<div id="title">
			<i class="fas fa-award" style="color: navy;"></i>&nbsp<b>${subject }</b>
		</div>
	
	</c:if>
	<div id="filter">
		<hr>
			<b>여기에서는 검색 필터를 지정할 수 있습니다.</b>
			<select name="category" style="height: 40px;">
				<option value="">검색조건</option>
				<option value="com001">인기순</option>
				<option value="ele002">추천순</option>
				<option value="sp003">최근순</option>
			</select>
			<input type="button" value="검색" style="height: 40px; width: 80px;">
		<hr>
	</div>
	<div id="grid_container">
		<c:if test="${empty list }">
			<div style="color: red; text-align: center; line-height: 333px;">아직 추가한 학습 카드가 없습니다.</div>
		</c:if>
		
		<c:forEach var="card" items="${ list }">
			<div class="myCardContainer">
				<div class="myCardTitle">${card.c_title }</div>
				<div class="myCardSubject label label-info">${card.s_name }</div>
				<div class="myCardWord">${card.c_qCnt }단어</div>
				<div class="myCardMake">${card.m_nickname }</div>
				<input type="button" value="카드학습하기" onclick="study(${card.c_idx});"> 
			</div>
		</c:forEach>
	</div>
</body>
</html>