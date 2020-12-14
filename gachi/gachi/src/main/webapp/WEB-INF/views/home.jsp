<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* 클래스 리스트 */
.homeClassListImg {
	width: 100%;
	margin: 10px auto;
	height: 250px;
}

.homeClassListTitle { /*클래스 리스트 제목(인기, 신규, 추천)*/
	font-weight: 600px;
}

.homeClassListTitle+p {
	margin: 0;
}

.homeClassListTitle+p>a { /* more */
	text-decoration: none;
	color: #91b4c8;
	font-weight: 600px;
	font-size: 20px;
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

.col-sm-4 a { /*a태그 설정*/
	text-decoration: none;
	color: black;
}

.fa-heart { /*하트 색상*/
	color: red;
}
/* 클래스 리스트 끝*/

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
</style>
</head>

<script>
	//이미지 오버 효과
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
	$(function(){
		$('i').on('click',function(){
			var id = '<%=(String) session.getAttribute("userid")%>';
			if (id == null || id == 'null') {
				swal('로그인 후 이용가능한 기능입니다.');
				return false;
			}
			if (id != null) {
				var url = "/home";
				var good_choice_code;
				var atr = $(this).attr('class');
				if (atr == 'far fa-heart fa-lg p-2') {
					$(this).attr('class', 'fas fa-heart fa-lg p-2');
					good_choice_code = $(this).attr('id');
					location.href = "/gachi?good_add=" + good_choice_code;
				} else if (atr == 'fas fa-heart fa-lg p-2') {
					$(this).attr('class', 'far fa-heart fa-lg p-2');
					good_choice_code = $(this).attr('id');
					location.href = "/gachi?good_del=" + good_choice_code;
				}
			}
		});
	});
</script>
<body>
	<div class="container cfont">
		<!-- 인기 -->
		<h3 class="homeClassListTitle">인기 클래스</h3>
		<p style="text-align: right">
			<a href="/gachi/classList?selectval=Ipopular">more</a>
		</p>
		<div class="row">
			<c:forEach var="list" items="${plist }">
				<div class="col-sm-4">
					<a href="/gachi/classView?code=${list.code }"><img
						src="upload/classImg/${list.class_img }" class="homeClassListImg" /></a><br />
					<div class="homeClassListTxt">
						<p>
							<span class="badge badge-info" style="font-size: 0.9em">${list.category }</span>
							<i class="far fa-heart fa-lg p-2"
								style="float: right; height: 15px;" id="${list.code }"></i>
							<c:forEach var="v" items="${cgoodList }">
								<c:if test="${v.code eq list.code }">
									<script>
										$('#${list.code}').attr('class',
												'fas fa-heart fa-lg p-2');
									</script>
								</c:if>
							</c:forEach>
						</p>
						<a href="/gachi/classView?code=${list.code }"><span>${list.class_name }</span><br />
							<span>by &nbsp;</span><span class=""> ${list.nickname }</span><br />
							<span style="float: right">가격 &nbsp; ${list.real_price }원</span>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 신규 -->
		<h3 class="homeClassListTitle" style="margin-top: 50px;">신규 클래스</h3>
		<p style="text-align: right">
			<a href="/gachi/classPage">more</a>
		</p>
		<div class="row">
			<c:forEach var="nlist" items="${nlist }">
				<div class="col-sm-4">
					<a href="/gachi/classView?code=${nlist.code }"><img
						src="upload/classImg/${nlist.class_img }" class="homeClassListImg" /></a><br />
					<div class="homeClassListTxt">
						<p>
							<span class="badge badge-info" style="font-size: 0.9em">${nlist.category }</span>
							<i class="far fa-heart fa-lg p-2"
								style="float: right; height: 15px;" id="${nlist.code }"></i>
							<c:forEach var="v" items="${cgoodList }">
								<c:if test="${v.code eq nlist.code }">
									<script>
										$('#${nlist.code}').attr('class',
												'fas fa-heart fa-lg p-2');
									</script>
								</c:if>
							</c:forEach>
						</p>
						<a href="/gachi/classView?code=${nlist.code }"><span>${nlist.class_name }</span><br />
							<span>by &nbsp;</span><span class=""> ${nlist.nickname }</span><br />
							<span style="float: right">가격 &nbsp; ${nlist.real_price }원</span>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 추천 -->
		<h3 class="homeClassListTitle" style="margin-top: 50px;">추천 클래스</h3>
		<p style="text-align: right">
			<a href="/gachi/classPage">more</a>
		</p>
		<div class="row" style="margin-bottom: 50px;">
			<c:forEach var="nlist" items="${rlist }">
				<div class="col-sm-4">
					<a href="/gachi/classView?code=${nlist.code }"><img
						src="upload/classImg/${nlist.class_img }" class="homeClassListImg" /></a><br />
					<div class="homeClassListTxt">
						<p>
							<span class="badge badge-info" style="font-size: 0.9em">${nlist.category }</span>
							<i class="far fa-heart fa-lg p-2"
								style="float: right; height: 15px;" id="${nlist.code }"></i>
							<c:forEach var="v" items="${cgoodList }">
								<c:if test="${v.code eq nlist.code }">
									<script>
										$('#${nlist.code}').attr('class',
												'fas fa-heart fa-lg p-2');
									</script>
								</c:if>
							</c:forEach>
						</p>
						<a href="/gachi/classView?code=${nlist.code }"><span>${nlist.class_name }</span><br />
							<span>by &nbsp;</span><span class=""> ${nlist.nickname }</span><br />
							<span style="float: right">가격 &nbsp; ${nlist.real_price }원</span>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>