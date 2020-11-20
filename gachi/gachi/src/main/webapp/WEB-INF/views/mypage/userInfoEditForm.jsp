<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>	
	
	/* 회원정보수정 폼 */
	
	/****************/
	/* 상단 - 메뉴바*/
	#userInfoEditFormTop{
		margin:20px auto;
		margin-left:80px;
		overflow:auto;
		text-align:center;
	}
	#userInfoEditFormTop li{
		float:left;
	}
	#userInfoEditFormTop li:nth-child(2){
		width:3%;
	}
	
	/****************/
	/* 내용 */
	#userInfoEditFormContent{
		width:50%;
		position:relative;
		left:25%;
		margin:50px 0;
	}
	#userInfoEditFormContent label{
		font-size:1.3em;
	}
	/* 정보수정 리스트 */
	#userInfoEditFormLst{
		margin:10px 0 100px;
	}
	#userInfoEditFormLst li{
		overflow:auto;
		padding:10px 0;
		text-align:center;
		margin-bottom:2%;
		margin:0 10px;
		
	}
	#userInfoEditFormLst li:nth-child(2n+1){
		width:30%;
		float:left;
	}
	#userInfoEditFormLst li:nth-child(2n){
		width:65%;
	}
	#userInfoEditFormLst li:nth-child(2),
	#userInfoEditFormLst li:nth-child(4),
	#userInfoEditFormLst li:nth-child(6),
	#userInfoEditFormLst li:nth-child(16){	
		border:none;
	}
	#userInfoEditFormLst li:nth-child(14)>input {
		width:25%;
		float:left;
		margin:0 5px;
	}
	#userInfoEditFormLst li:nth-child(14)>button {
		width:15%;
	}
	#userInfoEditFormLst li:nth-child(16)>input:first-child{
		width:15%;
		float:left;
	}
	#userInfoEditFormLst li:nth-child(16)>input:last-child{
		width:70%;
	}
	#userInfoEditFormLst li:nth-child(18)>input{
		width:100%;
	}
	#userInfoEditFormLst input{
		width:70%;
		text-align:center;
		border:none;
		border-bottom:1px solid #ddd;
	}
	#userInfoEditFormContent button{
		background-color:#abcee3;
	}
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div id="userInfoEditFormTop">
			<ul>
				<li><a href="/gachi/userInfoEdit"><b>회원정보수정</b></a></li>
				<li>|</li>
				<li><a href="/gachi/userLeave">회원탈퇴</a></li>
			</ul>
		</div>
		<div id="userInfoEditFormContent">
			<label>회원정보수정</label>
			<hr/>
			<ul id="userInfoEditFormLst">
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
					<input type="text" name="tel" value="010"/>
					<input type="text" name="tel" value="9999"/>
					<input type="text" name="tel" value="8888"/>
					<button type="button" class="btn btn-outline-light btn-sm">인증</button>
				</li>
				<li>주소</li>
				<li>
					<input type="text" name="zipcode" value="01234" readonly/>
					<button type="button" class="btn btn-outline-light btn-sm">검색</button>
					<input type="text" name="addr" value="서울시 마포구 백범로" readonly/>
				</li>
				<li>상세주소</li>
				<li><input type="text" name="addrDetail" value="11111112222222"/></li>
				
			</ul>
			<button type="button" class="btn btn-outline-light btn-block" onclick="location.href='/gachi/userInfoEditForm'">확인</button>
		</div>
	</div>
</div>