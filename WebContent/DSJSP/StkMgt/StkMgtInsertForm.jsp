<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<Style>
.StkMgtInsertOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.StkMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.StkInsertTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.StkInsertExitBtn{	position: absolute;	right: 5px;	top: 5px; cursor: pointer;}
.StkInsertExitBtn > img {width:20px;}
.StkInsertTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.StkInsertTable td{ padding: 5px 0 5px 0; font-size:11px;}
.StkInsertTable td:nth-child(2n-1){width:130px;}
.StkInsertTable td:nth-child(2n){text-align: left; padding-right:10px; width: 150px;}
.StkInsertTable textarea{border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.stkInput {border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.stkInput:focus, .StkInsertTable textarea:focus { outline:none; border: solid 1px red;}
.stkInputBtn {width:70px; height: 25px; margin:5px 10px 5px 10px;}
.stkInputBtn:first-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #1b3fef, #171a8b87); color: white; border-radius: 6px; font-weight: bold;}
.stkInputBtn:last-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
</Style>
<script type="text/javascript">
	
//데이터 검증
	$(document).on('click','input[type="submit"]', function() {
		var check = new Array();
		var memo = $('textarea[name="stk_memo"]').val();

		
		//jquery의 배열 활용 _ 
		$('.stkInput').each(function name(index, item) {
			check.push($(item).val());
		});
	
		
	);
</script>
	<div class="StkMgtInsertOverlay">
	</div>
	<div class="StkMgtInsertWrap">
		<div class="StkMgtWrap">
			<form action="StkMgtInsert.do">
				<div class="StkInsertTitle">
				상품 생성
				<div class="StkInsertExitBtn"><img src="../../img/exit_01.png" alt="닫기"></div>
				</div>
				<div class="StkInsertTable">
				<table>
				<tr>
						<td>상품명*<input type="hidden" name="stk_code" value=""></td>
						<td><input class="stkInput" type="text" name="stk_name" value=""  ></td>
						<td>구분</td>
						<td><input class="stkInput" type="text" name="stk_cla" value=""  ></td>
					</tr>
					<tr>
						<td>규격1</td>
						<td><input class="stkInput" type="text" name="stk_size1" value=""  ></td>
						<td>규격2</td>
						<td><input class="stkInput" type="text" name="stk_size2" value=""  ></td>
					</tr>
					<tr>
						<td>단위</td>
						<td><input class="stkInput" type="text" name="stk_unit" value=""  ></td>
						<td>가격</td>
						<td><input class="stkInput" type="text" name="stk_price" value=""  ></td>
					</tr>
					<tr>
						<td>부가세여부</td>
						<td><select name="stk_vat"> 
							<option value="과세"> 과세품목</option>
							<option value="면세" >면세품목</option>
							<option value="영세율">영세율품목</option>
						</select> </td>
						<td>입고일자</td>
						<td><input class="stkInput" type="date" name="stk_date" value=""  ></td>
					</tr>
					<tr>
						<td>수량표시</td>
						<td colspan="3"><select name="stk_amount">
							<option value="표시">표시</option>
							<option value="미표시">미표시</option>
						</select> </td>
					</tr>
					<tr>
						<td>메모</td>
						<td colspan="3"><textarea name="stk_memo" rows="6" cols="50"  ></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input class="stkInputBtn" type="submit" value="생성"><input class="StkModifyBtn" type="button" value="취소"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
