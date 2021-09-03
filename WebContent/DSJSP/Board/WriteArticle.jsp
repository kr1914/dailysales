<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성</title>
<jsp:include page="..\HtmlLib.jsp"></jsp:include>
<script type="text/javascript">
	function back() {
		history.back();
	}
</script>
</head>
<style>
	html, body{width:100%;height:100%;}
	.wrap{width:100%;height:100%;margin-top:40px;padding-left:20px;}
	div{border:solid 1px white;}
	#postDiv{background-color:#dfa0ff; color:white; height:30px;}
	.mainText{width:100%;height:80%;}
	.table{margin-bottom:0px;}
</style>
<body>
<c:choose>
	<c:when test="${empty ID}">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			window.location = "Board.jsp";
		</script>
	</c:when>
	<c:otherwise>
				<form action="WriteArticle_action.jsp">
			<div class="wrap">
			<h2>게시글 작성</h2>
				<div class="article">
					<div class="header">
						<div id="postDiv"> </div>
						<div class="table-responsiv">
							<table class="table table-striped">
								<tr>
									<td style="width:10%">머리말</td>
									<td style="width:90%"><select name="header">
								<option value="공지사항">공지사항</option>
								<option value="문의사항">문의사항</option>
								<option value="자유글">자유글</option>
								<option value="뉴스">뉴스</option>
								</select></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="textbox" name="title"></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text" name="wirter" disabled value="<%=session.getAttribute("ID")%>"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="section"> <!-- 차후에 링크 부분은 변경이 필요함. -->
						<div class="mainText table-responsiv">
							<table class="table-striped table">
								<tr>
									<td style="width:10%">내용</td>
									<td style="width:90%"><textarea rows="20" cols="70" name="article"></textarea></td>
								</tr>
							</table>
						</div>
					</div>
							<input type="submit" value="작성">
							<input type="button" value="이전으로" onclick="back()">
				</div>
			</div>
		</form>
	</c:otherwise>
</c:choose>

</body>
</html>