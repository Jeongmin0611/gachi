<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	
	/* 회원탈퇴 - 약관동의 */
	
	.mypageContent div{
		text-align: center;
	}
	.mypageContent button{
		width: 20%;
		background-color: ;
		margin-top: 100px;
	}
	#userLeaveNotice>div{
		margin-top:50px;
		padding:20px 0;
		background-color:#eee;
		line-height: 40px;
	}
	#userLeaveNotice>div input{
		margin-top:20px;
	}
	
</style>
<script>
	$(function(){
		$("#creatorLeaveBtn").click(function(){
			if($("input:checkbox[name=agree]").length==$("input:checkbox[name=agree]:checked").length){
				location.href='/gachi/creatorLeaveChk';
			}else{
				alert("안내문을 확인하신 후 모두 체크해주세요.");
			}
		});
	});
</script>
<div class="container cfont">
	<%-- <%@ include file="../inc/userProfile.jspf"%> --%>
	<div class="creatorMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">회원탈퇴 ></label>
			<label style="font-size:1.1em"><b>주의사항</b></label>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">탈퇴할 아이디</div>
				<div class="col-md-8">${userid }</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8">${username }</div>
			</div>
			<hr/>
			<div id="userLeaveNotice">
				<div>
					<div><b>사용하고 계신 아이디는 탈퇴 후 재사용 및 복구가 불가능합니다.</b></div>
					<div>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</div>
					<input type="checkbox" name="agree"/>확인했습니다.
				</div>
				<div>
					<div><b>탈퇴 후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.</b></div>
					<div>회원정보 및 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br/>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</div> 
					<input type="checkbox" name="agree"/>확인했습니다.
				</div>
				<div>
					<div><b>탈퇴와 동시에 정산되지 않은 금액은 모두 소멸됩니다.</b></div>
					<div>소멸된 미정산 금액은  탈퇴 후 복구가 불가하오니 탈퇴 전 모두 정산하여 주시기 바랍니다.</div> 
					<input type="checkbox" name="agree"/>확인했습니다.
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/creatorDashboard'">탈퇴취소</button>
				<button type="button" class="btn btn-outline-light" id="creatorLeaveBtn">다음</button>
			</div>
		</div>
	</div>
</div>