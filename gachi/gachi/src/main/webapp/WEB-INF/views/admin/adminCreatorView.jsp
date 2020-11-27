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
<script>
	$(function(){
		$("#cr_leaveBtn").click(function(){
			if(confirm("회원의 상태를 수정 하시겠습니까?")){
				$("#deleted").val('탈퇴');
			}else{
				return false;	
		});	
	});
</script>
<div class="container ad_font">
	<h1>크리에이터회원 조회</h1>
<form action="adminCreatorEditOk" method="post">	
	<ul id="ad_member_View" style="overflow:hidden;">
		<li>아이디</li><li><input type="text" name="userid" value="${vo.userid }"readonly/></li>
		<li>회원분류</li><li><input type="text" name="grade" value="${vo.grade }"readonly/></li>
		<li>이름</li><li><input type="text" name="username" value="${vo.username }" /></li>
		<li>닉네임</li><li><input type="text" name="nickname" value="${vo.nickname }"/></li>
		<li>연락처</li><li><input type="text" name="tel" value="${vo.tel }"/></li>
		<li>생년월일</li><li><input type="text" name="birthdate" value="${vo.birthdate }"readonly/></li>
		<li>성별</li><li><input type="text" name="gender" value="${vo.gender }"/></li>
		<li>우편번호</li><li><input type="text" name="zipcode" value="${vo.zipcode }"/></li>
		<li>주소</li><li><input type="text" name="addr" value="${vo.addr }"/></li>
		<li>상세주소</li><li><input type="text" name="detailaddr" value="${vo.detailaddr }"/></li>
		<li>가입일</li><li><input type="text" name="signupdate" value="${vo.signupdate }"readonly/></li>
		<li>탈퇴일</li><li><input type="text" name="withdrawdate" value="${vo.withdrawdate }"readonly/></li>
		<li>회원상태</li><li><input type="text" name="deleted" id="deleted" value="${vo.deleted }"readonly/></li>
	</ul>
		<button type="button" id = "aaa" class="btn" onclick="location.href='/gachi/adminCreator'">회원목록</button>
		<input type="submit" class="btn" value="회원정보수정"/>
		<button type="button" id="cr_leaveBtn" class="btn" onclick="location.href='/gachi/adminCreatorLeaveEditOk?userid=${vo.userid}'">회원탈퇴</button>
		<!-- <input type="button" id="cr_delBtn" class="btn" value="회원정보삭제"/> -->
	</form>	
	
	<h3>클래스 내역</h3>
	<div class="ad_member_Box">
	</div>
	<h3>정산내역</h3>
	<div class="ad_member_Box">
	
	</div>

</div>