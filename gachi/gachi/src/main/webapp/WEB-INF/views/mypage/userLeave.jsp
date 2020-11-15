<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#mypageNaviSub{margin:20px auto;margin-left:50px;overflow:auto;text-align:center;}
	#mypageNaviSub li{float:left;}
	#mypageNaviSub li:nth-child(2){width:3%;}
	
	#infoEditView{width:50%;position:relative;left:25%;margin:50px 0 200px;}
	#infoEditView label{font-size:1.5em;}
	
	#infoEditLst{margin:50px 0;}
	#infoEditLst li{overflow:auto;margin-bottom:10px;}
	#infoEditLst li:nth-child(2n+1){width:30%;float:left;}
	#infoEditLst li:nth-child(2n){width:70%;}
	#infoEditUserpwd{width:100%;}
	
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
	<div id="infoEditView">
		<label>비밀번호확인</label>
		<ul id="infoEditLst">
			<li>아이디</li>
			<li>userid@bitcamp.com</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="infoEditUserpwd"/></li>
		</ul>
		<button type="button" class="btn btn-outline-dark	 btn-block" onclick="location.href='#'">회원탈퇴</button>
	</div>
</div>