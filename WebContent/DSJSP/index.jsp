<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <style>
   .wrap{
	width:100%;
   }
   .mainlogo {
   width:100%;
   margin-top: 200px;
   text-align: center;
   }
   .maintitle{
      width:100%;
   	text-align: center;
   }
   .titleLogo{
   	width: 300px;
   	height: 300px;
   }
   .titleName{
   	width: 500px;
   }
   .start{    width: 100%;    height: 70px;    text-align: center;    margin-top: -40px;   overflow: hidden;   }
   
   .startBtn{width:200px;  margin-top: -10px;}
   </style>
  <div class="wrap">
 
  	<div class="mainlogo">
  		<img class="titleLogo" alt="로고" src="../img/title_logo.png" >
  		<script>
  		//로그인창 열기
  		function fun() {
			parent.loginPageOn();
		}
  		</script>
  	</div>
  	<div class="maintitle">
  		<img class="titleName" alt="DailySales" src="../img/MainPage.png">
  	</div>
	<div class="start">
  		<img class="startBtn" alt="DailySales" src="../img/main_start.png" onclick="fun()">
  	</div>
  
  </div>
  