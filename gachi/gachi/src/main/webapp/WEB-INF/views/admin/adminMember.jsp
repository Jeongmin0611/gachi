<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<div class="container">
<h1>회원관리</h1>
<div>
	<ul id="ad_member_info">
		<li>●총 회원 : 99명</li>
		<li>●탈퇴한 회원 : 1명</li>
		<li>●현재 회원 : 100명</li>
	</ul>
</div>
<div class="ad_right_align">
	<form action="">
		<select name="#">
			<option>전체</option>
			<option>아이디</option>
			<option>이름</option>
			<option>닉네임</option>
			<option>연락처</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>가입</option>
			<option>탈퇴</option>
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" value="검색" />
		</form>
</div>
<ul id="ad_member_lst" class="text-center">
	<li>번호</li>
	<li>아이디</li>
	<li>닉네임</li>
	<li>이름</li>
	<li>연락처</li>
	<li>가입일</li>
	<li>탈퇴일</li>
	<li>상태</li>
	
	<li>001</li>
	<li><a href="/gachi/adminMemberView">honggildong@naver.com</a></li>
	<li>길동짱</li>
	<li>홍길동</li>
	<li>010-1234-1234</li>
	<li>2020-04-24</li>
	<li>x</li>
	<li>가입</li>
	
	<li>001</li>
	<li>honggildong@naver.com</li>
	<li>길동짱</li>
	<li>홍길동</li>
	<li>010-1234-1234</li>
	<li>2020-04-24</li>
	<li>x</li>
	<li>가입</li>
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