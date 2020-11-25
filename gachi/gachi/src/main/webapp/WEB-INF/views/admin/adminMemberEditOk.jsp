<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test ="${result>0 }">
	<script>
		alert("정보가 수정되었습니다.");
		location.href="/gachi/adminMember"
	</script>
</c:if>

<c:if test="${result<=0 }">
	<script>
		alert("정보 수정을 실패하였습니다.");
		history.back();
	</script>
</c:if>