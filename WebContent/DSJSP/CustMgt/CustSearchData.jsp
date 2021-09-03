<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("11");
	List<Map<String, Object>> custlist;
	custlist = (List<Map<String, Object>>)session.getAttribute("custlist");%>
<table class="CustMgtTable_View">
<tbody>
	<tr>
		<th>No.</th>
		<th style="width:3%">구분</th>
		<th style="width:15%">거래처명</th>
		<th style="width:10%">사업자등록번호</th>
		<th style="width:5%">대표자</th>
		<th style="width:8%">연락처</th>
		<th style="width:8%">휴대전화</th>
		<th style="width:8%">팩스</th>
		<th style="width:5%">업종</th>
		<th style="width:5%">종목</th>
		<th style="width:15%">주소</th>
		<th style="width:15%">이메일</th>
	</tr>
	<% if(custlist.size() <= 0){
		%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
<%	}else {
		int i = 0;
		for(Map<String, Object> cust : custlist){
			i++;
		%>		
		<tr>
			<td><%=i%><input type="hidden" name="cust_code" value="<%=cust.get("cust_code")%>"></td>
			<td><%=cust.get("cust_cla") %></td>
			<td><%=cust.get("cust_name") %></td>
			<td><%=cust.get("cust_bizcode") %></td>
			<td><%=cust.get("cust_ceo") %></td>
			<td><%=cust.get("cust_tel") %></td>
			<td><%=cust.get("cust_phone") %></td>
			<td><%=cust.get("cust_fax") %></td>
			<td><%=cust.get("cust_ind") %></td>
			<td><%=cust.get("cust_stk") %></td>
			<td><%=cust.get("cust_addr1") %></td>
			<td><%=cust.get("cust_email") %></td>
		</tr>
<%
	}}
%>
</tbody>
</table>
	<script type="text/javascript">
	tableResizable();
	</script>