<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!-- 데이터 베이스 연결 -->
<sql:setDataSource var="db"  scope="page" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dailysal" user="root" password="810904"/>
<sql:update var="view" dataSource="${db}">
	update board set bd_view = bd_view+1 where bd_index=<%=request.getParameter("bd_index")%>;
</sql:update>
<sql:query var="post" dataSource="${db}">
	select * from board where bd_index=<%=request.getParameter("bd_index") %>;
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- 웹 라이브러리 호출 -->
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
		
		
//엄지 버튼 클릭시 좋아요 기능 작동, 에러 발생시 비로그인 여부 확인 후 비로그인상태이면 로그인 필요 메세지 알림
	$(document).on({
		click: function () {
			var check = '<%=(String)session.getAttribute("ID")%>';
			$.ajax({
				url:"likey_action.jsp",
				type:"post",
				data: {bd_index : <%=request.getParameter("bd_index")%>},
				error:function(request,error){
					if(check=="null"){
						alert("로그인이 필요합니다.");
					}else {
						alert("message:"+request.responseText); //차후에 에러 분류별로 메세지 별도 출력
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
</style>
<body>
	<div class="wrap">
		<div class="article">
			<c:forEach var="pos" items="${post.rows}">
			<div class="header">
				<div id="postDiv">[${pos.bd_header}]</div>
				<hr>
				<div id="posttitle"><h2>${pos.bd_title}</h2></div>
				<div id="dateCreated"><span><fmt:formatDate value="${pos.bd_date}" pattern="YYYY-MM-dd HH:ss"/></span></div>
				<div id="writer">작성자 : ${pos.bd_creator}</a></div>
				<hr>
			</div>
			<div class="section"> <!-- 차후에 링크 부분은 변경이 필요함. -->
				<div class="mainText">${pos.bd_article}</div>
			</div>
			<div class="thumbsUp">
			<!-- 좋아요 했었는지 여부확인 후 좋아요 아이콘 생성 -->
				<sql:query var="checkLike" dataSource="${db}">
					select count(*) count, like_state from likey where like_article=${pos.bd_index} and like_email='<%=(String)session.getAttribute("ID")%>';
				</sql:query>
				<c:forEach var="cklike" items="${checkLike.rows}">
					<c:choose>
						<c:when test="${cklike.like_state =='1'}">
							<img class="bi" src="..\..\img\hand-thumbs-up-fill.svg" alt="좋아요">
						</c:when>
						<c:otherwise>
							<img class="bi" src="..\..\img\hand-thumbs-up.svg" alt="좋아요">
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
				<c:if test="${ID eq pos.bd_creator}">
					<input type="button" value="수정하기" onclick="modify()">
				</c:if>
					<input type="button" value="이전으로" onclick="back()">
			
			</c:forEach>
		</div>
	</div>
</body>
</html>