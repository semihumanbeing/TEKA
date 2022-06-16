<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<nav id="bar" class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="font-size: x-large; font-weight: bolder;">QuizTIS</a>
    </div>
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">홈페이지</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">주제<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">운영체제</a></li>
          <li><a href="#">네트워크</a></li>
          <li><a href="#">자료구조</a></li>
          <li><a href="#">알고리즘</a></li>
          <li><a href="#">스프링</a></li>
          <li><a href="#">자바</a></li>
        </ul>
      <li><a href="#">내 학습세트</a></li>
    </ul>
     
     <button id="makebtn" class="btn btn-success navbar-btn navbar-left">만들기</button>
    <form id="searchbar" class="navbar-form navbar-left">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="카드 찾기">
      </div>
      <button type="submit" class="btn btn-default">검색</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
    </ul>
  </div>
</nav>

</body>
</html>