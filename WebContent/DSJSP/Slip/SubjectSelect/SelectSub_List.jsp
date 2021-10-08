<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="List"/>
<script>
function NoneResultSub() {
	var sub_name = "<%=request.getAttribute("key")%>";
		$.ajax({
			url:"SlectSubPop.do",
			data: {sub_name:sub_name},
			error: function(e) {
				alert("에러");
			},
			success: function(e) {
				$('#pager').html(e);
			}
		});
}
NoneResultSub();
</script>