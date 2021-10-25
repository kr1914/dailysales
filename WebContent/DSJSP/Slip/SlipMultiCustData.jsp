<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="ListData">
<script type="text/javascript">
	function InsertCust() {
		console.log("InsertCust");
		var create = "<%=request.getAttribute("key")%>";
		var size = <%=request.getAttribute("size")%>;
		if(confirm(size+"개의 거래처가 검색되었습니다. \n리스트를 오픈하시겠습니까?")){
			$.ajax({
				url:"/dailySales/DSJSP/Slip/SlipMgtCustListPop.do",
				data:{keyword:create},
				error: function() {
					console.log("에러");
				},
				success: function(e) {
					$('#pager').html(e);
				}
			});
		}
	}
	InsertCust();
</script>
