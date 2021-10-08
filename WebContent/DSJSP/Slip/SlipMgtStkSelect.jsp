<%@page import="com.daily.dto.Stock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	Stock stk = null;
   
   stk = (Stock)request.getAttribute("Stock");
   %>
<script>
var t1 = "<%=stk.getStk_code()%>";
var t2 = "<%=stk.getStk_name()%>";
var t3 = "<%=stk.getStk_vat()%>";
var t4 = "<%=stk.getStk_size1()%>/<%=stk.getStk_size2()%>"
</script>