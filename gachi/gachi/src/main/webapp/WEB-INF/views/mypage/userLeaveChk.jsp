<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 회원탈퇴 - 비번확인 */
	
	/******************/
	/* 상단 */
	#userLeaveChkTop{
		margin:20px auto;
		margin-left:50px;
		overflow:auto;
		text-align:center;
	}
	#userLeaveChkTop li{
		float:left;
	}
	#userLeaveChkTop li:nth-child(2){
		width:3%;
	}
	
	/******************/
	/* 내용 */
	#userLeaveChkContent{
		width:50%;
		position:relative;
		left:25%;
		margin:50px 0;
	}
	#userLeaveChkContent label{
		font-size:1.3em;
	}
	/* 비번확인 리스트 */
	#userLeaveChkLst{
		margin:50px 0 100px;
	}
	#userLeaveChkLst li{
		overflow:auto;
		margin-bottom:10px;
		text-align:center;
	}
	#userLeaveChkLst li:nth-child(2n+1){
		width:30%;
		float:left;
	}
	#userLeaveChkLst li:nth-child(2n){
		width:70%;
	}
	#leaveUserpwd{
		width:70%;
		border:none;
		outline:none;
		border-bottom:1px solid #ddd;
	}
	#userLeaveChkContent button{
		background-color:#eee;
		color:#000;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div id="userLeaveChkTop">
			<ul>
				<li><a href="/gachi/userInfoEdit">회원정보수정</a></li>
				<li>|</li>
				<li><a href="/gachi/userLeave"><b>회원탈퇴</b></a></li>
			</ul>
		</div>
		<div id="userLeaveChkContent">
			<label>비밀번호확인</label>
			<hr style="background:#000;"/>
			<ul id="userLeaveChkLst">
				<li>아이디</li>
				<li>userid@bitcamp.com</li>
				<li>비밀번호</li>
				<li><input type="password" name="userpwd" id="leaveUserpwd"/></li>
			</ul>
			<button type="button" class="btn btn-outline-light btn-block" onclick="location.href='/gachi/userLeaveOk'">회원탈퇴</button>
		</div>
	</div>
</div>