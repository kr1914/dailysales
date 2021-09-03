<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> stkList;
	stkList = (List<Map<String, Object>>)session.getAttribute("stkList");%>
	<table class="StkMgtTable_View">
	<tbody>
		<tr>
			<th style="width:8%">No.</th>
			<th style="width:15%">구분</th>
			<th style="width:30%">상품명</th>
			<th style="width:15%">규격1</th>
			<th style="width:15%">규격2</th>
			<th style="width:8%">입고일</th>
			<th style="width:9%">현재고</th>
		</tr>
		<%if(stkList.size() == 0){ %>
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
			for(Map<String, Object> stk : stkList){
				i++;
			%>
		
		<tr>
			<td><%=i%><input type="hidden" name="stk_code" value="<%=stk.get("stk_code")%>"></td>
			<td><%=stk.get("stk_cla") %></td>
			<td><%=stk.get("stk_name") %></td>
			<td><%=stk.get("stk_size1") %></td>
			<td><%=stk.get("stk_size2") %></td>
			<td><%=stk.get("stk_date") %></td>
			<td><%=stk.get("stk_quantity") %></td>
		</tr>
		<%
			}}
		%>
	</tbody>
</table>
	<script type="text/javascript">
	tableResizable();
	</script>