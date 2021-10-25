<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.daily.dao.DbAcesse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	DbAcesse dao = DbAcesse.getInstance();
	List<Map<String,Object>> articles = null;
	articles = (List<Map<String,Object>>)dao.boardSelect();
%>
<c:set var="boardList" value="<%=articles%>"></c:set>

<!-- 자유게시판 페이지, 테이블 구성 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="..\HtmlLib.jsp"></jsp:include> <!-- jquery, bootstrap -->
</head>
<body>
<h1>자유 게시판</h1>
<!-- Bootstrap 테이블. 넓이가 870 ~ 930px정도로 작아졌을때 게시판 화면을 준비해야함.(미완) -->
<div class="table-responsiv">
	<table class="table table-striped">
		<thead>
			<tr>
				<th style="width:10%">글번호</th>
				<th style="width:10%">말머리</th>
				<th style="width:35%">글제목</th>
				<th style="width:15%">글쓴이</th>
				<th style="width:10%">작성일</th>
				<th style="width:10%">조회수</th>
				<th style="width:10%">추천수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="articles" items="${boardList}">
			<tr>
				<c:set var="index" value="${articles.bd_index}"/>
				<td>${articles.bd_index}</td>
				<td>${articles.bd_header}</td>
				<td><a href="ViewArticle.jsp?bd_index=${articles.bd_index}">${articles.bd_title}</a><c:if test="${ID eq articles.bd_creator}"><a href="ModifyPost.jsp?bd_index=${articles.bd_index}"><img alt="수정" src="..\..\img\pencil-square.svg"></a><a href="DeletePost.jsp?bd_index=${articles.bd_index}"><img alt="삭제" src="..\..\img\x-square-fill.svg"></a></c:if></td>
				<td>${articles.bd_creator}</td>
				<fmt:formatDate value="${articles.bd_date}" pattern="MM-dd" var="date" />
				<td>${date}</td>
				<td>${articles.bd_view}</td>
				<td><fmt:formatNumber value="${articles.lk}" type="number"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
	<a href="WriteArticle.jsp"><input type="button" value="글 작성"></a>
</div>
</body>
</html>