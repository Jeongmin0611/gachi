<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

/* 결제 정보 */
#paymentInfo>.table *{ /*테이블 선 없애기*/
	border:none;
}
/* 결제 정보 끝 */
#deliveryInfo>.table *{
	border:none;
}
</style>
<div class="container cfont">
	<h3 style="text-align: center;margin-bottom:10px;">주문 신청서</h3><br/>
	
	<!-- 주문목록 -->
	<div id="purchaseList">
	 <h5>주문목록</h5><br/>
		<table class="table">
			<thead>
				<tr class="table-active">
					<td>번호</td>
					<td>클래스/상품정보</td>
					<td>상품금액</td>
					<td>수량</td>
					<td>발생 적립금</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>10</td>
					<td><div class="col-lg-5" style="width:100%; float: left;"><img src="/gachi/img/artEx/artEx01.PNG" style="height: 100px;"/></div>
						<div style="text-align: left;">
							<span style="background-color: lightblue; color:white">공예/창작</span><br/>
							드로잉 DIY 키트
						</div>
					</td>
					<td>15,000원</td>
					<td>1개</td>
					<td>150원</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 결제정보 -->
	<form style="margin-bottom: 50px;">
		<div id="paymentInfo">
		 <h5>결제정보</h5><hr/>
			 <table class="table">
			 	<tbody>
			 	<tr>
			 		<td>결제수단</td>
			 		<td><input type="radio" name="payment" value="kakaopay"/>카카오 페이</td>
			 	</tr>
			 	<tr>
				 	<td>상품금액</td>
				 	<td>150000원 &nbsp; <span style="color:gray">(적립금액 150원)</span></td>
			 	</tr>
			 	<tr>
				 	<td>배송비</td>
				 	<td>0원</td>
			 	</tr>
			 	<tr>
				 	<td>적립금 사용</td>
				 	<td><input type="text" style="border:1px solid lightblue"/><button>적용</button></td>
			 	</tr>
			 	<tr>
				 	<td>적립금사용</td>
				 	<td>0원</td>
			 	</tr>
			 	</tbody>
			 	<tfoot>
			 		<tr>
			 			<td>결제금액 </td>
			 			<td>15,000원 </td>
			 		</tr>
			 	</tfoot>
			 </table>
		</div>
		<!-- 배송지 정보 -->
		<div id="deliveryInfo">
			<h5>배송지 정보</h5><hr/>
			<table class="table">
				<tbody>
				<tr>
					<td>
						<input type="radio" name="deliveryAddressList" value="newaddr">새로운 배송지</td><td>
						<input type="radio" name="deliveryAddressList" value="newaddr">기본 배송지
					</td>
				</tr>
				<tr>
					<td>수령인</td>
					<td>닉네임</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>010-1234-1422</td>
				</tr>
				<tr>
					<td rowspan="3">배송지</td>
					<td><input type="text" style="width:50px;border: 1px solid lightblue;"><button>우편번호</button></td>
				</tr>
				<tr>
					<td><input type="text" style="border: 1px solid lightblue;"></td>
				</tr>
				<tr>
					<td><input type="text" style="border: 1px solid lightblue;" placeholder="상세주소"></td>
				</tr>
				<tr>
					<td>배송요청사항</td>
					<td><textarea style="width:100%;min-height:50px;resize: none; border: 1px solid lightblue;"></textarea></td>
				</tr>
				</tbody>
				<tfoot>
				<tr>
					<td colspan="2" style="text-align:center">
						<button type="submit" style="background: lightblue; border: 1px solid lightblue; color:white">주문하기</button>
					</td>
				</tr>
			</table>		
		</div>
		
	</form>
</div>