<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal?useUnicode=true&characterEncoding=utf8" user="root" password="810904"/>
	
	<sql:update var="delete" dataSource="${db}">
		delete from board where bd_index=<%=request.getParameter("deletePost")%>;
	</sql:update>
</body>
</html>