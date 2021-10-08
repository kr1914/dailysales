<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    List<Map<String,Object>> subList = null;
    subList = (List<Map<String,Object>>)request.getAttribute("subList");
    %>
<style>
.subPopupOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);position:fixed;top:0px; }
.subPopupWrapper{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#fdfdfd; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 300px; z-index:20;}
.SubTableContainer{width:100%; height:400px; overflow-y:scroll;}
.SubTable{ cursor:default; width:100%;   resize:vertical; border: solid 0.5px gray; }
.SubTable > tbody > tr>th:first-child{border-right: solid 1px gray; border-bottom: solid 1px gray; }
.SubTable > tbody > tr>th{box-sizing:border-box; border-bottom: solid 2px #fd4c4c; border-right: solid 1px #fd4c4c;font-size:11px; height: 18px; font-weight: bold; text-align: center; margin:0; padding:0; background-color:#fef2f2;}
.SubTable > tbody > tr>th:active{border-left: solid 1.5px #b5b5b5; border-top:solid 2px #b5b5b5; border-bottom: solid 0.5px #fd4c4c; border-right: solid 0.5px #fd4c4c;}
.SubTable > tbody > tr>th:nth-child(n+2){ border-right:solid 1px #da9e9e;}
.SubTable > tbody > tr>td{ font-size: 11px; text-align:center; margin:0; padding:0 5px 0 5px; text-overflow: hidden; height:20px;  border-right:solid 1px #da9e9e;}
.SubTable >tbody > tr > td:first-child {background-color:#fef2f2; border-right: double 1px gray; border-bottom:double 1px gray; text-align: center;}
</style>
<script>
$(document).on('click','.SubTable td', function() {
	$('tbody>tr>td:nth-child(n+2)').css({'background-color':'white','color':'black'});
	select = $(this).parent().children('td:first-child');
	selectLine = $(this).parent().children('td:nth-child(n+2)');
	selectLine.css({
		'background-color':'#4646cc7a',
		'color':'#e5ff97'
	});
});

//계정과목 선택기능
function selectSubTable(td) {
	var tdIndex = $('#SlipViewer td[state="update"][class="sub_name"]').index();
	console.log(tdIndex);
	td.parent().children('td').each(function(index, item) {
		if(index == 0){
			$('#SlipData td[class="sub_code"]').eq(tdIndex-1).children('span').text($(item).text());
		}else if(index == 1){
			$('#SlipData td[class="sub_name"]').eq(tdIndex-1).children('span').children('input').val($(item).text());
		}
	});
}
//계정과목 더블클릭시 선택 기능
$(document).on('dblclick','.SubTable td', function() {
	selectSubTable($(this));
	closeSubPop();
});
//계정과목 선택 팝업 
function closeSubPop() {
	$('.subPopupOverlay').fadeOut(300);
	$('.subPopupWrapper').fadeOut(300);
	$('#pager').delay(300).html("");
}

$(document).on('click','.subPopupOverlay', function () {
	if(confirm("정말로 닫으시겠습니까?")){
		closeSubPop();
	}
});
</script>
<div class="subPopupOverlay">
</div>
<div class="subPopupWrapper">
<div class="SubTableContainer">
	<table class="SubTable">
		<tr>
			<th>과목코드</th>
			<th>과목명</th>
			<th>분류</th>
		</tr>

				<%for(Map<String, Object> sub : subList){

%>

		<tr>
			<td><%=sub.get("sub_code") %></td>
			<td><%=sub.get("sub_name") %></td>
			<td><%=sub.get("sub_cla") %></td>
		</tr>
<%
}
%>
			</table>
		</div>
</div>
