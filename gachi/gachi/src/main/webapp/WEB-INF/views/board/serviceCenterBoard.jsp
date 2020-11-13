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
	/*============== 자주묻는 질문, 배송정책 메뉴 ===============*/
#CservicemenuDiv{
	clear:both;
	height: 30px;
	line-height:30px;  
	width: 100%;       /* [변경] 하위 메뉴와 동일하게 맞춤 */
	position: relative;
	background-color: #F4BFA9; /* [추가] 늘어난만큼 배경색도 보이도록 수정 */
	margin: 10px 0;
}

#CservicemenuDiv ul {/* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none;  
	margin: 0px;            
	padding: 0px;           
}

.CservicetopMenuLi{
	width: 16.7%;
	height: 30px;   
}

#CservicemenuDiv ul li {	/* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white;             
	float: left;              
	vertical-align: middle;     
	text-align: center;         
	-position: relative;      
}
.CserviceSubmenuLink, .CserviceSubmenuLink {	/* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration:none;               
	display: block;                     
	width: 100%; 
}
.CserviceSubmenuLink {     /* 상위 메뉴의 글씨색 설정 */
	color: black;             
}    
.CservicetopMenuLi:hover .menuLink {    /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: gray;                
}
.longLink {     /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px;   
}
.CserviceSubmenuLink {          /* 하위 메뉴의 a 태그 스타일 설정 */
	color: black;    
	line-height:30px;         
	background-color: white;      /* [변경] 배경색 변경 */
	-border: solid 1px white;    /* [삭제] 테두리 삭제 */
	-margin-right: -1px;         /* [삭제] 공백 보정 삭제 */
}
.CserviceSubmenu {              /* 하위 메뉴 스타일 설정 */
	position: absolute; 
	height: 0px;            
	overflow: hidden;       
	transition: height .2s; 
	-webkit-transition: height .2s; 
	-moz-transition: height .2s; 
	-o-transition: height .2s; 
	width: 100%;           
	left: 0;                
	background-color: white;        
	line-height: 30px;          
	-position: relative;  
	z-index:1000;
}
.CserviceSubmenu li {
	display: inline-block;
}
.CservicetopMenuLi:hover .submenu { 
	height: 30px;           
	border-top:2px solid #eee;
	border-bottom: 2px solid #eee;
}
.CserviceSubmenuLink:hover {        
	color: gray;  
	font-size:bold;               
	background-color: white;  
}
/* ============== 메뉴 ============== */
/* ============== 내용 표시 ============== */
#CserviceContentDiv{
	background-color: lightblue;
}
#CserviceContentDiv ul li{ /* 글자 속성 */
	line-height: 30px;
}
#CserviceContentDiv ul li:nth-child(4n+1){	/* 카테고리 */
	width:10%;
	height: 30px;
	background-color: #F4BFA9;
	margin-right: 10%;
	color: white;
	text-align: center;
	float: left;
}

#CserviceContentDiv ul li:nth-child(4n+2){	/* 제목 */
	width:100%;
	height: 30px;
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
			<li class="CservicetopMenuLi"><a href="">자주 묻는 질문</a>
				<ul class="CserviceSubmenu"><!-- 서브메뉴 -->
					<li><a href="#" class="CserviceSubmenuLink longLink">전체</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">TOP FAQ </a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">주문/결제</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">취소/환불</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">클래스/스토어</a></li>
					<li><a href="#" class="CserviceSubmenuLink longLink">기타</a></li>
				</ul>
			</li>
			<li class="CservicetopMenuLi"><a href="#">배송 정책</a></li>
		</ul>
	</div>
	
	<!-- 내용표시 -->
	<div id ="CserviceContentDiv">
		<ul>
			<li>배송</li>
			<li>지금 주문하면 언제 배송오나요?</li>
			<li>A</li>
			<li>오후 2시 이전 주문 시에는 영업일 기준 당일출고, 2시 이후 주문 시에는 영업일 기준 익일에 출고됩니다.
			공휴일과 주말인 경우 다음 영업일에 배송 출발하며, 상품 수령까지는 영업일 기준 1-3일정도 소요됩니다.
			</li>
			
			<li>배송</li>
			<li>질문</li>
			<li>A</li>
			<li>내용</li>
			<li>배송</li>
			<li>질문</li>
			<li>A</li>
			<li>내용</li>
		</ul>
	</div>
	

</div>