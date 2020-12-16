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

#cr_leave_board {
	border: 2px solid #437299;
	border-radius:10px;	
	width: 100%;
	height: 300px;
	padding: 10px;
	margin-top: 50px;
	text-align: center;
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
<div class="container cfont">
		
		<div id="cr_leave_board" >
			<img src="/gachi/img/mainlogo.png" style="width:20%"/>
			<br/><br/>
			<label style="color:gray">회원탈퇴 ></label>
			<label style="font-size:1.1em"><b>비밀번호확인</b></label>
			<hr class="userHr"/>
			<form method="post" id="frm" action="/gachi/creatorLeaveOk">
					<input type="hidden" name="userid" value="${userid }"/>				
					<input type="password" name="userpwd" id="userpwd" size="30" style="margin-right:10px;"/>
					<button type="submit" id="frm"class="btn btn-outline-light">확인</button>
			</form>
		</div>
</div>