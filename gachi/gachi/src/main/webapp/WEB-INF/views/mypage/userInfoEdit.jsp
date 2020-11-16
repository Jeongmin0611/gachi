<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 회원정보수정 -비밀번호확인 */
	
	/*********/
	/* 상단 */
	#userInfoEditTop{
		margin:20px 50px 10px;
		overflow:auto;
		text-align:center;
	}
	#userInfoEditTop li{
		float:left;
	}
	#userInfoEditTop li:nth-child(2){
		width:3%;
	}
	
	/*********/
	/* 내용 */
	#userInfoEditContent{
		width:50%;
		position:relative;
		left:25%;
		margin:50px 0 200px;
	}
	#userInfoEditContent label{
		font-size:1.5em;
	}
	/* 비번입력 리스트 */
	#userInfoEditLst{
		margin:50px 0 100px;
	}
	#userInfoEditLst li{
		overflow:auto;
		margin-bottom:20px;
		text-align:center;
	}
	#userInfoEditLst li:nth-child(2n+1){
		width:30%;
		float:left;
	}
	#userInfoEditLst li:nth-child(2n){
		width:70%;
	}
	#infoEditUserpwd{
		width:100%;
	}
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf"%>
	<div id="userInfoEditTop">
		<ul>
			<li><a href="/gachi/userInfoEdit"><b>회원정보수정</b></a></li>
			<li>|</li>
			<li><a href="/gachi/userLeave">회원탈퇴</a></li>
		</ul>
	</div>
	<hr/>
	<div id="userInfoEditContent">
		<label>비밀번호확인</label>
		<ul id="userInfoEditLst">
			<li>아이디</li>
			<li>userid@bitcamp.com</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="infoEditUserpwd"/></li>
		</ul>
		<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='/gachi/userInfoEditForm'">확인</button>
	</div>
</div>