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

#searchWord {
	border: 0;
	border-bottom: 1px solid black;
	outline: none;
}

#CnoticeSearch [type=submit] {
	background-color: white;
	color: black;
	border: 0;
}

#CnoticeSearch [type=submit]:focus {
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
		//검색어 폼에서 검색 버튼 클릭
		$('#searchForm').submit(function(){
			if($('#searchWord').val()==""){
				return false;
			}
			return true;
		});

	});
</script>
<div class="container cfont">

	<!-- 내용 표시 -->
	
		<h3>공지사항</h3>
		<!-- 검색 기능 -->
		<div id="CnoticeSearch">
			<form method="get" action="/gachi/noticeBoard" id="searchForm">
				<select name="searchKey" id="searchKey">
					<option value='subject'>제목</option>
					<option value='content'>내용</option>
				</select> <input type="text" name="searchWord" id="searchWord" />
				<input type="submit" value="검색"/>
			</form>
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
				<td><a href="/gachi/noticeBoardView?no=${vo.notice_num }&nowPage=${pvo.nowPage}<c:if test="${pvo.searchWord!=null }">&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">${vo.subject }</a></td>
				<td>${vo.writer }</td>
				<td>${vo.writedate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- paging -->
	<div id="CnoticePaging">
		<ul class="pagination justify-content-center">
			<c:if test="${pvo.nowPage>1 }">
				<li class="page-item">
					<a class="page-link" href="/gachi/noticeBoard?nowPage=${pageVO.nowPage-1}<c:if test="${pvo.searchWord!=null }">&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">Prev</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPageNum }" end="${pvo.startPageNum+pvo.onePageRecord-1}">
				<c:if test="${p<=pvo.totalPage }">
					<li class="page-item">
						<a class="page-link" href="/gachi/noticeBoard?nowPage=${p }<c:if test="${pvo.searchWord!=null }">&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>" <c:if test="${p==pvo.nowPage }">style="background-color:lightblue; color:white"</c:if>>${p}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${pvo.nowPage<pvo.totalPage }">
				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/noticeBoard?nowPage=${pageVO.nowPage+1}<c:if test="${pvo.searchWord!=null }">&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>