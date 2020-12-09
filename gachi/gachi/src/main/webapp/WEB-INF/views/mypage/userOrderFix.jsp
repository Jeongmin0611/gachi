<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:if test="${result gt 0 }">
	<script>
		swal({
			title: "완료",
			text: "구매확정이 완료되었습니다!",
			icon: "success",
			closeOnClickOutside: false,
			buttons: {
				confirm : {
					text: "확인",
					value: true,
					className: "btn btn-outline-light"
				}
			}
		}).then((result)=>{
			history.back();
		});
	</script>
</c:if>
<c:if test="${result le 0 }">
	<script>
		swal({
			title: "경고",
			text: "구매확정에 실패하였습니다.",
			icon: "error",
			closeOnClickOutside: false,
			buttons: {
				confirm : {
					text: "확인",
					value: true,
					className: "btn btn-outline-light"
				}
			}
		}).then((result)=>{
			history.back();
		});
	</script>
</c:if>