<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<div class="container">
<h1>크리에이터 관리</h1>
<div>
	<ul id="cr_member_info">
		<li>●활동 : 99명</li>
		<li>●탈퇴 : 1명</li>
		<li>●누적 : 100명</li>
	</ul>
</div>
<div class="cr_right_align">
	<form action="">
		<select name="#">
			<option>전체</option>
			<option>크리에이터명</option>
			<option>이름</option>
			<option>이메일</option>
			<option>연락처</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>승인</option>
			<option>미승인</option>
			<option>승인거절</option>
			
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" value="검색" />
		</form>
</div>
<ul id="cr_member_lst" class="text-center">
	<li>번호</li>
	<li>카테고리</li>
	<li>크리에이터명</li>
	<li>이메일</li>
	<li>연락처</li>
	<li>가입일</li>
	<li>탈퇴일</li>
	<li>승인여부</li>
	
	<li>041</li>
	<li>창작/공예</li>
	<li>박창작씨</li>
	<li>creator@naver.com</li>
	<li>010-1234-1234</li>
	<li>2020-04-24</li>
	<li>x</li>
	<li><a href="#">미승인</a></li>
	
	<li>055</li>
	<li>라이프스타일</li>
	<li>김헬스</li>
	<li>creator123@nate.com</li>
	<li>010-1234-4124</li>
	<li>2020-01-24</li>
	<li>x</li>
	<li><a href="#">승인</a></li>
</ul>	
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