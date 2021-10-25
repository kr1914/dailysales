<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../HtmlLib.jsp"></jsp:include>
<link rel="stylesheet" href="..\css\custLedgers.css">
</head>
<body>
<c:choose>
	<c:when test="${empty ID}">
		<script>alert("로그인이 필요합니다.");</script>
	</c:when>
	<c:otherwise>
	

<script>
var reportTableArray = new Array();

$(document).ready(function () {
	$('#custSearchbar').keyup(function(event) {
		if(event.keyCode == 13){
			var t = $(this).val();
			searchCust(t);
		}
	});
	
	$('#custSearchButton').click(function() {
		var t = $('#custSearchbar').val();
		searchCust(t);
		
	});
	
	$('#reportSelectButton').click(function() {
		console.log("거래처원장 조회 시작");
		var custcode = $('input[name="cust_code"]').val();
		var start = $('#startDate').val();
		var end = $('#endDate').val();
		callReport(custcode, start, end);
		var no = 1;
		var table ="";
		$.each(reportTableArray, function(key, value) {
			console.log("테이블작성 시작");
			
			if(value.tran_cla == "매출"){
			table = table + '<tr><td>'+no+'</td>'+'<td>'+value.tran_cla+'</td>'+'<td>'+value.tran_date+'</td>'+'<td>'+value.stk+'</td>'+'<td>'+value.ts_quantity+'</td>'+'<td>'+value.ts_price+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+value.sales+'</td>'+'<td>'+value.vat+'</td>'+'<td>'+'</td>'+'<td></td></tr>';
			}else if(value.tran_cla == "수금"){
				table = table + '<tr><td>'+no+'</td>'+'<td>'+value.tran_cla+'</td>'+'<td>'+value.tran_date+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+value.payment+'</td>'+'<td></td></tr>';
			}else if(value.tran_cla == "매입"){
				table = table + '<tr><td>'+no+'</td>'+'<td>'+value.tran_cla+'</td>'+'<td>'+value.tran_date+'</td>'+'<td>'+value.stk+'</td>'+'<td>'+value.ts_quantity+'</td>'+'<td>'+value.ts_price+'</td>'+'<td>'+value.purcharse+'</td>'+'<td>'+value.pur_vat+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td></td></tr>';
			}else if(value.tran_cla == "지출"){
				table = table + '<tr><td>'+no+'</td>'+'<td>'+value.tran_cla+'</td>'+'<td>'+value.tran_date+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+value.payment+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td>'+'</td>'+'<td></td></tr>';
			}else {
				
			}
			no++;
		});
		table = table.replace(/undefined/gi, '');
		$('#reportTableBody').html(table);
	});

});

$(document).on('DOMNodeInserted','.CustInfoTable', function() {
	$('.ledgersTitle').html("거래처원장"+"/"+$('.custName').children('td').html());
});


//거래처 조회 기능
function searchCust(word) {
	$.ajax({
		url:"/dailySales/DSJSP/Slip/SlipMgtCustSearch.do",
		data:{keyword:word},
		error: function() {
			
		},
		success: function(e) {
			if(e.indexOf('<input type="hidden" value="OneData">')!=-1){
				$('.CustInfoTable').html(e);
				$('.ledgersTitle').html("거래처원장"+"/"+$('.custName').children('td').html());
			}else if(e.indexOf('<input type="hidden" value="ListData">')!=-1){
				$('#pager').html(e);
			}else if(e.indexOf('<input type="hidden" value="None">')!=-1){
				$('#pager').html(e);
			}
		}
	});
}

//원장조회 기능
function callReport(custCode, start, end){
	$.ajax({
		url:"CustLedgerReport.do",
		type:"POST",
		async: false,
		data: {custCode:custCode, startDate:start, endDate:end},
		error: function(e) {
			console.log(e)
		},
		success: function(e) {
			reportTableArray = JSON.parse(e);
		}
	});
}
//거래처 검색 팝업 닫기
function closeCustList() {
	$('.CustMgtListOverlay').fadeOut(300);
	$('.CustMgtListWrap').fadeOut(300);
	$('.CustMgtListOverlay').delay(300).remove();
	$('.CustMgtListWrap').delay(300).remove();
}

var select, selectLine;
$(document).on('click','.CustMgtTable td', function() {
	$('tbody>tr>td:nth-child(n+2)').css({'background-color':'white','color':'black'});
	select = $(this).parent().children('td:first-child');
	selectLine = $(this).parent().children('td:nth-child(n+2)');
	selectLine.css({
		'background-color':'#4646cc7a',
		'color':'#e5ff97'
	});
});

$(document).on('click','.CustMgtListOverlay, .CustListExitBtn, .custListCancel', function () {
	if(confirm("정말로 닫으시겠습니까?")){
		closeCustList();
	}
});
</script>
	<div class="ledgerWrap">
		<header>
			<div class="ledgersHeader">
				<div class="ledgersTitle">거래처 원장</div>
				<div class="searchCust"><span>거래처 검색</span><input id="custSearchbar" type="text" value=""><input type="hidden" name="custCode" value=""><input id="custSearchButton" type="button" value="검색"></div>
				<div class="custData">
					<table class="CustInfoTable" id="custData">
						<tbody>
						<tr class="custName">
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>메모</td>
							<td colspan="2"></td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="setDate"><span>시작날짜<input id="startDate" type="date" value=""></span><span>종료일자<input id="endDate" type="date"></span></div>
			</div>
			<div class="headerBtn"><input id="reportSelectButton" type="button" value="원장 출력"></div>
		</header>
			
		<section>
			<div class="reportTableDiv table-responsiv">
				<table class="reportTable table">
					<thead>
						<tr>
							<th style="width:40px">No.</th>
							<th style="width:40px">구분</th>
							<th style="width:40px">날짜</th>
							<th style="width:40px">상품명/계좌명</th>
							<th style="width:40px">수량</th>
							<th style="width:40px">가격</th>
							<th style="width:40px">매입액</th>
							<th style="width:40px">부가세</th>
							<th style="width:40px">지출액</th>
							<th style="width:40px">매출액</th>
							<th style="width:40px">부가세</th>
							<th style="width:40px">수금액</th>
							<th style="width:40px">비고</th>
						</tr>
					</thead>
					<tbody id="reportTableBody">
					</tbody>
				</table>			
			
			</div>
		
		
		</section>
	
	<div id="pager"></div>
	</div>
	
</c:otherwise>
</c:choose>

</body>
</html>