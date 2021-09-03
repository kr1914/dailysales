<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="NoneStk">
<script type="text/javascript">
	function NoneResultStk() {
		var create = "<%=request.getAttribute("key")%>";
		if(confirm("없는 상품 이름입니다. \n상품을 검색하시겠습니까?")){
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
	NoneResultStk();
</script>