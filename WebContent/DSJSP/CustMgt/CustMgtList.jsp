<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
	List<Map<String, Object>> custList = null;
	custList =  (List<Map<String, Object>>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../HtmlLib.jsp"></jsp:include>
<title>거래처 관리</title>
</head>
<style>
.wrap{width:100%;}
*{}

header{margin-top:30px;}
.title{text-align: center; font-size: 20px; font-weight: bold;}
nav{width:100%; height: 50px;}
.searchbar{ font-size:11px; height: 20px; border-radius: 15px; border: none; background-color: #f1f1f187; box-shadow: 1px 1px 1px 1px #bfbfbf6e; padding-left:8px;}
.searchbar:focus{outline: none;}
.searchBtn{ font-size: 11px; border: none; border-radius: 7px; height: 22px;  background-color: #f9dcdcd4;}
.searchSet{ font-size:11px; height: 22px; border-radius: 5px; position: relative; top: 1px; left: 5px;}
.menu {width:100%; height: 30px;}
.menu > ul{list-style-type: none; float: right; margin: 5px 0px 5px 0px;}
.menu > ul > li {display:inline-block; width:50px; text-align: center; font-size:12px;
 height:20px; background-color: #f2f2f2; padding-top: 2px; border-radius: 5px; cursor:pointer;}
.CustMgtTable{ cursor:default; width:100%; height:400px; overflow-x:scroll; resize:vertical; border: solid 0.5px gray;}
.CustMgtTable_View {width:100%; table-layout: fixed;}
.CustMgtTable_View > tbody > tr>th:first-child{border-right: solid 1px gray; border-bottom: solid 1px gray; }
.CustMgtTable_View > tbody > tr>th{box-sizing:border-box; border-bottom: solid 2px #fd4c4c; border-right: solid 1px #fd4c4c;font-size:11px; height: 18px; font-weight: bold; text-align: center; margin:0; padding:0; background-color:#fef2f2;}
.CustMgtTable_View > tbody > tr>th:active{border-left: solid 1.5px #b5b5b5; border-top:solid 2px #b5b5b5; border-bottom: solid 0.5px #fd4c4c; border-right: solid 0.5px #fd4c4c;}
.CustMgtTable_View > tbody > tr>th:nth-child(n+2){ border-right:solid 1px #da9e9e;}
.CustMgtTable_View > tbody > tr>td{white-space:nowrap; font-size: 11px; text-align:center; margin:0; padding:0 5px 0 5px; text-overflow: hidden; height:20px;  border-right:solid 1px #da9e9e;}
.CustMgtTable_View >tbody > tr > td:first-child {background-color:#fef2f2; border-right: double 1px gray; border-bottom:double 1px gray; text-align: center;}
</style>
<body>
<c:choose>
	<c:when test="${empty Login}">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			window.location = "../main.jsp";
		</script>
	</c:when>
	<c:otherwise>
	<script src="../js/colResizable-1.5.min.js"></script>
	<script type="text/javascript">
	var selectLine=null;//테이블 선택 변수
	var select = null;
	var code; //거래처 조회 및 삭제에 쓰는 변수
	var word;
	var option;
	var sortOption = "";
	
	function tableResizable() {
		$('table').colResizable({
			resizeMode:'overflow',
			headerOnly:'true',
			liveDrag:true,
			postbackSafe: true,
		});
	}
		
	function searchCust(word, option, sortOption){
		$.ajax({
			url:"CustMgtListSearch.do",
			type:"post",
			data:{keyword:word, filter:option, sortOption:sortOption},
			error: function() {
				alert("검색 오류");
			},
			success: function(e) {
				$('.CustMgtTable').html(e);
			},
		});
	};
	
		$(document).ready(function() {
		
			tableResizable();
			
			//거래처 생성화면
			$('#CustInsert').click(function() {
				$.ajax({
					url:"CustMgtInsertForm.jsp",
					dataType:"html",
					error: function () {
						alert("연결 에러");
					},
					success: function(page) {
						var insertForm = page;
						$('.CustMgtPopup').html(insertForm);
					},
				});
			});
			
			
			//거래처 상세조회 및 수정페이지
			$('#CustView, #CustModify').click(function() {
				var ViewOrModi = $(this).attr("id"); //누른 버튼 확인용
				
				if(selectLine==null){
					alert("거래처를 선택해 주세요.");
					return;
				}
				code = select.children('input[name="cust_code"]').val();
				$.ajax({
					url:"CustMgtViewForm.do",
					type:"post",
					data:{CustCode:code, page:ViewOrModi},
					error: function() {
						alert("연결 오류");
					},
					success: function(page) {
						var ViewForm = page;
						$('.CustMgtPopup').html(ViewForm);
					}
				});
			});

			//거래처 삭제
			function CustMgtDelete() {
				$.ajax({
					url:"CustMgtDelete.do",
					type:"post",
					data:{CustCode:code},
					error: function() {
						alert("연결 오류");
					},
					success: function(e) {
						location.href="CustMgtListView.do";
					}
				});
			};
			$('#CustDelete').click(function () {
				if(selectLine==null){
					alert("거래처를 선택해 주세요.");
					return;
				}
				code = select.children('input[name="cust_code"]').val();
				if(confirm("삭제된 거래처는 복구할 수 없습니다. 삭제하시겠습니까?")){
					CustMgtDelete();
				}
			});
//검색 기능
		


		//검색 기능 실행 부분
		$('.searchbar').keyup(function(event) {
			if(event.keyCode == 13){
				word = $('.searchbar').val();
				option = $('.searchSet option:selected').val();
				searchCust(word,option,"");
			}
		});
		$('.searchBtn').click(function() {
			word = $('.searchbar').val();
			option = $('.searchSet option:selected').val();
			searchCust(word,option,"");
		})

			
			
		//테이블 선택 구현
			
		});
		
		$(document).on('click','.CustMgtTable td', function() {
			$('tbody>tr>td:nth-child(n+2)').css({'background-color':'white','color':'black'});
			select = $(this).parent().children('td:first-child');
			selectLine = $(this).parent().children('td:nth-child(n+2)');
			selectLine.css({
				'background-color':'#4646cc7a',
				'color':'#e5ff97'
			});
		});
		$(document).on('click','.CustMgtTable th', function() {
			word = $('.searchbar').val();
			option = $('.searchSet option:selected').val();
			sortOption = $(this).html();
			searchCust(word,option,sortOption);
		});
		
		
		$(document).on(function () {
			tableResizable();
			
		});
		
		$(document).on('click','.CustMgtInsertOverlay, .CustInsertExitBtn, .custInsertCancel', function() {
			if(confirm("정말로 닫으시겠습니까?")){
				$('.CustMgtInsertOverlay').fadeOut(300);
				$('.CustMgtInsertWrap').fadeOut(300);
				$('.CustMgtInsertOverlay').delay(300).remove();
				$('.CustMgtInsertWrap').delay(300).remove();
			}
		});
		$(document).on('click','.CustViewExitBtn, .CustMgtViewOverlay, .custViewBtn', function() {
			if(confirm("정말로 닫으시겠습니까?")){
				$('.CustMgtViewOverlay').fadeOut(300);
				$('.CustMgtViewWrap').fadeOut(300);
				$('.CustMgtViewOverlay').delay(300).remove();
				$('.CustMgtViewWrap').delay(300).remove();
			}
		});
		$(document).on('click','.CustModifyExitBtn, .CustMgtModifyOverlay, .custModifyBtn', function() {
			if(confirm("정말로 닫으시겠습니까?")){
				$('.CustMgtModifyOverlay').fadeOut(300);
				$('.CustMgtModifyWrap').fadeOut(300);
				$('.CustMgtModifyOverlay').delay(300).remove();
				$('.CustMgtModifyWrap').delay(300).remove();
			}
		});
	</script>
		<div class="wrap">
			<header>
				<div class="title">거래처 관리</div>
			</header>
			<nav>
				<div class="sort">
					<input class="searchbar" type="text" name="searchbar" value="" placeholder="Search">
					<input class="searchBtn" type="button" name="searchBtn" value="검색" onclick="">
					<select class="searchSet">
						<option value="all">전체</option>
						<option value="cust_name">거래처명</option>
						<option value="cust_cla">구분</option>
						<option value="cust_ceo">대표자명</option>
						<option value="cust_bizcode">사업자등록번호</option>
						<option value="cust_tel">연락처</option>
						<option value="cust+addr">주소</option>
					</select>
				</div>
				<div class="menu">
					<ul>
						<li id="CustInsert">생성</li>
						<li id="CustView">조회</li>
						<li id="CustModify">수정</li>
						<li id="CustDelete">삭제</li>
						<li id="CustSlip">최근</li>
						<li id="CustLedger">원장</li>
					</ul>
				</div>
			</nav>
			<section>
				<div class="CustMgtTable">
					<table class="CustMgtTable_View">
							<tr>
								<th>No.</th>
								<th style="width:3%">구분</th>
								<th style="width:15%">거래처명</th>
								<th style="width:10%">사업자등록번호</th>
								<th style="width:5%">대표자</th>
								<th style="width:8%">연락처</th>
								<th style="width:8%">휴대전화</th>
								<th style="width:8%">팩스</th>
								<th style="width:5%">업종</th>
								<th style="width:5%">종목</th>
								<th style="width:15%">주소</th>
								<th style="width:15%">이메일</th>
							</tr>
							<%if(custList.size() == 0){ %>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<%}else {
								int i = 0;
								for(Map<String, Object> cust : custList){
									i++;
								%>
							
							<tr>
								<td><%=i%><input type="hidden" name="cust_code" value="<%=cust.get("cust_code")%>"></td>
								<td><%=cust.get("cust_cla") %></td>
								<td><%=cust.get("cust_name") %></td>
								<td><%=cust.get("cust_bizcode") %></td>
								<td><%=cust.get("cust_ceo") %></td>
								<td><%=cust.get("cust_tel") %></td>
								<td><%=cust.get("cust_phone") %></td>
								<td><%=cust.get("cust_fax") %></td>
								<td><%=cust.get("cust_ind") %></td>
								<td><%=cust.get("cust_stk") %></td>
								<td><%=cust.get("cust_addr1") %></td>
								<td><%=cust.get("cust_email") %></td>
							</tr>
							<%
								}}
							%>
					</table>
				</div>
			</section>
		</div>
		<div class="CustMgtPopup"> </div>
	</c:otherwise>
</c:choose>

</body>
</html>