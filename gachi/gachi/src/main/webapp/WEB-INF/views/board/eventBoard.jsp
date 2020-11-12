<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
h3, li, button,input[type=button], select option {
	font-family: 'OSeongandHanEum';
}
#eventBtnDiv{
	float:right;
}
#eventBtnDiv input[type=button]{
	text-align: center;
	border:0;
	height: 30px;
	line-height: 20px;
	width:150px;
	margin: 0 10px;
}
.boardDiv{background-color: orange}
</style>
<script>
	$(function(){
		$('#noticeBtn').click(function(){
			location.href="<%=request.getContextPath()%>/noticeBoard";
		});
		$('#eventBtn').click(function(){
			location.href="<%=request.getContextPath()%>/eventBoard";
		});
		
	});
</script>
<div class="boardDiv">
	<div class="boardBtnDiv">
		<input type="button" id="noticeBtn" value="공지사항"/>
		<input type="button" id="eventBtn" value="이벤트"/>
	</div>
	<!-- 내용 표시 -->
	<div>
		<h3>이벤트</h3>
		<div id = "eventBtnDiv">
			<input type="button" id="ingEvent" value="진행중인 이벤트"/>
			<input type="button" id="endEvent" value="종료된 이벤트"/>
		</div>
		
		<!-- 이벤트 리스트 -->
		<ul>
			<li></li>
		</ul>
	</div>
</div>