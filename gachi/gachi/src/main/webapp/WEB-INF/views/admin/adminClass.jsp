<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#search_area{
		text-align:right;
		margin-top:20px;
		margin-bottom:10px;
		height:50px;
	}
</style>
<div class="container ad_font">
	<h1>클래스관리</h1>
<div id="search_area">
	<form method="get" action="/gachi/adminClass">
		<select name="category">
			<option>전체</option>
			<option value="공예/창작">공예/창작</option>
			<option value="요리">요리</option>
			<option value="미술">미술</option>
			<option value="음악">음악</option>
			<option value="라이프스타일">라이프스타일</option>
			<option value="운동">운동</option>
			<option value="사진/영상">사진/영상</option>
		</select>
		<select name="option">
			<option>전체</option>
			<option value="class_code">클래스코드</option>
			<option value="class_name">클래스명</option>
			<option value="nickname">크리에이터닉네임</option>
		</select>
		<select name="class_state">
			<option>전체</option>
			<option>등록대기</option>
			<option>개설</option>
			<option>종료</option>
		</select>
		<input type="text" name="searchWord"/>
		<input type="submit" class="btn" value="검색"/>
	</form>
</div>
	<ul id="ad_class_lst">
		<li>클래스코드</li>
		<li>카테고리</li>
		<li>클래스명</li>
		<li>크리에이터명</li>
		<li>누적수강생</li>
		<li>등록신청일</li>
		<li>등록일</li>
		<li>상태</li>
		
		
		<c:forEach var="vo" items="${list}">
		<li>${vo.class_code }</li>
		<li>${vo.category }</li>
		<li><a href="/gachi/adminClassView?class_code=${vo.class_code}">${vo.class_name}</a></li>
		<li>${vo.nickname }</li>
		<li>${vo.total_student }</li>
		<li>${vo.signup }</li>
		<li>${vo.allrow }</li>
		<li>${vo.class_state }</li>
		</c:forEach>
	</ul>
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<li class="btn"><a class="btn" href="#">Prev</a></li>
			<li><a href="#" class="paging_num">1</a></li>
			<li><a href="#" class="paging_num">2</a></li>
			<li><a href="#" class="paging_num">3</a></li>
			<li><a href="#" class="paging_num">4</a></li>
			<li><a href="#" class="paging_num">5</a></li>
			<li class="btn"><a class="btn" href="#">Next</a></li>
	</ul>
</div>
</div>
