<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="ListDataStk">
<script type="text/javascript">
	function MultiResultStk() {
		var create = "<%=request.getAttribute("key")%>";
		if(confirm("<%=request.getAttribute("size")%>건의 이름이 검색되었습니다.. \n상품을 검색하시겠습니까?")){
			$.ajax({
				url:"SlipMgtStkListPop.do",
				data:{keyword:create},
				error: function() {
					
				},
				success: function(e) {
					$('#pager').html(e);
				}
			});
		}
	}
	MultiResultStk();
</script>