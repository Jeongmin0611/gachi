<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		width: 150px;
	    height: 100px;
	    object-fit: cover;
	}

	/* 페이징 */
	.mypageMainBtm{
		margin:100px 0 50px;
		width:100%;
	}
	
	/* 모달 */
	#mypageModal{
		display:none;
		position:absolute;
		width:100%;
		height:100%;
		z-index:1;
	}
	.mypageModal_content{
		width:500px;
		height:500px;
		margin:100px auto;
		padding:20px 10px;
		background-color:#fff;
		border:2px solid #eee;
	}
	.mypageModal_content>div:first-child{
		margin:0 auto;
		width:100px;
		height:100px;
		background-color:#ffdac3;
		border-radius: 50%;
		text-align:center;
	}
	.mypageModal_content>div:nth-child(2){
		margin-top:20px;
		height:100px;
		text-align:center;
		border:2px solid #eee;
		font-size:1.3em;
		line-height:100px;
	}
	.mypageModal_content>div:nth-child(2) label{
		color:#ABCEE3;
	}
	.mypageModal_content>label{
		font-size:1em;
	}
	.mypageModal_content>label:nth-child(3){
		margin-top:30px;
	}
	/* 송장정보 */
	.mypageModal_content ul{
		margin:0 auto;
		overflow:auto;
		border-top:1px solid gray;
		margin-bottom:50px;
	}
	.mypageModal_content li{
		width:70%;
		float:left;
		border-bottom:1px solid gray;
		text-align:center;
		padding:0 20px;
	}
	.mypageModal_content li:nth-child(2n+1){
		text-align:left;
		background-color:#eee;
		width:30%;
	}
	.mypageModal_layer{
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background-color:rgba(0,0,0,0.5);
		z-index:-1;
	}
	#mypageModalClose{
		margin:0 auto;
		background-color:#abcee3;
	}
	#mypageModalBtm{
		text-align:center;
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
			 
		$("input[name=startDate]").val(yyyy+"-"+mm+"-"+dd);
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
									location.href=location.href;
								});
							}
			  			}, error: function(){
			  				console.log("구매확정 에러");
			  			}
			  		});	
				}
			});
		});
		//모달창 띄우기
	    $(".mypageDelivery").click(function(){
    		$("#mypageModal").css({
               "top": (($(window).height()-$("#mypageModal").outerHeight())/2+$(window).scrollTop())+"px",
               "left": (($(window).width()-$("#mypageModal").outerWidth())/2+$(window).scrollLeft())+"px"
               //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
            
            });
	        $("#mypageModal").fadeIn();
	    });
	    $("#mypageModalClose, .mypageModal_layer").click(function(){
	       $("#mypageModal").fadeOut();
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
					<button type="submit" class="btn btn-outline-light btn-sm" id="orderListDate">조회</button>
					<button type="button" class="btn btn-outline-light btn-sm" onclick="location.href='/gachi/mypage'">전체</button>
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
						<button type="submit" class="btn btn-outline-light btn-sm" id="orderListDate">조회</button>
						<button type="button" class="btn btn-outline-light btn-sm" id="orderListAll">전체</button>
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
							<div class="col-md-3"><img src="/gachi/img/${vo.class_img }"/></div>
							<div class="col-md-6">
								<ul class="mypageMainLst">
									<li>
										<label class="badge badge-info">${vo.category }</label>
										<label class="badge badge-light"><a href="#">주문번호 ${vo.order_code }-${vo.class_order_code }</a></label>
									</li>
									<li><a href="#">${vo.class_name }</a></li>
									<li>크리에이터명 <a href="#">${vo.nickname }</a></li>
									<li>가격 ${vo.real_price }원</li>
									<li>결제일시 ${vo.orderdate }</li>
								</ul>
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
							<div class="col-md-6" style="text-align:left">
								<ul class="mypageMainLst">
									<li>
										<label class="badge badge-info">${vo.category }</label>
										<label class="badge badge-light"><a href="#">주문번호 ${vo.order_code }-${vo.goods_order_code }</a></label>
									</li>
									<li><a href="#">${vo.goods_name }</a></li>
									<li>수량 ${vo.amount }개</li>
									<li>가격 ${vo.real_price }원</li>
									<li>결제일시 ${vo.orderdate }</li>
								</ul>
							</div>
							<!-- xs 크기에서만 숨기기  -->
							<div class="col-md-3 col d-none d-sm-block">
								<c:if test="${vo.finished eq '미확정' }">
									<div><button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button></div>
									<div><button type="button" class="btn btn-outline-light userOrderFix">구매확정</button>								 
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
									 	 <button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button>
										 <button type="button" class="btn btn-outline-light userOrderFix">구매확정</button>
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
		<div>
			<button type="button" class="btn btn-outline-lignt" id="moreContentLoad">더보기</button>
		</div>
		</div>
	</div>
</div>
<div id="mypageModal" class="cfont">
	<div class="mypageModal_content">
		<div>
			<img src="/gachi/img/icon_deliveryFinish.png" style="width:80%"/>
		</div>
		<div>상품이 <label>배송완료</label> 상태입니다.</div>
		<label>송장정보</label>
		<ul>
			<li>송장번호</li>
			<li>10101010</li>
			<li>택배사</li>
			<li>한진택배</li>
			<li>대표번호</li> 
			<li>1588-0011</li>
		</ul>
		<div id="mypageModalBtm">
			<button type="button" class="btn btn-outline-light" id="mypageModalClose">확인</button>
		</div>
	</div>
	<div class="mypageModal_layer"></div>
</div>
<div id="mypageModal" class="cfont">
	<div class="mypageModal_content">
		<div>
			<img src="/gachi/img/icon_delivery.png" style="width:85%"/>
		</div>
		<div>상품이 <label>배송진행중</label> 상태입니다.</div>
		<label>송장정보</label>
		<ul>
			<li>송장번호</li>
			<li>10101010</li>
			<li>택배사</li>
			<li>한진택배</li>
			<li>대표번호</li> 
			<li>1588-0011</li>
		</ul>
		<div id="mypageModalBtm">
			<button type="button" class="btn btn-outline-light" id="mypageModalClose">확인</button>
		</div>
	</div>
</div>
<div id="mypageModal" class="cfont">
	<div class="mypageModal_content">
		<div>
			<img src="/gachi/img/icon_deliveryReady.png" style="width:95%"/>
		</div>
		<div>상품이 <label>배송준비중</label> 상태입니다.</div>
		<label>송장정보</label>
		<ul>
			<li>송장번호</li>
			<li>10101010</li>
			<li>택배사</li>
			<li>한진택배</li>
			<li>대표번호</li> 
			<li>1588-0011</li>
		</ul>
		<div id="mypageModalBtm">
			<button type="button" class="btn btn-outline-light" id="mypageModalClose">확인</button>
		</div>
	</div>
</div>