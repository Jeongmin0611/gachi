<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 회원탈퇴 - 비번확인 */
	
	.mypageTop>div>div:last-child{
		font-weight: bold;
	}
	.mypageContent div{
		margin: 10px 0;
	}
	.mypageContent input{
		border:	none;
		outline: none;
		background-color: #eee;
	}
	.mypageContent>div>div:last-child{
		background-color: #eee;
	}
	.mypageContent>button{
		background-color: #abcee3;
		margin-top: 100px;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageTop">
			<div class="row">
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userInfoEdit">회원정보수정</a></div>
				<div class="col-1">|</div>
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userLeave">회원탈퇴</a></div>
			</div>
		</div>
		<div class="mypageContent col-lg-8 col-md-10">
			<h4>비밀번호확인</h4>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">아이디</div>
				<div class="col-md-8">userid@bitcamp.com</div>
			</div>
			<div class="row">	
				<div class="col-md-4">비밀번호</div>
				<div class="col-md-8"><input type="password"/></div>
			</div>
			<button type="button" class="btn btn-outline-light btn-block" onclick="location.href='/gachi/userLeaveOk'">확인</button>
		</div>
	</div>
</div>