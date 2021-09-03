<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
	List<Map<String, Object>> stkList = null;
	stkList =  (List<Map<String, Object>>)request.getAttribute("list");
	
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
.StkMgtTable{ cursor:default; width:100%; height:400px; overflow-x:auto; resize:vertical; border: solid 0.5px gray;}
.StkMgtTable_View {width:100%;}
.StkMgtTable_View > tbody > tr>th:first-child{border-right: solid 1px gray; border-bottom: solid 1px gray; }
.StkMgtTable_View > tbody > tr>th{box-sizing:border-box; border-bottom: solid 2px #fd4c4c; border-right: solid 1px #fd4c4c;font-size:11px; height: 18px; font-weight: bold; text-align: center; margin:0; padding:0; background-color:#fef2f2;}
.StkMgtTable_View > tbody > tr>th:active{border-left: solid 1.5px #b5b5b5; border-top:solid 2px #b5b5b5; border-bottom: solid 0.5px #fd4c4c; border-right: solid 0.5px #fd4c4c;}
.StkMgtTable_View > tbody > tr>th:nth-child(n+2){ border-right:solid 1px #da9e9e;}
.StkMgtTable_View > tbody > tr>td{ font-size: 11px; text-align:center; margin:0; padding:0 5px 0 5px; text-overflow: hidden; height:20px;  border-right:solid 1px #da9e9e;}
.StkMgtTable_View >tbody > tr > td:first-child {background-color:#fef2f2; border-right: double 1px gray; border-bottom:double 1px gray; text-align: center;}
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
		
	function searchStk(word, option, sortOption){
		$.ajax({
			url:"StkMgtListSearch.do",
			type:"post",
			data:{keyword:word, filter:option, sortOption:sortOption},
			error: function() {
				alert("검색 오류");
			},
			success: function(e) {
				$('.StkMgtTable').html(e);
			},
		});
	};
	
		$(document).ready(function() {
		
			tableResizable();
			
			//거래처 생성화면
			$('#stkInsert').click(function() {
				$.ajax({
					url:"StkMgtInsertForm.jsp",
					dataType:"html",
					error: function () {
						alert("연결 에러");
					},
					success: function(page) {
						var insertForm = page;
						$('.StkMgtPopup').html(insertForm);
					},
				});
			});
			
			
			//거래처 상세조회 및 수정페이지
			$('#stkView, #stkModify').click(function() {
				var ViewOrModi = $(this).attr("id"); //누른 버튼 확인용
				
				if(selectLine==null){
					alert("상품을 선택해주세요");
					return;
				}
				code = select.children('input[name="stk_code"]').val();
				$.ajax({
					url:"StkMgtViewForm.do",
					type:"post",
					data:{StkCode:code, page:ViewOrModi},
					error: function() {
						alert("연결 오류");
					},
					success: function(page) {
						var ViewForm = page;
						$('.StkMgtPopup').html(ViewForm);
					}
				});
			});

			//거래처 삭제
			function StkMgtDelete() {
				$.ajax({
					url:"StkMgtDelete.do",
					type:"post",
					data:{StkCode:code},
					error: function() {
						alert("연결 오류");
					},
					success: function(e) {
						location.href="StkMgtListView.do";
					}
				});
			};
			$('#stkDelete').click(function () {
				if(selectLine==null){
					alert("거래처를 선택해 주세요.");
					return;
				}
				code = select.children('input[name="stk_code"]').val();
				if(confirm("삭제된 거래처는 복구할 수 없습니다. 삭제하시겠습니까?")){
					StkMgtDelete();
				}
			});
//검색 기능
		


		//검색 기능 실행 부분
		$('.searchbar').keyup(function(event) {
			if(event.keyCode == 13){
				word = $('.searchbar').val();
				option = $('.searchSet option:selected').val();
				searchStk(word,option,"");
			}
		});
		$('.searchBtn').click(function() {
			word = $('.searchbar').val();
			option = $('.searchSet option:selected').val();
			searchStk(word,option,"");
		})

			
			
		//테이블 선택 구현
			
		});
		
		$(document).on('click','.StkMgtTable td', function() {
			$('tbody>tr>td:nth-child(n+2)').css({'background-color':'white','color':'black'});
			select = $(this).parent().children('td:first-child');
			selectLine = $(this).parent().children('td:nth-child(n+2)');
			selectLine.css({
				'background-color':'#4646cc7a',
				'color':'#e5ff97'
			});
		});
		$(document).on('click','.StkMgtTable th', function() {
			word = $('.searchbar').val();
			option = $('.searchSet option:selected').val();
			sortOption = $(this).html();
			searchStk(word,option,sortOption);
		});
		
		
		$(document).on(function () {
			tableResizable();
			
		});
		
		$(document).on('click','.StkMgtInsertOverlay, .StkInsertExitBtn, .StkInsertCancel', function() {
			if(confirm("정말로 닫으시겠습니까?")){
				$('.StkMgtInsertOverlay').fadeOut(300);
				$('.StkMgtInsertWrap').fadeOut(300);
				$('.StkMgtInsertOverlay').delay(300).remove();
				$('.StkMgtInsertWrap').delay(300).remove();
			}
		});
		$(document).on('click','.StkViewExitBtn, .StkMgtViewOverlay, .StkViewBtn', function() {
			if(confirm("정말로 닫으시겠습니까?")){
				$('.StkMgtViewOverlay').fadeOut(300);
				$('.StkMgtViewWrap').fadeOut(300);
				$('.StkMgtViewOverlay').delay(300).remove();
				$('.StkMgtViewWrap').delay(300).remove();
			}
		});
		$(document).on('click','.StkModifyExitBtn, .StkMgtModifyOverlay, .StkModifyBtn', function() {
			if(confirm("정말로 닫으시겠습니까?")){
				$('.StkMgtModifyOverlay').fadeOut(300);
				$('.StkMgtModifyWrap').fadeOut(300);
				$('.StkMgtModifyOverlay').delay(300).remove();
				$('.StkMgtModifyWrap').delay(300).remove();
			}
		});
	</script>
		<div class="wrap">
			<header>
				<div class="title">재고 관리</div>
			</header>
			<nav>
				<div class="sort">
					<input class="searchbar" type="text" name="searchbar" value="" placeholder="Search">
					<input class="searchBtn" type="button" name="searchBtn" value="검색" onclick="">
					<select class="searchSet">
						<option value="all">전체</option>
						<option value="stk_name">상품명</option>
						<option value="stk_cla">구분</option>
						<option value="stk_size">사이즈</option>
						<option value="stk_date">입고일</option>
					</select>
				</div>
				<div class="menu">
					<ul>
						<li id="stkInsert">생성</li>
						<li id="stkView">조회</li>
						<li id="stkModify">수정</li>
						<li id="stkDelete">삭제</li>
						<li id="stkSlip">최근</li>
						<li id="stkLedger">원장</li>
					</ul>
				</div>
			</nav>
			<section>
				<div class="StkMgtTable">
					<table class="StkMgtTable_View">
							<tr>
								<th style="width:8%">No.</th>
								<th style="width:15%">구분</th>
								<th style="width:30%">상품명</th>
								<th style="width:15%">규격1</th>
								<th style="width:15%">규격2</th>
								<th style="width:8%">입고일자</th>
								<th style="width:9%">재고</th>
							</tr>
							<%if(stkList.size() == 0){ %>
							<tr>
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
								for(Map<String, Object> stk : stkList){
									i++;
								%>
							
							<tr>
								<td><%=i%><input type="hidden" name="stk_code" value="<%=stk.get("stk_code")%>"></td>
								<td><%=stk.get("stk_cla") %></td>
								<td><%=stk.get("stk_name") %></td>
								<td><%=stk.get("stk_size1") %></td>
								<td><%=stk.get("stk_size2") %></td>
								<td><%=stk.get("stk_date") %></td>
								<td></td>
							</tr>
							<%
								}}
							%>
					</table>
				</div>
			</section>
		</div>
		<div class="StkMgtPopup"> </div>
	</c:otherwise>
</c:choose>

</body>
</html>