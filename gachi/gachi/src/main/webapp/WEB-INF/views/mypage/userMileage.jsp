<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#userMileageView{margin:50px 10px 5px;padding:10px;height:150px;border:5px solid #ABCEE3;}
	#userMileageView>div{width:33%;float:left;text-align:center;}
	#userMileageView label{width:100%;line-height:50px;}
	#userMileageView label:nth-child(2n){font-size:1.5em;}
	
	#userMileageLst{margin-bottom:100px;}
	#userMileageLst>label:first-child{width:100%;font-size:0.8em;text-align:right;}
	#userMileageLst>label:nth-child(2){margin-top:20px;font-size:1.5em;}
	
	#userMileageLst ul{overflow:auto;}
	#userMileageLst li{width:33%;line-height:50px;float:left;text-align:center;}
	#userMileageTtl li{line-height:30px;}
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf" %>
	<div id="userMileageView">
		<div>
			<label>현재 마일리지</label>
			<label>1,000p</label>
		</div>
		<div>
			<label>총 적립 마일리지</label>
			<label>1,000p</label>
		</div>
		<div>
			<label>사용한 마일리지</label>
			<label>0p</label>
		</div>
	</div>
	<div id="userMileageLst">
		<label>*마일리지는 적립(충전)된 달로부터 12개월 이내에 사용하셔야 합니다</label>
		<label>마일리지 적립/사용 내역</label>
		<hr/>
		<ul id="userMileageTtl">
			<li>적립날짜</li>
			<li>내역</li>
			<li>마일리지</li>
		</ul>
		<hr/>
		<ul>
			<li>2020-11-11</li>
			<li>회원가입 포인트</li>
			<li>+1,000p</li>
		</ul>
		<ul>
			<li>2020-11-11</li>
			<li>회원가입 포인트</li>
			<li>+1,000p</li>
		</ul>
		<ul>
			<li>2020-11-11</li>
			<li>회원가입 포인트</li>
			<li>+1,000p</li>
		</ul>
		<ul>
			<li>2020-11-11</li>
			<li>회원가입 포인트</li>
			<li>+1,000p</li>
		</ul>
		<ul>
			<li>2020-11-11</li>
			<li>회원가입 포인트</li>
			<li>+1,000p</li>
		</ul>
		<hr/>
	</div>
</div>