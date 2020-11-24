<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/* 회원탈퇴완료 */
	
	.mypageTop>div>div:last-child{
		font-weight: bold;
	}
	.mypageContent div{
		margin: 10px 0;
	}
	.mypageContent img{
		width: 100px;
	}
	.mypageContent h4{
		margin:50px 0;
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
			<div>
				<img src="/gachi/img/icon_check.png"/>
			</div>
			<h4>회원 탈퇴가 완료되었습니다.</h4>
			<hr/>
			<div>그동안 같이가치를 이용해주셔서 감사합니다.</div>
			<div>보다 나은 서비스로 다시 찾아 뵙겠습니다.</div>
			<hr/>
			<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi'">홈으로</button>
		</div>
	</div>
</div>