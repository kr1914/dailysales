<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	List<Map<String, Object>> chart = null;
	List<Map<String, Object>> board = null;
	List<Map<String, Object>> custSales = null;
	List<Map<String, Object>> guide = null;
	
	board = (List<Map<String, Object>>)request.getAttribute("board");

	if(session.getAttribute("nowCo")!=null){
		
		chart = (List<Map<String, Object>>)request.getAttribute("chartData");
		custSales = (List<Map<String, Object>>)request.getAttribute("custSales");
		guide = (List<Map<String, Object>>)request.getAttribute("guide");
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <jsp:include page="HtmlLib.jsp"></jsp:include>
	<link rel="stylesheet" href="css/main.css"/>
	<jsp:include page="js/main.jsp" flush="true"></jsp:include>
  </head>

  <body>
  <c:choose>
  	<c:when test="${empty ID}">
  		<jsp:include page="index.jsp" flush="true"></jsp:include>
  	</c:when>
  	<c:otherwise>
  <script>
  


  $(function () {
	  
	  // Graphs
	  var ctx1 = document.getElementById('myChart1');
	  // eslint-disable-next-line no-unused-vars
	  ctx1.height = 300;
	  var myChart = new Chart(ctx1, {
	    type: 'line',
	    data: {
	      labels: [
	    	  <% for(Map<String, Object> ct : chart){%>
	        '<%=ct.get("date")%>',
	        <%}%>
	      ],
	      datasets: [{
	        data: [
	        	<% for(Map<String, Object> ct : chart){%>
	          <%=ct.get("amount")%>,
	          <%}%>
	        ],
	        lineTension: 0,
	        backgroundColor: 'transparent',
	        borderColor: '#007bff',
	        borderWidth: 1,
	        pointBackgroundColor: '#007bff'
	      }]
	    },
	    options: {
	    	maintainAspectRatio: false,
	    	title:{
	    		display: true,
	    		text: "매출 현황",
	    	},
	      scales: {
	        yAxes: [{
	          ticks: {
	            beginAtZero: false,
	            
	          },
	          scaleLabel:{
	        	  display: true,
	        	  labelString: '1 = 1000원',
	          },
	        }]
	      },
	      legend: {
	        display: false
	      }
	    }
	  });
	  
	// Graphs
	  var ctx2 = document.getElementById('myChart2');
	  ctx2.height = 300;
	  var myChart = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	      labels: [
	    	  <% for(Map<String, Object> cs : custSales){%>
	        '<%=cs.get("cust_name")%>',
	        <%}%>
	      ],
	      datasets: [{
	    	label: '매출액',
	        data: [
	        	<% for(Map<String, Object> cs : custSales){%>
	          <%=cs.get("amount")%>,
	          <%}%>
	        ],
	        borderWidth: 1,
	        backgroundColor: 'transparent',
	        borderColor: '#af3d3d',

	      }]
	    },
	    options: {
	    	maintainAspectRatio: false,
	    	title:{
	    		display: true,
	    		text: "상위 매출 거래처",
	    	},
	    	scales:{
	    		yAxes: [{
	    			ticks: {
	    				beginAtZero: false,
	    			},
	  	          scaleLabel:{
		        	  display: true,
		        	  labelString: '1 = 1000원',
		          },
	    		}]
	    	}
	    },
	  });
	  
//슬라이드 메뉴
	  const swiper = new Swiper('.swiper', {
		  // Optional parameters
		  autoplay: {
			  delay: 5000,
		  },
		  direction: 'horizontal',
		  loop: true,

		  // If we need pagination
		  pagination: {
		    el: '.swiper-pagination',
		  },

		});
	  
	});
  
	
  
  function detectMediaSize() { 
	    if ( window.matchMedia('(min-width: 0px) and (max-width: 500px)').matches ) {
	    	$('#info > p').css('font-size','11px');
	    } else {
	    	$('#info > p').css('font-size','14px');
	    }
	};

	// Register
	window.addEventListener('resize', detectMediaSize, false);

	// Initialization
	detectMediaSize(); 
