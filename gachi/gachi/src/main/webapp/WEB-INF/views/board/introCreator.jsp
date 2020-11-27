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

/*======= 검색 ==========*/
#CintroCreateSearch {
	margin: 10px auto;
	text-align: right;
	width: 100%;
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
#introCreatorThumbnail>img {/*이미지 사이즈 조절*/
	width: 100%;
	margin: 10px auto;
	height: 350px;
}

.homeClassListTxt {
	text-align: center;
	overflow: auto;
	margin-bottom: 10px;
	padding: 0;
}

.homeClassListTxt p {
	margin: 0;
}

.homeClassListTxt p>span { /* 클래스 리스트 카테고리 */
	width: 100%;
	background-color: lightblue;
	color: white;
}

/*a태그 설정*/
.col-sm-4 a {
	text-decoration: none;
	color: black;
}
/*======= 크리에이터 리스트 ==========*/

.pagination{
	margin:50px 0;
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
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-sm-4">
				<a href="/gachi/introCreatorView?userid=${vo.userid }" id="introCreatorThumbnail">${vo.picture }</a><br/>
				<div class="homeClassListTxt">
					<p><span>${vo.category }</span></p>
					<a href="/gachi/introCreatorView?userid=${vo.userid }">${vo.nickname }</a>
				</div>				
			</div>
		</c:forEach>
	</div>
	
	<!-- 페이징 -->
	<ul class="pagination justify-content-center" id="mypageMainPage">
		<li class="page-item"><a class="page-link" href="#">Prev</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>

</div>
