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
<!-- 데이터베이스 연결 -->
	<sql:setDataSource var="db" scope="page" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal?useUnicode=true&characterEncoding=utf8" user="root" password="810904"/>
	
	<sql:query var="check" dataSource="${db}">
		select * from board where bd_index=<%=request.getParameter("bd_index") %>;
	</sql:query>
	
	<!-- 글 작성자와 로그인된 아이디 일치 확인 -->
	<c:forEach var="ck" items="${check.rows}">
		<c:if test="${ck.bd_creator != ID}">
			<script>
				alert("잘못된 접근입니다.");
				history.back();
			</script>
		</c:if>
	</c:forEach>
	
	<script type="text/javascript">
	  var check = prompt("삭제하시려면 '삭제'를 입력해주세요.");
	  var index = "<%=request.getParameter("bd_index")%>";
	  if(check=='삭제'){
		  $.ajax({
			 	url:"DeletePost_action.jsp",
				type:"post",
				data:{deletePost : index},
				error: function() {
					alert("에러");
				},
				success : function(a) {
					alert("삭제완료");
					location.href = "Board.jsp"
				},
		  });
	  }else {
		  alert("잘못된 입력입니다.");
		  history.back();
	  }
		  
	</script>

</body>
</html>