<%@page import="com.daily.dto.BankAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	BankAccount acct = null;
	acct = (BankAccount)request.getAttribute("Account");
	
%>
<Style>
.AcctMgtModifyOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.AcctMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.AcctModifyTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.AcctModifyExitBtn{ cursor: pointer;	position: absolute;	right: 5px;	top: 5px;}
.AcctModifyExitBtn > img {	width:20px;}
.AcctModifyTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.AcctModifyTable td{ padding: 5px 0 5px 0; font-size:11px;}
.AcctModifyTable td:nth-child(2n-1){width:130px}
.AcctModifyTable td:nth-child(2n){text-align: left; padding-right:10px;  width: 150px;}
.AcctModifyTable textarea{border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.AcctModifyTable .acctInput { border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.AcctModifyBtn {width:70px; height: 25px; margin:5px 10px 5px 10px; box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
.acctInput:focus { outline:none; border: solid 1px red;}
.acctInputBtn {width:70px; height: 25px; margin:5px 10px 5px 10px;}
.acctInputBtn:first-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #1b3fef, #171a8b87); color: white; border-radius: 6px; font-weight: bold;}
.acctInputBtn:last-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
</Style>
<script type="text/javascript">
	
//데이터 정규화
	$(document).on('click','input[type="submit"]', function() {
		var check = new Array();
		var memo = $('textarea[name="acct_memo"]').val();
		var regex_name = /[0-9]|[a-z]|[A-Z]|[가-힣]/;
		var regex_bizcode = /\d{3}-\d{2}-\d{5}$/; //사업자 등록번호
		var regex_postcode = /[0-9]$/;
		var regex_tel = /^[가-힣a-zA-Z-]/;
		
		//jquery의 배열 활용 _ 
		$('.acctInput').each(function name(index, item) {
			check.push($(item).val());
		});
	});

	
</script>
	<div class="AcctMgtModifyOverlay">
	</div>
	<div class="AcctMgtModifyWrap">
		<div class="AcctMgtWrap">
			<form action="AcctMgtModify.do">
				<div class="AcctModifyTitle">
				계좌 수정
				<div class="AcctModifyExitBtn"><img src="../../img/exit_01.png" alt="닫기"></div>
				</div>
				<div class="AcctModifyTable">
				<table>
					<tr>
						<td>계좌명*<input type="hidden" name="acct_code" value="<%=acct.getAcct_code()%>"></td>
						<td><input class="acctInput" type="text" name="acct_name" value="<%=acct.getAcct_name()%>"   ></td>
						<td>구분</td>
						<td><input class="acctInput" type="text" name="acct_cla" value="<%=acct.getAcct_cla()%>"  ></td>
					</tr>
					<tr>
						<td>은행명</td>
						<td><input class="acctInput" type="text" name="acct_bank" value="<%=acct.getAcct_bank()%>"  ></td>
						<td>예금주명</td>
						<td><input class="acctInput" type="text" name="acct_owner" value="<%=acct.getAcct_owner()%>"  ></td>
					</tr>
					<tr>
						<td>계좌번호</td>
						<td colspan="3"><input class="acctInput" type="text" name="acct_id" value="<%=acct.getAcct_id()%>"  ></td>
					</tr>
					<tr>
						<td>메모</td>
						<td colspan="3"><textarea name="acct_memo" rows="6" cols="50"  ><%=acct.getAcct_memo() %></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input class="acctInputBtn" type="submit" value="생성"><input class="AcctModifyBtn" type="button" value="취소"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
