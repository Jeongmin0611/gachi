<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
 #cre_profile_imgArea{
 	border:3px solid #437299;
 	border-radius:10px;
 	text-align:center;
 }
 #cre_profile_imgArea li{
 	padding:5px 0px;
 }
 #creator_editForm2{
 	margin:20px 0px;
 	border:3px solid #437299;
 	border-radius:10px;
 	overflow: auto;
 }
 #creator_editForm2>li{
 	float:left;
 	border-bottom:1px solid gray;
 	height:45px;
 	padding-top:7px;
 	overflow: auto;
 }
</style>
<script>
	$(()=>{
		$("#creator_editForm2>li:nth-child(2n+1)").css("width","15%").css("text-align","center");
		$("#creator_editForm2>li:nth-child(2n)").css("width","85%");
		$("#creator_editForm2>li:nth-child(17)").css("width","100%").css("border","none");
		$("#creator_editForm2>li:nth-child(18)").css("height","800px").css("margin","0");
		$(".form-control").css("width","30%").css("float","left");
		CKEDITOR.replace("creator_info");
		CKEDITOR.config.height=650;
		
	});
</script>
<div class="container ad_font">
	<h1>프로필 수정</h1>
	<div>
		<form method="post" id="cre_creator_editForm" action="" enctype="multipart/form-data">
			<ul id="cre_profile_imgArea" style="border:3px solid #437299;border-radius:10px;text-align:center;margin:10px 0px">
				<li>프로필 사진</li>
				<li><img src="/gachi/img/147.jpg"></li>
				<li style="text-align:center;"><input type="file"/></li>
			</ul>
			<ul id="creator_editForm2" class="form-group" style="overflow:auto">
				<li>아이디</li>
				<li>honggildong@naver.com</li>
				<li>비밀번호</li>
				<li><input type="text"/></li>
				<li>비밀번호확인</li>
				<li><input type="text"/></li>
				<li>생년월일</li>
				<li><input type="text" onkeypress="onlyNumber();" maxlength="8"/></li>
				<li>연락처</li>
				<li>
					<input type="text" onkeypress="onlyNumber();" maxlength="3" oninput="numberMaxLength(this);"/>-
					<input type="text" onkeypress="onlyNumber();" maxlength="4" oninput="numberMaxLength(this);"/>-
					<input type="text" onkeypress="onlyNumber();" maxlength="4" oninput="numberMaxLength(this);"/>
				</li>
				<li>사업자번호</li>
				<li>192-02-12455</li>
				<li>계좌번호</li>
				<li>
					<select>
						<option selected>은행명</option>
						<option>국민은행</option>
						<option>기업은행</option>
						<option>농협</option>
						<option>수협</option>
						<option>새마을금고</option>
						<option>신한은행</option>
						<option>우리은행</option>
						<option>카카오뱅크</option>
						<option>케이뱅크</option>
						<option>하나은행</option>
						<option>한국씨티은행</option>
						<option>BNK부산은행</option>
						<option>sc제일은행</option>
					</select>
					<input type="text"/>
				</li>
				<li>sns계정</li>
				<li><input type="text"/></li>
			</ul>
			<h3>소개글</h3>
			<textarea name="creator_info"></textarea>
			<div style="text-align:center;margin-top:20px;">
				<input type="submit" class="btn" value="수정"/>
				<input type="reset" class="btn" value="다시쓰기"/>
			</div>
		</form>
	</div>
</div>