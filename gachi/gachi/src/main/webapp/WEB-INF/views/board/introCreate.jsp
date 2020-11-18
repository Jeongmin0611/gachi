<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#introCreateTopDiv{
	margin-top:50px;
	height: 300px;
	line-height:300px;
	width:100%;
	text-align:center;
	background-color: #ABCEE3;
	font-size: 100px;
	color:white;
}
#introCreateTopDiv *{
font-family:'OSeongandHanEum';
}

/*======= 검색 ==========*/
#CintroCreateSearch {
	margin: 10px auto;
	float: right;
}

#createSearchTxt{
	border: 0;
	border-bottom: 1px solid black;
	outline: none;
}

#CintroCreateSearch button {
	background-color: white;
	color: black;
	border: 0;
}

#CintroCreateSearch button:focus {
	outline: none;
	color: #888;
}
/*======= 검색 ==========*/
/*======= 크리에이터 리스트 ==========*/
#CcreateList{
	margin: 50px auto;
	clear: right;
	overflow: auto;
	text-align: center;
}

#CcreateList li{
	float: left;
	width: 33%;
	margin: 10px quto;
}
#CcreateList li>a>img{
	width: 350px;
	height: 250px;	
}

#CcreateList span:next(){
	font-weight: bold;
}

#CcreateList span{
	font-size: 10px;
	background-color: lightblue;
	color:white;
}
/*======= 크리에이터 리스트 ==========*/
.pagination{
	margin-bottom:50px;
}


</style>

<div class="container cfont">
	<div id="introCreateTopDiv">
		크리에이터 소개
	</div>
	
	<!-- 검색 -->
	<div id="CintroCreateSearch">
	<select name="introCreateSelect1">
		<option value="Iall">전체</option>
		<option value="Inew">최신순</option>
		<option value="Ipopular">인기순</option>
	</select>
	<select name="IntroCreateSelect2">
		<option value="Iall">전체</option>
		<option value="Icreation">공예/창작</option>
		<option value="Ifood">요리</option>
		<option value="Iart">미술</option>
		<option value="Imusic">음악</option>
		<option value="IlifeStyle">라이프스타일</option>
		<option value="Isport">운동</option>
		<option value="Iphoto">사진/영상</option>
	</select>
	<input type="text" name="createSearchTxt" id="createSearchTxt" />
	<button name="createSearchBtn">검색하기</button>
	</div>
	<!-- 리스트 -->
	<ul id="CcreateList">
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		
		
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
		<li><a href="/gachi/introCreateDetail"><img src="/gachi/img/business-woman.png"/></a><br/>
		<div class="CCreateImgtxt"><span>공예/창작</span><br/>크리에이터 명</div></li>
	</ul>
	
	<!-- 페이징 -->
	<ul class="pagination justify-content-center" id="mypageMainPage">
		<li class="page-item"><a class="page-link" href="#">Prev</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">4</a></li>
		<li class="page-item"><a class="page-link" href="#">5</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>

</div>
