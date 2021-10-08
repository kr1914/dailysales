<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.daily.dto.Article"%>
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
	int result = dao.viewArticle(index);
	if(result>0){
		dao.commit();
	}else {
		dao.rollback();
	}
%>
	<c:set var="pos" value="<%=article%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- �� ���̺귯�� ȣ�� -->
<jsp:include page="..\HtmlLib.jsp"></jsp:include>
<script type="text/javascript">
	function back() {
		history.back();
	}
	function modify() {
		location.href = "ModifyPost.jsp?bd_index="+<%=request.getParameter("bd_index")%>;
	}

	function viewArticleSize() { 
	    if ( window.matchMedia('(min-width: 0px) and (max-width: 800px)').matches ) {
	    	$('.wrap').css('width','100%');
	    } else {
	    	$('.wrap').css('width','900px');
	    }
	};

	// Register
	window.addEventListener('resize', viewArticleSize, false);

	// Initialization
	viewArticleSize(); 
	
	$(function () {
		
		
//���� ��ư Ŭ���� ���ƿ� ��� �۵�, ���� �߻��� ��α��� ���� Ȯ�� �� ��α��λ����̸� �α��� �ʿ� �޼��� �˸�
	$(document).on({
		click: function () {
			var check = '<%=(String)session.getAttribute("ID")%>';
			$.ajax({
				url:"likey_action.jsp",
				type:"post",
				data: {bd_index : <%=request.getParameter("bd_index")%>},
				error:function(request,error){
					if(check=="null"){
						alert("�α����� �ʿ��մϴ�.");
					}else {
						alert("message:"+request.responseText); //���Ŀ� ���� �з����� �޼��� ���� ���
					}
			     },
				success: function (e) {
					$('.thumbsUp').html(e);
				},
			});
		}
	},".bi");
		
		
	});
	
	$(document).on({
	    mouseenter: function () {
	    	$('.bi').css({
				'transform':'scale(1.2)',
				'transition':'0.2s',
			})
	    },
	    mouseleave: function () {
	    	$('.bi').css({
				'transform':'scale(1)',
				'transition':'0.2s',
				
			})
	    }
	}, ".bi");
</script>
</head>
<style>
	html, body{width:100%;height:100%;}
	.wrap{width:100%;height:100%;margin-top:40px;padding-left:20px;}
	div{border:solid 1px white;}
	#postDiv{background-color:#dfa0ff; color:white;}
	.mainText{width:100%;min-height:500px;}
	.thumbsUp{width:100%;height:50px;margin: 0 auto; text-align: center; margin-top:15px;margin-bottom:15px;}
	.bi{width:50px;height:50px;}
	.modifyBtn{border: none;    background-color: #c9c9e8;    height: 25px;    font-size: 13px;    font-weight: bold;}
	.backBtn{border: none;    background-color: #fdd0eb;    height: 25px;    font-size: 13px;    font-weight: bold;}
</style>
<body>
	<div class="wrap">
		<div class="article">
			<div class="header">
				<div id="postDiv">[${pos.bd_header}]</div>
				<hr>
				<div id="posttitle"><h2>${pos.bd_title}</h2></div>
				<div id="dateCreated"><span><fmt:parseDate var="date" value="${pos.bd_date}" pattern="YYYY-MM-dd HH:ss"></fmt:parseDate>
				
				<fmt:formatDate value="${date}" pattern="YYYY-MM-dd HH:ss"/></span></div>
				<div id="writer">�ۼ��� : ${pos.bd_creator}</div>
				<hr>
			</div>
			<div class="section"> <!-- ���Ŀ� ��ũ �κ��� ������ �ʿ���. -->
				<div class="mainText">${pos.bd_article}</div>
			</div>
			<div class="thumbsUp">
			<!-- ���ƿ� �߾����� ����Ȯ�� �� ���ƿ� ������ ���� -->
	<%
		HashMap<String, String> info = new HashMap<String, String>();
		info.put("index", index);
		info.put("ID",(String)session.getAttribute("ID"));
		Map<String, Object> checkLike = dao.checkLikey(info);
	%>
		<c:set var="cklike" value="<%=checkLike%>"></c:set>
			<c:choose>
				<c:when test="${cklike.like_state =='1'}">
					<img class="bi" src="..\..\img\hand-thumbs-up-fill.svg" alt="���ƿ�">
				</c:when>
				<c:otherwise>
					<img class="bi" src="..\..\img\hand-thumbs-up.svg" alt="���ƿ�">
				</c:otherwise>
			</c:choose>
			</div>
				<c:if test="${ID eq pos.bd_creator}">
					<input class="modifyBtn" type="button" value="�����ϱ�" onclick="modify()">
				</c:if>
					<input class="backBtn" type="button" value="��������" onclick="back()">
		</div>
	</div>
</body>
</html>