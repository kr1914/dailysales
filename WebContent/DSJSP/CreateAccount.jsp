<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js\CreateAccount.js"></script>
  </head>
  <link rel="stylesheet" href="css\CreateAccount.css">

  <body>

    <div class="wrap">
      <div id="site_name">
        <div class="">
          <img src="..\img\logo.png" alt="로고">
        </div>
      </div>
      <section>
        <form class="" action="createAccount_action.jsp" method="post">
          <div id="crtacc">
            <div id="title">
              회원가입
            </div>
            <div id="input">
              <div class="inputbox">
                  <label for="">이메일</label><div></div>
                  <input class="textbox" type="text" name="email" value="" placeholder="Email">
              </div>
              <div class="inputbox">
                  <label for="">닉네임</label><div></div>
                  <input class="textbox" type="text" name="nickname" value="" placeholder="Nickname">
              </div>
              <div class="inputbox">
                  <label for="">비밀번호</label><div></div>
                  <input class="textbox" type="password" name="pwd1" value="" placeholder="Password">
              </div>
              <div class="inputbox">
                  <label for="">비밀번호 확인</label><div></div>
                  <input class="textbox" type="password" name="pwd2" value="" placeholder="Password check">
              </div>
            </div>
            <div id="input2">
              <div class="inputbox">
                <label for="">이름</label><div></div>
                <input type="text" name="name" value="" class="textbox" placeholder="Name">
              </div>
              <div class="inputbox">
                <label for="">생년월일</label><div></div>
                <input id="birth" type="date" name="birth" value="" class="textbox" placeholder="900213 (예)">
              </div>
              <div class="inputbox">
                <label id="gender" for="gender">성별</label><div></div>
                <input id="male" class="radio_sex" type="radio" name="gender" value="남">남자
                <input id="female" class="radio_sex" type="radio" name="gender" value="여">여자
              </div>
              <div class="inputbox">
                <label for="">주소</label> <br><div></div>
                <input id="postal_code" class="add" type="text" name="address" value="" readonly>
                <input id="find_add" type="button" name="find_add" value="우편번호찾기" onclick=""><br>
                <input id="address_input" class="textbox" type="text" name="address2" value="" placeholder="도로명/지번 주소">
                <input id="address_input2" class="textbox" type="text" name="address3" value="" placeholder="상세주소">
              </div>
              <div class="inputbox">
                <label for="">연락처</label><div></div>
                <select class="phone1 phone" name="phone1">
                  <option value="null">선택</option>
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="019">019</option>
                </select>
                <input class="phone" type="number" name="phone2" value="" maxlength="4">
                <input class="phone" type="number" name="phone3" value="" maxlength="4">
              </div>
            </div>
            <div id="button">
              <img id="btnImg" src="..\img\plus.png" alt="">
            </div>
            <div id="crtAcc_footer">
              <div class="">
                <input id="verification" type="text" name="check_code" value="">
                  <button id="verificationBtn"type="button" name="button">인증 메일 발송</button>
              </div>
              <div id="terms">
                <span>
                  개인정보제공 이용약관 동의
                </span>
                <input type="checkbox" name="agree" value="today()">
                <span>
                  <a href="#">약관보기</a>
                </span>
              </div>
              <div class="">
                <input id="create" type="submit" name="button" value="회원가입">
              </div>
            </div>
          </form>
      </section>
      <div id="dupl"></div>
    </div>
  </body>
</html>
