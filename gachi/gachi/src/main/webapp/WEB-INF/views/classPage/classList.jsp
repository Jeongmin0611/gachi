<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../inc/top.jspf"%>
<%@ include file="../inc/top2.jspf"%>
<style>

/*======= 검색 ==========*/
#CintroCreateSearch {
	margin: 50px auto;
	text-align: right;
	width: 100%;
}

#CintroCreateSearch span {
	float: left;
}

#CintroCreateSearch span a {
	text-decoration: none;
	color: black;
}

/*======= 검색 ==========*/
/*======= 크리에이터 리스트 ==========*/
.homeClassListImg { /*이미지 사이즈 조절*/
	width: 100%;
	margin: 10px auto;
	height: 250px;
}

.homeClassListTxt {
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

.fa-heart { /*하트 색상*/
	color: red;
}
/*======= 크리에이터 리스트 ==========*/
/* 이미지 오버 효과 */
.row img {
	max-width: 100%;
	position: relative;
	opacity: 1;
}

.row img:hover {
	-webkit-transform: scale(1.05);
	transform: scale(1.05);
}

.row * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

/* 이미지 오버 효과 끝 */
.pagination {
	margin: 50px 0;
}
</style>
<script>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
$(function(){
	//주소에서 파라미터 값 가져오기
	var url = decodeURI(document.location.href);// http://localhost:9090/gachi/classList
	var param = url.substring(url.indexOf('?')+1).split('&');
	if(url.indexOf('?')==-1){
		$('#aAll').attr('style','font-weight:bold');
	}else{
		if(param[0].substring(0,param[0].indexOf('='))=='category'){
			var cate = param[0].substring(param[0].indexOf('=')+1);
			switch(cate){
			case '요리':
				$('#aFood').attr('style','font-weight:bold');
				break;
			case '음악':
				$('#aMusic').attr('style', 'font-weight:bold');
				break;
			case '운동':
				$('#aExercise').attr('style', 'font-weight:bold');
				break;
			case '공예/창작':
				$('#aCrafts').attr('style', 'font-weight:bold');
				break;
			case '미술':
				$('#aArt').attr('style', 'font-weight:bold');
				break;
			case '라이프스타일':
				$('#aLifeStyle').attr('style', 'font-weight:bold');
				break;
			case '사진/영상':
				$('#aPhoto').attr('style', 'font-weight:bold');
				break;
			default:
				$('#aAll').attr('style', 'font-weight:bold');			
			}
			if(param[1]!=undefined){
				var selectOption = param[1].substring(param[1].indexOf('=')+1);
				switch (selectOption) {
				case 'Iall':
				case 'undefined':
					$('#Iall').attr('selected', 'selected');
					break;
				case 'Inew':
					$('#Inew').attr('selected', 'selected');
					break;
				case 'Ipopular':
					$('#Ipopular').attr('selected', 'selected');
					break;
				}
			}else{
				$('#Iall').attr('selected','selected');
			}
		}else if(param[0].substring(0,param[0].indexOf('='))=='selectval'){
			$('#aAll').attr('style', 'font-weight:bold');
			if(param[0] != undefined){
				var selectOption = param[0].substring(param[0].indexOf('=')+1);
				switch (selectOption) {
				case 'Iall':
				case 'undefined':
					$('#Iall').attr('selected', 'selected');
					break;
				case 'Inew':
					$('#Inew').attr('selected', 'selected');
					break;
				case 'Ipopular':
					$('#Ipopular').attr('selected', 'selected');
					break;
				}
			} else {
				$('#Iall').attr('selected', 'selected');
			}			
		}
	}
	
	if(param[0].substring(0,param[0].indexOf('='))=='category'){
		if(param[1] != undefined){
			var init_selectVal = param[1].substring(param[1].indexOf('=')+1);
		}else{
			var init_selectVal='Iall';
		}
	}else{
		if(param[0]!=undefined){
			var init_selectVal = param[0].substring(param[0].indexOf('=')+1);
		}else{
			var init_selectVal = 'Iall';
		}
	}
	
	$('select').click(function(){
		var new_selectVal = $('#classListSelect option:selected').val();
		if(init_selectVal == new_selectVal){
			return false;
		}
		if(init_selectVal!=new_selectVal){
			init_selectVal=new_selectVal;
			if(url.indexOf('category')==-1){
				location.href="/gachi/classList?selectval="+init_selectVal;
			}else if(url.indexOf('category')>-1){
				if(url.indexOf('&')>-1){
					var url2 = url.split('&');
					alert(url2);
					location.href=url2[0]+'&selectval='+init_selectVal;
				}else{
					location.href=url+'&selectval='+init_selectVal;
				}
			}
		}
	});
	});
</script>

<div class="container cfont">


	<!-- 검색 -->
	<div id="CintroCreateSearch">
		<span> <a href="/gachi/classList" id="aAll">전체</a> &nbsp; 
			<a href="/gachi/classList?category=공예/창작" id="aCrafts">공예/창작</a> &nbsp; 
			<a href="/gachi/classList?category=요리" id="aFood">요리</a> &nbsp; 
			<a href="/gachi/classList?category=미술" id="aArt">미술</a>&nbsp; 
			<a href="/gachi/classList?category=음악" id="aMusic">음악</a> &nbsp; 
			<a href="/gachi/classList?category=라이프스타일" id="aLifeStyle">라이프스타일</a> &nbsp; 
			<a href="/gachi/classList?category=운동" id="aExercise">운동</a> &nbsp; 
			<a href="/gachi/classList?category=사진/영상" id="aPhoto">사진/영상</a> &nbsp;
		</span> 
		<select id="classListSelect" name="classListSelect">
			<option value="Iall" id="Iall">전체</option>
			<option value="Inew" id="Inew">최신순</option>
			<option value="Ipopular" id="Ipopular">인기순</option>
		</select>
	</div>

	<!-- 리스트 -->
	<div class="row">
		<c:forEach var="list" items="${list }">
			<div class="col-sm-4">
				<a href="/gachi/classView?code=${list.code }">
				<img src="/gachi/img/${list.class_img1 }" class="homeClassListImg" /></a><br />
				<div class="homeClassListTxt">
					<p>
						<span>${list.category }</span><i class="far fa-heart fa-lg p-2"
							style="float: right; height: 15px;"></i>
					</p>
					<a href="/gachi/classView?code=${list.code }"><span>${list.class_name }</span><br />
						<span>by &nbsp;</span><span class=""> ${list.nickname }</span><br />
						<span style="float: right">가격 &nbsp; ${list.real_price }원</span> </a>
				</div>
			</div>
		</c:forEach>
	</div>

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


<%@ include file="../inc/bottom.jspf"%>