<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<Style>
.CustMgtInsertOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.CustMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.CustInsertTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.CustInsertExitBtn{	position: absolute;	right: 5px;	top: 5px; cursor: pointer;}
.CustInsertExitBtn > img {width:20px;}
.CustInsertTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.CustInsertTable td{ padding: 5px 0 5px 0; font-size:11px;}
.CustInsertTable td:nth-child(2n-1){width:130px;}
.CustInsertTable td:nth-child(2n){text-align: left; padding-right:10px; width: 150px;}
.CustInsertTable textarea{border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.custInput {border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.custInput:focus, .CustInsertTable textarea:focus { outline:none; border: solid 1px red;}
.custInputBtn {width:70px; height: 25px; margin:5px 10px 5px 10px;}
.custInputBtn:first-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #1b3fef, #171a8b87); color: white; border-radius: 6px; font-weight: bold;}
.custInputBtn:last-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
</Style>
<script type="text/javascript">
	$(document).on('click','.findPost1, .findPost2', function() {
			var post1or2 =$(this).attr('class');
			
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
		            if(post1or2=="findPost1"){
			            $('input[name="cust_post1"]').val(data.zonecode);
			            $('input[name="cust_addr1"]').val(addr +" "+ extraAddr);
			            $('input[name="cust_addr1"]').focus();
			            
		            }else {
		            	 $('input[name="cust_post2"]').val(data.zonecode);
				         $('input[name="cust_addr2"]').val(addr +" "+ extraAddr);
				         $('input[name="cust_addr2"]').focus();
		            }
		        }
				}).open();
		});
	
//데이터 검증
	$(document).on('click','input[type="submit"]', function() {
		var check = new Array();
		var memo = $('textarea[name="cust_memo"]').val();
		var regex_name = /[0-9]|[a-z]|[A-Z]|[가-힣]/;
		var regex_bizcode = /\d{3}-\d{2}-\d{5}$/; //사업자 등록번호
		var regex_postcode = /[0-9]$/;
		var regex_tel = /^[가-힣a-zA-Z-]/;
		
		//jquery의 배열 활용 _ 
		$('.custInput').each(function name(index, item) {
			check.push($(item).val());
		});
		
		//사업자명,구분,사업자등록번호,대표자명,업종,종목,우편번호,주소,우편번호2,주소2,연락처,휴대전화,팩스,이메일,계좌번호
		if(check[0]==""){
			alert("거래처명은 필수입력사항입니다.");
			return false;
		}else if(check[0].length>45){
			alert("거래처명은 최대 45자입니다.");
			return false;
		}else if(check[1].length>20){
			alert("구분 항목은 최대 20자입니다.");
			return false;
		}else if(check[2]!=""){
			if(regex_bizcode.test(check[2])){
			
			}else {
				alert("사업자등록번호 형식을 확인해 주세요.");
				return false;
			}
		}else if(check[3].length>30){
			alert("대표자명은 최대 30자입니다.");
			return false;
		}else if(check[4].length>30){
			alert("업종은 최대 30자입니다.");
			return false;
		}else if(check[5].length>30){
			alert("종목은 최대 30자입니다.");
			return false;
		}else if(check[6]!=""){
			if(regex_postcode.test(check[6])){
			}else {
				alert("우편번호는 숫자만 입력가능합니다.");
				return false;
			}				
		}else if(check[7].length>99){
			alert("주소는 99자 이내로 입력해주세요.");
			return false;
		}else if(check[8]!=""){
			if(regex_postcode.test(check[8])){
			}else {
				alert("우편번호는 숫자만 입력가능합니다.");
				return false;
			}
		}else if(check[9].length>99){
			alert("주소는 99자 이내로 입력해주세요.");
			return false;
		}else if(check[10]!=""){
			if(!regex_tel.test(check[10])){
			}else {
				alert("전화번호는 숫자 혹은 '-'만 가능합니다.");
				return false;
			}
		}else if(check[11]!=""){
			if(regex_tel.test(check[11])){
			}else {
				alert("전화번호는 숫자 혹은 '-'만 가능합니다.'");
				return false;
			}
		}else if(check[12]!=""){
			if(regex_tel.test(check[12])){
			}else {
				alert("전화번호는 숫자 혹은 '-'만 가능합니다.");
				return false;
			}
		}else if(check[13].length>45){
			alert("이메일은 최대 45자입니다.");
			return false;
		}else if(check[13].length>40){
			alert("계좌번호는 최대 40자입니다.");
			return false;
		}
	
	});

	
</script>
	<div class="CustMgtInsertOverlay">
	</div>
	<div class="CustMgtInsertWrap">
		<div class="CustMgtWrap">
			<form action="CustMgtInsert.do">
				<div class="CustInsertTitle">
				거래처 생성
				<div class="CustInsertExitBtn"><img src="../../img/exit_01.png" alt="닫기"></div>
				</div>
				<div class="CustInsertTable">
				<table>
					<tr>
						<td>거래처명*</td>
						<td><input class="custInput" type="text" name="cust_name" value=""></td>
						<td>구분</td>
						<td><input class="custInput" type="text" name="cust_cla" value=""></td>
					</tr>
					<tr>
						<td>사업자등록번호</td>
						<td><input class="custInput" type="text" name="cust_bizcode" value=""></td>
						<td>대표자명</td>
						<td><input class="custInput" type="text" name="cust_ceo" value=""></td>
					</tr>
					<tr>
						<td>업종</td>
						<td><input class="custInput" type="text" name="cust_ind" value=""></td>
						<td>종목</td>
						<td><input class="custInput" type="text" name="cust_stk" value=""></td>
					</tr>
					<tr>
						<td>우편번호1</td>
						<td colspan="3"><input class="custInput postInput" type="text" name="cust_post1" value=""><input class="findPost1" type="button" value="우편번호찾기"></td>
					</tr>
					<tr>
						<td>주소1</td>
						<td colspan="3"><input class="custInput addrInput" type="text" name="cust_addr1" value=""></td>
					</tr>
							<tr>
						<td>우편번호2</td>
						<td colspan="3"><input class="custInput postInput" type="text" name="cust_post2" value=""><input class="findPost2" type="button" value="우편번호찾기"></td>
					</tr>
					<tr>
						<td>주소2</td>
						<td colspan="3"><input class="custInput addrInput" type="text" name="cust_addr2" value=""></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input class="custInput" type="text" name="cust_tel" value=""></td>
						<td>휴대전화</td>
						<td><input class="custInput" type="text" name="cust_phone" value=""></td>
					</tr>
					<tr>
						<td>팩스</td>
						<td><input class="custInput" type="text" name="cust_fax" value=""></td>
						<td>이메일</td>
						<td><input class="custInput" type="text" name="cust_email" value=""></td>
					</tr>
					<tr>
						<td>계좌번호</td>
						<td colspan="3"><input class="custInput addrInput" type="text" name="cust_account" value="" placeholder="은행명 예금주 계좌번호"></td>

					</tr>
					<tr>
						<td>메모</td>
						<td colspan="3"><textarea name="cust_memo" rows="6" cols="50"></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input class="custInputBtn" type="submit" value="생성"><input class="custInputBtn custInsertCancel" type="button" value="취소"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
