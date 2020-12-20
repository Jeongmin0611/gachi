<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#introCreateTopDiv{
	margin-top:50px;
	margin-bottom:30px;
	height: 300px;
	line-height:300px;
	width:100%;
	text-align:center;
	font-size: 100px;
	color:white;
}
#introCreateTopDiv img{
	width: 100%;
	height: 300px;
}

/*======= 검색 ==========*/
#CintroCreateSearch {
	margin: 10px auto;
	text-align: right;
	width: 100%;
}

#searchWord{
	border: 0;
	border-bottom: 1px solid black;
	outline: none;
}

#CintroCreateSearch [type=button] {
	background-color: white;
	color: black;
	border: 0;
}

#CintroCreateSearch [type=button]:focus {
	outline: none;
	color: #888;
}
/*======= 검색 ==========*/
/*======= 크리에이터 리스트 ==========*/
#introCreatorThumbnail>img {/*이미지 사이즈 조절*/
	width: 100%;
	margin: 10px auto;
	height: 390px;
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
<script>
	//검색어 폼에서 검색 버튼 클릭
	$('#searchForm').submit(function(){
		if($('#searchWord').val()==""){
			return false;
		}	
		return true;
	});
</script>
<div class="container cfont">
	<div id="introCreateTopDiv">
		<img src="/gachi/img/introCreatorLogo.png"/>
	</div>
	
	<!-- 검색 -->
	<div id="CintroCreateSearch">
		<form method="get" action="/gachi/introCreator" id="searchForm">
			<select name="searchKey" id="searchKey">
				<option value="전체">전체</option>
				<option value="공예/창작">공예/창작</option>
				<option value="요리">요리</option>
				<option value="미술">미술</option>
				<option value="음악">음악</option>
				<option value="라이프스타일">라이프스타일</option>
				<option value="운동">운동</option>
				<option value="사진/영상">사진/영상</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" placeholder="크리에이터 이름을 입력하세요" style="min-width: 250px; text-align: right;"/>
			<input type="submit" value="검색"/>
		</form>
	</div>

	<!-- 리스트 -->
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-sm-4">
				<a href="/gachi/introCreatorView?userid=${vo.userid }" id="introCreatorThumbnail">
				<img src="<%=request.getContextPath()%>/upload/creatorImg/${vo.picture }"/></a><br/>
				<div class="homeClassListTxt">
					<p><span>${vo.category }</span></p>
					<a href="/gachi/introCreatorView?userid=${vo.userid }">${vo.nickname }</a>
				</div>				
			</div>
		</c:forEach>
	</div>
	
	<!-- paging -->
	<div id="introCreatorPaging">
		<ul class="pagination justify-content-center">
			<c:if test="${pvo.nowPage>1 }">
				<li class="page-item">
					<a class="page-link" href="/gachi/introCreator?nowPage=${pvo.nowPage-1}<c:if test="${pvo.searchWord!=null }">&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">Prev</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPageNum }" end="${pvo.startPageNum+pvo.onePageRecord-1}">
				<c:if test="${p<=pvo.totalPage }">
					<li class="page-item">
						<a class="page-link" href="/gachi/introCreator?nowPage=${p }<c:if test="${pvo.searchWord!=null }">&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>" <c:if test="${p==pvo.nowPage }">style="background-color:lightblue; color:white"</c:if>>${p}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${pvo.nowPage<pvo.totalPage }">
				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/introCreator?nowPage=${pvo.nowPage+1}<c:if test="${pvo.searchWord!=null }">&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">Next</a></li>
			</c:if>
		</ul>
	</div>

</div>
