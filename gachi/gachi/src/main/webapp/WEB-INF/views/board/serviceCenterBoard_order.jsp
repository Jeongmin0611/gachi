<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

#CserviceSearchDiv {
	float: right;
	margin:0 0 10px;
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
#CserviceContentDiv{
}
#CserviceContentDiv ul li{ /* 글자 속성 */
	line-height: 40px;
}
#CserviceContentDiv ul li:nth-child(4n+1){	/* 카테고리 */
	width:15%;
	height: 40px;
	background-color: #F4BFA9;
	margin-right: 5%;
	color: white;
	text-align: center;
	float: left;
}

#CserviceContentDiv ul li:nth-child(4n+2){	/* 제목 */
	width:100%;
	height: 40px;
}

#CserviceContentDiv ul li:nth-child(4n+3){	/* A */
	width:20%;
	height:150px;
	color:#FB5000;
	font-size:100px;
	line-height:150px;
	text-align:center;
	background-color: #eee;
	paddin:0px;
	margin: 20px 0;
	float: left;
}
#CserviceContentDiv ul li:nth-child(4n+4){	/* 답변 */
	width:100%;
	height:150px;
	background-color: #eee;
	margin: 20px 0;
}
/* ============== 내용 표시 끝 ============== */
#CservicePaging{
	margin: 40px 0;
}
</style>

<div class="CboardDiv">
	<div id="CserviceSearchDiv">
		<select name="CserviceSelect">
			<option value="CSall">전체</option>
			<option value="CSSubject">질문</option>
			<option value="CSContent">답변</option>			
		</select>
		<input type="text" name="CserviceSearchTxt" id="CserviceSearchTxt" />
			<button name="CserviceSearchBtn">검색하기</button>
	</div>	
	<!-- 자주묻는 질문, 배송정책 메뉴 -->
	<%@ include file="../inc/serviceboardMenu.jspf" %>
	<!-- 내용표시 -->
	<div id ="CserviceContentDiv">
		<ul>
			<li>주문/결제</li>
			<li>지금 주문하면 언제 배송오나요?</li>
			<li>A</li>
			<li>오후 2시 이전 주문 시에는 영업일 기준 당일출고, 2시 이후 주문 시에는 영업일 기준 익일에 출고됩니다.
			공휴일과 주말인 경우 다음 영업일에 배송 출발하며, 상품 수령까지는 영업일 기준 1-3일정도 소요됩니다.
			</li>
			
			<li>주문/결제</li>
			<li>질문</li>
			<li>A</li>
			<li>내용</li>
			<li>주문/결제</li>
			<li>질문</li>
			<li>A</li>
			<li>내용</li>
		</ul>
	</div>
	<!-- paging -->
	<div id="CservicePaging">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>

</div>