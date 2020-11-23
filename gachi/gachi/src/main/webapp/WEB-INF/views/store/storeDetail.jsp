<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.carousel-item img {
	width: 100%;
}
</style>
<script>
	function purchase(){
		location.href="/gachi/purchase";
	};
</script>
<div class="container cfont">
	<div class="row">
		<!-- bxslide -->
		<div id="carouselExampleIndicators" class="carousel slide col-sm-6" data-interval="3000"
			data-ride="carousel" >
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/gachi/img/artEx/artEx14.PNG" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="/gachi/img/artEx/artEx15.PNG" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="/gachi/img/artEx/artEx16.PNG" class="d-block w-100">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- bxslide 옆에 글 -->
		<div class="col-sm-6 pt-2">
			<span style="background-color: lightblue">공예/창작</span><br/>
			<h3>드로잉 set 상품 </h3><br/>
			재고 &nbsp; 100개<br/>
			가격 &nbsp; 150,000원<br/>
			적립금 &nbsp; 150원 <i class="far fa-heart fa-lg" style="float:right; height: 15px; color: red;"></i><br/>
			<p><p/>
			<button style="height:40px; width:50%; border:1px solid lightblue; background-color:white; float: left;">장바구니 담기</button>
			<button style="height:40px; width:50%; border:1px solid lightblue; background-color: lightblue;" onclick="purchase()">구매</button>
		</div>

		<!-- 설명글 -->
		<h4 style="margin-top:10px; padding-left:10px;">상품소개글</h4>
		<div class="col-sm-12" style="min-height: 300px; background-color: #eee">
			상품 설명글 
		</div>
		
		<!-- 상품 문의 -->
		<h4 style="margin-top:10px; padding-left:10px;">상품 문의</h4><br/>
		<button style="border: 1px solid lightblue; background-color: lightblue; text-align:right" >문의 작성</button>
		<div class="col-sm-12" style="min-height: 300px; border:1px solid lightblue">
			<ul class="row">
				<li class="col-sm-1" style="border-bottom: 1px solid gray">번호</li>
				<li class="col-sm-4" style="border-bottom:1px solid gray">제목</li>
				<li class="col-sm-2" style="border-bottom:1px solid gray">작성자</li>
				<li class="col-sm-2" style="border-bottom:1px solid gray">작성일</li>
				<li class="col-sm-1" style="border-bottom:1px solid gray">조회수</li>
				<li class="col-sm-2" style="border-bottom:1px solid gray">상태</li>
			</ul>
		</div>
		<!-- 상품 리뷰 -->
		<h4 style="margin-top:10px; padding-left:10px;">상품 리뷰</h4>
		<button style="border: 1px solid lightblue; background-color: lightblue;" >리뷰 작성</button>
		<div class="col-sm-12" style="min-height: 300px; border:1px solid lightblue; margin-bottom:50px;" >
			<ul class="row">
				<li class="col-sm-1" style="border-bottom:1px solid gray">번호</li>
				<li class="col-sm-4" style="border-bottom:1px solid gray">제목</li>
				<li class="col-sm-2" style="border-bottom:1px solid gray">작성자</li>
				<li class="col-sm-2" style="border-bottom:1px solid gray">작성일</li>
				<li class="col-sm-1" style="border-bottom:1px solid gray">조회수</li>
				<li class="col-sm-2" style="border-bottom:1px solid gray">상태</li>
			</ul>
		</div>
	</div>
</div>