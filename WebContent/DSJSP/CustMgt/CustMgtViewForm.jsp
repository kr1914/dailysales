<%@page import="com.daily.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Customer cs = null;
	cs = (Customer)request.getAttribute("Customer");
	
%>
<Style>
.CustMgtViewOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.CustMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.CustViewTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.CustViewExitBtn{ cursor: pointer;	position: absolute;	right: 5px;	top: 5px;}
.CustViewExitBtn > img {	width:20px;}
.CustViewTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.CustViewTable td{ padding: 5px 0 5px 0; font-size:11px;}
.CustViewTable td:nth-child(2n-1){width:130px}
.CustViewTable td:nth-child(2n){text-align: left; padding-right:10px;  width: 150px;}
.CustViewTable textarea{background-color:#80808021; border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.CustViewTable .custInput {background-color:#80808021; border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.custViewBtn {width:70px; height: 25px; margin:5px 10px 5px 10px; box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
.custInput:focus { outline:none; border: solid 1px red;}
</Style>
	<div class="CustMgtViewOverlay">
	</div>
	<div class="CustMgtViewWrap">
		<div class="CustMgtWrap">
			<form action="CustMgtView.do">
				<div class="CustViewTitle">
				거래처 조회
				<div class="CustViewExitBtn"><img src="../../img/exit_01.png" alt="닫기"></div>
				</div>
				<div class="CustViewTable">
				<table>
					<tr>
						<td>거래처명*</td>
						<td><input class="custInput" type="text" name="cust_name" value="<%=cs.getCust_name()%>" disabled="disabled"></td>
						<td>구분</td>
						<td><input class="custInput" type="text" name="cust_cla" value="<%=cs.getCust_cla() %>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>사업자등록번호</td>
						<td><input class="custInput" type="text" name="cust_bizcode" value="<%=cs.getCust_bizcode() %>" disabled="disabled"></td>
						<td>대표자명</td>
						<td><input class="custInput" type="text" name="cust_ceo" value="<%=cs.getCust_ceo() %>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>업종</td>
						<td><input class="custInput" type="text" name="cust_ind" value="<%=cs.getCust_ind() %>" disabled="disabled"></td>
						<td>종목</td>
						<td><input class="custInput" type="text" name="cust_stk" value="<%=cs.getCust_stk() %>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>우편번호1</td>
						<td colspan="3"><input class="custInput postInput" type="text" name="cust_post1" value="<%=cs.getCust_post1() %>" disabled="disabled"><input class="findPost1" type="button" value="우편번호찾기"></td>
					</tr>
					<tr>
						<td>주소1</td>
						<td colspan="3"><input class="custInput addrInput" type="text" name="cust_addr1" value="<%=cs.getCust_addr1() %>" disabled="disabled"></td>
					</tr>
							<tr>
						<td>우편번호2</td>
						<td colspan="3"><input class="custInput postInput" type="text" name="cust_post2" value="<%=cs.getCust_post2() %>" disabled="disabled"><input class="findPost2" type="button" value="우편번호찾기"></td>
					</tr>
					<tr>
						<td>주소2</td>
						<td colspan="3"><input class="custInput addrInput" type="text" name="cust_addr2" value="<%=cs.getCust_addr2() %>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input class="custInput" type="text" name="cust_tel" value="<%=cs.getCust_tel() %>" disabled="disabled"></td>
						<td>휴대전화</td>
						<td><input class="custInput" type="text" name="cust_phone" value="<%=cs.getCust_phone() %>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>팩스</td>
						<td><input class="custInput" type="text" name="cust_fax" value="<%=cs.getCust_fax() %>" disabled="disabled"></td>
						<td>이메일</td>
						<td><input class="custInput" type="text" name="cust_email" value="<%=cs.getCust_email() %>" disabled="disabled"></td>
					</tr>
					<tr>
						<td>계좌번호</td>
						<td colspan="3"><input class="custInput addrInput" disabled="disabled" "text" name="cust_account" value="<%=cs.getCust_account() %>" placeholder="은행명 예금주 계좌번호"></td>
					</tr>
					<tr>
						<td>메모</td>
						<td colspan="3"><textarea name="cust_memo" rows="6" cols="50" disabled="disabled"><%=cs.getCust_memo() %></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input class="custViewBtn" type="button" value="취소"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
