<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
	<h1>클래스관리</h1>
<div id="search_area">
	<form method="post" action="">
		<select>
			<option>전체</option>
			<option>등록대기</option>
			<option>개설</option>
			<option>종료</option>
		</select>
		<select>
			<option>전체</option>
			<option>공예/창작</option>
			<option>요리</option>
			<option>미술</option>
			<option>음악</option>
			<option>라이프스타일</option>
			<option>운동</option>
			<option>사진/영상</option>
		</select>
		<select>
			<option>클래스명</option>
			<option>크리에이터</option>
		</select>
		<input type="text" name=""/>
		<input type="submit" value="검색"/>
	</form>
</div>
	<ul id="ad_class_lst">
		<li>클래스코드</li>
		<li>카테고리</li>
		<li>클래스명</li>
		<li>크리에이터명</li>
		<li>누적수강생</li>
		<li>등록일</li>
		<li>상태</li>
		
		<li>cl001</li>
		<li>공예/창작</li>
		<li><a href="/gachi/adminClassView">곰돌이인형div</a></li>
		<li>홍길동</li>
		<li>999</li>
		<li>2020-11-11</li>
		<li>등록대기</li>
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
