<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script>
	$(()=>{
		$('.container>div:nth-of-type(2)').css("margin-bottom","10px");
	});
</script>
<div class="container ad_font">
<h1>회원관리</h1>
<div>
	<ul id="ad_member_info">
		<li>●총 회원 : ${countAllMember }명</li>
		<li>●현재 회원 : ${countNowMember }명</li>
		<li>●탈퇴한 회원 : ${countDeletedMember }명</li>
	</ul>
</div>
<div style="text-align:right"> 
	<form action="">
		<select name="#">
			<option>전체</option>
			<option value= "userid">아이디</option>
			<option value="username">이름</option>
			<option value="nickname">닉네임</option>
			<option value="tel">연락처</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>가입</option>
			<option>탈퇴</option>
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" class="btn" value="검색" />
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
	
	<c:forEach var="memberList" items="${memberList }">
		<li>${memberList.rownum }</li>
		<li><a href="/gachi/adminMemberEdit">${memberList.userid }</a></li>
		<li>${memberList.nickname }</li>
		<li>${memberList.username }</li>
		<li>${memberList.tel }</li>
		<li>${memberList.signupdate }</li>
		<li><c:if test="${memberList.deleted eq '탈퇴'}">${memberList.withdrawdate }</c:if><c:if test="${memberList.deleted ne '탈퇴'}"> </c:if></li>
	<li>${memberList.deleted}</li>	
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