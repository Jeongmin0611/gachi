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
	#pwdFrm>div>div:last-child{
		background-color: #eee;
	}
	#pwdFrm>button{
		background-color: #abcee3;
		margin-top: 100px;
	}
	
</style>
<script>
	//빈칸검사
	$(function(){
		$("#pwdFrm").submit(function(){
			if($("#userInfoPwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			return true;
		});
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageTop">
			<div class="row">
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userInfoEditChk">회원정보수정</a></div>
				<div class="col-1">|</div>
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userLeave">회원탈퇴</a></div>
			</div>
		</div>
		<div class="mypageContent col-lg-8 col-md-10">
			<h4>비밀번호확인</h4>
			<hr class="userHr"/>
			<form method="post" id="pwdFrm" action="/gachi/userLeaveOk">
				<div class="row">
					<div class="col-md-4">아이디</div>
					<div class="col-md-8"><input type="text" name="userid" value=${userid } readonly/></div>
				</div>
				<div class="row">	
					<div class="col-md-4">비밀번호</div>
					<div class="col-md-8"><input type="password" name="userpwd" id="userInfoPwd"/></div>
				</div>
				<button type="submit" class="btn btn-outline-light btn-block">확인</button>
			</form>
		</div>
	</div>
</div>