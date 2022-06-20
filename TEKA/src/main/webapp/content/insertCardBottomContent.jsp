<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="panel panel-default">
  <div class="panel-heading">추가한 카드</div>
</div>

<div id="semi_card">
	
	<div>
		<table class="table table-striped" class="table">
			<tr>
				<th>객체지향</th>
			</tr>
			<tr>
				<td>객체지향이란 즉, 현실세계를 프로그래밍으로 옮겨온 것이다. 현실세계의 사물들을 객체라고 보고,
				그 객체로부터 개발하고자하는 프로그램에 필요한 특징들을 뽑아와 프로그래밍하는 것이다.
				대표적인 특징으로는 추상화, 상속, 다형성, 캡슐화가 있다.
				</td>		
				<td>
					<div class="btn-group-vertical">
					  <input type="button" class="btn btn-default btn-sm" value="수정">
					  <input type="button" class="btn btn-default btn-sm" value="삭제">
					</div>
				</td>
			</tr>
		</table>	
		
		<table class="table table-striped" class="table">
			<tr>
				<th>직렬화</th>
			</tr>
			<tr>
				<td>자바에서 입출력을 할 때, 데이터는 '스트림'이라는 통로를 이용한다.
				하지만 객체는 byte형이 아니기 때문에 스트림을 통해 파일을 저장하거나 네트워크로 전송할 수 없다.
				따라서 객체를 스트림을 통해 입출력하기위해서 byte배열로 변환하는 작업이 필요한데, 이 작업이 직렬화이다.
				반대로 스트림을 통해 받은 직렬화된 객체를 원래모양대로 만드는 작업이 역직렬화이다.
				</td>		
				<td>
					<div class="btn-group-vertical">
					  <input type="button" class="btn btn-default btn-sm" value="수정">
					  <input type="button" class="btn btn-default btn-sm" value="삭제">
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-striped" class="table">
			<tr>
				<th>컴파일러와 인터프리터의 차이</th>
			</tr>
			<tr>
				<td>컴파일러와 인터프리터 모두 고레벨 언어를 기계어로 변환하는 역할을 한다.
				컴파일러는 전체코드의 명령어를 수집하고 재구성하는 반면, 인터프리터는 소스코드의 각 행을 연속적으로 분석한다.
				인터프리터는 고레벨 언어를 중간 언어로 한 번 번역하는 작업을 각 행마다 수행하기 때문에, 일반적으로 컴파이러의 실행속도가 더 빠르다.
				자바의 경우, 자바 컴파일러가 자바파일을 클래스파일로 컴파일하고, 인터프리터가 클래스파일을 기계어로 변환한다.
				</td>		
				<td>
					<div class="btn-group-vertical">
					  <input type="button" class="btn btn-default btn-sm" value="수정">
					  <input type="button" class="btn btn-default btn-sm" value="삭제">
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-striped" class="table">
			<tr>
				<th>교착상태(Deadlock)</th>
			</tr>
			<tr>
				<td>프로세스가 자원을 얻지못해 다음작업을 수행하지 못하는 상태이다.
				주로 시스템적으로 한정된 자원을 여러 곳에서 사용하려고 할 때 발생한다.
				교착상태는 상호배제, 비선점, 순환대기, 점유대기 4가지 조건을 모두 만족해야 발생한다.
				</td>		
				<td>
					<div class="btn-group-vertical">
					  <input type="button" class="btn btn-default btn-sm" value="수정">
					  <input type="button" class="btn btn-default btn-sm" value="삭제">
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-striped" class="table">
			<tr>
				<th>운영체제</th>
			</tr>
			<tr>
				<td>운영체제는 사용자에게 편리한 인터페이스 환경을 제공하고 컴퓨터 시스템의 자원을 효율적으로 관리하는 소프트웨어입니다.
				운영체제는 인터페이스(GUI)와 시스템 호출(System call), 커널(Kernel)과 드라이버(Driver)로 구성됩니다.
				</td>		
				<td>
					<div class="btn-group-vertical">
					  <input type="button" class="btn btn-default btn-sm" value="수정">
					  <input type="button" class="btn btn-default btn-sm" value="삭제">
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-striped" class="table">
			<tr>
				<th>DNS(DomainNameSystem)</th>
			</tr>
			<tr>
				<td>도메인이나 호스트 이름을 숫자로 된 ip주소로 바꾸어 주는 장비이다.</td>		
				<td>
					<div class="btn-group-vertical">
					  <input type="button" class="btn btn-default btn-sm" value="수정">
					  <input type="button" class="btn btn-default btn-sm" value="삭제">
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>

<div id="btn_card_insert">
	<div class="btn-group">
	  <input type="button" class="btn btn-success navbar-btn navbar-left" value="임시저장">
	  <input type="button" class="btn btn-success navbar-btn navbar-left" value="카드등록">
	</div>
</div>

</body>
</html>