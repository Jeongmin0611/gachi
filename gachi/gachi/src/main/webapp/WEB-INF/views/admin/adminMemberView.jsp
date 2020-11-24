<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	h3{
		margin:20px 0px;
	}
</style>
<div class="container">
	<h1>회원조회</h1>
	<ul id="ad_member_View">
		<li>번호</li><li>001</li>
		<li>아이디</li><li>park1234@naver.com</li>
		<li>이름</li><li>홍길동</li>
		<li>닉네임</li><li>동서남북</li>
		<li>연락처</li><li>010-1234-1233</li>
		<li>가입일</li><li>2020-08-12</li>
		<li>마일리지</li><li>1200p</li>
	</ul>
	<h3>시청 중인 클래스</h3>
	<div class="ad_member_Box">
	</div>
	<h3>구매내역</h3>
	<div class="ad_member_Box">
	
	</div>
	<div style="text-align:center;margin-top:20px;">
		<button class="btn" onclick="history.back()">회원목록</button>
		<button class="btn" onclick="location.href='/gachi/adminMemberEdit'">회원정보수정</button>
		<button class="btn" onclick="location.href='/gachi/adminMemberEdit'">회원탈퇴처리</button>
	</div>
</div>