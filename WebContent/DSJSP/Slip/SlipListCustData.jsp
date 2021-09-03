<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="ListData">
<script type="text/javascript">
	function SearchMultiCust() {
		var create = "<%=request.getAttribute("key")%>";
			$.ajax({
				url:"SlipMgtCustListPop.do",
				data:{keyword:create},
				error: function() {
					
				},
				success: function(e) {
				}
			});
	}
	SearchMultiCust();
</script>
