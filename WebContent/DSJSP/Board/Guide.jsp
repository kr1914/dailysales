<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.daily.dao.DbAcesse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 자유게시판 페이지, 테이블 구성 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="..\HtmlLib.jsp"></jsp:include> <!-- jquery, bootstrap -->
</head>
<style>
 ul {
 list-style-type: none;
 display: inline-flex;
 }
 li {margin-left:5px; margin-right:5px;}
 a{cursor: pointer;}
</style>
<script>
$(document).ready(function() {
	boardlist(1); // 첫페이지 로딩
		
});


function boardlist(page) {
	$.ajax({
		url:"BoardList.do",
		type:"POST",
		data:{page:page, type:"guide"},
		error: function(e) {
			console.log(e);
		},
		success: function(e) {
			$('.table-responsiv').html(e);
		}
	});
}
</script>
<body>
<h1>이용가이드</h1>
<!-- Bootstrap 테이블. 넓이가 870 ~ 930px정도로 작아졌을때 게시판 화면을 준비해야함.(미완) -->
<div class="table-responsiv">
	<table class="table table-striped">
		<thead>
			<tr>
				<th style="width:10%">글번호</th>
				<th style="width:10%">말머리</th>
				<th style="width:35%">글제목</th>
				<th style="width:15%">글쓴이</th>
				<th style="width:10%">작성일</th>
				<th style="width:10%">조회수</th>
				<th style="width:10%">추천수</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div id="paging">

	</div>
</div>

<div>
	<a href="WriteArticle.jsp"><input type="button" value="글 작성"></a>
</div>
</body>
</html>