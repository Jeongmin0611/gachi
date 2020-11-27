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
	#userInfoEditFrm>button{
		margin-top: 100px;
	}
	#userInfoEditFrm>div:nth-child(5) input,
	#userInfoEditFrm>div:nth-child(5) button,
	#userInfoEditFrm>div:nth-child(6) input:first-child,
	#userInfoEditFrm>div:nth-child(6) button{
		width: 20%;
	}
	#userInfoEditFrm>div:nth-child(8) input:last-child{
		width: 50%;
	}
	#userInfoEditFrm>div>div:last-child{
		background-color: #eee;
	}
	#userInfoEditFrm input[type=checkbox]{
		margin:0;
	}
	#userInfoEditFrm label{
		width:15%;
		font-size:0.8em;
	}
	#userInfoEditFrm label:nth-child(3){
		width:30%;
	}
	#userInfoEditFrm label:last-child{
		width:35%;
	}
	
</style>
<script>
	//빈칸검사
	$(function(){
		$("#userInfoEditFrm").submit(function(){
			if($("#userInfoNickname").val()==""){
				alert("닉네임을 입력하세요.");
				return false;
			}
			if($("#userInfoTel1").val()=="" || $("#userInfoTel2").val()=="" || $("#userInfoTel3").val()==""){
				alert("연락처를 입력하세요.");
				return false;
			}
			if($("#userInfoZipcode").val()=="" || $("#userInfoAddr").val()==""){
				alert("주소를 입력하세요.");
				return false;
			}
			if($("#userInfoDetailaddr").val()==""){
				alert("상세주소를 입력하세요.");
				return false;
			}
			if($("#userInfoPwd1").val()=="" || $("#userInfoPwd2").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if($("#userInfoPwd1").val() != $("#userInfoPwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
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
			<h4>회원정보수정</h4>
			<hr class="userHr"/>
			<form method="post" id="userInfoEditFrm" action="/gachi/userInfoEditFormOk">
			<div class="row">
					<div class="col-md-4">아이디</div>
					<div class="col-md-8"><input type="text" name="userid" value="${vo.userid }" readonly/></div>
				</div>
				<div class="row">
					<div class="col-md-4">이름</div>
					<div class="col-md-8">${vo.username }</div>
				</div>
				<div class="row">
					<div class="col-md-4">닉네임</div>
					<div class="col-md-8"><input type="text" name="nickname" id="userInfoNickname" value="${vo.nickname }"/></div>
				</div>
				<div class="row">
					<div class="col-md-4">생년월일</div>
					<div class="col-md-8">${vo.birthdate }</div>
				</div>
				<div class="row">
					<div class="col-md-4">연락처</div>
					<div class="col-md-8">
						<input type="text" name="tel1" id="userInfoTel1" value="${vo.tel1 }"/>-
						<input type="text" name="tel2" id="userInfoTel2" value="${vo.tel2 }"/>-
						<input type="text" name="tel3" id="userInfoTel3" value="${vo.tel3 }"/>
						<button type="button" class="btn btn-outline-light btn-sm">인증</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">주소</div>
					<div class="col-md-8">
						<input type="text" name="zipcode" id="userInfoZipcode" value="01234" readonly/>
						<button type="button" class="btn btn-outline-light btn-sm">검색</button>
						<input type="text" name="addr" id="userInfoAddr" value="${vo.addr }" readonly/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">상세주소</div>
					<div class="col-md-8"><input type="text" name="detailaddr" id="userInfoDetailaddr" value="${vo.detailaddr }"/></div>
				</div>
				<div class="row">
				<div class="col-md-4">가입일</div>
					<div class="col-md-8">${vo.signupdate }</div>
				</div>
				<div class="row">
					<div class="col-md-4">관심사</div>
					<div class="col-md-8">
						<label><input type="checkbox" name="interest" value="미술">미술</label>
						<label><input type="checkbox" name="interest" value="요리">요리</label>
						<label><input type="checkbox" name="interest" value="공예/창작">공예/창작</label>
						<label><input type="checkbox" name="interest" value="운동">운동</label>
					
						<label><input type="checkbox" name="interest" value="음악">음악</label>
						<label><input type="checkbox" name="interest" value="사진">사진</label>
						<label><input type="checkbox" name="interest" value="라이프스타일">라이프스타일</label>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">새로운 비밀번호</div>
					<div class="col-md-8"><input type="password" name="userpwd" id="userInfoPwd1"/></div>
				</div>
				<div class="row">
					<div class="col-md-4">비밀번호 확인</div> 
					<div class="col-md-8"><input type="password" id="userInfoPwd2"/></div>
				</div>
				
				<button type="submit" class="btn btn-outline-light btn-block">확인</button>
			</form>
		</div>
	</div>
</div>