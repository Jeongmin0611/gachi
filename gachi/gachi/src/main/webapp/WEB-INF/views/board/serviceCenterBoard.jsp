<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

#CserviceSearchDiv {
	float: right;
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
	<div id = "CservicemenuDiv">
		<ul>
			<li><a href="">자주 묻는 질문</a>
				<ul class="CserviceSubmenu"><!-- 서브메뉴 -->
					<li><a href="#" class="CserviceSubmenuLink longLink">전체</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">TOP FAQ </a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">주문/결제</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">취소/환불</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">클래스/스토어</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">기타</a></li>
				</ul>
			</li>
			<li>배송 정책</li>
		</ul>
	</div>

</div>