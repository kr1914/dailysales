<%@page import="com.daily.dao.DbAcesse"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	DbAcesse dao = DbAcesse.getInstance();
	String index = request.getParameter("deletePost");
	int result = 0;
	result = dao.deleteArticle(index);
	
	System.out.println(result);
	if(result>0){
		dao.commit();
	}else {
		dao.rollback();
	}
%>