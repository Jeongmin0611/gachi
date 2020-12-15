<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 회원탈퇴 - 비번확인 */
	
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
		$("#frm").submit(function(){
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			return true;
		});
	});
</script>
<div class="container cfont"><%-- 
	<%@ include file="../inc/userProfile.jspf"%> --%>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">회원탈퇴 ></label>
			<label style="font-size:1.1em"><b>비밀번호확인</b></label>
			<hr class="userHr"/>
			<form method="post" id="frm" action="/gachi/creatorLeaveOk">
				<input type="hidden" name="userid" value="${userid }"/>
				<div class="row">	
					<div class="col-md-4">비밀번호</div>
					<div class="col-md-8"><input type="password" name="userpwd" id="userpwd" size="20"/></div>
				</div>
				<div style="vertical-align:middle">
					<button type="submit" id="frm"class="btn btn-outline-light">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>