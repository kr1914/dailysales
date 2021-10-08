<%@page import="com.daily.dto.Article"%>
<%@page import="com.daily.dao.DbAcesse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	DbAcesse dao = DbAcesse.getInstance();
	Article article = null;
	String index = request.getParameter("bd_index");
	article = (Article)dao.selectArticle(index);
	String text = article.getBd_article();
	article.setBd_article(text.replace("<br>", "\n"));
%>
	<c:set var="modi" value="<%=article %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<h2>게시글 수정</h2>
<!-- 로그인 확인 -->
<c:choose>
	<c:when test="${empty ID}">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			window.location = "Board.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<form action="ModifyPost_action.jsp">
			<div class="wrap">
				<div class="article">
					<div class="header">
					
						<div id="postDiv"> </div>
						<div class="table-responsiv">
							<table class="table table-striped">
								<tr>
								<% String header [] = {"공지사항","문의사항","자유글","뉴스"}; %>
									<td style="width:10%">머리말</td>
									<td style="width:90%">
										<select name="header">
										<c:choose>
											<c:when test="${modi.bd_header eq '이용가이드'}">
												<option value="이용가이드" selected="selected">이용가이드</option>
											</c:when>
											<c:otherwise>
												<c:forEach var="head" items="<%=header%>">
													<c:choose>
														<c:when test="${modi.bd_header eq head}">
															<option value="${head}" selected="selected">${head}</option>
														</c:when>
														<c:otherwise>
															<option value="${head}">${head}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
											
										</select>
									</td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" value="${modi.bd_title}"></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text" name="wirter" disabled value="<%=session.getAttribute("ID")%>"></td>
								</tr>
							</table>
							<hr>
						</div>
					</div>
					<div class="section"> <!-- 차후에 링크 부분은 변경이 필요함. -->
						<div class="mainText table-responsiv">
							<table class="table-striped table">
								<tr>
									<td style="width:10%">내용</td>
									<td style="width:90%"><textarea rows="20" cols="70" name="article">${modi.bd_article}</textarea></td>
								</tr>
							</table>
						</div>
					</div>
							<input type="submit" value="수정">
							<input type="hidden" name="index" value="${modi.bd_index}">
							<input type="button" value="이전으로" onclick="back()">
				</div>
			</div>
		</form>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
	function back() { //이전 페이지로 이동
		history.back();
	}
</script>
</body>
</html>
