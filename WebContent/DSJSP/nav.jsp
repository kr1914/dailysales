<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!-- 좌측 네비 구성 및 본문 헤더-iframe으로 구성된 html 페이지, 로그인 전후로 다른 구성을 가지고 있음. -->

<!--로그인버튼 조정-->
<%
  List<Map<String, Object>> login = null;
	ArrayList<String[]> getCo = new ArrayList<String[]>();

  login = (List<Map<String, Object>>)session.getAttribute("Login");
  String getName = null;
  
  //로그인 되었을 때 세션의 세팅 (이름, 회사명, 관리권한) "nowCo" : 지금 설정된 회사 키값
  if(login!=null){
	  getName = (String)login.get(0).get("name");
	  if(getCo.isEmpty()){
		  for(Map<String,Object> co : login){
			  String a [] = {(String)co.get("company"),(String)co.get("grade"),(String)co.get("key")};
			  getCo.add(a);
		  }
	  }
	  session.setAttribute("ID", login.get(0).get("id"));
  }
  
  
  String name = null;
  if(getName==null){
    name = "로그인이 필요합니다.";
  }else if(getName.equals("fail")){
	name = "로그인이 필요합니다.";
  }else{name = getName+"님";}
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
	<jsp:include page="HtmlLib.jsp"></jsp:include>	
	<script src="js\nav.js"></script>
    <script src="js\jBox.js"></script>
   	
    <link rel="stylesheet" href="css\nav.css">
    <link rel="stylesheet" href="css\login.css">

  </head>


  <body  class="row">
    <nav class="">
      <div id="nav_slider" ></div>
      <div id="logo"><a href="nav.jsp"><img src="..\img\logo.png" alt="logo"></a></div>
