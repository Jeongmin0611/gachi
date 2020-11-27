<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>	
	
	/* 회원정보확인 */
	
	.mypageContent div{
		margin: 10px 0;
	}
	.mypageContent input{
		border:	none;
		outline: none;
		background-color: #eee;
	}
	.mypageContent>button{
		background-color: #abcee3;
		margin-top: 100px;
	}
	/* 연락처, 주소 */
	.mypageContent>div:nth-child(7) input,
	.mypageContent>div:nth-child(8) input:first-child{
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
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userInfoEditChk">회원정보수정</a></div>
				<div class="col-1">|</div>
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userLeave">회원탈퇴</a></div>
			</div>
		</div>
		<div class="mypageContent col-lg-8 col-md-10">
			<h4>회원정보확인</h4>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">아이디</div>
				<div class="col-md-8">${vo.userid }</div>
			</div>
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8">${vo.username }</div>
			</div>
			<div class="row">
				<div class="col-md-4">닉네임</div>
				<div class="col-md-8"><input type="text" name="nickname" value="${vo.nickname }" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">생년월일</div>
				<div class="col-md-8">${vo.birthdate }</div>
			</div>
			<div class="row">
				<div class="col-md-4">연락처</div>
				<div class="col-md-8">
					<input type="text" name="tel1" value="${vo.tel1 }" readonly/>-
					<input type="text" name="tel2" value="${vo.tel2 }" readonly/>-
					<input type="text" name="tel3" value="${vo.tel3 }" readonly/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">주소</div>
				<div class="col-md-8">
					<input type="text" name="zipcode" value="${vo.zipcode }" readonly/>
					<input type="text" name="addr" value="${vo.addr }" readonly/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">상세주소</div>
				<div class="col-md-8"><input type="text" name="detailaddr" value="${vo.detailaddr }" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">가입일</div>
				<div class="col-md-8">${vo.signupdate }</div>
			</div>
			<div class="row">
				<div class="col-md-4">관심사</div>
				<div class="col-md-8"><input type="text" name="interest" value="${vo.interest }" readonly/></div>
			</div>
			
			<button type="button" class="btn btn-outline-light btn-block" onclick="location.href='/gachi/userInfoEditChk'">수정하기</button>
		</div>
	</div>
</div>