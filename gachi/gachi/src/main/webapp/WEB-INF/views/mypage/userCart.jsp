<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 장바구니 */
	
	.mypageContent div{
		text-align: center;
	}
	.mypageContent input{
		border:	none;
		outline: none;
		width: 100%;
	}
	.mypageContent button{
		background-color: #abcee3;
	}
	.mypageContent>div:last-child button{
		margin-top: 100px;
	}
	#userCartContent{
		text-align: center;
	}
	#userCartContent>div{
		margin: 5px;
	}
	#userCartContent>div>div:nth-child(3){
		text-align: left;
	}
	#userCartContent>button{
		float:left;
		margin:10px 5px;
	}
	
	/**********************/
	/* 하단 */
	
	#userCartBtm>div{
		text-align: center;
		margin: 20px 10px;
	}
	
</style>
<script>
	
	$(function(){
		//전체체크
		$("#cartSelectAll").click(function(){
			if($("#cartSelectAll").prop("checked")){
				$("input:checkbox").prop("checked",true);
			}else{
				$("input:checkbox").prop("checked",false);
			}
		});
		
		//선택상품삭제
		$("#selectDel").click(function(){
			
		});
	
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageContent col-lg-8 col-md-10">
			<label style="font-size:1.1em"><b>장바구니</b></label>
			<label style="color:gray">> 주문/결제 ></label>
			<label style="color:gray">주문완료</label>
			<hr class="userHr"/>
			<form method="post" id="cartFrm" action="/gachi/orderSheet">
				<div class="row">
					<div class="col-md-1"><input type="checkbox" id="cartSelectAll" checked/></div>
					<div class="col-md-2"></div>
					<div class="col-md-4">클래스/상품명</div>
				</div>
				<hr/>
				<c:set var="sum" value="0"/>
				<c:set var="cnt" value="0"/>
				<c:forEach var="cvo" items="${cList }">
					<div class="row">
						<div class="col-md-1"><input type="checkbox" name="orderVOList[${cnt }].code" value="${cvo.code }" checked/></div>
						<input type="hidden" name="orderVOList[${cnt }].class_img1" value="${cvo.class_img }"/>
						<div class="col-md-2" style="overflow:hidden"><img src="/gachi/img/${cvo.class_img }" style="width:100%;height:100%;object-fit: cover"/></div>
						<div class="col-md-4"><input type="text" name="orderVOList[${cnt }].class_name" value="${cvo.class_name }"/><br/>${cvo.username }</div>
						<div class="col-md-5"><input type="text" name="orderVOList[${cnt }].amount" value="${cvo.amount }" style="width:15%"/>개
											  <input type="text" name="orderVOList[${cnt }].stack" value="${cvo.stack }" style="width:15%"/>p
									          <input type="text" name="orderVOList[${cnt }].real_price" value="${cvo.real_price }" style="width:30%"/>원
											  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDelete?code=${cvo.code}'">X</button></div>
					</div>
					<hr/>
					<c:set var="sum" value="${sum+cvo.real_price*cvo.amount }"/>
					<c:set var="cnt" value="${cnt+1 }"/>
				</c:forEach>
				<c:forEach var="gvo" items="${gList }">
					<div class="row">
						<div class="col-md-1"><input type="checkbox" name="orderVOList[${cnt }].code" value="${gvo.code }" checked/></div>
						<input type="hidden" name="orderVOList[${cnt }].goods_img1" value="${gvo.goods_img1 }"/>
						<div class="col-md-2" style="overflow:hidden"><img src="/gachi/img/${gvo.goods_img1 }" style="width:100%;height:100%;object-fit: cover"/></div>
						<div class="col-md-4"><input type="text" name="orderVOList[${cnt }].goods_name" value="${gvo.goods_name }"/></div>
						<div class="col-md-5"><input type="text" name="orderVOList[${cnt }].amount" value="${gvo.amount }" style="width:15%"/>개
											  <input type="text" name="orderVOList[${cnt }].stack" value="${gvo.stack }" style="width:15%"/>p
											  <input type="text" name="orderVOList[${cnt }].real_price" value="${gvo.real_price }" style="width:30%"/>원
											  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDelete?code=${gvo.code}'">X</button></div>
					</div>
					<hr/>
					<c:set var="sum" value="${sum+gvo.real_price*gvo.amount }"/>
					<c:set var="cnt" value="${cnt+1 }"/>
				</c:forEach>
				<button type="button" id="selectDel" class="btn btn-info btn-sm">선택상품삭제</button>
				<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDeleteAll'">전체삭제</button>
				<label style="font-size:0.7em;margin:10px">*주문 시 상품 합계 금액이 50,000원 이상은 무료배송이며, 미만일 경우 2,500원의 배송비가 추가 됩니다.</label>
				<hr/>
				<div id="userCartBtm">
					<div><b>합계</b> ${sum }원</div>	
					<c:if test="${sum lt 50000}">
						<c:set var="ship" value="2500"/>
						<div><b>배송비</b> +${ship }원</div>
					</c:if>
					<c:if test="${sum ge 50000}">
						<c:set var="ship" value="0"/>
						<div><b>배송비 무료</b></div>
					</c:if>
					<hr class="userHr"/>
					<div style="font-size:1.2em;"><b>총 금액</b> ${sum+ship }원</div>
				</div>
				<div>
					<button type="submit" class="btn btn-outline-light">선택상품주문</button>
					<button type="submit" class="btn btn-outline-light">전체상품주문</button>
				</div>
			</form>
		</div>
	</div>
</div>