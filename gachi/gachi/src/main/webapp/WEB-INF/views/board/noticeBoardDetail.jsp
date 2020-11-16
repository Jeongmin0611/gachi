<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#noticeDetailUl{
	
}
#noticeDetailUl li{
	float: left;
	margin-top:10px;
}
#noticeDetailUl li:nth-child(1),#noticeDetailUl li:nth-child(3){
	width:15%;
}
#noticeDetailUl li:nth-child(2), #noticeDetailUl li:nth-child(4){
	width:85%;
}
#noticeDetailUl li:nth-child(5){
	width:100%;
	margin-bottom: 20px;
	
}
/* 버튼 */
#noticeDetialBtn{
	margin: 20px 0;
}

</style>
<script>
	$('#noticeDetaillistBtn').click(function(){
		location.href="/gachi/noticeBoard";
	});
</script>
<div class="container">
	<div>
		<ul id="noticeDetailUl">
			<li>제목</li>
			<li>공지사항 제목입니다.</li>
			<li>등록일</li>
			<li>2020-10-16</li>
			<li>공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용 공지사항 내용 내용
			</li>
		</ul>
	</div>
	<!-- 버튼 -->
	<div id="noticeDetialBtn">	
		<button type="button" class="btn btn-light">이전</button>
		<button type="button" class="btn btn-light">다음</button>
		<button type="button" class="btn btn-light" id="noticeDetaillistBtn">목록</button>
	</div>
</div>