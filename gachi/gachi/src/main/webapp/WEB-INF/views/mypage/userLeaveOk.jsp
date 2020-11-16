<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#mypageNaviSub{margin:20px auto;margin-left:50px;overflow:auto;text-align:center;}
	#mypageNaviSub li{float:left;}
	#mypageNaviSub li:nth-child(2){width:3%;}
	
	#userLeaveOkView{width:50%;position:relative;left:25%;margin:50px 0 200px;text-align:center;}
	#userLeaveOkView label{width:100%;}
	#userLeaveOkView label:first-child{font-size:2em;margin-bottom:100px;}
	#userLeaveOkView label:nth-child(4){margin-bottom:30px;}
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf"%>
	<div id="mypageNaviSub">
		<ul>
			<li><a href="/gachi/userInfoEdit">회원정보수정</a></li>
			<li>|</li>
			<li><a href="#"><b>회원탈퇴</b></a></li>
		</ul>
	</div>
	<hr/>
	<div id="userLeaveOkView">
		<label>회원 탈퇴가 완료되었습니다.</label>
		<hr/>
		<label>그동안 같이가치를 이용해주셔서 감사합니다.</label>
		<label>보다 나은 서비스로 다시 찾아 뵙겠습니다.</label>
		<button type="button" class="btn btn-primary">홈으로</button>
		<hr/>
	</div>
</div>