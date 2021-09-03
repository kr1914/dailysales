<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="None">
<script type="text/javascript">
	function InsertCust() {
		var create = "<%=request.getAttribute("key")%>";
		if(confirm("없는 거래처 이름입니다. \n거래처를 검색하시겠습니까?")){
			$.ajax({
				url:"SlipMgtCustListPop.do",
				data:{keyword:create},
				error: function() {
					
				},
				success: function(e) {
					$('#pager').html(e);
				}
			});
		}
	}
	InsertCust();
</script>
