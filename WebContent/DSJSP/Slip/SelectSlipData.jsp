<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    List<HashMap<String,Object>> slip = null;
    slip = (List<HashMap<String,Object>>)request.getAttribute("slipList");
    int i = 0;
    for(HashMap<String,Object> s : slip){
    	i++;
    	
    	if(s.get("tran_cla").equals("매출")){
    	if(s.get("vat") == null) s.put("vat",""); 
    %>
    
	<tr>
		<td class="no" state="view"><span><%=i%></span><input type="hidden" name="tran_index" value="<%=s.get("tran_index")%>"></td>
		<td class="stk_name" state="view"><span><%=s.get("stk_name") %></span><input type="hidden" name="stk_code" value="<%=s.get("stk_code") %>"><input type="hidden" name="stk_vat" value="<%=s.get("stk_vat") %>"></td>
		<td class="stk_size1" state="view"><span><%=s.get("size") %></span></td>
		<td class="quantity" state="view"><span><%=s.get("ts_quantity") %></span></td>
		<td class="price" state="view"><span><%=s.get("ts_price") %></span></td>
		<td class="amount" state="view"><span><%=s.get("amount") %></span></td>
		<td class="vat" state="view"><span><%=s.get("vat") %></span></td>
		<td class="collect" state="view"><span></span><input type="hidden" name="colType" value=""><input type="hidden" name="acct_code" value=""> </td>
		<td class="memo" state="view"><span></span></td>
		
		
	</tr>
	
	<%}else if(s.get("tran_cla").equals("수금")){
		
	%>
	<tr>
		<td class="no" state="view"><span><%=i%></span><input type="hidden" name="tran_index" value="<%=s.get("tran_index")%>"></td>
		<td class="stk_name" state="view"><span></span><input type="hidden" name="stk_code" value=""><input type="hidden" name="stk_vat" value=""></td>
		<td class="stk_size1" state="view"><span></span></td>
		<td class="quantity" state="view"><span></span></td>
		<td class="price" state="view"><span></span></td>
		<td class="amount" state="view"><span></span></td>
		<td class="vat" state="view"><span></span></td>
		<td class="collect" state="view"><span><%=s.get("ta_amount") %></span><input type="hidden" name="colType" value="<%=s.get("sl_sub")%>"><input type="hidden" name="acct_code" value="<%=s.get("ta_acct") %>"> </td>
		<td class="memo" state="view"><span><%=s.get("acct_name") %></span></td>
		
	</tr>
		
		
		
	<%}else if(s.get("tran_cla").equals("매입")){
		if(s.get("vat") == null) s.put("vat",""); 
	%>
	<tr>
		<td class="no" state="view"><span><%=i%></span><input type="hidden" name="tran_index" value="<%=s.get("tran_index")%>"></td>
		<td class="stk_name" state="view"><span><%=s.get("stk_name") %></span><input type="hidden" name="stk_code" value="<%=s.get("stk_code") %>"><input type="hidden" name="stk_vat" value="<%=s.get("stk_vat") %>"></td>
		<td class="stk_size1" state="view"><span><%=s.get("size") %></span></td>
		<td class="quantity" state="view"><span><%=s.get("ts_quantity") %></span></td>
		<td class="price" state="view"><span><%=s.get("ts_price") %></span></td>
		<td class="amount" state="view"><span><%=s.get("amount") %></span></td>
		<td class="vat" state="view"><span><%=s.get("vat") %></span></td>
		<td class="collect" state="view"><span></span><input type="hidden" name="colType" value=""><input type="hidden" name="acct_code" value=""> </td>
		<td class="memo" state="view"><span></span></td>
		
	</tr>
    
    
    <%}else if(s.get("tran_cla").equals("지출")){%>
   	<tr>
		<td class="no" state="view"><span><%=i%></span><input type="hidden" name="tran_index" value="<%=s.get("tran_index")%>"></td>
		<td class="stk_name" state="view"><span></span><input type="hidden" name="stk_code" value=""><input type="hidden" name="stk_vat" value=""></td>
		<td class="stk_size1" state="view"><span></span></td>
		<td class="quantity" state="view"><span></span></td>
		<td class="price" state="view"><span></span></td>
		<td class="amount" state="view"><span></span></td>
		<td class="vat" state="view"><span></span></td>
		<td class="collect" state="view"><span><%=s.get("ta_amount") %></span><input type="hidden" name="colType" value="<%=s.get("sl_sub")%>"><input type="hidden" name="acct_code" value="<%=s.get("ta_acct") %>"> </td>
		<td class="memo" state="view"><span><%=s.get("acct_name") %></span></td>
	</tr>
    
    
    <%}%>
    <%}%>