<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

/* ============== 내용 표시 ============== */
#CserviceContentDiv{
}
#CserviceContentDiv ul li{ /* 글자 속성 */
	line-height: 40px;
}
#CserviceContentDiv {	/* 카테고리 */
	width:100%;
	background-color: #eee;
	padding: 40px 20%;
	margin-bottom: 50px;
}
/* ============== 내용 표시 끝 ============== */

</style>

<div class="container">
	<!-- 자주묻는 질문, 배송정책 메뉴 -->
	<%@ include file="../inc/serviceboardMenu.jspf" %>
	
	<!-- 내용표시 -->
	<div id ="CserviceContentDiv">
		<h3>배송정책</h3><br/>
		본 상품은 하비풀이 아닌 미디공에서 개별 발송하는 상품으로, 배송 책임은 미디공에 있습니다.<br/><br/>
		<strong>배송 정책</strong><br/><br/>
		
		1) 배송가능지역: 전국<br/><br/>
		
		2) 택배사: 롯데택배<br/><br/>
		
		3) 기본 배송비: 무료(도서산간지역의 경우 추가 배송비가 부과됩니다.)<br/><br/>
		
		4) 배송기간<br/><br/>
		
		가. 결제 후 2일 내에 출고됩니다.<br/><br/>
		
		나. 오후 12시 주문 건까지 당일 출고됩니다.(주말 및 공휴일 제외)
		    (단, 물량이 많은 경우에는 고객님께 전화 드려 배송날짜를 협의할수 있습니다.)<br/><br/>
		
		<strong>교환 정책</strong><br/><br/>
		교환 배송 관련 안내<br/><br/>
		
		1) 준비물 키트에 한해서만 교환 가능합니다.<br/><br/>
		
		2) 배송 완료일로부터 7일 이내 교환 신청 가능합니다.(반드시 고객센터 안내 후 가능합니다.)<br/><br/>
		
		3) 단순 변심 등 고객 사유로 인한 교환의 경우 왕복배송비를 지불해야하며, 제품 및 포장이 재판매 가능한 상태여야 합니다. (상품 및 구성품, 포장 훼손, 분실 시 교환 불가)<br/>
	</div>
	

</div>