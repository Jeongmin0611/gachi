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
		width: 30%;
		background-color: ;
		margin-top: 100px;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">회원정보수정 ></label>
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
				<div class="col-md-4">생년월일</div>
				<div class="col-md-8">${vo.year }년 ${vo.month }월 ${vo.day }일</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">닉네임</div>
				<div class="col-md-8"><input type="text" name="nickname" value="${vo.nickname }" readonly/></div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">연락처</div>
				<div class="col-md-8">
					<input type="text" name="tel" value="${vo.tel }" readonly/>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">주소</div>
				<div class="col-md-8">
					<input type="text" name="zipcode" value="${vo.zipcode }" style="width:15%" readonly/>
					<input type="text" name="addr" value="${vo.addr }" style="width:70%" readonly/>
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
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/userInfoEditChk'">수정하기</button>
			</div>
		</div>
	</div>
</div>