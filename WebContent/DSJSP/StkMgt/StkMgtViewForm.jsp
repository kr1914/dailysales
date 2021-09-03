<%@page import="com.daily.dto.Stock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Stock stk = null;
	stk = (Stock)request.getAttribute("Stock");
	
%>
<Style>
.stkMgtViewOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.StkMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.StkViewTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.StkViewExitBtn{ cursor: pointer;	position: absolute;	right: 5px;	top: 5px;}
.StkViewExitBtn > img {	width:20px;}
.StkViewTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.StkViewTable td{ padding: 5px 0 5px 0; font-size:11px;}
.StkViewTable td:nth-child(2n-1){width:130px}
.StkViewTable td:nth-child(2n){text-align: left; padding-right:10px;  width: 150px;}
.StkViewTable textarea{background-color:#80808021; border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.StkViewTable .StkInput {background-color:#80808021; border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.StkViewBtn {width:70px; height: 25px; margin:5px 10px 5px 10px; box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
.stkInput:focus { outline:none; border: solid 1px red;}
</Style>
	<div class="StkMgtViewOverlay">
	</div>
	<div class="StkMgtViewWrap">
		<div class="StkMgtWrap">
			<form action="StkMgtView.do">
				<div class="StkViewTitle">
				상품 상세 조회
				<div class="StkViewExitBtn"><img src="../../img/exit_01.png" alt="닫기"></div>
				</div>
				<div class="StkViewTable">
				<table>
					<tr>
						<td>상품명*<input type="hidden" name="stk_code" value="<%=stk.getStk_code()%>"></td>
						<td><input class="stkInput" type="text" name="stk_name" value="<%=stk.getStk_name() %>"  disabled="disabled" ></td>
						<td>구분</td>
						<td><input class="stkInput" type="text" name="stk_cla" value="<%=stk.getStk_cla()%>"  disabled="disabled" ></td>
					</tr>
					<tr>
						<td>규격1</td>
						<td><input class="stkInput" type="text" name="stk_size1" value="<%=stk.getStk_size1() %>"  disabled="disabled" ></td>
						<td>규격2</td>
						<td><input class="stkInput" type="text" name="stk_size2" value="<%=stk.getStk_size2() %>"  disabled="disabled" ></td>
					</tr>
					<tr>
						<td>단위</td>
						<td><input class="stkInput" type="text" name="stk_unit" value="<%=stk.getStk_unit() %>"  disabled="disabled" ></td>
						<td>가격</td>
						<td><input class="stkInput" type="text" name="stk_price" value="<%=stk.getStk_price() %>"  disabled="disabled" ></td>
					</tr>
					<tr>
						<td>부가세여부</td>
						<td><select name="stk_vat"  disabled="disabled">
							<c:set var="vat" value="<%=stk.getStk_vat() %>"></c:set> 
							<option value="과세" <c:if test="${vat eq '과세'}">selected</c:if>> 과세품목</option>
							<option value="면세" <c:if test="${vat eq '면세'}">selected</c:if>>면세품목</option>
							<option value="영세율" <c:if test="${vat eq '영세율'}">selected</c:if>>영세율품목</option>
						</select> </td>
						<td>입고일자</td>
						<td><input class="stkInput" type="date" name="stk_date" value="<%=stk.getStk_date() %>"  disabled="disabled" ></td>
					</tr>
					<tr>
						<td>수량표시</td>
						<td colspan="3"><select name="stk_amount"  disabled="disabled">
							<c:set var="amount" value="<%=stk.getStk_amount() %>"></c:set>
							<option value="표시" <c:if test="${amount eq '표시' }">selected</c:if>>표시</option>
							<option value="미표시" <c:if test="${amount eq '미표시' }">selected</c:if>>미표시</option>
						</select> </td>
					</tr>
					<tr>
						<td>메모</td>
						<td colspan="3"><textarea name="stk_memo" rows="6" cols="50"  disabled="disabled" ><%=stk.getStk_memo() %></textarea></td>
					</tr>
					<tr>
						<td><input class="StkModifyBtn" type="button" value="취소"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
