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
%>
<%
String article = request.getParameter("article"); 
article = article.replace("\r\n", "<br>");
System.out.println(article);
%>

<sql:setDataSource var="db" scope="page" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal?useUnicode=true&characterEncoding=utf8" user="root" password="810904"/>
<sql:update var="post" dataSource="${db}">
insert into board(bd_creator, bd_header, bd_title, bd_article, bd_data, bd_date) values(
'<%=(String)session.getAttribute("ID") %>','<%=request.getParameter("header") %>','<%=request.getParameter("title") %>','<%=article %>',null,'<%=now %>');
</sql:update>

<jsp:forward page="Board.jsp"></jsp:forward>