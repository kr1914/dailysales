<%@page import="javax.xml.ws.Dispatch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Map" %>
<%
		List<Map<String, Object>> update = null;
		Object key = null;
		//세션 변경하는 파일 세션 Login인이 널값인지 확인 후 널값이 아니면 Login의 선택된 회사의 key값을 nowCo라는 세션에 등록
		
		String coIndex = request.getParameter("select");
		int index = Integer.parseInt(coIndex);

		if(session.getAttribute("Login")!=null) {
			update = (List<Map<String, Object>>)session.getAttribute("Login");
		}
		Map<String, Object> ex = update.get(index);
		
		key = ex.get("key");
		session.setAttribute("nowCo", key);
		
		
		%>