<%//로그인 전,후차이 아이콘 변경+이름 표시 차후에 회사 선택 select 옵션도 추가 %>
      <c:choose>
      	<c:when test="<%=getName==null%>">
      		<div id="nav_login" data-popup-open="login"><a href="#"><img src="..\img\login02.png" alt="로그인"></a></div>
      	</c:when>
      	<c:otherwise>
      		<div id="nav_logout"><a href="logout.jsp"><img src="..\img\logout.png" alt="로그아웃"> </a> </div>
      	</c:otherwise>
      </c:choose>
      <div id="acInfo">
      	<div id="acName"><span><%=name%></span>
      	</div>
      	<div id="timer"><span id="meridiem"></span> 
      	</div>
      	<%//경우1:로그인전, 경우2: 로그인 후 회사는 없을때, 경우3: 로그인 후 회사가 있을 떄, 경우4 로그인 후 회사가 3개이상 있을 때 %>
      	<c:choose> 
	      	<c:when test="<%=login!=null%>"> <!-- 로그인 후 -->
	      		<div class="">
	      			<%if(getCo.get(0)[0]!=null){ %>
	     	 		<select class="myCo" name="selectMyCo">
      					<%
      					int i = 0;
      					for(String[] company : getCo){ 
      					%>
      					<%
      					if(request.getParameter("select")!=null){
      					if(Integer.parseInt(request.getParameter("select"))==i){ %>
      						<option value="<%=i%>" selected="selected"><%=company[0]%>:<%=company[1] %></option>
      						<%}else {%>
      							<option value="<%=i%>"><%=company[0]%>:<%=company[1] %></option>
      						<% }
      					
      					}else { %>
      						<option value="<%=i%>"><%=company[0]%>:<%=company[1] %></option>
      					<%}
      					i++; } %>
   					</select> <%} %> 	
					<%if(getCo.size()<3 && getName != null){ %>
      			<div class="myCoStartBtn"><span><a href="MyCoMgt/MyCoCreateForm.jsp" target="content">회사 생성</a></span></div>
      				<%} %>
	      		</div>
	      	</c:when>
      		<c:otherwise> <!-- 로그인 전 -->
      		</c:otherwise>
      	</c:choose>
      	
      </div>
      <div id="nav_menu">
        <ul>
          <li>
            <div class="nav_btn slipInsert">
              <img src="..\img\nav_icon01.png" alt="전표입력">
              <span>전표입력</span>
            </div>
            <div class="nav_btn_slide">
              <ul>
                <li onclick="content.location.href='Slip/InsertSlip.jsp'">일반전표입력</li>
                <li>엑셀일괄입력</li>
              </ul>
            </div>
          </li>
          <li>
            <div class="nav_btn cMgt">
              <img src="..\img\nav_icon02.png" alt="거래처관리">
              <span>거래처관리</span>
            </div>
            <div class="nav_btn_slide">
              <ul>
                <li onclick="content.location.href='CustMgt/CustMgtListView.do'">거래처 목록 관리</li>
                <li>거래처원장 관리</li>
              </ul>
            </div>
          </li>
          <li>
            <div class="nav_btn">
              <img src="..\img\nav_icon03.png" alt="재고관리">
              <span>재고관리</span>
            </div>
            <div class="nav_btn_slide">
              <ul>
                <li onclick='content.location.href="StkMgt/StkMgtListView.do"'>재고 목록 관리</li>
                <li>재고별 원장 관리</li>
              </ul>
            </div>
          </li>
          <li>
            <div class="nav_btn">
              <img src="..\img\nav_icon08.png" alt="자금관리">
              <span>자금관리</span>
            </div>
            <div class="nav_btn_slide">
              <ul>
                <li onclick='content.location.href="AcctMgt/AcctMgtListView.do"'>계좌 목록 관리</li>
                <li>계좌별 원장 관리</li>
              </ul>
            </div>
          </li>
          <li>
            <div class="nav_btn">
              <img src="..\img\nav_icon04.png" alt="직원관리">
              <span>직원관리</span>
            </div>

            <div class="nav_btn_slide">
              <ul>
                <li>직원 목록 관리</li>
                <li>급여관리</li>
              </ul>
            </div>
          </li>
          <li>
            <div class="nav_btn">
              <img src="..\img\nav_icon05.png" alt="재무제표">
              <span>재무제표</span>
            </div>
            <div class="nav_btn_slide">
              <ul>
                <li>손익계산서</li>
                <li>재무상태표</li>
                <li>매입/매출 출력</li>
              </ul>
            </div>
          </li>
          <li>
            <div class="nav_btn">
              <img src="..\img\nav_icon06.png" alt="설정">
              <span>설정</span>
            </div>
            <div class="nav_btn_slide">
              <ul>
                <li id="set_CoI" onclick="content.location.href='MyCoMgt/MyCoView.do'">회사정보관리</li>
                <li>일반설정</li>
                <li>권한설정</li>
              </ul>
            </div>
          </li>
          <li>
            <div class="nav_btn">
              <img src="..\img\nav_icon07.png" alt="공지사항">
              <span>공지사항</span>
            </div>
            <div class="nav_btn_slide">
              <ul>
                <li></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
      <div class="tutorial">
        <label for="tuEx">도움말을 보지 않습니다.</label> <input id="tuEx" type="checkbox" name="tutorial" value="">
      </div>

    </nav>
    <div class="wrap">
      <header>
        <div id="header_nav" class="">
       		 <div class="header_nav">
       	 		<ol>
	        		<li id="introMenu" class="header_nav_icon" onclick="content.location.href=''">소개</li>
	        		<li class="header_nav_icon" onclick="content.location.href=''">이용 가이드</li>
	        		<li class="header_nav_icon" onclick="content.location.href='Board/Board.jsp'">커뮤니티</li>
	        		<li class="header_nav_icon" onclick="content.location.href=''">사이트맵</li>
        		</ol>
        	</div>
          <div id="header_login"></div>
        </div>
      </header>
      <iframe class="" name="content" src="main.jsp" width="" height=""></iframe>
    </div>

	<div id="check"></div>
  </body>

</html>
