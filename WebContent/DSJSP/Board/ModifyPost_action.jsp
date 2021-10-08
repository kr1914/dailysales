<%@page import="com.daily.dto.Article"%>
<%@page import="com.daily.dao.DbAcesse"%>
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
<%
	DbAcesse dao = DbAcesse.getInstance();
	Article article = null;
	String index = request.getParameter("index");
	article = (Article)dao.selectArticle(index);
%>
	<c:set var="ck" value="<%=article %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�Խ��� �� �ۼ�</title>
</head>
<body>
	
	<!-- �� �ۼ��ڿ� �α��ε� ���̵� ��ġ Ȯ�� -->
	<c:if test="${ck.bd_creator != ID}">
		<script>
			alert("�߸��� �����Դϴ�.");
			history.back();
		</script>
	</c:if>
	
	<!-- ������Ʈ �� sql ���� -->
	<%
	article.setBd_article(request.getParameter("article").replace("\n","<br>"));
	article.setBd_title(request.getParameter("title"));
	article.setBd_header(request.getParameter("header"));
	article.setBd_date("now()");
	int result = dao.updateArticle(article);
	if(result>0){
		dao.commit();
	}else {
		dao.rollback();
	}
	%>
	<c:set var="modifySql" value="<%=result %>"/>
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


