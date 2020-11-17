<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <style>
 #ad_notice_lst li{vertical-align:middle;line-height:50px;}
 #search_area{margin-bottom:20px;}
 select{height:30px;}
 </style> 
<div class="container text-center cfont">
<h1>공지사항</h1>
<!-- 1:1문의 영역 -->

<!-- 검색영역 -->
<div id="search_area">
<form action="#">
	<select id="searchType2" name="option2">
			<option selected="selected">제목</option>
			<option>작성자</option>
			<option>등록일</option>
			<option>답변여부</option>
	</select>
<input type="text" id="searchWord" placeholder="내용 입력"/>
<input type="submit" class="btn btn-info" value="검색"/>
</form>
</div>
<ul id="ad_notice_lst">
	<li>선택</li>
	<li>번호</li>
	<li>제목</li>
	<li>작성자</li>
	<li>등록일</li>
	<li>조회수</li>

	<li><input type="checkbox" id="" name=""/></li>
	<li>10</li>
	<li><a href="/gachi/adminNoticeView">동영상이 나오지 않을 때 해결방법</a></li>
	<li>같이가치</li>
	<li>2020-10-29</li>
	<li>25</li>
</ul>
<div class="ad_list_menu">
	<button class="btn btn-info" onclick="location.href='/gachi/adminNoticeWrite'">글쓰기</button>
	<button class="btn btn-info">삭제</button> 
</div>
<div id="paging">
	<ul>
		<li>prev</li>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>
		<li>next</li>
	</ul>
</div>
</div>