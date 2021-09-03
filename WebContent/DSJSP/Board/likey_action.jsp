<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<% String id = (String)session.getAttribute("ID"); %>
<% String article = request.getParameter("bd_index"); %>

<!-- ���ƿ� ���� ��ȸ -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal" user="root" password="810904"/>
<sql:query var="check" dataSource="${db}">
	select count(*) count, like_state from likey where like_email='<%=id%>' and like_article='<%=article %>';
</sql:query>


<!-- 
		���̽� �� DB������Ʈ
			1. ���ƿ並 �������� �ѹ��� ���� ��� 
			2. ���ƿ並 �������� �־����� ����ߴ� ���
			3. ���ƿ� ������ ���
		
		�� ���̽��� ���ƿ� �������� ���ϰ����� ���� <i class="bi bi-hand-thumbs-up-fill"></i>
 -->
<c:forEach var="likeyAction" items="${check.rows}">
	<c:set var="count" value="${likeyAction.count}"/>
	<c:choose>
		<c:when test="${likeyAction.count == 0}">
			<sql:update var="dolike" dataSource="${db}">
				insert into likey(like_article, like_email, like_state, like_date) values('<%=article%>','<%=id%>','1',now());
			</sql:update>
			<img class="bi" src="..\..\img\hand-thumbs-up-fill.svg" alt="���ƿ�">
		</c:when>
		<c:when test="${likeyAction.count == 1 && likeyAction.like_state != '1' }">
			<sql:update var="didlike" dataSource="${db}">
				update likey set like_state='1', like_date=now() where like_email='<%=id%>' and like_article='<%=article %>';
			</sql:update>
			<img class="bi" src="..\..\img\hand-thumbs-up-fill.svg" alt="���ƿ�">
		</c:when>
		<c:otherwise>
			<sql:update var="dontlike" dataSource="${db}">
				update likey set like_state='0', like_date=now() where like_email='<%=id%>' and like_article='<%=article %>';
			</sql:update>
			<img class="bi" src="..\..\img\hand-thumbs-up.svg" alt="���ƿ�">
		</c:otherwise>
	</c:choose>
</c:forEach>