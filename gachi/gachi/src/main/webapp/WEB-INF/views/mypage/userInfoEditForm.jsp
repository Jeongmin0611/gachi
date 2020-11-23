<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>	
	
	/* 회원정보수정 폼 */
	
	.mypageTop>div>div:first-child{
		font-weight:bold;
	}
	.mypageContent div{
		margin: 10px 0;
	}
	.mypageContent input{
		border:	none;
		outline: none;
		background-color: #eee;
	}
	.mypageContent button{
		background-color: #abcee3;
	}
	.mypageContent>button{
		margin-top: 100px;
	}
	.mypageContent>div:nth-child(7) input,
	.mypageContent>div:nth-child(7) button,
	.mypageContent>div:nth-child(8) input:first-child,
	.mypageContent>div:nth-child(8) button{
		width: 20%;
	}
	.mypageContent>div:nth-child(8) input:last-child{
		width: 50%;
	}
	.mypageContent>div>div:last-child{
		background-color: #eee;
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
			<h4>회원정보수정</h4>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8">김유미</div>
			</div>
			<div class="row">
				<div class="col-md-4">생년월일</div>
				<div class="col-md-8">1990.12.31</div>
			</div>
			<div class="row">
				<div class="col-md-4">아이디</div>
				<div class="col-md-8">userid@bitcamp.com</div>
			</div>
			<div class="row">
				<div class="col-md-4">닉네임</div>
				<div class="col-md-8"><input type="text" name="nickname" value="김유미"/></div>
			</div>
			<div class="row">
				<div class="col-md-4">연락처</div>
				<div class="col-md-8">
					<input type="text" name="tel1" value="010"/>-
					<input type="text" name="tel2" value="9999"/>-
					<input type="text" name="tel3" value="8888"/>
					<button type="button" class="btn btn-outline-light btn-sm">인증</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">주소</div>
				<div class="col-md-8">
					<input type="text" name="zipcode" value="01234" readonly/>
					<button type="button" class="btn btn-outline-light btn-sm">검색</button>
					<input type="text" name="addr" value="서울시 마포구 백범로" readonly/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">상세주소</div>
				<div class="col-md-8"><input type="text" name="addrDetail" value="11111112222222"/></div>
			</div>
			
			<button type="button" class="btn btn-outline-light btn-block" onclick="location.href='/gachi/userInfo'">확인</button>
		</div>
	</div>
</div>