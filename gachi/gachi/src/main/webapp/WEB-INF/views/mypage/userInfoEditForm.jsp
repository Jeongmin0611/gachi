<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#mypageNaviSub{margin:20px auto;margin-left:80px;overflow:auto;text-align:center;}
	#mypageNaviSub li{float:left;}
	#mypageNaviSub li:nth-child(2){width:3%;}
	
	#infoEditView{width:50%;position:relative;left:25%;margin:50px 0 200px;}
	#infoEditView label{font-size:1.5em;}
	
	#infoEditLst{margin:50px 0 100px;}
	#infoEditLst li{overflow:auto;margin-bottom:20px;text-align:center;}
	#infoEditLst li:nth-child(2n+1){width:30%;float:left;}
	#infoEditLst li:nth-child(2n){width:70%;}
	#infoEditLst li:nth-child(14)>input {width:80%;float:left;}
	#infoEditLst li:nth-child(14)>button {width:20%;}
	#infoEditLst li:nth-child(16)>input:first-child{width:15%;float:left;}
	#infoEditLst li:nth-child(16)>input:last-child{width:70%;}
	
	#infoEditLst input{width:100%;text-align:center;}
	
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf"%>
	<div id="mypageNaviSub">
		<ul>
			<li><a href="/gachi/userInfoEdit"><b>회원정보수정</b></a></li>
			<li>|</li>
			<li><a href="/gachi/userLeave">회원탈퇴</a></li>
		</ul>
	</div>
	<hr/>
	<div id="infoEditView">
		<label>회원정보수정</label>
		<ul id="infoEditLst">
			<li>이름</li>
			<li>김유미</li>
			<li>생년월일</li>
			<li>1990.12.31</li>
			<li>아이디</li>
			<li>userid@bitcamp.com</li>
			<li>변경할 비밀번호</li>
			<li><input type="password" name="userpwd"/></li>
			<li>비밀번호 확인</li>
			<li><input type="password"/></li>
			<li>닉네임</li>
			<li><input type="text" name="nickname" value="김유미"/></li>
			<li>연락처</li>
			<li>
				<input type="text" name="tel" value="010-9999-8888"/>
				<button type="button" class="btn btn-outline-primary btn-sm">인증</button>
			</li>
			<li>주소</li>
			<li>
				<input type="text" name="zipcode" value="01234" readonly/>
				<button type="button" class="btn btn-outline-primary btn-sm">검색</button>
				<input type="text" name="addr" value="서울시 마포구 백범로" readonly/>
			</li>
			<li>상세주소</li>
			<li><input type="text" name="addrDetail" value="11111112222222"/></li>
			
		</ul>
		<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='/gachi/userInfoEditForm'">확인</button>
	</div>
</div>