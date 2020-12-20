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
<script type="text/javascript">
	$(()=>{
		$("#adminNotice").submit(()=>{
			if($("#option").val()=='전체'){
				$("#option").val(null);	
			}
			if($("#date1").val()!=''&& $("#date2").val()==''){
				alert("시작/종료일자를 입력하여주십시오.");
				return false;
			}
			if($("#date1").val()==''&& $("#date2").val()!=''){
				alert("시작/종료일자를 입력하여주십시오.");
				return false;
			}
			if($("#date1").val()>$("#date2").val()){
				alert("시작일보다 종료일이 더 빠릅니다.\n다시 입력하여 주십시오.");
				return false;
			}
			return true;
		});
	});


</script>
<div class="container ad_font">
<h1>공지사항</h1>
<!-- 1:1문의 영역 -->

<!-- 검색영역 -->
<div id="search_area">
<form method="post" id="adminNotice" action="/gachi/adminNotice">
<div>
	등록일 <input type="date" id="date1" name="date1"/>&nbsp;~
	&nbsp;<input type="date" id="date2" name="date2"/>
</div>
	<div style="margin-top:10px;">
		<select id="option" name="option">
				<option value="">전체</option>
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자닉네임</option>
		</select>
		<input type="text" id="searchWord" name="searchWord" placeholder="내용 입력" size="40"/>
		<input type="submit" class="btn" value="검색"/>
	</div>
</form>
</div>
<ul id="ad_notice_lst">
	<li>번호</li>
	<li>제목</li>
	<li>작성자</li>
	<li>등록일</li>
	<li>조회수</li>

	<c:forEach var="vo" items="${list}">
		<li>${vo.notice_num}</li>
		<li><a href="/gachi/adminNoticeView?notice_num=${vo.notice_num}&nowPage=${npvo.nowPage}">${vo.subject}</a></li>
		<li>${vo.writer}</li>
		<li>${vo.writedate}</li>
		<li>${vo.hit}</li>
	</c:forEach>

</ul>
<div class="ad_list_menu">
	<button class="btn" onclick="location.href='/gachi/adminNoticeWrite'">글쓰기</button>
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
						<a href="/gachi/adminNotice?nowPage=${p}&date1=${date1}&date2=${date2}&
							searchWord=${searchWord}&option=${option}" class="paging_num">${p}</a>
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