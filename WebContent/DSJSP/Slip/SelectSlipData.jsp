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
    	
    %>
    
	<tr>
		<td class="no" state="view"><span><%=i%></span><input type="hidden" name="tran_index" value="<%=s.get("tran_index")%>"></td>
		<td class="stk_name" state="view"><span></span><input type="hidden" name="stk_code" value=""><input type="hidden" name="stk_vat" value=""></td>
		<td class="stk_size1" state="view"><span></span></td>
		<td class="quantity" state="view"><span></span></td>
		<td class="price" state="view"><span></span></td>
		<td class="amount" state="view"><span></span></td>
		<td class="vat" state="view"><span></span></td>
		<td class="collect" state="view"><span></span><input type="hidden" name="colType" value=""><input type="hidden" name="acct_code" value=""> </td>
		<td class="memo" state="view"><span></span></td>
	</tr>
	
	<%}%>