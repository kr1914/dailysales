<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    List<Map<String,Object>> sub;
    sub = (List<Map<String,Object>>)request.getAttribute("subList");
    
    %>
<input type="hidden" value="one"/>
<script>
var sub_code = <%=sub.get(0).get("sub_code")%>;
var sub_name = <%=sub.get(0).get("sub_name")%>;
</script>