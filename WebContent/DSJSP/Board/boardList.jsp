<%@page import="com.daily.dto.Paging"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	System.out.println("111");
	List<Map<String, Object>> list = null;
	list = (List<Map<String, Object>>)request.getAttribute("board");
	Paging pg = (Paging)request.getAttribute("page");
%>
   <c:set var="boardList" value="<%=list %>"/>
   <c:set var="page" value="<%=pg %>"/>
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
				<td>${articles.m_nick}</td>
				<fmt:formatDate value="${articles.bd_date}" pattern="MM-dd" var="date" />
				<td>${date}</td>
				<td>${articles.bd_view}</td>
				<td><fmt:formatNumber value="${articles.lk}" type="number"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="paging">
		<ul>
			<c:if test="${page.curPage > 1 }"><li><a onclick="boardlist(${page.prevPage})">이전</a></li></c:if>
			<c:forEach var="i" begin="1" end="${page.rangeSize}" step="1">
				<c:set var="prev" value="${page.curPage-i}"/>
				<c:if test="${prev>0}"><li><a onclick="boardlist(${prev})">${prev}</a></li></c:if>
			</c:forEach>
			<li><a href="">${page.curPage}</a></li>
			<c:forEach var="i" begin="1" end="${page.rangeSize}" step="1">
				<c:set var="prev" value="${page.curPage+i}"/>
				<c:if test="${prev<=page.endPage}"><li><a onclick="boardlist(${prev})">${prev}</a></li></c:if>
			</c:forEach>	
			<c:if test="${page.curPage != page.endPage}"><li><a onclick="boardlist(${page.nextPage})">다음</a></li></c:if>
		</ul>
	</div>