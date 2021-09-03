<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
	List<Map<String, Object>> custList = null;
	Map<String, Object> cust = null;
	custList =  (List<Map<String, Object>>)request.getAttribute("custlist");
	cust = custList.get(0);
	
%>
<input type="hidden" value="OneData">
<tr class="custName">
	<td colspan="2"><%=cust.get("cust_name") %>[<%=cust.get("cust_cla") %>]<input type="hidden" name="cust_code" value="<%=cust.get("cust_code") %>"></td>
</tr>
<tr>
	<td><%=cust.get("cust_bizcode") %></td>
	<td><%=cust.get("cust_ceo") %></td>
</tr>
<tr>
	<td>[T]<%=cust.get("cust_tel") %></td>
	<td>[H]<%=cust.get("cust_phone") %></td>
</tr>
<tr>
	<td>[F]<%=cust.get("cust_fax") %></td>
	<td><%=cust.get("cust_email") %></td>
</tr>
<tr>
	<td>메모</td>
	<td colspan="2"><%=cust.get("cust_memo") %></td>
</tr>