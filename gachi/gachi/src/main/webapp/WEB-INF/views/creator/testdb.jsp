<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
</style>
<div class="container">
	<ul id="test">
		<li>아이디</li>
		<li>비밀번호</li>
		<li>이름</li>
		
		<c:forEach var="vo" items="${list}">
			<li>${vo.id}</li>
			<li>${vo.password}</li>
			<li>${vo.username}</li>	
		</c:forEach>
	</ul>
</div>