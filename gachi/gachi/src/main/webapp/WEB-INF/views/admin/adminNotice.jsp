<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style>
#ad_notice_lst li {
	vertical-align: middle;
	line-height: 50px;
}

#search_area {
	text-align:right;
	margin-bottom: 10px;
}

select {
	height: 30px;
}
</style> 
<div class="container ad_font">
<h1>공지사항</h1>
<!-- 1:1문의 영역 -->

<!-- 검색영역 -->
<div id="search_area">
<div>
	총 레코드 수:${npvo.totalRecord}
</div>
<form action="#">
	<select id="searchType2" name="option2">
			<option selected="selected">제목</option>
			<option>작성자</option>
			<option>등록일</option>
	</select>
<input type="text" id="searchWord" placeholder="내용 입력" size="40"/>
<input type="submit" class="btn" value="검색"/>
</form>
</div>
<ul id="ad_notice_lst">
	<li>선택</li>
	<li>번호</li>
	<li>제목</li>
	<li>작성자</li>
	<li>등록일</li>
	<li>조회수</li>

	<c:forEach var="vo" items="${list}">
		<li><input type="checkbox" id="" name=""/></li>
		<li>${vo.notice_num}</li>
		<li><a href="/gachi/adminNoticeView?notice_num=${vo.notice_num}&nowPage=${npvo.nowPage}">${vo.subject}</a></li>
		<li>${vo.writer}</li>
		<li>${vo.writedate}</li>
		<li>${vo.hit}</li>
	</c:forEach>

</ul>
<div class="ad_list_menu">
	<button class="btn" onclick="location.href='/gachi/adminNoticeWrite'">글쓰기</button>
	<button class="btn">삭제</button> 
</div>
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${npvo.nowPage>1}">
				<li class="btn">
					<a class="btn" href="/gachi/adminNotice?nowPage=${npvo.nowPage-1}">Prev</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${npvo.startPageNum}" end="${npvo.startPageNum + npvo.onePageRecord-1 }">
				<c:if test="${p<=npvo.totalPage}">
					<li <c:if test="${p==npvo.nowPage}"> style="color:#437299"</c:if>>
						<a href="/gachi/adminNotice?nowPage=${p}" class="paging_num">${p}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${npvo.nowPage<npvo.totalPage}">
				<li class="btn">
					<a class="btn" href="/gachi/adminNotice?nowPage=${npvo.nowPage+1}">next</a>
				</li>
			</c:if>
	</ul>
</div>
</div>