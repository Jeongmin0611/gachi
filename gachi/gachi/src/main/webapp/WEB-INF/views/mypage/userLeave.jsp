<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 회원탈퇴 - 약관동의 */
	
	.mypageTop>div>div:last-child{
		font-weight:bold;
	}
	.mypageContent div{
		margin: 10px 0;
	}
	.mypageContent button:first-child{
		background-color: #abcee3;
		margin-top: 100px;
	}
	.mypageContent button:last-child{
		background-color: #eee;
		margin-top: 100px;
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
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userInfoEdit">회원정보수정</a></div>
				<div class="col-1">|</div>
				<div class="col-4 col-sm-4 col-md-3 col-lg-2"><a href="/gachi/userLeave">회원탈퇴</a></div>
			</div>
		</div>
		<div class="mypageContent col-lg-8 col-md-10">
			<h4>회원탈퇴</h4>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">탈퇴할 아이디</div>
				<div class="col-md-8">user</div>
			</div>
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8">김유미</div>
			</div>
			<hr/>
			<div>
				<div>*사용하고 계신 아이디는 탈퇴 후 재사용 및 복구가 불가능합니다.</div>
				<div>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</div>
				<input type="checkbox"/>확인했습니다.
			</div>
			<hr/>
			<div>
				<div>*탈퇴 후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.</div>
				<div>회원정보 및 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br/>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</div> 
				<input type="checkbox"/>확인했습니다.
			</div>
			
			<div>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/userInfo'">탈퇴취소</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/userLeaveChk'">다음</button>
			</div>
		</div>
	</div>
</div>