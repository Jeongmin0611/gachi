<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#myqnaTop{overflow:auto;padding:20px 50px 0;}
	#myqnaTop li{width:7%;float:left;text-align:center;}
	#myqnaTop li:nth-child(2n){width:3%;}
	#myqnaTop li:first-child{font-weight:bold;}
	
	#myqnaClass{overflow:auto;margin-bottom:100px;border:3px solid #eee;padding:15px;}
	#myqnaClass li{float:left;text-align:center;padding:0 10px;}
	#myqnaClass>li:first-child{float:left;text-align:left;padding:0 15px;font-weight:bold;color:gray;}
	#myqnaClass>li:first-child>label{font-size:1em;color:#F4BFA9;font-weight:bold;margin-right:10px;}
	#myqnaClass li:nth-child(2),#myqnaClass>li:nth-child(3){font-size:0.8em;}
	#myqnaClass li:nth-child(4){float:right;color:#ABCEE3;font-weight:bold;font-size:1.5em;}
	#myqnaClass li:nth-child(5){width:100%;text-align:left;padding:0 15px;}
	#myqnaClass>li:last-child{padding:10px;}
	#myqnaClass>li:last-child label{font-size:1em;color:#ABCEE3;font-weight:bold;margin-right:10px;}
	#myqnaClass li:last-child{width:100%;text-align:left;float:left;padding:0 10px;}
	
	#myqnaMain>label{margin:30px 30px 5px 30px;padding:5px;background-color:#eee;}
</style>
<div class="container" id="myqnaMain">
	<%@ include file="../inc/userProfile.jspf" %>
	<ul id="myqnaTop">
		<li><a href="/gachi/myqna">클래스</a></li>
		<li>|</li>
		<li><a href="#">스토어</a></li>
		<li>|</li>
		<li><a href="#">1:1문의</a></li>
		<li>|</li>
		<li><a href="#">이벤트</a></li>
	</ul>
	<hr/>
	<div id="myqnaSearchDiv">
		<select name="searchKeyClassName">
			<option value="클래스명">클래스명</option>
			<option value="카모마일 프랑스 자수">카모마일 프랑스 자수</option>
		</select>
		<select name="searchKeyQnaStatus">
			<option value="답변상태">답변상태</option>
			<option value="답변완료">답변완료</option>
			<option value="미답변">미답변</option>
		</select>
	</div>
	<label><a href="#">카모마일 프랑스 자수</a></label>
	<ul id="myqnaClass">
		<li><label class="badge badge-light">Q</label>질문입니다</li>
		<li>김유미</li>
		<li>20.11.15</li>
		<li>답변완료</li>
		<li>입문자도 충분히 가능한가요?? 난이도가 어느정도인지 궁금합니다.</li>
		<li>
		<hr/>
			<ul>
				<li><label class="badge badge-light">A</label>홍길동</li>
				<li>20.11.15</li>
				<li>네 처음 시작하시는 분들도 무리없이 따라오시는 난이도의 수업입니다 :)</li>
			</ul>
		</li>
	</ul>
</div>