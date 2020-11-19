<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 공지 사항 -->
<style>

h3{
	margin-top:50px;
	text-align: center;
}

#CnoticeSearch {
	text-align: right;
	width: 100%;
}

#CnoticeSearchTxt {
	border: 0;
	border-bottom: 1px solid black;
	outline: none;
}

#CnoticeSearch button {
	background-color: white;
	color: black;
	border: 0;
}

#CnoticeSearch button:focus {
	outline: none;
	color: #888;
}
/* 테이블 */
table {
	margin-top:20px;
}


/* 페이징 */
#CnoticePaging {
	clear: both;
	padding-top: 20px;
	margin-bottom: 50px;
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
<div class="container cfont">

	<!-- 내용 표시 -->
	
		<h3>공지사항</h3>
		<div id="CnoticeSearch">
			<select name="noticeSubject">
				<option value='Nall'>전체</option>
				<option value='Nsubject'>제목</option>
				<option value='Ncontent'>내용</option>
			</select> <input type="text" name="CnoticeSearchTxt" id="CnoticeSearchTxt" />
			<button name="noticeSearchBtn">검색하기</button>
		</div>
	<!-- 표 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>10</td>
				<td><a href="/gachi/noticeBoardDetail">공지사항 제목 입니다 공지사항 제목 입니다</a></td>
				<td>관리자</td>
				<td>10-30</td>
				<td>50</td>
			</tr>
			<tr>
				<td>10</td>
				<td><a href="/gachi/noticeBoardDetail">공지사항 제목 입니다</a></td>
				<td>관리자</td>
				<td>10-30</td>
				<td>50</td>
			</tr>
			<tr>
				<td>10</td>
				<td><a href="/gachi/noticeBoardDetail">공지사항 제목 입니다</a></td>
				<td>관리자</td>
				<td>10-30</td>
				<td>50</td>
			</tr>
			<tr>
				<td>10</td>
				<td><a href="/gachi/noticeBoardDetail">공지사항 제목 입니다</a></td>
				<td>관리자</td>
				<td>10-30</td>
				<td>50</td>
			</tr>
		</tbody>
	</table>
	
	<!-- paging -->
	<div id="CnoticePaging">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
</div>