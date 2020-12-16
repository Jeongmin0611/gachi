<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#CserviceSearchDiv {
	float: right;
	margin: 50px 0 10px;
}

#CserviceSearchTxt {
	border: 0;
	border-bottom: 1px solid black;
	outline: none;
}

#CserviceSearchDiv button {
	background-color: white;
	color: black;
	border: 0;
}

#CserviceSearchDiv button:focus {
	outline: none;
	color: #888;
}

/* ============== 내용 표시 ============== */
#CserviceContentDiv {
	
}

#CserviceContentDiv ul li { /* 글자 속성 */
	line-height: 40px;
}

#CserviceContentDiv ul li:nth-child(4n+1) { /* 카테고리 */
	width: 15%;
	height: 40px;
	background-color: #F1F7FA;
	margin-right: 5%;
	text-align: center;
	float: left;
}

#CserviceContentDiv ul li:nth-child(4n+2) { /* 제목 */
	width: 100%;
	height: 40px;
}

#CserviceContentDiv ul li:nth-child(4n+3) { /* A */
	width: 20%;
	min-height: 150px;
	color: #FB5000;
	font-size: 100px;
	line-height: 150px;
	text-align: center;
	background-color: #eee;
	paddin: 0px;
	margin: 20px 0;
	float: left;
}

#CserviceContentDiv ul li:nth-child(4n+4) { /* 답변 */
	width: 100%;
	min-height: 150px;
	background-color: #eee;
	margin: 20px 0;
}
/* ============== 내용 표시 끝 ============== */
#CservicePaging {
	margin: 40px 0;
}
</style>

<div class="container">
	<div id="CserviceSearchDiv">
		<select name="CserviceSelect">
			<option value="CSall">전체</option>
			<option value="CSSubject">질문</option>
			<option value="CSContent">답변</option>
		</select> <input type="text" name="CserviceSearchTxt" id="CserviceSearchTxt" />
		<button name="CserviceSearchBtn">검색하기</button>
	</div>
	<!-- 자주묻는 질문, 배송정책 메뉴 -->
	<%@ include file="../inc/serviceboardMenu.jspf"%>
	<!-- 내용표시 -->
	<div id="CserviceContentDiv">
		<ul>
			<li>FAQ</li>
			<li>지금 주문하면 언제 배송오나요?</li>
			<li>A</li>
			<li>오후 2시 이전 주문 시에는 영업일 기준 당일출고, 2시 이후 주문 시에는 영업일 기준 익일에 출고됩니다.
				공휴일과 주말인 경우 다음 영업일에 배송 출발하며, 상품 수령까지는 영업일 기준 1-3일정도 소요됩니다.</li>

			<li>FAQ</li>
			<li>수강 신청한 클래스 시청 방법</li>
			<li>A</li>
			<li>[하비풀 클래스 상품] 하비풀 홈페이지에서 구매한 경우 : 사이트 내 로그인 > 우측 상단 [내 클래스] >
				시청 제휴몰(텐바이텐, 오늘의 집, 네이버, 핫트랙스)에서 구매한 경우 : 사이트 내 회원가입(로그인) > 우측 상단 [내
				클래스] > 하단에 쿠폰 번호 입력 > 등록 > 시청 [DIY 스토어 상품] 스토어 상품은 입점업체마다 영상 포함여부가
				상이합니다. 또한 영상이 포함되어있을 경우 <내클래스>가 아닌 외부 링크를 통해 시청 가능합니다. 해당 상품
				상세페이지 또는 수령하신 키트 내 종이안내서를 통해 시청방법 확인 부탁드립니다.
			</li>
			<li>FAQ</li>
			<li>구성품이 다른 것 같아요. 불량 상품을 받은 것 같아요.</li>
			<li>A</li>
			<li>받으신 키트의 구성품이 클래스 내용과 다를 경우, 받으신 제품 사진을 촬영하여 1:1문의 또는 채팅상담에
				내용과 함께 올려주세요. 하비풀에서 확인 후 누락된 구성품 또는 올바른 상품을 재출고 진행해드립니다.</li>
		</ul>
	</div>

</div>