<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:include page="..\HtmlLib.jsp"></jsp:include>
</head>
<body>
<!-- �����ͺ��̽� ���� -->
	<sql:setDataSource var="db" scope="page" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal?useUnicode=true&characterEncoding=utf8" user="root" password="810904"/>
	
	<sql:query var="check" dataSource="${db}">
		select * from board where bd_index=<%=request.getParameter("bd_index") %>;
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