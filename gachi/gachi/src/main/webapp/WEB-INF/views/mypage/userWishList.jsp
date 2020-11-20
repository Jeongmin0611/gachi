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
	
	/* 리스트 */
	.userWishItem{
		overflow:auto;
		margin-left:50px;
		width:20%;
		float:left;
		margin-bottom:100px;
	}
	.userWishItem img{
		width:100%;
		height:150px;
		object-fit:cover;
	}
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div id="userWishTop">
			<select>
				<option>전체</option>
				<option>클래스</option>
				<option>스토어</option>
			</select>
		</div>
		<ul class="userWishItem">
			<li><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg"/></a></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li>클래스명 <a href="/gachi/myclassView">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
		</ul>
		<ul class="userWishItem">
			<li><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg"/></a></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li>클래스명 <a href="/gachi/myclassView">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
		</ul>
		<ul class="userWishItem">
			<li><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg"/></a></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li>클래스명 <a href="/gachi/myclassView">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
		</ul>
		<ul class="userWishItem">
			<li><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg"/></a></li>
			<li><span class="badge badge-info">공예/창작</span></li>
			<li>클래스명 <a href="/gachi/myclassView">카모마일 프랑스 자수</a></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
		</ul>	
	</div>
</div>