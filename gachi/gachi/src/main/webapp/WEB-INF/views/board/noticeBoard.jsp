<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 공지 사항 -->
<style>
h3, li, button,input[type=button], select option {
	font-family: 'OSeongandHanEum';
}

#noticeUl {
	margin: 60px 150px;
}

#noticeUl li {
	width: 10%;
	float: left;
	border-bottom: 1px solid gray;
}

#noticeUl li:nth-child(5n+2) {
	width: 60%;
}

#noticeUl li:nth-child(1) {
	background-color: #EDE9E9;
}

#noticeUl li:nth-child(2) {
	background-color: #EDE9E9;
}

#noticeUl li:nth-child(3) {
	background-color: #EDE9E9;
}

#noticeUl li:nth-child(4) {
	background-color: #EDE9E9;
}

#noticeUl li:nth-child(5) {
	background-color: #EDE9E9;
}

#noticeSearch {	
	float: right;
}

#noticeSearchTxt {
	border: 0;
	border-bottom: 1px solid black;
	outline: none;
}

#noticeSearch button {
	background-color: white;
	color: black;
	border:0;
}
#noticeSearch button:focus{
	outline: none;
	color: #888;
}
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
		<h3>공지사항</h3>
		<div id="noticeSearch">
			<select name="noticeSubject">
				<option value='Nall'>전체</option>
				<option value='Nsubject'>제목</option>
				<option value='Ncontent'>내용</option>
			</select> 
			<input type="text" name="noticeSearchTxt" id="noticeSearchTxt" />
			<button name="noticeSearchBtn">검색하기</button>
		</div>
		<ul id="noticeUl">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회수</li>


			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회수</li>
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회수</li>
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회수</li>
			

		</ul>
	</div>
</div>