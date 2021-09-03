<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	List<Map<String, Object>> stkList = null;
   
   stkList = (List<Map<String, Object>>)session.getAttribute("stkList");
   %>
<input type="hidden" value="OneDataStk">
<script>
var t1 = "<%=stkList.get(0).get("stk_code")%>";
var t2 = "<%=stkList.get(0).get("stk_name")%>";
var t3 = "<%=stkList.get(0).get("stk_vat")%>";
</script>