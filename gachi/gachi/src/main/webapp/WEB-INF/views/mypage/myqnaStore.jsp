<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 질문,문의 */
	
	/* 상단 */
	#myqnaTop{
		overflow:auto;
		padding:20px 50px 0;
	}
	#myqnaTop li{
		width:7%;
		float:left;
		text-align:center;
	}
	#myqnaTop li:nth-child(2n){
		width:3%;
	}
	#myqnaTop li:nth-child(3){
		font-weight:bold;
	}
	
	/* 내용 */
	#myqnaContent>div:first-child{
		text-align:right;
		width:100%;
		overflow:auto;
		height:50px;
	}
	#myqnaContent>label{
		margin:10px 30px;
		padding:5px;
		background-color:#fde9e2;
	}
	#myqnaContent>label a:hover{
		font-weight:bold;
	}
	/* 클래스 질문답변 */
	#myqnaClass{
		overflow:auto;
		margin-bottom:100px;
		border:3px solid #eee;
		padding:15px;
	}
	#myqnaClass li{
		float:left;
		text-align:center;
		padding:0 10px;
	}
	#myqnaClass>li:first-child{
		float:left;
		text-align:left;
		padding:0 15px;
		font-weight:bold;
		color:gray;
	}
	#myqnaClass>li:first-child>label{
		font-size:1em;
		color:#F4BFA9;
		font-weight:bold;
		margin-right:10px;
	}
	#myqnaClass li:nth-child(2),#myqnaClass>li:nth-child(3){
		font-size:0.8em;
	}
	#myqnaClass li:nth-child(4){
		float:right;
		color:#ABCEE3;
		font-weight:bold;
		font-size:1.5em;
	}
	#myqnaClass li:nth-child(5){
		width:100%;
		text-align:left;
		padding:0 15px;
	}
	#myqnaClass>li:last-child{
		padding:10px;
	}
	#myqnaClass>li:last-child label{
		font-size:1em;
		color:#ABCEE3;
		font-weight:bold;
		margin-right:10px;
	}
	#myqnaClass li:last-child{
		width:100%;
		text-align:left;
		float:left;
		padding:0 10px;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<ul id="myqnaTop">
			<li><a href="/gachi/myqnaClass">클래스</a></li>
			<li>|</li>
			<li><a href="/gachi/myqnaStore">스토어</a></li>
			<li>|</li>
			<li><a href="/gachi/myqna1on1">1:1문의</a></li>
			<li>|</li>
			<li><a href="/gachi/myqnaEvent">이벤트</a></li>
		</ul>
		<div id="myqnaContent">
			<div>
				<select>
					<option>답변상태</option>
					<option>답변완료</option>
					<option>미답변</option>
				</select>
			</div>
			<label><a href="#">캘리그라피 입문 세트</a></label>
			<ul id="myqnaClass">
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>답변완료</li>
				<li>필요한 재료를 추가로 별도 구매가 가능한가요?</li>
				<li>
				<hr/>
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>해당 상품은 세트로만 판매되고 있는 상품이며, 구성품 개별 구매는 어렵습니다! 구성품에 관한 정보는 상세페이지 내에 기재되어 있으니, 참고하시어 즐거운 취미 생활 되시기를 바라겠습니다 :) 감사합니다!</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>