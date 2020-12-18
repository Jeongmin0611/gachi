<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../inc/top2.jspf"%>
<style>
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
	
	//좋아요 클릭이벤트
	$('i').on('click',function(){
		var id = '<%=(String) session.getAttribute("userid")%>';
		if (id == null || id == 'null') {
			swal('로그인 후 이용가능한 기능입니다.');
			return false;
		}
		
		var good_choice_code;
		var atr = $(this).attr('class');
		if (id != null) {
			if (atr == 'far fa-heart fa-lg p-2') {
				$(this).attr('class', 'fas fa-heart fa-lg p-2');
				good_choice_code = $(this).attr('data-name');
				$.ajax({
					type:"POST",
					url:"/gachi/good_add",
					data:{
						good_add:good_choice_code
					},success:function(){
						location.reload();
					}, error:function(){
						swal('실패'+error);
					}
				});//ajax			
				
			} else if (atr == 'fas fa-heart fa-lg p-2') {
				$(this).attr('class', 'far fa-heart fa-lg p-2');
				good_choice_code = $(this).attr('data-name');
				$.ajax({
					type:"POST",
					url:"/gachi/good_del",
					data:{
						good_del:good_choice_code
					},success:function(){
						location.reload();
					}, error:function(){
						swal('실패'+error);
					}
				});//ajax
			}//elif
		}//id가 널이 아닐 때 if문
	});
	});
</script>

<div class="container cfont">

		<h3 class="homeClassListTitle" style="margin-bottom: 50px;">추천 클래스</h3>
	<!-- 리스트 -->
	<div class="row" style="margin-bottom:50px">
		<c:forEach var="list" items="${list }">
			<div class="col-sm-4">
				<a href="/gachi/classView?code=${list.code }">
				<img src="/gachi/upload/classImg/${list.class_img }" class="homeClassListImg" /></a><br />
				<div class="homeClassListTxt">
					<p>
						<span class="badge badge-info" style="font-size:0.9em">${list.category }</span>
							<i class="far fa-heart fa-lg p-2" style="float: right; height: 15px;" data-name="${list.code }">${list.good }</i>
							<c:forEach var="v" items="${cgoodList }">
								<c:if test="${v.code eq list.code }">
									<script>
										$('i[data-name=${list.code }]').attr('class',
										'fas fa-heart fa-lg p-2');
								</script>
								</c:if>
							</c:forEach>
					</p>
					<a href="/gachi/classView?code=${list.code }"><span>${list.class_name }</span><br />
						<span>by &nbsp;</span><span class=""> ${list.nickname }</span><br />
						<span style="float: right">가격 &nbsp;
						<fmt:formatNumber value="${list.real_price }" pattern="#,###"/> 원</span> </a>
				</div>
			</div>
		</c:forEach>
	</div>

	
</div>
