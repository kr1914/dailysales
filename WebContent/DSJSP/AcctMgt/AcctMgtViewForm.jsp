<%@page import="com.daily.dto.BankAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	BankAccount acct = null;
	acct = (BankAccount)request.getAttribute("Account");
	
%>
<Style>
.AcctMgtViewOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.AcctMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.AcctViewTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.AcctViewExitBtn{ cursor: pointer;	position: absolute;	right: 5px;	top: 5px;}
.AcctViewExitBtn > img {	width:20px;}
.AcctViewTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.AcctViewTable td{ padding: 5px 0 5px 0; font-size:11px;}
.AcctViewTable td:nth-child(2n-1){width:130px}
.AcctViewTable td:nth-child(2n){text-align: left; padding-right:10px;  width: 150px;}
.AcctViewTable textarea{background-color:#80808021; border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.AcctViewTable .AcctInput {background-color:#80808021; border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.AcctViewBtn {width:70px; height: 25px; margin:5px 10px 5px 10px; box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
.acctInput:focus { outline:none; border: solid 1px red;}
</Style>
	<div class="AcctMgtViewOverlay">
	</div>
	<div class="AcctMgtViewWrap">
		<div class="AcctMgtWrap">
			<form action="AcctMgtView.do">
				<div class="AcctViewTitle">
				계좌 상세 조회
				<div class="AcctViewExitBtn"><img src="../../img/exit_01.png" alt="닫기"></div>
				</div>
				<div class="AcctViewTable">
				<table>
					<tr>
						<td>계좌명*</td>
						<td><input class="acctInput" type="text" name="acct_name" value="<%=acct.getAcct_name()%>" disabled="disabled" ></td>
						<td>구분</td>
						<td><input class="acctInput" type="text" name="acct_cla" value="<%=acct.getAcct_cla()%>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>은행명</td>
						<td><input class="acctInput" type="text" name="acct_bank" value="<%=acct.getAcct_bank()%>" disabled="disabled"></td>
						<td>예금주명</td>
						<td><input class="acctInput" type="text" name="acct_owner" value="<%=acct.getAcct_owner()%>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>계좌번호</td>
						<td colspan="3"><input class="acctInput" type="text" name="acct_id" value="<%=acct.getAcct_id()%>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>메모</td>
						<td colspan="3"><textarea name="acct_memo" rows="6" cols="50" disabled="disabled"><%=acct.getAcct_memo() %></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input class="AcctViewBtn" type="button" value="취소"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
