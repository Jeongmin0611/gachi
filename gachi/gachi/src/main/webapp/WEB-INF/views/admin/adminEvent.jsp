<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>

 <style>
#search_area {
	margin:20px 0px;
}
#ad_event_lst{
	overflow: auto;
}
#ad_event_lst li {
	vertical-align: middle;
}
#ad_event_header{
	overflow:auto;
}
#ad_event_header li {
	vertical-align: middle;
	line-height: 50px;
}
.ad_list_menu li{
	float:right;
}
select {
	height: 30px;
}
</style> 
<div class="container text-center ad_font">
<h1>이벤트관리</h1>
<div id="search_area">
	<form method="get" action="">
		<ul class="ad_list_menu">
			<li>
				<select>
					<option>제목</option>
					<option>내용</option>
				</select>
				<input type="text" id="searchWord" name="searchWord" size="30"/>
				<input type="submit" class="btn" value="검색"/>
			</li>
			<li>
				<input type="date" id="ad_event_date2" name="date2"/>
			</li>
			<li>
				~
			</li>
			<li>
				기간 <input type="date" id="ad_event_date1" name="date1"/>
			</li>
		</ul>
	</form>
</div>
<ul id="ad_event_header">
	<li>선택</li>
	<li>번호</li>
	<li>이미지</li>
	<li>제목</li>
	<li>시작일</li>
	<li>종료일</li>
	<li>조회수</li>
</ul>
<ul id="ad_event_lst">
	<li><input type="checkbox" id="" name=""/></li>
	<li>10</li>
	<li><img src="img/musicEx/musicEx01.png"></li>
	<li class="wordCut"><a href="/gachi/adminEventView">신규회원 이벤트 3만원할인!</a></li>
	<li>2020-10-21</li>
	<li>2020-10-29</li>
	<li>123</li>
</ul>
<div class="ad_list_menu">
	<button class="btn" onclick="location.href='/gachi/adminEventWrite'">글쓰기</button>
	<button class="btn">삭제</button> 
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