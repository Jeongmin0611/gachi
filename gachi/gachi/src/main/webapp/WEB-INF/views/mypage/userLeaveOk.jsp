<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/* 회원탈퇴완료 */
	
	/*****************/
	/* 상단 */
	#userLeaveOkTop{
		margin:20px auto;
		margin-left:50px;
		overflow:auto;
		text-align:center;
	}
	#userLeaveOkTop li{
		float:left;
	}
	#userLeaveOkTop li:nth-child(2){
		width:3%;
	}
	
	/*****************/
	/* 내용 */
	#userLeaveOkContent{
		width:50%;
		position:relative;
		left:25%;
		text-align:center;
	}
	#userLeaveOkContent label{
		width:100%;
	}
	#userLeaveOkContent label:first-child{
		font-size:1.5em;
		margin:50px 0;
	}
	#userLeaveOkContent label:nth-child(3),#userLeaveOkContent label:nth-child(4){
		margin:15px 0;
	}
	#userLeaveOkContent Button{
		margin:100px 0 50px;
		background-color:#ABCEE3;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div id="userLeaveOkTop">
			<ul>
				<li><a href="/gachi/userInfoEdit">회원정보수정</a></li>
				<li>|</li>
				<li><a href="/gachi/userLeave"><b>회원탈퇴</b></a></li>
			</ul>
		</div>
		<div id="userLeaveOkContent">
			<label>회원 탈퇴가 완료되었습니다.</label>
			<hr/>
			<label>그동안 같이가치를 이용해주셔서 감사합니다.</label>
			<label>보다 나은 서비스로 다시 찾아 뵙겠습니다.</label>
			<hr/>
			<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi'">홈으로</button>
		</div>
	</div>
</div>