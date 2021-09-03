<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date"  %>
<%@ page import="java.text.SimpleDateFormat" %>
    
<% Date today = new Date(); 
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	String now = format1.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�Խ��� �� �ۼ�</title>
</head>
<body>
	<sql:setDataSource var="db" scope="page" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal?useUnicode=true&characterEncoding=utf8" user="root" password="810904"/>
	
	<sql:query var="check" dataSource="${db}">
		select * from board where bd_index=<%=request.getParameter("index") %>;
	</sql:query>
	
	<!-- �� �ۼ��ڿ� �α��ε� ���̵� ��ġ Ȯ�� -->
	<c:forEach var="ck" items="${check.rows}">
		<c:if test="${ck.bd_creator != ID}">
			<script>
				alert("�߸��� �����Դϴ�.");
				history.back();
			</script>
		</c:if>
	</c:forEach>
	
	<!-- ������Ʈ �� sql ���� -->
	<sql:update var="modifySql" dataSource="${db}">
	update board set bd_header='<%=request.getParameter("header") %>', bd_title='<%=request.getParameter("title") %>', bd_article='<%=request.getParameter("article") %>', bd_date='<%=now%>' where bd_index=<%=request.getParameter("index") %>;
	</sql:update>
	
	<!-- ����� 1�̸� ����ó��, �׿ܿ��� �������� �˸����Բ� ������������ -->
	<c:choose>
		<c:when test="${modifySql==1}">
			<jsp:forward page="Board.jsp"></jsp:forward>	
		</c:when>
		<c:otherwise>
			<script>
				alert("������ �����߽��ϴ�.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>


