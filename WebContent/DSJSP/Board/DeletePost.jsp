<%@page import="com.daily.dto.Article"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.daily.dao.DbAcesse"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	DbAcesse dao = DbAcesse.getInstance();
	Article article = null;
	String index = request.getParameter("bd_index");
	article = (Article)dao.selectArticle(index);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:include page="..\HtmlLib.jsp"></jsp:include>
</head>
<body>

	<c:set var="ck" value="<%=article %>"/>
	<!-- �� �ۼ��ڿ� �α��ε� ���̵� ��ġ Ȯ�� -->
	<c:if test="${ck.bd_creator != ID}">
		<script>
			alert("�߸��� �����Դϴ�.");
			history.back();
		</script>
	</c:if>
	
	<script type="text/javascript">
	  var check = prompt("�����Ͻ÷��� '����'�� �Է����ּ���.");
	  var index = "<%=request.getParameter("bd_index")%>";
	  if(check=='����'){
		  $.ajax({
			 	url:"DeletePost_action.jsp",
				type:"post",
				data:{deletePost : index},
				error: function() {
					alert("����");
				},
				success : function(a) {
					alert("�����Ϸ�");
					location.href = "Board.jsp"
				},
		  });
	  }else {
		  alert("�߸��� �Է��Դϴ�.");
		  history.back();
	  }
		  
	</script>

</body>
</html>