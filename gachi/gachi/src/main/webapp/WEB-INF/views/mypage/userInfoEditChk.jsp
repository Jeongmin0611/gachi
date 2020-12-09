<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 회원정보수정 -비밀번호확인 */
	.mypageContent div{
		text-align: center;
	}
	.mypageContent>form>div{
		margin-top: 50px;
	}
	.mypageContent input{
		width: 100%;
	}
	.mypageContent button{
		width: 30%;
		background-color: ;
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
		<div class="mypageContent col-md-10">
			<label style="color:gray">회원정보수정 ></label>
			<label style="font-size:1.1em"><b>비밀번호확인</b></label>
			<hr class="userHr"/>
			<form method="post" id="pwdFrm" action="/gachi/userInfoEditOk">	
				<input type="hidden" name="userid" value="${userid }"/>
				<div class="row">	
					<div class="col-md-4">비밀번호확인</div>
					<div class="col-md-8"><input type="password" name="userpwd" id="userInfoPwd" style="width:100%"/></div>
				</div>
				<div>
					<button type="submit" class="btn btn-outline-light">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>