<%@page import="com.daily.dto.Stock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Stock stk = null;
	stk = (Stock)request.getAttribute("Stock");
	
%>
<Style>
.StkMgtModifyOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.StkMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.StkModifyTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.StkModifyExitBtn{ cursor: pointer;	position: absolute;	right: 5px;	top: 5px;}
.StkModifyExitBtn > img {	width:20px;}
.StkModifyTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.StkModifyTable td{ padding: 5px 0 5px 0; font-size:11px;}
.StkModifyTable td:nth-child(2n-1){width:130px}
.StkModifyTable td:nth-child(2n){text-align: left; padding-right:10px;  width: 150px;}
.StkModifyTable textarea{border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.StkModifyTable .stkInput { border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.StkModifyBtn {width:70px; height: 25px; margin:5px 10px 5px 10px; box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
.stkInput:focus { outline:none; border: solid 1px red;}
.stkInputBtn {width:70px; height: 25px; margin:5px 10px 5px 10px;}
.stkInputBtn:first-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #1b3fef, #171a8b87); color: white; border-radius: 6px; font-weight: bold;}
.stkInputBtn:last-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
</Style>
<script type="text/javascript">
	
//데이터 정규화
	$(document).on('click','input[type="submit"]', function() {
		var check = new Array();
		var memo = $('textarea[name="stk_memo"]').val();
		var regex_name = /[0-9]|[a-z]|[A-Z]|[가-힣]/;
		var regex_bizcode = /\d{3}-\d{2}-\d{5}$/; //사업자 등록번호
		var regex_postcode = /[0-9]$/;
		var regex_tel = /^[가-힣a-zA-Z-]/;
		
		//jquery의 배열 활용 _ 
		$('.stkInput').each(function name(index, item) {
			check.push($(item).val());
		});
	});

	
</script>
	<div class="StkMgtModifyOverlay">
	</div>
	<div class="StkMgtModifyWrap">
		<div class="StkMgtWrap">
			<form action="StkMgtModify.do">
				<div class="StkModifyTitle">
				거래처 조회
				<div class="StkModifyExitBtn"><img src="../../img/exit_01.png" alt="닫기"></div>
				</div>
				<div class="StkModifyTable">
				<table>
					<tr>
						<td>상품명*<input type="hidden" name="stk_code" value="<%=stk.getStk_code()%>"></td>
						<td><input class="stkInput" type="text" name="stk_name" value="<%=stk.getStk_name() %>"  ></td>
						<td>구분</td>
						<td><input class="stkInput" type="text" name="stk_cla" value="<%=stk.getStk_cla()%>"  ></td>
					</tr>
					<tr>
						<td>규격1</td>
						<td><input class="stkInput" type="text" name="stk_size1" value="<%=stk.getStk_size1() %>"  ></td>
						<td>규격2</td>
						<td><input class="stkInput" type="text" name="stk_size2" value="<%=stk.getStk_size2() %>"  ></td>
					</tr>
					<tr>
						<td>단위</td>
						<td><input class="stkInput" type="text" name="stk_unit" value="<%=stk.getStk_unit() %>"  ></td>
						<td>가격</td>
						<td><input class="stkInput" type="text" name="stk_price" value="<%=stk.getStk_price() %>"  ></td>
					</tr>
					<tr>
						<td>부가세여부</td>
						<td><select name="stk_vat">
							<c:set var="vat" value="<%=stk.getStk_vat() %>"></c:set> 
							<option value="과세" <c:if test="${vat eq '과세'}">selected</c:if>> 과세품목</option>
							<option value="면세" <c:if test="${vat eq '면세'}">selected</c:if>>면세품목</option>
							<option value="영세율" <c:if test="${vat eq '영세율'}">selected</c:if>>영세율품목</option>
						</select> </td>
						<td>입고일자</td>
						<td><input class="stkInput" type="date" name="stk_date" value="<%=stk.getStk_date() %>"  ></td>
					</tr>
					<tr>
						<td>수량표시</td>
						<td colspan="3"><select name="stk_amount">
							<c:set var="amount" value="<%=stk.getStk_amount() %>"></c:set>
							<option value="표시" <c:if test="${amount eq '표시' }">selected</c:if>>표시</option>
							<option value="미표시" <c:if test="${amount eq '미표시' }">selected</c:if>>미표시</option>
						</select> </td>
					</tr>
					<tr>
						<td>메모</td>
						<td colspan="3"><textarea name="stk_memo" rows="6" cols="50"  ><%=stk.getStk_memo() %></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input class="stkInputBtn" type="submit" value="생성"><input class="StkModifyBtn" type="button" value="취소"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
