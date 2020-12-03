<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>	
	
	/* 회원정보확인 */
	
	.mypageContent div{
		text-align: center;
	}
	.mypageContent input{
		border:	none;
		outline: none;
		width: 100%;
	}
	.mypageContent button{
		background-color: #abcee3;
		margin-top: 50px;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageContent col-lg-8 col-md-10">
			<label style="color:gray">회원정보수정</label>
			<label style="color:gray">></label>
			<label style="font-size:1.1em"><b>회원정보확인</b></label>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">아이디</div>
				<div class="col-md-8">${vo.userid }</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8">${vo.username }</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">닉네임</div>
				<div class="col-md-8"><input type="text" name="nickname" value="${vo.nickname }" readonly/></div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">생년월일</div>
				<div class="col-md-8">${vo.birthdate }</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">연락처</div>
				<div class="col-md-8">
					<input type="text" name="tel1" value="${vo.tel1 }" style="width:30%" readonly/>-
					<input type="text" name="tel2" value="${vo.tel2 }" style="width:30%" readonly/>-
					<input type="text" name="tel3" value="${vo.tel3 }" style="width:30%" readonly/>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">주소</div>
				<div class="col-md-8">
					<input type="text" name="zipcode" value="${vo.zipcode }" readonly/>
					<input type="text" name="addr" value="${vo.addr }" readonly/>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">상세주소</div>
				<div class="col-md-8"><input type="text" name="detailaddr" value="${vo.detailaddr }" readonly/></div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">가입일</div>
				<div class="col-md-8">${vo.signupdate }</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">관심사</div>
				<div class="col-md-8"><input type="text" name="interest" value="${vo.interest }" readonly/></div>
			</div>
			<hr/>
			<div>
				<button type="button" class="btn btn-outline-light btn-block" onclick="location.href='/gachi/userInfoEditChk'">수정하기</button>
			</div>
		</div>
	</div>
</div>