<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	h3{
		margin:20px 0px;
	}
	h1{
		margin-bottom:10px;
	}
</style>
<div class="container">
	<h1>크리에이터회원 조회</h1>
	<ul id="ad_member_View">
		<li>&nbsp;&nbsp;번호</li><li>001</li>
		<li>&nbsp;&nbsp;아이디</li><li>park1234@naver.com</li>
		<li>&nbsp;&nbsp;이름</li><li>홍길동</li>
		<li>&nbsp;&nbsp;닉네임</li><li>동서남북</li>
		<li>&nbsp;&nbsp;연락처</li><li>010-1234-1233</li>
		<li>&nbsp;&nbsp;가입일</li><li>2020-08-12</li>
		<li>&nbsp;&nbsp;마일리지</li><li>1200p</li>
	</ul>
	<h3>클래스 내역</h3>
	<div class="ad_member_Box">
	</div>
	<h3>정산내역</h3>
	<div class="ad_member_Box">
	
	</div>
	<div style="margin-top:20px;text-align:center;">
		<button class="btn" onclick="history.back()">회원목록</button>
		<button class="btn" onclick="location.href='/gachi/adminMemberEdit'">회원정보수정</button>
		<button class="btn" onclick="location.href='/gachi/adminMemberEdit'">회원탈퇴처리</button>
	</div>
</div>