<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	h3{
		margin:20px 0px;
	}
</style>
<script>
	$(function(){
		$("#ad_delBtn").click(function(){
			if(confirm("회원의 정보를 삭제하시겠습니까?")){
				location.href="/gachi/adminMemberDelete?userid=${vo.userid}";
			}
		});
	});
</script>

<div class="container ad_font">
	<h1>회원조회</h1>
<form action="adminMemberEditOk" method="post">	
	<ul id="ad_member_View">
		<li>아이디</li><li><input type="text" name="userid" value="${vo.userid }"readonly/></li>
		<li>이름</li><li><input type="text" name="username" value="${vo.username }" /></li>
		<li>닉네임</li><li><input type="text" name="nickname" value="${vo.nickname }"/></li>
		<li>연락처</li><li><input type="text" name="tel" value="${vo.tel }"/></li>
		<li>가입일</li><li><input type="text" name="signupdate" value="${vo.signupdate }"readonly/></li>
		<li>마일리지</li><li>1200p</li>
	</ul>
		<button class="btn" onclick="history.back()">회원목록</button>
		<input type="submit" class="btn" value="회원정보수정"/>
		<input type="button" id="ad_delBtn" class="btn" value="회원정보삭제"/>
	</form>	
	<h3>시청 중인 클래스</h3>
	<div class="ad_member_Box">
	</div>
	<h3>구매내역</h3>
	<div class="ad_member_Box">
	
	</div>
</div>