<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="ListData">
<script type="text/javascript">
	function InsertCust() {
		var create = "<%=request.getAttribute("key")%>";
		var size = <%=request.getAttribute("size")%>;
		if(confirm(size+"개의 거래처가 검색되었습니다. \n리스트를 오픈하시겠습니까?")){
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
