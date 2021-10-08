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
	<!-- 글 작성자와 로그인된 아이디 일치 확인 -->
	<c:if test="${ck.bd_creator != ID}">
		<script>
			alert("잘못된 접근입니다.");
			history.back();
		</script>
	</c:if>
	
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