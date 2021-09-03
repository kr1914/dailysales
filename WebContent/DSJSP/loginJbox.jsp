<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="popupOverlay"></div>
    <div class="popupLogin">
    <div id="loginCloseBtn"><img alt="X" src="../img/exit_01.png"></div>
	<div id="loginTitle">
	<span>로그인</span>
	</div>
	<div id="loginWrapper">
	<div id="loginContainer">
	<form id="loginForm" action="login.jsp" method="post">
	<label for="loginId">이메일</label>
	<input class="input" type="email" name="loginId" value="" placeholder="EXAM01@naver.com">
	<label for="loginPwd">비밀번호</label>
	<input class="input" type="password" name="loginPwd" value="" placeholder="PASSWORD">
	<div id="wrongMassage">잘못된 아이디 또는 비밀번호입니다.</div>
	<div id="loginFindPwd"><a href="#">아이디/비밀번호찾기</a></div>
	<input class="loginBtn" type="button" name="" value="login">
	<div id="loginFooter"><a href="CreateAccount.jsp" target="content">
	<div id="createAccount">회원가입</div></a>
	</form>
	</div>

	</div>
	</div>
	</div>