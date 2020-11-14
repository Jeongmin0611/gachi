<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#myclassMainDiv{overflow-x:hidden;}
	/*내용*/
	#mypageMainContent{float:clear;margin-bottom:100px;}
	#mypageMainContent p{margin:20px;}
	#mypageMainContent>p>label{width:5%;}
	#mypageMainContent>label{width:100%;height:50px;line-height:50px;text-align:center;font-size:1.5em;margin:50px 0 30px;background-color:#eee;}
	
	#mypageMainLst{width:70%;float:left;}
	#mypageMainLst>li{margin:10px 30px;line-height:25px;}
	#mypageMainLst>li:first-child{margin:20px 30px 20px 50px;float:left;}
	#mypageMainLst>li:nth-child(2){margin:0;}
	#mypageMainLst>li:nth-child(5){margin:0 50px 0 0;}
	
	/*클래스썸네일*/
	#mypageMainLst img{width:200px;height:150px;object-fit:cover;}
	
	/*버튼*/
	#mypageMainLstBtn{height:180px;overflow:auto;text-align:center;padding-top:5%;}
	
	#mypageMainPage{margin-top:100px;width:100%;}
	
</style>
<div class="container" id="myclassMainDiv">
	<%@ include file="../inc/userProfile.jspf"%>
	<div id="mypageMainContent">
		<p><input type="radio" name="searchKey" value="전체"/><label>전체</label>
			<input type="radio" name="searchKey" value="상품"/><label>상품</label>
			<input type="radio" name="searchKey" value="클래스"/><label>클래스</label>
			<button type="button" class="btn btn-outline-dark btn-sm">◀</button>
			<input type="date" value="2020-11-11"/>
			-
			<input type="date" value="2020-11-11"/>
			<button type="button" class="btn btn-outline-dark btn-sm">▶</button>
			<button type="button" class="btn btn-outline-dark btn-sm">이번달</button></p>
		<label>2020-11-06</label>
		<ul id="mypageMainLst">
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li>
				<label class="badge badge-info">공예/창작</label>
				<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
			</li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
		</ul>
		<div id="mypageMainLstBtn">
			<button type="button" class="btn btn-outline-primary">배송조회</button>
			<button type="button" class="btn btn-outline-dark">결제취소</button>
		</div>
		<label>2020-11-06</label>
		<ul id="mypageMainLst">
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li>
				<label class="badge badge-info">공예/창작</label>
				<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
			</li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
		</ul>
		<div id="mypageMainLstBtn">
			<button type="button" class="btn btn-outline-primary">배송조회</button>
			<button type="button" class="btn btn-outline-dark">결제취소</button>
		</div>
		<label>2020-11-06</label>
		<ul id="mypageMainLst">
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li>
				<label class="badge badge-info">공예/창작</label>
				<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
			</li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
		</ul>
		<div id="mypageMainLstBtn">
			<button type="button" class="btn btn-outline-primary">배송조회</button>
			<button type="button" class="btn btn-outline-dark">결제취소</button>
		</div>
		<label>2020-11-06</label>
		<ul id="mypageMainLst">
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li>
				<label class="badge badge-info">공예/창작</label>
				<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
			</li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
		</ul>
		<div id="mypageMainLstBtn">
			<button type="button" class="btn btn-outline-primary">배송조회</button>
			<button type="button" class="btn btn-outline-dark">결제취소</button>
		</div>
		<label>2020-11-06</label>
		<ul id="mypageMainLst">
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li>
				<label class="badge badge-info">공예/창작</label>
				<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
			</li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
		</ul>
		<div id="mypageMainLstBtn">
			<button type="button" class="btn btn-outline-primary">배송조회</button>
			<button type="button" class="btn btn-outline-dark">결제취소</button>
		</div>
		<ul class="pagination justify-content-center" id="mypageMainPage">
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