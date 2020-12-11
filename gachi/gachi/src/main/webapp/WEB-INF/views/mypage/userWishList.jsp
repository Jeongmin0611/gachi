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
		<div class="mypageContent col-md-10">
			<label style="color:gray">장바구니 ></label>
			<label style="font-size:1.1em"><b>좋아요</b></label>
			<hr class="userHr"/>
			<div class="row">
				<c:forEach var="cvo" items="${cList }">
					<div class="col-md-4">
						<div><a href="/gachi/myclassView"><img src="/gachi/img/artEx/${cvo.class_img }" style="width:100%;height:180px;object-fit: cover"/></a></div>
						<div><span class="badge badge-info">${cvo.category }</span></div>
						<div><a href="/gachi/myclassView">${cvo.class_name }</a></div>
						<div><a href="#">${cvo.nickname }</a></div>
					</div>
				</c:forEach>
				<c:forEach var="gvo" items="${gList }">
				<div class="col-md-4">
					<div><a href="/gachi/myclassView"><img src="/gachi/img/store/${gvo.goods_img1 }" style="width:100%;height:180px;object-fit: cover"/></a></div>
					<div><span class="badge badge-info">${gvo.category }</span></div>
					<div><a href="/gachi/myclassView">${gvo.goods_name }</a></div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>