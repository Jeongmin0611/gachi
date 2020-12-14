<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>	
	
	/* 마이페이지(메인) - 컨테이너 */
	
	a:hover{
		font-weight:bold;
	}
	.mypageTop{
		text-align: center;
		margin: 10px auto 40px;	 
	}
	.mypageTop>div:first-child{
		text-align:left;
	}
	.mypageTop button,
	.mypageContent button{
		background-color: ;
		margin:5px 0;
	}	
	.mypageContent div{
		text-align: center;
	}
	.mypageContent>div>div{
		margin:auto 0;
	}	
	.mypageContent>div>div:nth-child(2){
		text-align:left;
	}
	/*클래스썸네일*/
	.mypageContent img{
		width: 100%;
	    height: 150px;
	    object-fit: cover;
	}

	/* 페이징 */
	.mypageMainBtm{
		margin:100px 0 50px;
		width:100%;
	}
	
</style>
<script>

	$(function(){
		$("input[name=option][value=all]").prop("checked","true");

		//오늘 날짜 세팅
		var date = new Date();
		var yyyy = date.getFullYear();
		var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
		var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
			 
		$("input[name=startDate]").val(yyyy+"-"+mm+"-"+"01");
		$("input[name=endDate]").val(yyyy+"-"+mm+"-"+dd);		
		
		//구매확정
		$(".userOrderFix").click(function(){
			swal({
				title: "구매확정",
				text: "선택하신 상품을 구매확정 하시겠습니까?",
				icon: "warning",
				closeOnClickOutside: false,
				buttons: {
					cancle : {
						text: "취소",
						value: false,
						className: "btn btn-outline-light"
					},
					confirm : {
						text: "확인",
						value: true,
						className: "btn btn-outline-light"
					}
				}
			}).then((result)=>{
				var goods_order_code = $(this).next().val();
				if(result){
					$.ajax({
			  			url: "/gachi/userOrderFix",
			  			data: "goods_order_code="+goods_order_code,
			  			type: "GET",
			  			success: function(result){ 
							if(result>0){
								swal({
									title: "완료",
									text: "구매확정이 완료되었습니다! \n해당 상품에 대한 마일리지가 지급되었습니다.",
									icon: "success",
									closeOnClickOutside: false,
									buttons: {
										confirm : {
											text: "확인",
											value: true,
											className: "btn btn-outline-light"
										}
									}
								}).then((result)=>{
									location.href = location.href;
								});
							}
			  			}, error: function(){
			  				console.log("구매확정 에러");
			  			}
			  		});	
				}
			});
		});  
	    
	    //더보기 페이징 -> userProfile.jspf
	    moreContent();
	});
	
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<!-- 상단 -->
		<div class="mypageTop col-md-10">
			<div>
				<label style="color:gray">주문/결제 ></label>
				<label style="font-size:1.1em"><b>결제내역확인</b></label>
			</div>
			<hr class="userHr"/>
			<input type="hidden" id="mypageOption" value="${option }"/>
			<input type="hidden" id="mypageStartDate" value="${startDate }"/>
			<input type="hidden" id="mypageEndDate" value="${endDate }"/>
			<form action="/gachi/mypage" method="post">
				<!-- xs, sm 크기에서만 숨기기  -->
				<div class="d-none d-sm-none d-md-block">
					
					<input type="radio" name="option" value="all"/><label>전체</label>
					<input type="radio" name="option" value="class"/><label>클래스</label>	
					<input type="radio" name="option" value="goods"/><label>상품</label>
						
					<input type="date" name="startDate"/>-
					<input type="date" name="endDate"/>
					<button type="submit" class="btn btn-light btn-sm" id="orderListDate">조회</button>
					<button type="button" class="btn btn-light btn-sm" onclick="location.href='/gachi/mypage'">전체기간</button>
				</div>
			</form>
			<form action="/gachi/mypage" method="post">
				<!-- xs, sm 크기에서만 보이기  -->
				<div class="d-block d-sm-bolck d-md-none">
					<div>
						<input type="radio" name="option" value="all"/><label>전체</label>
						<input type="radio" name="option" value="class"/><label>클래스</label>	
						<input type="radio" name="option" value="goods"/><label>상품</label>
					</div>
					<div>	
						<input type="date" name="startDate"/>-
						<input type="date" name="endDate"/>
						<button type="submit" class="btn btn-light btn-sm" id="orderListDate">조회</button>
						<button type="button" class="btn btn-light btn-sm" id="orderListAll">전체</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 내용 -->
		<div class="mypageContent col-md-10">
			<c:forEach var="list" items="${map }">
				<c:set var="key" value="${list.key }"/>
				<c:if test="${fn:contains(key,'c')}">
					<c:forEach var="vo" items="${list.value }">
						<div class="row moreContent">	
							<div class="col-md-3"><img src="upload/classImg/${vo.class_img }"/></div>
							<div class="col-md-6" style="padding:0 40px">
									<div style="text-align:left">
										<label class="badge badge-info">${vo.category }</label>
										<label class="badge badge-light">주문번호 ${vo.order_code }-${vo.class_order_code }</label>
									</div>
									<div style="text-align:left"><b>${vo.class_name }</b></div>
									<div style="font-size:0.9em;text-align:left">${vo.nickname }</div>
									<div style="font-size:0.9em;text-align:left">가격 <fmt:formatNumber value="${vo.real_price }" pattern="#,###" />원</div>
									<div style="font-size:0.9em;text-align:left">결제일시 ${vo.orderdate }</div>
							</div>
							<div class="col-md-3">
								<div><label class="badge badge-pill badge-primary" style="font-size:0.9em">구매확정완료</label></div>
							</div>
						</div>
						<hr class="moreContent"/>
					</c:forEach>
				</c:if>
				<c:if test="${fn:contains(key,'g')}">
					<c:forEach var="vo" items="${list.value }">
						<div class="row moreContent">	
							<div class="col-md-3"><img src="/gachi/img/store/${vo.goods_img1 }"/></div>
							<div class="col-md-6" style="padding:0 40px">
										<div style="text-align:left">
											<label class="badge badge-info">${vo.category }</label>
											<label class="badge badge-light">주문번호 ${vo.order_code }-${vo.goods_order_code }</label>
										</div>
										<div style="text-align:left"><b>${vo.goods_name }</b></div>
										<div style="font-size:0.9em;text-align:left">수량 ${vo.amount }개</div>
										<div style="font-size:0.9em;text-align:left">가격 <fmt:formatNumber value="${vo.real_price }" pattern="#,###" />원</div>
										<div style="font-size:0.9em;text-align:left">결제일시 ${vo.orderdate }</div>
							</div>
							<!-- xs 크기에서만 숨기기  -->
							<div class="col-md-3 col d-none d-sm-block">
								<c:if test="${vo.finished eq '미확정' }">
									<div><button type="button" class="btn btn-light mypageDelivery" data-toggle="modal" data-target="#myclassReviewModal">배송조회</button></div>
									<div><button type="button" class="btn btn-light userOrderFix">구매확정</button>								 
									     <input type="hidden" id="goods_order_code" value="${vo.goods_order_code }"/></div>
								</c:if>	
								<c:if test="${vo.finished eq '확정' }">
									<div><label class="badge badge-pill badge-primary" style="font-size:0.9em">구매확정완료</label></div>
								</c:if>						
							</div>
							<!-- xs 크기에서만 보이기  -->
							<div class="col-md-3 d-block d-sm-none">
								<div>
									 <c:if test="${vo.finished eq '미확정' }">
									 	 <button type="button" class="btn btn-light mypageDelivery">배송조회</button>
										 <button type="button" class="btn btn-light userOrderFix">구매확정</button>
										 <input type="hidden" id="goods_order_code" value="${vo.goods_order_code }"/>
									 </c:if>
									 <c:if test="${vo.finished eq '확정' }">
										<div><label class="badge badge-pill badge-primary" style="font-size:0.9em">구매확정완료</label></div>
									</c:if>		 
								</div>
							</div>
						</div>
						<hr class="moreContent"/>
					</c:forEach>
				</c:if>
			</c:forEach>
		<div style="text-align:center;margin-top:50px">
			<button type="button" class="btn focusEffectSm" id="moreContentLoad" style="width:150px">더보기</button>
		</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myclassReviewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title" id="myModalLabel">배송조회</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body" style="text-align:center">
      	<div style="width:150px;height:150px;margin:0 auto;margin-bottom:50px;padding-top:1%;border-radius:50%;background:#e3eef6">
			<img src="/gachi/img/icon_deliveryReady.png" style="width:90%"/>
		</div>
		<h4>주문하신 상품이 <b>배송준비중</b> 상태입니다.</h4>
		<hr class="userHr"/>
        <div class="row">
        	<div class="col-md-4">운송장 번호</div>
        	<div class="col-md-8">10101010</div>
        </div>
        <hr/>
        <div class="row">
        	<div class="col-md-4">택배사</div>
        	<div class="col-md-8">한진택배</div>
        </div>
        <hr/>
        <div class="row">
        	<div class="col-md-4">대표번호</div>
        	<div class="col-md-8">1588-0011</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>