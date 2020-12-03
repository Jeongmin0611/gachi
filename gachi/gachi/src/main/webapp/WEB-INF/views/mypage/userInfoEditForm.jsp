<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>	
	
	/* 회원정보수정 폼 */
	
	.mypageContent div{
		text-align: center;
	}
	.mypageContent input{
		width: 100%;
	}.mypageContent button{
		background-color: #abcee3;
	}
	.mypageContent button[type=submit]{
		margin-top: 100px;
	}
	
</style>
<script>
	$(function(){
		//관심사 체크하기
		var userInter = $("#userInter").val();
		var strInter = userInter.split(",");
		for(i=0;i<strInter.length;i++){
			$("input:checkbox[value="+strInter[i]+"]").prop("checked","true")
		}
		
		//빈칸검사
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
			if($("#userInfoPwd1").val()=="" && $("#userInfoPwd2").val()==""){
				return true;
			}
			if($("#userInfoPwd1").val() != $("#userInfoPwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			return true;
		});
		//$("input:checkbox[id='id값']").prop("checked", true);
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageContent col-lg-8 col-md-10">
			<label style="color:gray">회원정보수정 ></label>
			<label style="font-size:1.1em"><b>수정하기</b></label>
			<hr class="userHr"/>
			<form method="post" id="userInfoEditFrm" action="/gachi/userInfoEditFormOk">
			<div class="row">
					<div class="col-md-4">아이디</div>
					<div class="col-md-8"><input type="text" name="userid" value="${vo.userid }" style="border:none;outline:none" readonly/></div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">이름</div>
					<div class="col-md-8">${vo.username }</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">생년월일</div>
					<div class="col-md-8">${vo.birthdate }</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">닉네임</div>
					<div class="col-md-8"><input type="text" name="nickname" id="userInfoNickname" value="${vo.nickname }"/></div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">연락처</div>
					<div class="col-md-8">
						<input type="text" name="tel1" id="userInfoTel1" value="${vo.tel1 }" style="width:25%"/>-
						<input type="text" name="tel2" id="userInfoTel2" value="${vo.tel2 }" style="width:25%"/>-
						<input type="text" name="tel3" id="userInfoTel3" value="${vo.tel3 }" style="width:25%"/>
						<button type="button" class="btn btn-outline-light btn-sm" style="width:15%">인증</button>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">주소</div>
					<div class="col-md-8">
						<input type="text" name="zipcode" id="userInfoZipcode" value="01234" style="width:15%;outline:none" readonly/>
						<button type="button" class="btn btn-outline-light btn-sm" style="width:15%">검색</button>
						<input type="text" name="addr" id="userInfoAddr" value="${vo.addr }" style="width:67%;outline:none" readonly/>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">상세주소</div>
					<div class="col-md-8"><input type="text" name="detailaddr" id="userInfoDetailaddr" value="${vo.detailaddr }"/></div>
				</div>
				<hr/>
				<div class="row">
				<div class="col-md-4">가입일</div>
					<div class="col-md-8">${vo.signupdate }</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">관심사</div>
					<div class="col-md-8">
						<input type="hidden" id="userInter" value="${vo.interest }"/>
						<label><input type="checkbox" name="interest" value="미술">미술</label>
						<label><input type="checkbox" name="interest" value="요리">요리</label>
						<label><input type="checkbox" name="interest" value="공예/창작">공예/창작</label>
						<label><input type="checkbox" name="interest" value="운동">운동</label>				
						<label><input type="checkbox" name="interest" value="음악">음악</label>
						<label><input type="checkbox" name="interest" value="사진">사진</label>
						<label><input type="checkbox" name="interest" value="라이프스타일">라이프스타일</label>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">새로운 비밀번호</div>
					<div class="col-md-8"><input type="password" name="userpwd" id="userInfoPwd1"/></div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">비밀번호 확인</div> 
					<div class="col-md-8"><input type="password" id="userInfoPwd2"/></div>
				</div>
				<hr/>
				<div>
					<button type="submit" class="btn btn-outline-light btn-block">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>