<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<% String id = (String)session.getAttribute("ID"); %>
<% String article = request.getParameter("bd_index"); %>

<!-- 좋아요 상태 조회 -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal" user="root" password="810904"/>
<sql:query var="check" dataSource="${db}">
	select count(*) count, like_state from likey where like_email='<%=id%>' and like_article='<%=article %>';
</sql:query>


<!-- 
		케이스 별 DB업데이트
			1. 좋아요를 누른적이 한번도 없는 경우 
			2. 좋아요를 누른적이 있었으나 취소했던 경우
			3. 좋아요 상태인 경우
		
		각 케이스별 좋아요 아이콘을 리턴값으로 전달 <i class="bi bi-hand-thumbs-up-fill"></i>
 -->
<c:forEach var="likeyAction" items="${check.rows}">
	<c:set var="count" value="${likeyAction.count}"/>
	<c:choose>
		<c:when test="${likeyAction.count == 0}">
			<sql:update var="dolike" dataSource="${db}">
				insert into likey(like_article, like_email, like_state, like_date) values('<%=article%>','<%=id%>','1',now());
			</sql:update>
			<img class="bi" src="..\..\img\hand-thumbs-up-fill.svg" alt="좋아요">
		</c:when>
		<c:when test="${likeyAction.count == 1 && likeyAction.like_state != '1' }">
			<sql:update var="didlike" dataSource="${db}">
				update likey set like_state='1', like_date=now() where like_email='<%=id%>' and like_article='<%=article %>';
			</sql:update>
			<img class="bi" src="..\..\img\hand-thumbs-up-fill.svg" alt="좋아요">
		</c:when>
		<c:otherwise>
			<sql:update var="dontlike" dataSource="${db}">
				update likey set like_state='0', like_date=now() where like_email='<%=id%>' and like_article='<%=article %>';
			</sql:update>
			<img class="bi" src="..\..\img\hand-thumbs-up.svg" alt="좋아요">
		</c:otherwise>
	</c:choose>
</c:forEach>