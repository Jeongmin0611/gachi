<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	h3{
		margin:20px 0px;
	}
	#ad_member_View input[type="text"]{
		line-height:0px;
	}
</style>
<script>
	$(function(){
/* 		$("#ad_delBtn").click(function(){
			if(confirm("회원의 정보를 삭제하시겠습니까?")){
				location.href="/gachi/adminMemberDelete?userid=${vo.userid}";
			}else {
				return false;
			}
		}); */
 		$("#ad_leaveBtn").click(function(){
			if(confirm("회원의 상태를 수정 하시겠습니까?")){
				$("#deleted").val('탈퇴');
				location.href='/gachi/adminMemberLeaveEditOk?userid=${vo.userid}';
			}else{
				return false;
		}; 
	});
</script>

<div class="container ad_font">
	<h1>회원조회</h1>
<form action="adminMemberEditOk" method="post">	
	<ul id="ad_member_View" style="overflow:hidden;"> 
		<li>아이디</li><li>${vo.userid }</li>
		<li>회원분류</li><li>${vo.grade }</li>
		<li>이름</li><li><input type="text" name="username" value="${vo.username }" /></li>
		<li>닉네임</li><li><input type="text" name="nickname" value="${vo.nickname }"/></li>
		<li>연락처</li><li><input type="text" name="tel" value="${vo.tel }"/></li>
		<li>생년월일</li><li>${vo.birthdate }</li>
		<li>성별</li><li><input type="text" name="gender" value="${vo.gender }"/></li>
		<li>우편번호</li><li><input type="text" name="zipcode" value="${vo.zipcode }"/></li>
		<li>주소</li><li><input type="text" name="addr" value="${vo.addr }"/></li>
		<li>상세주소</li><li><input type="text" name="detailaddr" value="${vo.detailaddr }"/></li>
		<li>가입일</li><li>${vo.signupdate }</li>
		<li>탈퇴일</li><li>${vo.withdrawdate }</li>
		<li>회원탈퇴여부</li><li>${vo.deleted }</li>	
	</ul>
		<div style="margin:10px 0px;">
			<button class="btn" onclick="history.back()">회원목록</button>
			<input type="submit" class="btn" value="회원정보수정"/>
			<button type="button" id="ad_leaveBtn" class="btn" >회원탈퇴</button>
		</div>
	</form>	
	<h3>시청 중인 클래스</h3>
	<div class="ad_member_Box">
	</div>
	<h3>구매내역</h3>
	<div class="ad_member_Box">
	
	</div>
</div>