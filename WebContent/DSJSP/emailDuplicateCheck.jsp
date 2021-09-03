<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daily.dao.DbAcesse" %>
<%	DbAcesse dba = new DbAcesse();%>
<%  String id = request.getParameter("id");	
	Boolean result = dba.duplicateCheck(id); //이름 호출%>
	<input type="hidden" name="email_token" value="<%=result%>"/>

