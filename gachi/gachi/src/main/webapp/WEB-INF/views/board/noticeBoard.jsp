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

table a, table a:hover{
	text-decoration: none;
	color:black;
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
	<table class="table ">
		<thead>
			<tr class="table-active">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.notice_num }</td>
				<td><a href="/gachi/noticeBoardView?no=${vo.notice_num }">${vo.subject }</a></td>
				<td>${vo.writer }</td>
				<td>${vo.writedate }</td>
			</tr>
			</c:forEach>
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