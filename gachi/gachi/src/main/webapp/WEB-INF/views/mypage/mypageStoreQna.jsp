<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 질문,문의 */
	
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
	#myqnaClass li:nth-child(2),
	#myqnaClass>li:nth-child(3),
	#myqnaClass>li:nth-child(4),
	#myqnaClass>li:nth-child(5){
		font-size:0.8em;
	}
	#myqnaClass>li:nth-child(4) a{
		color:#1b3da7;
	}
	#myqnaClass>li:nth-child(5) a{
		color:#aaa;
	}
	#myqnaClass li:nth-child(6){
		float:right;
		color:#ABCEE3;
		font-weight:bold;
		font-size:1.5em;
	}
	#myqnaClass li:nth-child(7){
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
		<div class="mypageContent col-md-10">
			<label style="color:gray">내 활동 ></label>
			<label style="font-size:1.1em"><b>상품문의</b></label>
			<hr class="userHr"/>
			<div style="text-align:right">
				<button type="button" class="btn btn-outline-light">문의작성</button>
				<select>
					<option>상품명</option>
					<option>카모마일 프랑스 자수</option>
				</select>
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
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
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