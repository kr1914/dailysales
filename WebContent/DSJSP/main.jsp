<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <jsp:include page="HtmlLib.jsp"></jsp:include>
	<link rel="stylesheet" href="css/main.css"/>
  </head>

  <body>
  <div>
   <h1>Daily Sales</h1>
   <p> 안녕하십니까. 데일리 세일즈는 회사 관리의 꼭 필요한 부분만 모아 회계프로그램 또는 ERP가 능숙하지 않은 분도 쉽게 사용할 수 있도록
   고안된 회계관리 프로그램입니다. 회사에서 가장 기본이자 중요한 판매를 기록하는 것에 초점을 맞춰 입력할 수 있도록 만들어져있습니다.
   하루하루 매출을 정리하며 수금과 비용을 입력해 보면서 회사의 상태를 파악하고 방향성을 정함에 있어 많은 도움이 될 것입니다.
   </div>
   <p>
   
   <div class="row main">
	   <div class="col-sm-6 ">
	   		<div class="col-sm-12 mainChart">
	   			매출현황
	   		</div>
	   </div>
	   <div class="col-sm-6">
	   		<div class="col-sm-12 mainChart">
	   			이미지
	   		</div>
	   </div>

   </div>
   <div class="row main">
	   <div class="col-sm-3 col-xs-6">
		   <div class="col-sm-12 mainChart">
		   		금월 거래처 TOP5
		   </div>
	   </div>
	   <div class="col-sm-3 col-xs-6">
		   	<div class="col-sm-12 mainChart">
			   	<a href="Board/Board.jsp" target="content"> 게시판</a>
		   </div>
	   </div>
	   <div class="col-sm-3 col-xs-6">
	 	  <div class="col-sm-12 mainChart">
		   		DailySales 시작하기 (tutorial)
		   </div>
	   </div>
	   <div class="col-sm-3 col-xs-6">
	 	  <div class="col-sm-12 mainChart">
		   		도움되는 사이트
		   </div>
	   </div>
   </div>
   <div class="row main">
  		<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	   
	  	</div>
	  	<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	
	  	</div>
	  	<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	
	  	</div>
	  	<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	  
	  	</div>
   </div>
  </body>

</html>
