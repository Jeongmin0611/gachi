<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/* 회원탈퇴완료 */
	
	.mypageContent div{
		text-align: center;
		margin: 50px 0 30px;
		line-height:40px;
	}
	.mypageContent button{
		width: 30%;
		background-color: ;
		margin-top: 100px;
	}
	
</style>
<div class="container cfont">
	<%-- <%@ include file="../inc/userProfile.jspf"%> --%>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">회원탈퇴 </label>
			<label style="font-size:1.1em"><b>탈퇴완료</b></label>
			<hr class="userHr"/>
			<div>
				<img src="/gachi/img/icon_check.png" style="width:100px"/>
			</div>
			<div><h4>회원탈퇴가 완료되었습니다.</h4></div>
			<div>그동안 같이가치를 이용해주셔서 감사합니다.<br/>
				보다 나은 서비스로 다시 찾아 뵙겠습니다.
			</div>
			<hr/>
			<div>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi'">홈으로</button>
			</div>
		</div>
	</div>
</div>