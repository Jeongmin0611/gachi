<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 좋아요 목록 */
	
	/* 상단 */
	#userWishTop{
		margin:20px 50px 50px;
	}
	#userWishTop>label{
		margin:0 10px;
	}

</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageContent col-lg-8 col-md-10">
			<label style="color:gray">장바구니 ></label>
			<label style="font-size:1.1em"><b>좋아요</b></label>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">
					<div><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg" style="width:100%;height:100%;object-fit: cover"/></a></div>
					<div><span class="badge badge-info">공예/창작</span></div>
					<div><a href="/gachi/myclassView">카모마일 프랑스 자수</a></div>
					<div><a href="#">홍길동</a></div>
				</div>
				<div class="col-md-4">
					<div><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg" style="width:100%;height:100%;object-fit: cover"/></a></div>
					<div><span class="badge badge-info">공예/창작</span></div>
					<div><a href="/gachi/myclassView">카모마일 프랑스 자수</a></div>
					<div><a href="#">홍길동</a></div>
				</div>
				<div class="col-md-4">
					<div><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg" style="width:100%;height:100%;object-fit: cover"/></a></div>
					<div><span class="badge badge-info">공예/창작</span></div>
					<div><a href="/gachi/myclassView">카모마일 프랑스 자수</a></div>
					<div><a href="#">홍길동</a></div>
				</div>
				<div class="col-md-4">
					<div><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg" style="width:100%;height:100%;object-fit: cover"/></a></div>
					<div><span class="badge badge-info">공예/창작</span></div>
					<div><a href="/gachi/myclassView">카모마일 프랑스 자수</a></div>
					<div><a href="#">홍길동</a></div>
				</div>	
			</div>
		</div>
	</div>
</div>