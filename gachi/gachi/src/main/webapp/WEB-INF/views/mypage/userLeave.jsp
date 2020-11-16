<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 회원탈퇴 - 약관동의 */
	
	/**************/
	/* 상단- 서브메뉴 */
	#userLeaveTop{
		margin:20px auto;
		margin-left:50px;
		overflow:auto;
		text-align:center;
	}
	#userLeaveTop li{
		float:left;
	}
	#userLeaveTop li:nth-child(2){
		width:3%;
	}
	
	
	/**************/
	/* 내용 */	
	#userLeaveContent{
		width:50%;
		position:relative;
		left:25%;
		margin:50px 0 200px;
	}
	#userLeaveContent>label{
		font-size:1.5em;
	}
	/* 회원정보 */
	#userLeaveInfo{
		background-color:#eee;
		padding:30px;
		text-align:center;
		margin-bottom:20px;
	}
	#userLeaveInfo>label{
		width:100%;
	}
	/* 약관내용 */
	#userLeaveNotice{
		border:3px solid #eee;
		padding:20px;
	}
	#userLeaveNotice>li{
		margin:20px;
	}
	#userLeaveNotice>li>label:first-child{
		font-weight:bold;
	}
	#userLeaveNotice>li>label:nth-child(2){
		font-size:0.9em;
	}
	#userLeaveNotice>li:nth-child(2){
		margin-bottom:50px;
	}
	#userLeaveNotice>li:last-child{
		text-align:center;
	}
	
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf"%>
	<div id="userLeaveTop">
		<ul>
			<li><a href="/gachi/userInfoEdit">회원정보수정</a></li>
			<li>|</li>
			<li><a href="#"><b>회원탈퇴</b></a></li>
		</ul>
	</div>
	<hr/>
	<div id="userLeaveContent">
		<label>회원탈퇴</label>
		<div id="userLeaveInfo">
			<label>탈퇴할 아이디 : user</label>
			<label>이름 : 김유미</label>
		</div>
		<ul id="userLeaveNotice">
			<li>
				<label>*사용하고 계신 아이디는 탈퇴 후 재사용 및 복구가 불가능합니다.</label>
				<label>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</label>
				<input type="checkbox"/><label>동의합니다.</label>
			</li>
			<li>
				<label>*탈퇴 후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.</label>
				<label>회원정보 및 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br/>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</label> 
				<input type="checkbox"/><label>동의합니다.</label>
			</li>
			<li>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/gachi/mypage'">탈퇴취소</button>
				<button type="button" class="btn btn-primary" onclick="location.href='/gachi/userLeaveChk'">확인</button>
			</li>
		</ul>
	</div>
</div>