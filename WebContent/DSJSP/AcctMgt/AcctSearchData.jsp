<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> acctList;
	acctList = (List<Map<String, Object>>)session.getAttribute("acctList");%>
	<table class="AcctMgtTable_View">
	<tbody>
		<tr>
			<th style="width:8%">No.</th>
			<th style="width:15%">구분</th>
			<th style="width:30%">계좌명</th>
			<th style="width:15%">은행명</th>
			<th style="width:15%">예금주명</th>
			<th style="width:8%">계좌번호</th>
			<th style="width:9%">잔액</th>
		</tr>
		<%if(acctList.size() == 0){ %>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<%}else {
			int i = 0;
			for(Map<String, Object> acct : acctList){
				i++;
			%>
		
		<tr>
			<td><%=i%><input type="hidden" name="acct_code" value="<%=acct.get("acct_code")%>"></td>
			<td><%=acct.get("acct_cla") %></td>
			<td><%=acct.get("acct_name") %></td>
			<td><%=acct.get("acct_bank") %></td>
			<td><%=acct.get("acct_owner") %></td>
			<td><%=acct.get("acct_id") %></td>
			<td><%=acct.get("acct_money") %></td>
		</tr>
		<%
			}}
		%>
	</tbody>
</table>
	<script type="text/javascript">
	tableResizable();
	</script>