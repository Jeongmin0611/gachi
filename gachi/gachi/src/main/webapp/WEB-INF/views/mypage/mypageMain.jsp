<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	a:link, a:visited{text-decoration:none;}
	a:hover{text-decoration:none;font-weight:bold;}
	.mainDiv{width:90%;margin:100px auto;}
	
	/*프로필 영역*/
	#profileDiv{
		height:200px;
		padding:50px 125px 0;
		border:1px solid #ddd;
		margin-top:50px;	
	}
	
	/*프사*/
	#profileBox {
	    width: 100px;
	    height: 100px; 
	    border-radius: 30%;
	    overflow: hidden;
	    float:left;
	}
	#profileIcon {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	#profileDiv label:nth-child(2){position:relative;left:50px;top:35px;font-size:1.5em;}
	#profileDiv label:nth-child(3){position:relative;left:300px;top:20px;}
	#profileDiv label:nth-child(4){position:relative;left:255px;top:50px;}
	#profileDiv label:nth-child(5){position:relative;left:500px;top:20px;}
	#profileDiv label:nth-child(6){position:relative;left:450px;top:50px;}

	/*마이페이지 메뉴*/
	#mypageNavi{height:50px;background-color:#ddd;overflow:auto;}
	#mypageNavi li{float:left;width:10%;line-height:50px;text-align:center;}
	#mypageNavi li:last-child{float:right;width:15%;background-color:pink;}
	
	/*내용*/
	#content{float:clear;margin-bottom:100px;}
	#content p{margin:20px 0 50px;}
	#lst>li{margin:0 50px;line-height:25px;}
	#lst>li:first-child{text-align:center;font-size:1.5em;margin-top:50px;}
	#lst>li:nth-child(2){margin-top:20px;float:left;}
	#lst>li:nth-child(3){margin-top:30px;}
	#lst>li:nth-child(4){}
	#lst>li:nth-child(5){}
	#lst>li:nth-child(7){margin:0 50px 0 0;}
	/*클래스썸네일*/
	#lst img{width:200px;height:150px;object-fit:cover;}
	
	/*버튼*/
	#testBtn1, #testBtn2{position:relative;left:800px;}
	#testBtn1{top:-100px;}
	#testBtn2{top:-90px;}
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf"%>
	<div id="content">
		<p><input type="radio" name="searchKey" value="전체"/>전체
			<input type="radio" name="searchKey" value="상품"/>상품
			<input type="radio" name="searchKey" value="클래스"/>클래스

			<button type="button" class="btn btn-outline-dark btn-sm">◀</button>
			<input type="date" value="2020-11-11"/>
			-
			<input type="date" value="2020-11-11"/>
			<button type="button" class="btn btn-outline-dark btn-sm">▶</button>
			<button type="button" class="btn btn-outline-dark btn-sm">이번달</button></p>
		<hr/>
		<ul id="lst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="testBtn1"><button type="button" class="btn btn-outline-dark btn-sm">배송조회</button></li>
			<li id="testBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="lst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="testBtn1"><button type="button" class="btn btn-outline-dark btn-sm">배송조회</button></li>
			<li id="testBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="lst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="testBtn1"><button type="button" class="btn btn-outline-dark btn-sm">배송조회</button></li>
			<li id="testBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="lst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="testBtn1"><button type="button" class="btn btn-outline-dark btn-sm">배송조회</button></li>
			<li id="testBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
		</ul>
		<hr/>
		<ul id="lst">
			<li>2020-11-06</li>
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li><span class="badge badge-light"><a href="#">주문번호 10101010</a></span></li>
			<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
			<li>강사명 <a href="#">홍길동</a></li>
			<li>결제가격 15000원</li>
			<li>결제일시 20.11.06 19:30:34</li>
			<li id="testBtn1"><button type="button" class="btn btn-outline-dark btn-sm">배송조회</button></li>
			<li id="testBtn2"><button type="button" class="btn btn-outline-dark btn-sm">결제취소</button></li>
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