<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>

<div class="container ad_font">
<h1>크리에이터 관리</h1>
<div id="ad_search_header">
<div>
	<ul id="cr_member_info">
		<li>●활동 : ${countNowCreator }명</li>
		<li>●탈퇴 : ${countDeletedCreator}명</li>
		<li>●누적 : ${countAllCreator }명</li>
	</ul>
</div>
<div>
	<form action="">
		<select name="#">
			<option>전체</option>
			<option>크리에이터명</option>
			<option>이름</option>
			<option>이메일</option>
			<option>연락처</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>승인</option>
			<option>미승인</option>
			<option>승인거절</option>
			
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" class="btn" value="검색" />
		</form>
</div>
</div>
<div style="margin-bottom:20px;">
<ul id="cr_member_lst" class="text-center">
	<li>번호</li>
	<li>카테고리</li>
	<li>크리에이터명</li>
	<li>이메일</li>
	<li>연락처</li>
	<li>가입일</li>
	<li>탈퇴일</li>
	<li>승인여부</li>
	
	<c:forEach var="creatorList" items="${creatorList }">
	<li>${creatorList.rownum }</li>
	<li>${creatorList.category}</li>
	<li>${creatorList.nickname}</li>
	<li><a href="/gachi/adminCreatorView">${creatorList.userid }</a></li>
	<li>${creatorList.tel }</li>
	<li>${creatorList.signupdate }</li>
		<li><c:if test="${memberList.deleted eq '탈퇴'}">X</c:if><c:if test="${memberList.deleted ne '탈퇴'}">${memberList.withdrawdate }</c:if></li>
	<li>${creatorList.creator_state}

	</c:forEach>
</ul>
</div>	
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