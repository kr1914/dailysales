<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.daily.dao.DbAcesse"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	DbAcesse dao = DbAcesse.getInstance();
	Map<String, String> info = new HashMap<String, String>();
	info.put("email", request.getParameter("email"));
	info.put("nickname", request.getParameter("nickname"));
	info.put("name",request.getParameter("name"));
	info.put("pwd1",request.getParameter("pwd1"));
	info.put("phone1",request.getParameter("phone1"));
	info.put("phone2",request.getParameter("phone2"));
	info.put("phone3",request.getParameter("phone3"));
	info.put("address",request.getParameter("address"));
	info.put("address2",request.getParameter("address2"));
	info.put("address3",request.getParameter("address3"));
	info.put("birth",request.getParameter("birth"));
	info.put("gender",request.getParameter("gender"));

	int result = dao.crtId(info);
	
	if(result>0){
		dao.commit();
	}else {
		dao.rollback();
		out.println("<script>");
		out.println("alert('가입 실패');");
		out.println("history.back()");
		out.println("<script>");
	}
%>
<% response.sendRedirect("main.jsp");%>