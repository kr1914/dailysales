
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전표 입력</title>
<jsp:include page="../HtmlLib.jsp"/>
<script src="../js/colResizable-1.5.min.js"></script>

</head>
<style>
.wrap{width:960px; height:100%; padding-left:10px;}
.SlipHeader{width:1000px; height: 300px; vertical-align: top;}
.SlipInsertTitle{width:1000px; height: 50px; magin-top: 20px;}
.CustInfoContainer{width:420px; display: inline-block; height: 260px; border: solid 1px #cccccc; box-shadow: -2px 4px 8px 2px #e2e2e2; border-radius:19px; padding: 10px; float:left;}
.CustInfoContainer > div { font-weight:bold;}
#custSearchbar{border-radius: 5px;    border: solid 0.5px #a7a7a7;}
#custSearchbar:focus{outline: solid 2px blue; outline-radius:5px;}
#custSearchButton{margin-left: 10px;  border-radius: 5px;  width: 40px;    height: 24px;    border: none;    font-size: 12px;    background-color: #cacaff; font-weight: bold;}
.CustInfoTable { margin-top:30px; border-spacing: 5px; border-collapse: separate;}
.CustInfoTable > tbody > tr > td {margin-top:5px; margin-bottom: 5px; box-shadow: 0px 3px 5px 1px #d8d8d8;}
.CustInfoTable > tbody > tr > td:last-child{width: 200px; padding-left:10px;}
.custName > td{font-size: 20px; font-weight: bold; color: red; margin-top:10px;}
.SalesStateContainer{border-radius:19px; float:left; margin-left:5px; width:300px; display: inline-block;  height: 260px;  border: solid 1px #cccccc;    box-shadow: 3px 4px 8px 2px #e2e2e2; padding: 20px;}
.SalesStateDiv{margin-top: 45px;}
.SalesStateTable{ width:100%;}
.SalesStateTable > tbody > tr > td:first-child { width: 80px; text-align: center; font-size: 15px; padding:4px;}
.SalesStateTable > tbody > tr > td:last-child { width: 130px;  text-align: right;  font-size: 15px;}
#calenderContainer {border-radius:19px; width:230px; height: 260px; padding: 10px; display: inline-block;     box-shadow: 2px 4px 8px 2px #e2e2e2;     border: solid 1px #cccccc;  float:left;  margin-left:5px;}
.calenderBox{width:100%;}
.Slipdate{height:20px;}
.InquireSlip{font-size: 11px; height:20px;}
#calender { margin-top:5px; cursor: default;}
#calender > thead > tr > th, #calender > tbody > tr > td {width:30px; height:20px; text-align: center;}
#calender > thead > tr > th{background-color:#f5caca;}
#calender > thead > tr > th:first-child, #calender > tbody > tr > td:first-child{color:red;}
#calender > thead > tr > th:last-child, #calender > tbody > tr > td:last-child{color:blue;}
#CalenderMonth{vertical-align:top; font-size: 20px; font-weight: bold; margin:0 auto; width:60px; text-align: center; display: inline-block;}
#CalenderYear{margin: 0 auto; width:120px; text-align: center; font-size: 10px;}
.calenderTitle{width:100%; height:50px; margin-top:10px;}
.CalenderBtn{display: inline-block; width: 20px; height:28px;}
.beforeMonth{background-image: url("../../img/direct.png"); background-size:cover; margin-left:50px; cursor: pointer;}
.nextMonth{transform: rotate(180deg); background-image: url("../../img/direct.png"); cursor: pointer; background-size:cover; margin-right:50px;} 
.today{background-color:#866dde; color:white;}
.directImg{width:320; height:100%; scale:1.5;}
.TabBtn{margin: 0 5px 0 5px; border-radius: 10px;}
.TabBtnActiving{border:double 3px white;}
.SalesBtn{ background-color: #ff7373;     color: #fbfde2;    border: none;    height: 30px;    width: 50px;    box-shadow: inset -2px -2px 6px -1px #a52f2f;}
.SalesBtn:active{box-shadow: inset 1px 2px 6px -1px #a52f2f;}
.PurchaseBtn{ background-color: #8583ec;     color: #fbfde2;    border: none;    height: 30px;    width: 50px;    box-shadow: inset -2px -2px 6px -1px #4c49cf;}
.PurchaseBtn:active{box-shadow: inset 1px 2px 6px -1px #4c49cf;}
.expenseBtn{ background-color: #68bb69;     color: #fbfde2;    border: none;    height: 30px;    width: 50px;    box-shadow: inset -2px -2px 6px -1px #085209;}
.expenseBtn:active{box-shadow: inset 1px 2px 6px -1px #085209;}
.journalizingBtn{ background-color: #adadad;     color: #fbfde2;    border: none;    height: 30px;    width: 50px;    box-shadow: inset -2px -2px 6px -1px #636363;}
.journalizingBtn:active{box-shadow: inset 1px 2px 6px -1px #636363;}
.TabBtnContainer{text-align: center;}
td[state="update"]>span>input{text-align: right;    border: solid 0.5px #5fcc5f;    border-radius: 3px;}
td[state="update"]>span>input:focus{outline: solid 2px green;}
<!--아래 테이블 부분-->
.SlipViewerContainer{width:100%; height: 500px;}
#SlipViewer{width:960px;  }
#SlipViewer th{border: solid 1px #c7c7c7; text-align: center; overflow-x:hidden;}
#SlipViewer td{border: solid 1px #c7c7c7;}
#SlipData td:nth-child(n+4){text-align: right;}
#SlipData td:nth-child(1), #SlipData td:nth-child(2) ,#SlipData td:nth-child(3){text-align: center;}
#SlipData > tr:nth-child(2n) > td{background-color:#f1f1f1;}
.SlipInput{width:100%; height: 22px;}
#rowCreate{border: none;  border-radius: 5px;  margin: 5px;    font-size: 11px;    width: 50px;    height: 20px;    font-weight: bold;    background-color: #ffd2d2;}
#rowDelete{border: none;  border-radius: 5px;  margin: 5px;    font-size: 11px;    width: 60px;    height: 20px;    font-weight: bold;    background-color: #93c3ff;}
.SlipController{text-align: right; width:100%;}
#save{border: none;    margin: 5px;   border-radius: 5px; font-size: 12px;    width: 50px;    height: 30px;    font-weight: bold;    background-color: #c9dcf9;}
#reset{    border: none;    margin: 5px;  border-radius: 5px;  font-size: 12px;    width: 50px;    height: 30px;    font-weight: bold;    background-color: #d6fbc4;}


</style>
<script type="text/javascript">

//달력 날짜 클릭시 css효과
function clickDate(date) {
	$('#date>tr>td').removeClass('today');
	date.attr('class','today');
}

//날짜 선택시 효과
function dateFocus(n) {
	var day = new Array();
	var tt;
	$('#date>tr>td').each(function (index, item) {
		if($(item).text()==n){
			clickDate($(item));
		}
	});
}

var SlipData = new Array(); //전표 송신시 사용하는 객체배열

//전표 저장 기능
function saveSlip(data) {
	$.ajax({
		url:"saveSlip.do",
		data : {target:JSON.stringify(data)},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success: function(e) {
			dateFocus($('input[name="date"]').val());
			alert("저장완료");
		}
	});
}


$(document).on('click','#save', function() {
	resetSlipInput(); //input 모드로 되어있는행 없애기
	rowRemove(); // 전표정보 없는 행 삭제
	slipsData(); //전표정보 배열 타입으로 저장
	saveSlip(SlipData); //저장기능 실행
	calSales(); //매출액 계산
});

//합계표 계산식
function calSales() {
	var sal=0;
	var vat=0;
	var amt=0;
	var col=0;
	var gap=0;
	$('td[class="amount"]').each(function(index, item) { //매출계산
		if($(this).attr('state')=="view"){
			sal = Number(sal) + Number($(item).children('span').text());	
		}else{
			sal = Number(sal) + Number($(item).children('span').children('input').val());
		}
	});
	$('td[class="vat"]').each(function(index, item) { //부가세
		if($(this).attr('state')=="view"){
			vat = Number(vat) + Number($(item).children('span').text());	
		}else{
			vat = Number(vat) + Number($(item).children('span').children('input').val());
		}
	});
	amt = Number(sal) + Number(vat);
	$('td[class="collect"]').each(function(index, item) { //부가세
		if($(this).attr('state')=="view"){
			col = Number(col) + Number($(item).children('span').text());	
		}else{
			col = Number(col) + Number($(item).children('span').children('input').val());
		}
	});
	gap = amt - col;
	
	$('#sal').text(sal);
	$('#vat').text(vat);
	$('#amt').text(amt);
	$('#col').text(col);
	$('#gap').text(gap);
	
}

//현금입력하기
function cashInput() {
	var update = $('#SlipData td[class="collect"][state="update"]');
	update.children('input[name="colType"]').val("101");
	update.children('input[name="acct_code"]').val('1');
	update.children('span').children('input').removeAttr('readonly');
	closePop();
}
//계좌선택 팝업
function accountInput() {
	$.ajax({
		url:"SlipMgtAcctListPop.do",
		error: function() {
			alert("연결 오류");
		},
		success: function(e) {
			$('#pager').html(e);
		}
		
	})
}


//수금선택창 팝업 닫기
function closePop(){
	$('#Pop').fadeOut();
}


$(document).on('keydown','#Pop', function() {
	var sel = $(this).children('input[selected]').val();
	if(sel == "101"){
		
	}else if(sel == "102"){
		
	}
});







//'yyyy-MM-dd형식으로 날짜값 받아서 달력 구성해주고 dd값의 날짜 css효과 함수'
function calend(today) {
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	month = (month < 10) ? '0'+month : month; // 10월이전 앞에 0붙이기
	var first = year+"-" +month +"-"+"01"; //이번달 1일
	var dayOfWeek = new Date(first).getDay();
	var count = [31,28,31,30,31,30,31,31,30,31,30,31]; //월별 일수
	if(year%4==0||year%100==0||year%400==0){ //윤년 체크
		count[1] = 29;
	};
	var mon = count[today.getMonth()]; //이번달 날짜수
	var calender =""; //달력 html 코드
	var day = 1;
	while(day<=mon){
		calender = calender + "<tr>";
		dayOfWeek++;
		for(var i=1;i<8;i++){
			if(dayOfWeek%8 == i){
				if(day<=mon){
					calender = calender + "<td>"+day+"</td>";
				}else if(day>mon){
					calender = calender + "<td></td>";
				}
				day++;
				dayOfWeek++;
			}else if(day<=mon){
				calender = calender + "<td></td>";
			}
		}
		calender = calender + "</tr>";
	}
	$('#date').html(calender);
	$('#CalenderMonth').text(today.getMonth()+1+"월");
	$('#CalenderYear').text(year+"년");
	dateFocus(today.getDate());
}


//각 리스트 창 닫기

function closeCustList() {
	$('.CustMgtListOverlay').fadeOut(300);
	$('.CustMgtListWrap').fadeOut(300);
	$('.CustMgtListOverlay').delay(300).remove();
	$('.CustMgtListWrap').delay(300).remove();
}

function closeStkList() {
	$('.StkMgtListOverlay').fadeOut(300);
	$('.StkMgtListWrap').fadeOut(300);
	$('.StkMgtListOverlay').delay(300).remove();
	$('.StkMgtListWrap').delay(300).remove();
}

function closeAcctList() {
	$('.AcctMgtListOverlay').fadeOut(300);
	$('.AcctMgtListWrap').fadeOut(300);
	$('.AcctMgtListOverlay').delay(300).remove();
	$('.AcctMgtListWrap').delay(300).remove();
}



//탭 선택 기능
function tabCSSChange(tab) {
	
	$('input[name="nowTab"]').val(tab);
	var container = $('.CustInfoContainer, .SalesStateContainer, #calenderContainer');
	if(tab=="매출"){ //#ffb3b3 , 
		container.css({
			'box-shadow':'2px 4px 8px 2px #ffb3b3',
			'border':'solid 1px #ffb3b3'
		});
	}else if(tab=='매입'){
		container.css({
			'box-shadow':'2px 4px 8px 2px #9593fd',
			'border':'solid 1px #9593fd'
		});
	}else if(tab=="비용"){
		container.css({
			'box-shadow':'2px 4px 8px 2px #91e492',
			'border':'solid 1px #91e492'
		});
	}else if(tab=="수동"){
		container.css({
			'box-shadow':'2px 4px 8px 2px #e2e2e2',
			'border':'solid 1px #e2e2e2'
		});
	}
}

$(document).ready(function() {
	
	//탭 선택(매출,매입,비용,수동), 초기값 매출
	tabCSSChange("매출");	
	$('.TabBtn').click(function() {
		tabCSSChange($(this).val());
		slipTableReset($(this).val());
		custContainerReset();
		$('#custSearchbar').select();
	});
	
	$('#SlipViewer').colResizable({ //전표입력창 사이즈 조절 기능 추가
		resizeMode:'flex',
		headerOnly:'true',
		liveDrag:true,
		postbackSafe: true,
	});
	
	//거래처 검색 및 불러오기
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
	
	//초기 달력설정
	var tDay = new Date();
	calend(tDay);
	$('.Slipdate').val(new Date().toISOString().slice(0,10)); //오늘날짜 넣기
	
	//월 변경시
		$('.beforeMonth').click(function() {
			var yy = $('#CalenderYear').text().replace("년","");
			var mm = $('#CalenderMonth').text().replace("월","");
			if(mm!=1){
				mm = Number(mm)-1;
				if(mm<10){
					mm = "0"+mm;
				}
			}else {
				yy = yy-1;
				mm = "12";
			}
			var cgmt = yy+"-"+mm+"-01";
			var beforeM = new Date(cgmt);
			calend(beforeM);
		});
	
		$('.nextMonth').click(function() {
			var yy = $('#CalenderYear').text().replace("년","");
			var mm = $('#CalenderMonth').text().replace("월","");
			if(mm!=12){
				mm = Number(mm)+1;
				if(mm<10){
					mm = "0"+mm;
				}
			}else {
				yy = Number(yy)+1;
				mm = "01";
			}
			var cgmt = yy+"-"+mm+"-01";
			var nextM = new Date(cgmt);
			calend(nextM);
			
		});
	
	//input날짜 변경시
	$('.Slipdate').keyup(function(event) {
			if(event.keyCode == 13){
				word = $('.Slipdate').val();
				var d = new Date(word);
				calend(d);
			}
		});
});
//상품명 검색시

	$(document).on('keyup','input[name="stk_name"]', function(event) {
		if(event.keyCode == 13){
		searchStock($(this).val());
		}
	});

//달력에서 날짜 선택시
	$(document).on('click','#date>tr>td', function () {
		var td = $(this);
		clickDate(td);
		var yy = $('#CalenderYear').text().replace("년","");
		var mm = $('#CalenderMonth').text().replace("월","");
		if(Number(mm)<10){
			mm = "0"+mm;
		}
		var dd = td.text();
		if(dd!=""){ //날짜부분 공란이면 date박스 변경하지 않음
			const offset = new Date().getTimezoneOffset()*60000;
		
			var date = new Date(new Date(yy+"-"+mm+"-"+dd)-offset).toISOString().slice(0,10);
			$('.Slipdate').val(date);
		}
		$('#custSearchbar').select();
	});

	
	var values = new Array();
	var names = new Array();
//원래대로 돌아가기
	function resetSlipInput() {
		$('#SlipData td[state="update"]').each(function(index, item) {
			values[index] = $(item).children('span').children('input[type="text"]').val();
			$(item).children('span').text(values[index]);
			$(item).attr('state','view');
		});
	}
//삭제 버튼클릭시
	$(document).on('click','#rowDelete', function() { //
		var tran_index = $('#SlipData td[state="update"][class="memo"]').parent().children('td[class="no"]').children('input[name="tran_index"]').val();
		if(tran_index == null || tran_index == ""){
			$('#SlipData td[state="update"][class="memo"]').parent().remove();
		}else {
			deleteSlip(tran_index);
			$('#SlipData td[state="update"][class="memo"]').parent().remove();
		}
	});

//전표 테이블 클릭시 해당 행 입력가능하게 수정 후 누른 부분을 포커스 
	$(document).on('click','#SlipData td:nth-child(n+2)', function() {
		updateSlipInput($(this));
		calSales();
	});
	
	$(document).on('click','.CustMgtListOverlay, .CustListExitBtn, .custListCancel', function () {
		if(confirm("정말로 닫으시겠습니까?")){
			closeCustList();
		}
	});
	$(document).on('click','.StkMgtListOverlay', function() {
		if(confirm("정말로 닫으시겠습니까?")){
			closeStkList();
		}
	});
	
	$(document).on('click','.AcctMgtListOverlay', function() {
		if(confirm("정말로 닫으시겠습니까?")){
			closeAcctList();
		}
	});
//수량입력시 엔터
	$(document).on('keyup','input[class="SlipInput"][name="quantity"]', function(e) {
		if(e.keyCode== 13){
			$('input[class="SlipInput"][name="price"]').select();
		}
	});

//메모에서 행추가
	$(document).on('keydown','input[class="SlipInput"][name="memo"]', function(e) {
		var shiftTab = e.keyCode || e.which;
		if(shiftTab == 9){
			if(e.shiftKey){
				$(this).parent().parent('td[class="collect"]').children('span').children().select();
			}else {
				if($(this).closest('tr').is(':last-child')){
					SlipTableRowCreate();
					calSales();
					updateSlipInput($('#SlipData > tr:last-child > td[class="no"]'));
				}else{
					var index = $(this).closest('tr').index()+2;
					var tds = $('#SlipData > tr:nth-child('+index+') > td[class="no"]');
					updateSlipInput(tds);
					calSales();
				}	
			}
		}
	});
//거래처 정보 초기화
	function custContainerReset() {
		$('input[name="custName"]').val(""); //거래처입력부분 초기화
		$('.CustInfoTable').html('<tr class="custName"><td colspan="2">&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>메모</td><td colspan="2"></td></tr>');
		}
//전표 정보초기화
	function slipTableReset(tab){
	 var table = $('#SlipViewer');
	 table.html("");
	 $.ajax({
		 url:"changTab.do",
		 data:{tab:tab},
		 error: function() {
			alert("에러");
		},
		success: function(page) {
			if(page.indexOf('<input type="hidden" value="expense"/>') != -1){
				$('#custSearchbar').attr('disabled','disabled');
			}else {
				$('#custSearchbar').removeAttr('disabled');
			}
			table.html(page);
		}
	 });
	}
	
	
	
	//매출에만 쓰는 것
	
	//전표 삭제
	
	function deleteSlip(tran_index) {
		$.ajax({
			url:"SlipDelete.do",
			data:{tran_index:tran_index},
			error: function() {
				alert("에러");
			},
			success: function() {
				alert("삭제");
			},
		})
	}
	
	//수금선택창 팝업

function CollectPop(td) {
	var wid = td.css('width');
	var divX = td.offset().left;
	var divY = td.offset().top;
	
	$('#pager').html('<div id="Pop"><input type="radio" name="paymentMethod" value="현금">현금||<input type="radio" name="paymentMethod" value="계좌" checked="checked">계좌 <input type="button" value="X" onclick="closePop()"></div>');
	$('#Pop').css({
		'width':wid,
		'height':'30px',
		'background-color':'#333333',
		'position':'fixed',
		'left':divX,
		'top':divY-32,
		'color':'#fff3b6',
		'box-sizing':'border-box',
		'border':'double 2px #4cb3ff',
		
	});
	$('#Pop input[type="button"]').css({
		'color':'black',
		'width':'30px',
	});
	$('#Pop').fadeIn(500);
	$('#Pop').children('input[value="102"]').focus();
	$('#Pop').keyup(function(e) {
		if(e.keyCode == 13){
			if($('input[name="paymentMethod"][value="현금"]').is(':checked')){
				cashInput();
			}else if($('input[name="paymentMethod"][value="계좌"]').is(':checked')){
				accountInput();
			}
		}
	});
	$(this).focusout(function() {
	});
}
	
//전표 조회 기능
function selectSlips(custcode, date, tab) {
	$.ajax({
		url:"selectSlips.do",
		data: {custcode:custcode, date:date, tab:tab},
		error: function() {
			alert("조회 실패");
		},
		success: function(e) {
			$('#SlipData').html(e);
			SlipTableRowCreate();
			SlipTableRowCreate();
		}
	});
}
	
//단가*수량 계산기능(VAT)
function calculateSlip() {
	var quantity = $('#SlipData td[class="quantity"][state="update"]').children('span').children('input');
	var price = $('#SlipData td[class="price"][state="update"]').children('span').children('input');
	var cal = $('#SlipData td[class="amount"][state="update"]').children('span').children('input');
	var vat = $('#SlipData td[class="vat"][state="update"]').children('span').children('input');
	var vatCheck = $('#SlipData td[class="stk_name"][state="update"]').children('input[name="stk_vat"]');
	
	cal.val(quantity.val()*price.val());
	if(vatCheck.val()=="과세"){
		vat.val(Math.round(cal.val()/11));
		cal.val(Math.round(cal.val()/1.1));
		price.val(Math.round(price.val()/1.1));
	}
	$('input[class="SlipInput"][name="collect"]').select();
}
	
//상품 선택 기능
function selectStock(stk_code, stk_name, stk_vat, stk_size) {
	var update = $('#SlipData td[class="stk_name"][state="update"]');
	update.children('span').children('input[name="stk_name"]').val(stk_name);
	update.children('input[name="stk_code"]').val(stk_code);
	update.children('input[name="stk_vat"]').val(stk_vat);
	update.parent().children('td[class="stk_size1"]').children('span').val(stk_size);
	update.parent().children('td[class="quantity"]').children('span').children('input').select();
	update.parent().children('td[class="collect"]').children('span').children('input').attr('disabled','disabled');
}
	
//상품 조회 기능
function searchStock(word){
	$.ajax({
		url:"SlipMgtStockSearch.do",
		data:{keyword:word},
		errorr: function() {
			alert("연결오류");
		},
		success: function(e) {
			if(e.indexOf('<input type="hidden" value="OneDataStk">')!=-1){
				$('#pager').html(e);
				selectStock(t1, t2, t3, t4);
			}else if(e.indexOf('<input type="hidden" value="ListDataStk">')!=-1){
				$('#pager').html(e);
			}else if(e.indexOf('<input type="hidden" value="NoneStk">')!=-1){
				$('#pager').html(e);
			}
		}
	})
}
	
	//전표저장시 데이터 없는 행 삭제
function rowRemove() {
	var tablerow = $('#SlipData tr').length;
	for (var n=0; n<tablerow;n++){
		var stk = $('#SlipData td[class="stk_name"]').eq(n).children('input[name="stk_code"]');
		var col = $('#SlipData td[class="collect"]').eq(n).children('span').text()
		if(stk.val() == "" && col == ""){
			stk.parent().parent().remove();
		}
	}
	tablerow = $('#SlipData tr').length;
	for(var n=0; n<tablerow; n++){
		$('#SlipData td[class="no"]').eq(n).children('span').text(n+1);
	}
}
	//거래처 검색 기능
function searchCust(word) {
	$.ajax({
		url:"SlipMgtCustSearch.do",
		data:{keyword:word},
		error: function() {
			
		},
		success: function(e) {
			if(e.indexOf('<input type="hidden" value="OneData">')!=-1){
				$('.CustInfoTable').html(e);
				$('#custSearchbar').val("");
				selectSlips($('input[name="cust_code"]').val(),$('input[name="date"]').val(), $('input[class="nowTab"]').val());
			}else if(e.indexOf('<input type="hidden" value="ListData">')!=-1){
				$('#pager').html(e);
			}else if(e.indexOf('<input type="hidden" value="None">')!=-1){
				$('#pager').html(e);
			}
		}
		
	});
}
	
	//전표데이터 추출 (매출, 매입)
function slipsData() {
	var tablerow = $('#SlipData tr').length; //테이블 행 수
	var SlipTabMode = $('input[name="nowTab"]').val();
	for (var i = 0; i<tablerow; i++){ //각 행에서 데이터 추출해 SlipData 배열에 저장
		var slipT;
		var note
		if(SlipTabMode=="매출"){
			if($('#SlipData td[class="stk_name"]').eq(i).children('input[name="stk_code"]').val() != null && $('#SlipData td[class="stk_name"]').eq(i).children('input[name="stk_code"]').val() != ""){
				slipT = "매출";
				note = $('#SlipData td[class="memo"]').eq(i).children('span').text();
			}else if($('#SlipData td[class="collect"]').eq(i).children('input[name="colType"]').val() == "101" || $('#SlipData td[class="collect"]').eq(i).children('input[name="colType"]').val() == "102"){
				slipT = "수금";
				note = "";
			}
		}else if(SlipTabMode=="매입"){
			if($('#SlipData td[class="stk_name"]').eq(i).children('input[name="stk_code"]').val() != null && $('#SlipData td[class="stk_name"]').eq(i).children('input[name="stk_code"]').val() != ""){
				slipT = "매입";
				note = $('#SlipData td[class="memo"]').eq(i).children('span').text();
			}else if($('#SlipData td[class="collect"]').eq(i).children('input[name="colType"]').val() == "101" || $('#SlipData td[class="collect"]').eq(i).children('input[name="colType"]').val() == "102"){
				slipT = "지출";
				note = "";
			}
		}else if(SlipTabMode=="비용"){
			
		}
		
		SlipData[i] = {
				custcode: $('.CustInfoTable input[name="cust_code"]').val(),
				date : $('#calenderDateViewer input[name="date"]').val(),
				tran_index : $('input[name="tran_index"]').eq(i).val(),
				stkcode: $('#SlipData td[class="stk_name"]').eq(i).children('input[name="stk_code"]').val(),
				quantity: $('#SlipData td[class="quantity"]').eq(i).children('span').text(),
				price: $('#SlipData td[class="price"]').eq(i).children('span').text(),
				amount: $('#SlipData td[class="amount"]').eq(i).children('span').text(),
				vat: $('#SlipData td[class="vat"]').eq(i).children('span').text(),
				collect: $('#SlipData td[class="collect"]').eq(i).children('span').text(),
				type: $('#SlipData td[class="collect"]').eq(i).children('input[name="colType"]').val(),
				acct_code: $('#SlipData td[class="collect"]').eq(i).children('input[name="acct_code"]').val(),
				slipType: slipT,
				memo: note,
		}
	}
}
	//계좌 선택 기능
function selectAcct(code, name) {
	var update = $('#SlipData td[class="collect"][state="update"]'); //입력중인 수금칸 td
	update.children('input[name="colType"]').val("102"); //수금 타입 입력
	update.children('input[name="acct_code"]').val(code); //수금
	update.next('td').children('span').children('input[name="memo"]').val(name); //비고란에 계좌이름 입력
	update.next('td').children('span').children('input[name="memo"]').attr('readonly','readonly');
	update.children('span').children('input').removeAttr('readonly');
	$('#SlipData td[class="stk_name"][state="update"]').children('span').children('input[name="stk_name"]').attr('disabled','disabled');
	update.children('span').children('input').select();
}
	//전표 테이블 행추가 버튼(매출매입)
function SlipTableRowCreate() {
	var lastRow = $('#SlipData tr:last-child').index()+2;
	var tab = $('input[name="nowTab"]').val();
	if(tab == "매출" || tab == "매입"){
	var row = '<tr><td class="no" state="view"><span>'+lastRow+'</span><input type="hidden" name="tran_index" value=""></td>	<td class="stk_name" state="view"><span></span><input type="hidden" name="stk_code" value=""><input type="hidden" name="stk_vat" value=""></td><td class="stk_size1" state="view"><span></span></td><td class="quantity" state="view"><span></span></td><td class="price" state="view"><span></span></td><td class="amount" state="view"><span></span></td><td class="vat" state="view"><span></span></td><td class="collect" state="view"><span></span><input type="hidden" name="colType" value=""><input type="hidden" name="acct_code" value=""></td><td class="memo" state="view"><span></span></td></tr>';
	}else if(tab == "비용"){
		var row = '<tr><td class="no" state="view"><span>'+lastRow+'</span><input type="hidden" name="tran_index" value=""></td><td class="sub_name" state="view"><span></span></td><td class="sub_code" state="view"><span></span></td><td class="payment_select" state="view"><select name="select_payment"><option value="계좌">계좌</option>	<option value="거래처">거래처</option></select>	</td><td class="cust_name" state="view"><span></span><input type="hidden" name="cust_code" value=""></td><td class="payment" state="view"><span></span><input type="hidden" name="payment_code" value=""></td><td class="amount" state="view"><span></span></td><td class="vat" state="view"><span></span></td>	<td class="memo" state="view"><span></span></td></tr>';
	} 
	$('#SlipData').append(row);
}
//계정과목 검색 창
function subPopup(sub_name) {
	$.ajax({
		url:"subPopup.do",
		data: {sub_name:sub_name},
		error: function() {
			
		},
		success: function(data) {
			if(data.indexOf('<input type="hidden" value="one"/>') != -1){
				alert("");
			}else if(data.indexOf('<input type="hidden" value="List"/>') != -1){
				$('#pager').html(data);
			} 
		}
	});
}
//계정과목 선택기능
	function selectSubTable(td) {
		var tdIndex = $('#SlipData td[state="update"]').index();
		td.parent().children('td').each(function(index, item) {
			if(index == 0){
				$('#SlipData td[class="sub_code"]').eq(tdIndex-1).children('span').text($(item).text());
			}else if(index == 1){
				$('#SlipData td[class="sub_name"]').eq(tdIndex-1).children('span').children('input').val($(item).text());
			}
		});
	}
	//계정과목 더블클릭시 선택 기능
	$(document).on('dblclick','.SubTable td', function() {
		selectSubTable($(this));
		closeSubPop();
	});

$(document).on('keyup','input[class="SlipInput"][name="sub_name"]', function(e) {
	if(e.keyCode == 13){
		subPopup($(this).val());
	}
})
	
//가격입력시 엔터, 포커스 아웃 하면 부가세 계산 (매출매입)
$(document).on('keyup','input[class="SlipInput"][name="price"]', function(e) {
	if(e.keyCode== 13){
		$('input[class="SlipInput"][name="memo"]').select();
	}
});
$(document).on('focusout','input[class="SlipInput"][name="price"]', function() {
	calculateSlip();
});

$(document).on('keyup','input[class="SlipInput"][name="collect"]', function(e) {
	if(e.keyCode == 13){
		CollectPop($(this));
	}
});
$(document).on('click','#reset', function() {
	selectSlips($('input[name="cust_code"]').val(),$('input[name="date"]').val(), $('input[class="nowTab"]').val());
});	

//Slip테이블 Input모드로 변경 하단부 매출/매입/비용/수동에 따라서 다르게 불러오기(매출매입)
function updateSlipInput(td) {
	var nowTab = $('input[name="nowTab"]');
	if(nowTab.val()=="매출"|| nowTab.val()=="매입"){
		if(td.attr('state')=="view"){
			resetSlipInput(); //다른부분에 인풋으로 되어있다면 원래대로 수정
			
			td.parent().children('td').children('span').each(function(index, item) {
				values[index] = $(item).text();
				names[index] = $(item).parent().attr('class');
				if(index==0 || index == 2){
					
				}else {
				$(item).text("");
				$(item).html('<input class="SlipInput" type="text" name="'+names[index]+'" value="'+values[index]+'">');
				$(item).parent().attr('state','update');
				$('#SlipData td[state="update"][class="collect"] > span > input').attr('placeholder','Enter를 눌러 입력할 수 있습니다.');
				$('#SlipData td[state="update"][class="collect"] > span > input').attr('readonly','readonly');
				}
			});
		}
		//매출,매입
		if($('#SlipData td[class="stk_name"][state="update"]').children('input[name="stk_code"]').val() != "" || $('#SlipData td[class="stk_code"][state="update"]').children('input[name="stk_code"]').val() != null){
			$('#SlipData td[class="collect"][state="update"]').children('span').children('input[name="collect"]').attr('disabled','disabled');
		}
		if($('#SlipData td[class="collect"][state="update"]').children('span').children('input[name="collect"]').val() != "" || $('#SlipData td[class="collect"][state="update"]').children('span').children('input[name="collect"]').attr('readonly') != "readonly"){
			$('#SlipData td[class="stk_name"][state="update"]').children('span').children('input[name="stk_name"]').attr('disabled','disabled');
		}
	}else if(nowTab.val()=="비용"){
		resetSlipInput();
		td.parent().children('td').children('span').each(function(index, item) {
			values[index] = $(item).text();
			names[index] = $(item).parent().attr('class');
			if(index==0 || index == 2 || index == 4){
				
			}else {
			$(item).text("");
			$(item).html('<input class="SlipInput" type="text" name="'+names[index]+'" value="'+values[index]+'">');
			$(item).parent().attr('state','update');
			}
		});
	}
	

	td.children('span').children('input').select();
}

</script>
<body>
<c:choose>
	<c:when test="${empty ID}">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
		</script>
	</c:when>
	<c:otherwise>
	

<div class="wrap">
	<div class="SlipInsertTitle"><h3>전표입력</h3></div>
	<div class="SlipHeader">
		<div class="CustInfoContainer">
			<div>
				거래처명 <input id="custSearchbar" type="text" name="custName" value=""><input id="custSearchButton" type="button" value="찾기">
				</div>
			<table class="CustInfoTable">
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
			</table>
		</div>
		<div class="SalesStateContainer">
			<div class="TabBtnContainer">
				<input class="TabBtn SalesBtn"  type="button" value="매출">
				<input class="TabBtn PurchaseBtn"  type="button" value="매입">
				<input class="TabBtn expenseBtn"  type="button" value="비용">
				<input class="TabBtn journalizingBtn"  type="button" value="수동">
				<input class="nowTab" name="nowTab" type="hidden" value="매출">
			 </div>
			<div class="SalesStateDiv">
				
				<table class="SalesStateTable">
					<tr>
						<td>매출액</td>
						<td id="sal"></td>
					</tr>
					<tr>
						<td>부가세</td>
						<td id="vat"></td>
					</tr>
					<tr>
						<td>합계</td>
						<td id="amt"></td>
					</tr>
					<tr>
						<td>수금액</td>
						<td id="col"></td>
					</tr>
					<tr>
						<td>차액</td>
						<td id="gap"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="calenderContainer">
			<div id="calenderDateViewer"><input class="Slipdate" type="date" name="date" value=""><input class="InquireSlip" type="button" value="전표조회"></div>
			<div>
				<div></div>
				<div class="calenderBox">
					<div class="calenderTitle">
						<div id="CalenderYear"></div>
						<div class="beforeMonth CalenderBtn"> </div>
						<div id="CalenderMonth"></div>
						<div class="nextMonth CalenderBtn"></div>
					</div>
					<div><table id="calender">
						<thead>
							<tr>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
						</thead>
						<tbody id="date">
		
						</tbody>
					</table></div>
				</div>
			</div>
		</div>
	</div>


<!-- 타이틀,  -->
<div class="SlipViewerContainer">
	<div class="tableController">
		<input id="rowCreate" type="button" value="행추가" onclick="SlipTableRowCreate()">
		<input id="rowDelete" type="button" value="전표삭제" >
	</div>
	<div>
	<table id="SlipViewer">
		<thead>
			<tr>
				<th width="5%">No</th>
				<th width="15%">상품명</th>
				<th width="10%">규격</th>
				<th width="10%">수량</th>
				<th width="10%">단가</th>
				<th width="15%">공급가액</th>
				<th width="15%">부가세</th>
				<th width="15%">수금액</th>
				<th width="10%">비고</th>
			</tr>
		</thead>
		<tbody id="SlipData">
			<tr>
				<td class="no" state="view"><span>1</span><input type="hidden" name="tran_index" value=""></td>
				<td class="stk_name" state="view"><span></span><input type="hidden" name="stk_code" value=""><input type="hidden" name="stk_vat" value=""></td>
				<td class="stk_size1" state="view"><span></span></td>
				<td class="quantity" state="view"><span></span></td>
				<td class="price" state="view"><span></span></td>
				<td class="amount" state="view"><span></span></td>
				<td class="vat" state="view"><span></span></td>
				<td class="collect" state="view"><span></span><input type="hidden" name="colType" value=""><input type="hidden" name="acct_code" value=""></td>
				<td class="memo" state="view"><span></span></td>
			</tr>
			<tr>
				<td class="no" state="view"><span>2</span><input type="hidden" name="tran_index" value=""></td>
				<td class="stk_name" state="view"><span></span><input type="hidden" name="stk_code" value=""><input type="hidden" name="stk_vat" value=""></td>
				<td class="stk_size1" state="view"><span></span></td>
				<td class="quantity" state="view"><span></span></td>
				<td class="price" state="view"><span></span></td>
				<td class="amount" state="view"><span></span></td>
				<td class="vat" state="view"><span></span></td>
				<td class="collect" state="view"><span></span><input type="hidden" name="colType" value=""><input type="hidden" name="acct_code" value=""> </td>
				<td class="memo" state="view"><span></span></td>
			</tr>
		</tbody>
	</table>
	</div>
	<div class="SlipController"><input id="save" type="button" value="저장"><input id="reset" type="button" value="초기화"></div>
	
</div>
	<div id="pager"></div>
	</div>
	
		</c:otherwise>
</c:choose>
</body>
</html>