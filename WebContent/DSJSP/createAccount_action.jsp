<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
  </body>
</html>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal?useUnicode=true&characterEncoding=utf8" user="root" password="810904"/>
<sql:update var="crt" dataSource="${db}">
insert into member values('<%=request.getParameter("email") %>','<%=request.getParameter("nickname") %>','<%=request.getParameter("name") %>','<%=request.getParameter("pwd1") %>','<%=request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3")%>','<%= request.getParameter("address") %>','<%= request.getParameter("address2")+""+request.getParameter("address3") %>','<%= request.getParameter("birth") %>','<%= request.getParameter("gender") %>','2021-07-12','test');
</sql:update>

<% response.sendRedirect("main.jsp");%>