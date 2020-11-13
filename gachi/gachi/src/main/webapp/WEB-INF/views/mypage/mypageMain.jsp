<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/*내용*/
	#mypageMainContent{float:clear;margin-bottom:100px;}
	#mypageMainContent p{margin:20px;}
	#mypageMainContent label{width:5%;}
	#mypageMainLst>li{margin:0 50px;line-height:25px;}
	#mypageMainLst>li:first-child{text-align:center;font-size:1.5em;margin-top:50px;}
	#mypageMainLst>li:nth-child(2){margin-top:20px;float:left;}
	#mypageMainLst>li:nth-child(3){margin-top:30px;}
	#mypageMainLst>li:nth-child(7){margin:0 50px 0 0;}
	
	/*클래스썸네일*/
	#mypageMainLst img{width:200px;height:150px;object-fit:cover;}
	
	/*버튼*/
	#mypageMainBtn1, #mypageMainBtn2{position:relative;left:800px;}
	#mypageMainBtn1{top:-100px;}
	#mypageMainBtn2{top:-90px;}
	
</style>
<div class="container">
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
		<hr/>
		<ul id="mypageMainLst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="mypageMainBtn1"><button type="button" class="btn btn-outline-primary btn-sm">배송조회</button></li>
			<li id="mypageMainBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="mypageMainLst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="mypageMainBtn1"><button type="button" class="btn btn-outline-primary btn-sm">배송조회</button></li>
			<li id="mypageMainBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="mypageMainLst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="mypageMainBtn1"><button type="button" class="btn btn-outline-primary btn-sm">배송조회</button></li>
			<li id="mypageMainBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="mypageMainLst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="mypageMainBtn1"><button type="button" class="btn btn-outline-primary btn-sm">배송조회</button></li>
			<li id="mypageMainBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="mypageMainLst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="mypageMainBtn1"><button type="button" class="btn btn-outline-primary btn-sm">배송조회</button></li>
			<li id="mypageMainBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
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