<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container text-center ad_font">
<h1>회원정보수정</h1>
	<form action="" id="ad_memberEdit_Frm">
	<ul>
		<li>아이디</li><li><input type="text" name="" value="${vo.userid }"readonly/></li>
		<li>이름</li><li><input type="text" name="" placeholder="${vo.username }" /></li>
		<li>닉네임</li><li><input type="text" name="" placeholder="${vo.nickname }"/></li>
		<li>연락처</li><li><input type="text" name="" placeholder="${vo.tel }"/></li>
		<li>가입일</li><li><input type="text" name="" value="${vo.signupdate }"readonly/></li>
		<li>마일리지</li><li><input type="text" name="" value="1000p"/></li>
		
		
	</ul><br/>
		<input type="submit" class="btn" value="회원정보수정"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</form>
	<br/>
</div>