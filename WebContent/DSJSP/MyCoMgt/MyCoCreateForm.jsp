<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 생성</title>
<jsp:include page="../HtmlLib.jsp"></jsp:include>
</head>
<style>
html, body {width:100%, height:100%;}

.wrap{width:100%; max-width: 700px; min-width:385px; margin-left:20px;}
header{width:100%; height: 70px; padding-top: 19px;}
.title{font-size: 20px; font-weight: bold; text-align: center;}
 td:first-child{text-align: center; }
 input{font-size: 12px;}
 .table>tbody>tr>td{vertical-align: middle; font-size: 12px;}
.longInput{width:95%;}
.co_code1{width:40px;}
.co_code2{width:30px;}
.co_code3{width:70px;}
.BtnBox{margin:0 auto; text-align: center;}
.postnum{width:70px;}
.div{display: inline-block; margin-left:15px; margin-right:10px;}
.findPost{margin-left: 10px;}
.errorMsg{font-size: 7px; color:red;}
</style>

<body>
<script>
 $(document).ready(function () {
		//다음 주소 API 첫번째 주소
		$('#findPost1').click(function() {
			new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	        }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	            } else {}

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postnum1').value = data.zonecode;
	            document.getElementById("co_addr1").value = addr +" "+ extraAddr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("co_addr1").focus();
	        }
			}).open();
		});
		//다음 주소 API 첫번째 주소
		$('#findPost2').click(function() {
			new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	        }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	            } else {}

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postnum2').value = data.zonecode;
	            document.getElementById("co_addr2").value = addr +" "+ extraAddr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("co_addr2").focus();
	        }
			}).open();
		});
		
		
		//분류 설정 : 첫번째 선택지가 법인이면 마지막의 간이는 선택 불가능하도록 설정
		
		$('input[name="co_div1"]').click(function () {
			var div1 = $('input[name="co_div1"]:checked').val();
			if(div1=="A"){
			}else if(div1=="B"){
				$('[name="co_div3"][value="1"]').attr('checked',false);
				$('[name="co_div3"][value="0"]').attr('checked',true);
			}
			
		});
		
		//검증(정규화)
		
		function wrongInput(inputBar) {
			  $(inputBar).css({
					"border":" solid 2px #ff6a6a",
					"transition": "0.1s",
				});
		};
		function successInput(inputBar){
			$(inputBar).css({
				"border":" solid 2px rgb(100 197 165)",
				"transition": "0.1s",
			});
		}

		var inputBar;
		var data;
		
		$('input[name="co_name"]').focusout(function () {
			data = $(this).val();
			if(data.length>20){
				wrongInput(this);
				$(this).parent().children('div').html("20자 이내로 입력해주세요.");
			}else if(data==""){
				wrongInput(this);
				$(this).parent().children('div').html("회사명은 필수입력사항입니다.");
			}else {
				successInput(this);
				$(this).parent().children('div').html("");
			}
		});
		
		$('input[name="co_code1"]').focusout(function () {
			data = $(this).val();
			if(data==""){
				wrongInput(this);
				$(this).parent().children('div').html("사업자등록번호는 필수입력사항입니다.");
			}else if(data.length<3){
				wrongInput(this);
				$(this).parent().children('div').html("사업자등록번호를 확인해주세요");
			}else {
				successInput(this);
				$(this).parent().children('div').html("");
			}
		});
		
		$('input[name="co_code2"]').focusout(function () {
			data = $(this).val();
			if(data==""){
				wrongInput(this);
				$(this).parent().children('div').html("사업자등록번호는 필수입력사항입니다.");
			}else if(data.length<2){
				wrongInput(this);
				$(this).parent().children('div').html("사업자등록번호를 확인해주세요");
			}else {
				successInput(this);
				$(this).parent().children('div').html("");
			}
		});
		$('input[name="co_code3"]').focusout(function () {
			data = $(this).val();
			if(data==""){
				wrongInput(this);
				$(this).parent().children('div').html("사업자등록번호는 필수입력사항입니다.");
			}else if(data.length<5){
				wrongInput(this);
				$(this).parent().children('div').html("사업자등록번호를 확인해주세요");
			}else {
				successInput(this);
				$(this).parent().children('div').html("");
			}
		});
		
		$('input[name="co_ceo"]').focusout(function () {
			data = $(this).val();
			if(data==""){
				wrongInput(this);
				$(this).parent().children('div').html("이름은 필수입력사항입니다.");
			}else if(data.length>20){
				wrongInput(this);
				$(this).parent().children('div').html("대표자명은 20자 이하여야합니다.");
			}else {
				successInput(this);
				$(this).parent().children('div').html("");
			}
		});
		
		
})

</script>
<c:choose>
	<c:when test="${empty Login}">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			window.location = "../main.jsp";
		</script>
	</c:when>
	<c:otherwise>
	<div class="wrap">
		<header>
			<div class="title">
			관리 회사 생성
			</div>
		</header>
		<section>
			<div class="table-responsiv">
			<form action="MyCoInsert.do" method="post">
				<table class="myCoCreate table table-striped">
					<tr class="line">
						<td class="subject" style="width:20%">회사명*</td>
						<td style="width:80%"><input class="longInput" type="text" name="co_name" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>사업자등록번호*</td>
						<td><input class="co_code1" type="text" name="co_code1" value="" maxlength="3">-<input  class="co_code2" type="text" name="co_code2" value="" maxlength="2">-<input class="co_code3"  type="text" name="co_code3" value="" maxlength="5">
						<div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>대표자명*</td>
						<td><input class="longInput" type="text" name="co_ceo" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>업종</td>
						<td><input type="text" name="co_ind" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>분류</td>
						<td><input type="text" name="co_stk" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>우편번호*</td>
						<td><input id="postnum1" class="postnum" type="text" name="co_post1" value=""  readonly="readonly" ><input id="findPost1" class="findPost" type="button" value="우편번호찾기"></td>
					</tr>
					<tr>
						<td>주소*</td>
						<td><input id="co_addr1" class="longInput" type="text" name="co_addr1" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>우편번호2</td>
						<td><input id="postnum2"  class="postnum" type="text" name="co_post2" value=""  readonly="readonly" ><input id="findPost2"  class="findPost" type="button" value="우편번호찾기"></td>
					</tr>
					<tr>
						<td>주소2</td>
						<td><input id="co_addr2"  class="longInput" type="text" name="co_addr2" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="co_tel" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td><input type="text" name="co_phone" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>팩스</td>
						<td><input type="text" name="co_fax" value=""><div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>사업자구분*</td>
						<td>
						<div class="div"><input type="radio" name="co_div1" value="A">일반(개인)&nbsp&nbsp<input type="radio" name="co_div1" value="B">법인</div>||
						<div class="div"><input type="radio" name="co_div2" value="0" readonly="readonly" >일반&nbsp&nbsp<input type="radio" name="co_div2" value="1" readonly="readonly" >면세(겸업)</div>||
						<div class="div"><input type="radio" name="co_div3" value="0" readonly="readonly" >일반&nbsp&nbsp<input type="radio" name="co_div3" value="1" readonly="readonly" >간이</div>
						<div class="errorMsg"></div></td>
					</tr>
					<tr>
						<td>결산일*</td>
						<td><input type="text" name="co_closing" value="2021-12-31" readonly="readonly"><div class="errorMsg"></div></td>
					</tr>
				</table>
				<div class="BtnBox"><input type="submit" name="CrtCoBtn" value="생성"><input type="button" value="이전" onclick="history.back()"></div>
				
				</form>
			</div>
		</section>
	
	</div>
	</c:otherwise>
</c:choose>
</body>
</html>