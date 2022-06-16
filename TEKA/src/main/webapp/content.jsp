<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card-container {
	text-decoration: none;
	margin-top: 10px;
	padding: 10px;
	margin: auto;
	width: 750px;
	height: 300px;
	
}

.card {
  float: left;
  background-color: transparent;
  width: 420px;
  height: 280px;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
  
}

/* This container is needed to position the front and back side */
.card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
 
}
.card.flipped .card-inner {
	transform: rotateX(180deg);
}

/* Position the front and back side */
.card-front, .card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 10px;
  box-shadow: 1px 1px 4px black;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.card-front {
  background-color: white;
}

/* Style the back side */
.card-back {
  background-color: white;
  transform: rotateX(180deg);
}

.card-front>h1, .card-back>h1{
	font-weight: bolder;
	padding-top: 90px;
}

.side {
	padding: 10px;
	margin-left: 15px;
	width: 280px;
	height: 280px;
	float: left;
}
.introduction{
	padding-top: 30px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(".card").click(function(){
		$(this).toggleClass("flipped");
	});	
});
</script>
</head>
<body>

	<c:forEach begin="1" end="7">
		<div class="card-container">
			<div class="card">
				<div class="card-inner">
					<div class="card-front">
						<h1>앞면입니다</h1>
					</div>
					<div class="card-back">
						<h1>뒷면이예요</h1>
					</div>
				</div>
			</div>
			
			<div class="side">
				<h2>게시글입니다</h2>
				<span class="badge">알고리즘</span>
				<button type="button" class="btn btn-xs btn-primary">
					추천 <span class="badge">7</span>
				</button>
				<p class="introduction">소개글입니다</p>
			</div>
			
		</div>
		
	</c:forEach>
	<div>
	
	</div>
</body>
</html>