</script>
  <div id="info">
   <h1>Daily Sales</h1>
   <p> 안녕하십니까. 데일리 세일즈는 회사 관리의 꼭 필요한 부분만 모아 회계프로그램 또는 ERP가 능숙하지 않은 분도 쉽게 사용할 수 있도록
   고안된 회계관리 프로그램입니다. 회사에서 가장 기본이자 중요한 판매를 기록하는 것에 초점을 맞춰 입력할 수 있도록 만들어져있습니다.
   하루하루 매출을 정리하며 수금과 비용을 입력해 보면서 회사의 상태를 파악하고 방향성을 정함에 있어 많은 도움이 될 것입니다.
   </div>
   <p>
   
   <div class="row main">
	   <div class="col-sm-6">
	   		<div id="charts" class="col-sm-12 mainChart">
	   			<canvas id="myChart1"></canvas>
	   		</div>
	   </div>
	   <div class="col-sm-6">
	   		<div class="col-sm-12 mainChart">
	   			<canvas id="myChart2" ></canvas>
	   		</div>
	   </div>

   </div>
   <div class="row main">
	   <div class="col-sm-3 col-xs-6">
		   <div class="col-sm-12 mainChart">
		   		<div class="swiper">
				  <!-- Additional required wrapper -->
				  <div class="swiper-wrapper">
				    <!-- Slides -->
				    <div class="swiper-slide"><img class="bannerImg" alt="돈의속성" src="../img/book1.jpg"> </div>
				    <div class="swiper-slide"><img class="bannerImg" alt="돈의속성" src="../img/book2.jpg"></div>
				    <div class="swiper-slide"><img class="bannerImg" alt="돈의속성" src="../img/book3.jpg"></div>
				  </div>
				  <!-- If we need pagination -->
				  <div class="swiper-pagination"></div>

				  <!-- If we need scrollbar -->
				  <div class="swiper-scrollbar"></div>
				</div>
		   </div>
	   </div>
	   <div class="col-sm-3 col-xs-6">
		   	<div class="col-sm-12 mainChart">
			   	<a href="Board/Board.jsp" target="content"> 게시판</a>
			   	<div class="table-responsiv boardDiv">
			   	<table class="table table-striped board">
			   	<% for(Map<String,Object> bd : board){ %>
			   		<tr>
			   			<td><a href="Board/ViewArticle.jsp?bd_index=<%=bd.get("bd_index")%>"><%=bd.get("board") %></a> </td>
			   			<td><%=bd.get("date") %></td>
		   			</tr>
	   			<%} %>
			   	</table>
			   	</div>
		   </div>
	   </div>
	   <div class="col-sm-3 col-xs-6">
	 	  <div class="col-sm-12 mainChart">
		   		<a href="Guide.do">DailySales 이용가이드</a>
				<div class="table-responsiv guideDiv">
			   	<table class="table table-striped board">
			   	<% for(Map<String,Object> gd : guide){ %>
			   		<tr>
			   			<td><a href="Board/ViewArticle.jsp?bd_index=<%=gd.get("bd_index")%>"><%=gd.get("guide") %> </a></td>
			   			<td><%=gd.get("date") %></td>
		   			</tr>
	   			<%} %>
			   	</table>
			   	</div>
		   </div>
	   </div>
	   <div class="col-sm-3 col-xs-6">
	 	  <div class="col-sm-12 mainChart">
				<div class="swiper">
				  <!-- Additional required wrapper -->
				  <div class="swiper-wrapper">
				    <!-- Slides -->
				    <div class="swiper-slide">
    					<div class="table-responsiv">
			  		 	<table class="table Site">
				    		<tr>
				    			<td><img class="suportSite" alt="홈텍스" src="../img/hometax.webp"></td>
				    			<td>홈텍스</td>
				    		</tr>
				    		<tr>
				    			<td><img class="suportSite" alt="홈텍스" src="../img/insurance.png"></td>
				    			<td>4대보험료 계산기</td>
				    		</tr>
				    		<tr>
				    			<td><img class="suportSite" alt="홈텍스" src="../img/hometax.webp"></td>
				    			<td>홈텍스</td>
				    		</tr>
				    	</table>
				    	</div>
				    </div>
				    <div class="swiper-slide">
      					<div class="table-responsiv">
			  		 	<table class="table Site">
				    		<tr>
				    			<td><img class="suportSite" alt="홈텍스" src="../img/hometax.webp"></td>
				    			<td>홈텍스</td>
				    		</tr>
				    		<tr>
				    			<td><img class="suportSite" alt="홈텍스" src="../img/insurance.png"></td>
				    			<td>4대보험료 계산기</td>
				    		</tr>
				    		<tr>
				    			<td><img class="suportSite" alt="홈텍스" src="../img/hometax.webp"></td>
				    			<td>홈텍스</td>
				    		</tr>
				    	</table>
				    	</div>
				    </div>
				  </div>
				  <!-- If we need pagination -->
				  <div class="swiper-pagination"></div>
				
				</div>
		   		
		   </div>
	   </div>
   </div>
   <div class="row main">
  		<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	   
	  	</div>
	  	<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	
	  	</div>
	  	<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	
	  	</div>
	  	<div class="col-md-2 col-sm-3 col-xs-6" style="background-color:purple">
	  
	  	</div>
   </div>
     	</c:otherwise>
  
  </c:choose>
  </body>

</html>
<%} %>
