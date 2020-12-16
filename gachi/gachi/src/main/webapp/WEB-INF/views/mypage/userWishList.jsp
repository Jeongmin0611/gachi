<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 좋아요 목록 */
	
</style>
<script>
	$(function(){
		$('i').on('click',function(){
			var code = $(this).attr('id');

			$.ajax({
				url: "/gachi/delWishList",
				data: "code="+code,
				type: "GET",
				success: function(result){
					if(result>0){
						swal({
							title: "완료",
							text: "좋아요 목록에서 삭제되었습니다.",
							icon: "success",
							closeOnClickOutside: false,
							buttons: {
								confirm : {
									text: "확인",
									value: true,
									className: "btn btn-light"
								}
							}
						}).then((result)=>{
							location.href=location.href;
						});
					}
				}, error: function(){
					console.log("좋아요 삭제 에러");
				}
			});		
		});
		//더보기 페이징 -> userProfile.jspf
		moreContent6();
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">장바구니 ></label>
			<label style="font-size:1.1em"><b>좋아요</b></label>
			<hr class="userHr"/>
			<c:if test="${cntGood ne 0 }">
				<div class="row">
					<c:forEach var="cvo" items="${cList }">
						<div class="col-md-4">
							<div class="card focusEffectSm moreContent" style="margin:20px 0;border-radius:1em">
								<a href="/gachi/myclassView"><img src="/gachi/upload/classImg/${cvo.class_img }" alt="" class="card-img-top" style="width:100%;height:180px;object-fit: cover;border-top-left-radius:1em;border-top-right-radius:1em"/></a>
								<div class="card-body" style="height:120px">
									<div><span class="badge badge-info">${cvo.category }</span></div>
									<i class="fas fa-heart fa-lg p-2 focusEffect" id="${cvo.code }" style="float:right"></i>
									<b style="font-size:0.9em"><a href="/gachi/myclassView">${cvo.class_name }</a></b>
									<div style="font-size:0.9em">by ${cvo.nickname }</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<c:forEach var="gvo" items="${gList }">
						<div class="col-md-4">
							<div class="card focusEffectSm moreContent" style="margin:20px 0;border-radius:1em">
								<a href="/gachi/myclassView"><img src="/gachi/upload/storeImg/${gvo.goods_img1 }" alt="" class="card-img-top" style="width:100%;height:180px;object-fit: cover;border-top-left-radius:1em;border-top-right-radius:1em"/></a>
								<div class="card-body" style="height:120px">
									<div><span class="badge badge-info">${gvo.category }</span></div>
									<i class="fas fa-heart fa-lg p-2 focusEffect" id="${gvo.code }" style="float:right"></i>
									<b style="font-size:0.9em"><a href="/gachi/myclassView">${gvo.goods_name }</a></b>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div style="text-align:center;margin-top:50px">
					<button type="button" class="btn focusEffectSm" id="moreContentLoad" style="width:150px;color:#fff">더보기</button>
				</div>
			</c:if>
			<c:if test="${cntGood eq 0 }">
				<div style="text-align: center">
					<div><img src="/gachi/img/icon_heart.png" style="width:20%"/></div>
					<div style="margin-bottom:50px"><h4>좋아요 목록이 없습니다.</h4></div>
					<div><button type="button" class="btn focusEffectSm" onclick="location.href='/gachi'" style="width:150px;color:#fff">쇼핑하러가기</button></div>
				</div>
			</c:if>
		</div>
	</div>
</div>