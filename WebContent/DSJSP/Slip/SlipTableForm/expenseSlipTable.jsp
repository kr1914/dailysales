<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <input type="hidden" value="expense"/>
		<thead>
			<tr>
				<th width="5%">No</th>
				<th width="15%">계정과목</th>
				<th width="10%">과목코드</th>
				<th width="10%">결제구분</th>
				<th width="10%">거래처</th>
				<th width="10%">결제코드</th>
				<th width="15%">금액</th>
				<th width="15%">부가세</th>
				<th width="10%">비고</th>
			</tr>
		</thead>
		<tbody id="SlipData">
			<tr>
				<td class="no" state="view"><span>1</span><input type="hidden" name="tran_index" value=""></td>
				<td class="sub_name" state="view"><span></span></td>
				<td class="sub_code" state="view"><span></span></td>
				<td class="payment_select" state="view">
					<select name="select_payment">
						<option value="계좌">계좌</option>
						<option value="거래처">거래처</option>
					</select>
				</td>
				<td class="cust_name" state="view"><span></span><input type="hidden" name="cust_code" value=""></td>
				<td class="payment" state="view"><span></span><input type="hidden" name="payment_code" value=""></td>
				<td class="amount" state="view"><span></span></td>
				<td class="vat" state="view"><span></span></td>
				<td class="memo" state="view"><span></span></td>
			</tr>
			<tr>
				<td class="no" state="view"><span>2</span><input type="hidden" name="tran_index" value=""></td>
				<td class="sub_name" state="view"><span></span></td>
				<td class="sub_code" state="view"><span></span></td>
				<td class="payment_select" state="view">
					<select name="select_payment">
						<option value="계좌">계좌</option>
						<option value="거래처">거래처</option>
					</select>
				</td>
				<td class="cust_name" state="view"><span></span><input type="hidden" name="cust_code" value=""></td>
				<td class="payment" state="view"><span></span><input type="hidden" name="payment_code" value=""></td>
				<td class="amount" state="view"><span></span></td>
				<td class="vat" state="view"><span></span></td>
				<td class="memo" state="view"><span></span></td>
			</tr>
		</tbody>