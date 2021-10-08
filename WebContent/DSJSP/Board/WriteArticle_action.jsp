<%@page import="com.daily.dao.DbAcesse"%>
<%@page import="com.daily.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date"  %>
<%@ page import="java.text.SimpleDateFormat" %>

<!-- 오늘 날짜 생성 및 입력 포맷 설정 -->
<% Date today = new Date(); 
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	String now = format1.format(today);
	Article article = new Article();
	DbAcesse dao = DbAcesse.getInstance();
%>
<%
	String text = request.getParameter("article");
	text = text.replace("\r\n", "<br>");
	article.setBd_article(text);
	article.setBd_creator((String)session.getAttribute("ID"));
	article.setBd_title(request.getParameter("title"));
	article.setBd_header(request.getParameter("header"));
	article.setBd_date(now);
	int result = dao.writeArticle(article);
	if(result>0){
		dao.commit();
	}else {
		dao.rollback();
	}
	%>

<jsp:forward page="Board.jsp"></jsp:forward>