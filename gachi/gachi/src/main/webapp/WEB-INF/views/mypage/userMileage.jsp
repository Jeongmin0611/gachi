<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 마일리지 */
	
	/*******************/
	/* 상단 */
	#userMileageTop{
		margin:50px 10px 5px;
		padding:10px;
		height:150px;
		border:3px solid #ABCEE3;
	}
	#userMileageTop>div{
		width:33%;
		float:left;
		text-align:center;
	}
	#userMileageTop label{
		width:100%;
		line-height:50px;
	}
	#userMileageTop label:nth-child(2n){
		font-size:1.3em;
	}
	
	/*******************/
	/* 내용 */
	#userMileageContent{
		margin-bottom:100px;
	}
	#userMileageContent>label:first-child{
		width:100%;
		font-size:0.8em;
		text-align:right;
		padding-right:10px;
	}
	#userMileageContent>label:nth-child(2){
		margin-top:20px;
		font-size:1.3em;
		margin-left:10px;
	}
	#userMileageContent ul{
		overflow:auto;
	}
	#userMileageContent li{
		width:33%;
		line-height:50px;
		float:left;
		text-align:center;
	}
	/* 리스트 제목 */
	#userMileageTtl li{
		line-height:30px;
	}
	
	/*******************/
	/* 하단 */
	.userMileageBtm{margin:50px 0;width:100%;}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div id="userMileageTop">
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
		<div id="userMileageContent">
			<label>*마일리지는 적립된 달로부터 12개월 이내에 사용하셔야 합니다</label>
			<label>마일리지 적립/사용 내역</label>
			<hr style="background:#000;"/>
			<ul id="userMileageTtl">
				<li>날짜</li>
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
		<div class="userMileageBtm">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">Prev</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>
</div>