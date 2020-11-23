<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>


<div class="container">

<h1>회원관리</h1>
<div>
	<ul id="ad_member_info">
		<li>●총 회원 : ${countAllMember }명</li>
		<li>●현재 회원 : ${countNowMember }명</li>
		<li>●탈퇴한 회원 : ${countDeletedMember }명</li>
	</ul>
</div>
<div class="ad_right_align">
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
	
	<c:forEach var="memberList" items="${memberList }">
	<li>${memberList.rownum }</li>
	<li>${memberList.userid }</li>
	<li>${memberList.nickname }</li>
	<li>${memberList.username }</li>
	<li>${memberList.tel }</li>
	<li>${memberList.signupdate }</li>
	<li><c:if test="${memberList.withdrawdate eq null}">x</c:if><c:if test="${memberList.withdrawdate ne null}">${memberList.withdrawdate }</c:if></li>
	<li><c:if test="${memberList.deleted eq 0 }">가입</c:if><c:if test="${memberList.deleted eq 1 }">탈퇴</c:if></li>	
	</c:forEach>
	<!-- <li>001</li>
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
	<li>가입</li> -->
</ul>	
<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
</div>
</div>