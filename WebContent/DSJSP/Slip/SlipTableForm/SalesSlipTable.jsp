<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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