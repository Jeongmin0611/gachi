<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 질문,문의 */
	
	/* 내용 */
	
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
	
	/* 모달 */
	#myqnaModal{
		display:none;
		position:absolute;
		width:100%;
		height:100%;
		z-index:1;
	}
	#myqnaModal input, 
	#myqnaModal textarea{
		border:none;
		border-bottom:2px solid #ABCEE3;
		text-align:left;
		margin-top:10px;
		padding:10px;
	}
	.myqnaModal_content{
		width:500px;
		height:600px;
		margin:100px auto;
		padding:20px 10px;
		background-color:#fff;
		border:3px solid #ABCEE3;
	}
	.myqnaModal_content>div{
		padding:5px 10px;
	}
	.myqnaModal_content>label{
		width:100%;
		padding:10px;
		font-weight:;
		background-color:#e3eef6;
		text-align:center;
		color:;
		font-size:1.3em;
	}
	.myqnaModal_content input{
		width:100%;
		margin-bottom:10px;
	}
	.myqnaModal_content textarea{
		width:100%;
		height:300px;
		margin-bottom:30px;
	}
	#myqnaWrite{
		background-color:#ABCEE3;
		margin:0 auto;
		margin-top:50px;
		border:none;
	}
	.myqnaModal_layer{
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background-color:rgba(0,0,0,0.5);
		z-index:-1;
	}
	
</style>
<script>
	$(function(){
		//모달창 띄우기(1대1)
	    $("#myqnaFrm").click(function(){
			$("#myqnaModal").css({
	           "top": (($(window).height()-$("#myqnaModal").outerHeight())/2+$(window).scrollTop())+"px",
	           "left": (($(window).width()-$("#myqnaModal").outerWidth())/2+$(window).scrollLeft())+"px"
	           //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
	        
	        });
	        $("#myqnaModal").fadeIn();
	    });
	    $("#myqnaWrite, .myqnaModal_layer").click(function(){
	       $("#myqnaModal").fadeOut();
	    });  
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">내 활동 ></label>
			<label style="font-size:1.1em"><b>1:1문의</b></label>
			<hr class="userHr"/>
			<div style="text-align:right">
				<select>
					<option>분류전체</option>
					<option>사이트 이용</option>
					<option>주문/결제</option>
				</select>
				<select>
					<option>답변상태</option>
					<option>답변완료</option>
					<option>미답변</option>
				</select>
				<button type="button" class="btn btn-outline-light" id="myqnaFrm">문의하기</button>
			</div>
			<label>주문/결제</label>
			<ul id="myqnaClass">
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
				<li>답변완료</li>
				<li>이중결제가 됐는데 취소해주세요.</li>
				<li>
				<hr/>
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>시스템 오류 또는 시스템 점검으로 일시적인 이중결제가 발생할 수 있습니다. 고객센터(1588-1588)로 연락 부탁드립니다.</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
<div id="myqnaModal" class="cfont">
	<div class="myqnaModal_content">
		<label>문의작성</label>
		<input type="text" placeholder="제목"/>
		<textarea placeholder="내용을 입력해주세요."></textarea>
		<button type="button" class="btn btn-outline-light btn-block" id="myqnaWrite">등록</button>
	</div>
	<div class="myqnaModal_layer"></div>
</div>