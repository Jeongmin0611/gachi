<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.carousel-item img {
	width: 100%;
}
/* 수강후기 */
#myclassReview {
	margin-top: 20px;
	margin-bottom: 50px;
	overflow: auto;
	width: 100%;
}

#myclassReview ul {
	overflow: auto;
}

#myclassReview>label {
	font-size: 1.3em;
}

#myclassReview>button {
	float: right;
	background-color: #ABCEE3;
}

#myclassReview li {
	float: left;
	text-align: center;
	padding: 0 10px;
}

#myclassReview li:first-child {
	color: #F4BFA9;
}

#myclassReview li:nth-child(2) {
	text-align: left;
	font-weight: bold;
	color: gray;
}

#myclassReview li:nth-child(3), #myclassReview li:nth-child(4) {
	font-size: 0.8em;
}

#myclassReview li:last-child {
	width: 100%;
	text-align: left;
	padding: 15px;
}

#myclassReviewPg a {
	color: #ABCEE3;
	margin-bottom: 50px;
}
/* 질문게시판 */
#myclassQna {
	mragin-top: 20px;
	margin-bottom: 50px;
	overflow: auto;
	width: 100%;
	margin-bottom: 50px;
}

#myclassQna>ul {
	overflow: auto;
	margin-bottom: 20px;
	border: 3px solid #eee;
	padding: 15px;
}

#myclassQna>label {
	font-size: 1.3em;
}

#myclassQnaSearch {
	float: right;
}

#myclassQnaSearch input {
	border: none;
	outline: none;
	border-bottom: 1px solid #000;
}

#myclassQnaSearch button:nth-child(2) {
	background-color: #eee;
	color: #000;
}

#myclassQnaFrm {
	background-color: #ABCEE3;
}

#myclassQna li {
	float: left;
	text-align: center;
	padding: 0 10px;
}

#myclassQna>ul>li:first-child {
	float: left;
	text-align: left;
	padding: 0 15px;
	font-weight: bold;
	color: gray;
}

#myclassQna>ul>li:first-child>label {
	font-size: 1em;
	color: #F4BFA9;
	font-weight: bold;
	margin-right: 10px;
}

#myclassQna li:nth-child(2), #myclassQna li:nth-child(3) {
	font-size: 0.8em;
}

#myclassQna li:nth-child(4) {
	width: 100%;
	text-align: left;
	padding: 0 15px;
}

#myclassQna>ul>li:last-child {
	padding: 10px;
}

#myclassQna>ul>li:last-child label {
	font-size: 1em;
	color: #ABCEE3;
	font-weight: bold;
	margin-right: 10px;
}

#myclassQna li:last-child {
	width: 100%;
	text-align: left;
	float: left;
	padding: 0 10px;
}

#myclassQna>ul>li>ul>li:last-child {
	font-size: 1em;
}
/* 모달 */
input[type=text] {
	text-align: left;
}
</style>
<script>
		function reviewMoreContent(){
			//더보기 페이징
		    $(".reviewMoreContent").css("display","none");
		    $(".reviewMoreContent").slice(0,6).show();
		    $("#reviewMoreContentLoad").click(function(e){
		    	e.preventDefault();
		    	$(".reviewMoreContent:hidden").slice(0,6).show();
		    	if($(".reviewMoreContent:hidden").length==0){
					$("#reviewMoreContentLoad").css("display","none");	    	
		  	  	}
		    });
		}
		
		function qnaMoreContent(){
			//더보기 페이징
		    $(".qnaMoreContent").css("display","none");
		    $(".qnaMoreContent").slice(0,3).show();
		    $("#qnaMoreContentLoad").click(function(e){
		    	e.preventDefault();
		    	$(".qnaMoreContent:hidden").slice(0,3).show();
		    	if($(".qnaMoreContent:hidden").length==0){
					$("#qnaMoreContentLoad").css("display","none");	    	
		  	  	}
		    });
		}
	    
	$(function() {
		//textarea에 ckeditor편집기 적용. name속성값		
		var editor=CKEDITOR.replace('message-text', {
			allowedContent:true,
			toolbar :[['Bold','Italic','-','Image','Smiley','SpecialChar']],
				imageUploadUrl:'/gachi/clientImgUpload',
				extraPlugins:'uploadimage'
				
		});
		editor.on('fileUploadRequest', function( evt ) {
		    var fileLoader = evt.data.fileLoader,
		        formData = new FormData(),
		        xhr = fileLoader.xhr;
		    xhr.open( 'POST', fileLoader.uploadUrl, true );
		    formData.append( 'upload', fileLoader.file, fileLoader.fileName );
		    formData.append('type','classView');
		    fileLoader.xhr.send( formData );
		    evt.stop();
		}, null, null, 4 ); 

		//세션의 아이디 가져오기
    	var id = '<%=(String) session.getAttribute("userid")%>';
    	
		//평점에 별넣기 https://www.wbotelhos.com/raty 참고
		$(".classRating").raty({
			score : 5,
			path : "img/starImages",
			half : true,
			width : "100%",
			space : false
		});
		$(".myclassStars").raty({
			score : 5,
			path : "img/starImages",
			half : true,
			width : "100%",
			readOnly : true,
			space : false
		});

		//좋아요 클릭이벤트
		$('i').on(
				'click',
				function() {
					if (id == null || id == 'null') {
						swal('로그인 후 이용가능한 기능입니다.');
						return false;
					}
					if (id != null) {
						var good_choice_code;
						var atr = $(this).attr('class');
						if (atr == 'far fa-heart fa-lg') {
							$(this).attr('class', 'fas fa-heart fa-lg');
							good_choice_code = $(this).attr('id');
							location.href = "/gachi/classView?code="+ good_choice_code + "&good_add="+ good_choice_code;
						} else if (atr == 'fas fa-heart fa-lg') {
							$(this).attr('class', 'far fa-heart fa-lg');
							good_choice_code = $(this).attr('id');
							location.href = "/gachi/classView?code="+ good_choice_code + "&good_del="+ good_choice_code;
						}
					}
				});
	  
	  	//장바구니 담기
	  	$('#userCart').on('click',function(){
	  		var code = $("#cartCode").val();
	  		$.ajax({
	  			url: "/gachi/userCartInsert",
	  			data: "code="+code+"&amount=1",
	  			type: "GET",
	  			success: function(result){ //0: 장바구니 중복, 1: 클래스 주문 중복, 2: insert 성공
	  				if(result==0){
	  					swal({
		  					title: "확인",
		  					text: "이미 장바구니에 담겨있는 클래스입니다. \n장바구니로 이동하시겠습니까?",
		  					icon: "warning",
		  					closeOnClickOutside: false,
		  					buttons: {
		  						cancle : {
		  							text: "취소",
		  							value: false,
		  							className: "btn btn-outline-light"
		  						},
		  						confirm : {
		  							text: "확인",
		  							value: true,
		  							className: "btn btn-outline-light"
		  						}
		  					}
		  				}).then((result)=>{
		  					if(result){
		  						location.href="/gachi/userCart";
		  					}
		  				});
	  				}else if(result==1){
	  					swal({
		  					title: "완료",
		  					text: "해당 클래스를 장바구니에 담았습니다. \n장바구니로 이동하시겠습니까?",
		  					icon: "success",
		  					closeOnClickOutside: false,
		  					buttons: {
		  						cancle : {
		  							text: "취소",
		  							value: false,
		  							className: "btn btn-outline-light"
		  						},
		  						confirm : {
		  							text: "확인",
		  							value: true,
		  							className: "btn btn-outline-light"
		  						}
		  					}
		  				}).then((result)=>{
		  					if(result){
		  						location.href="/gachi/userCart";
		  					}
		  				});
	  				}else if(result==2){
	  					swal({
		  					title: "확인",
		  					text: "이미 수강 중인 클래스입니다. \n내 학습표로 이동하시겠습니까?",
		  					icon: "warning",
		  					closeOnClickOutside: false,
		  					buttons: {
		  						cancle : {
		  							text: "취소",
		  							value: false,
		  							className: "btn btn-outline-light"
		  						},
		  						confirm : {
		  							text: "확인",
		  							value: true,
		  							className: "btn btn-outline-light"
		  						}
		  					}
		  				}).then((result)=>{
		  					if(result){
		  						location.href="/gachi/myclassList";
		  					}
		  				});
	  				}
	  				
	  			}, error: function(){
	  				console.log("장바구니담기 에러");
	  			}
	  		});
	  	});
	  	reviewMoreContent();
	  	qnaMoreContent();
	});
	function purchase() {
		location.href = "/gachi/purchase";
	};
</script>
<div class="container cfont">
	<div class="row">
		<!-- bxslide -->
		<div id="carouselExampleIndicators" class="carousel slide col-sm-6"
			data-interval="3000" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/gachi/img/artEx/artEx14.PNG" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="/gachi/img/artEx/artEx15.PNG" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="/gachi/img/artEx/artEx16.PNG" class="d-block w-100">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- bxslide 옆에 글 -->
		<div class="col-sm-6 pt-2">
			<span class="badge badge-info" style="font-size: 0.9em">${vo.category }</span><br />
			<h3>${vo.class_name }</h3>
			<br /> by ${vo.nickname }<br /> 가격 &nbsp; ${vo.real_price }원<br />

			적립금 &nbsp; ${vo.stack }원 <i class="far fa-heart fa-lg"
				style="float: right; height: 15px; color: red;" id="${vo.code }"></i>
			<input type="hidden" value="${vo.code }" id="cartCode" />
			<c:if test="${goodVo.code eq vo.code }">
				<script>
					$('#${vo.code}').attr('class', 'fas fa-heart fa-lg');
				</script>
			</c:if>
			<br />
			<p>
			<p />
			<button id="userCart"
				style="height: 40px; width: 50%; border: 1px solid lightblue; background-color: white; float: left;">장바구니
				담기</button>
			<button
				style="height: 40px; width: 50%; border: 1px solid lightblue; background-color: lightblue;"
				onclick="purchase()">구매</button>
		</div>

		<!-- 설명글 -->
		<h4 style="margin-top: 10px; padding-left: 10px;">클래스 소개</h4>
		<br />&nbsp; 차시 | 112차 총 시간 | 896시간

		<div class="col-sm-12"
			style="min-height: 300px; background-color: #eee">클래스 설명글</div>

		<!-- 클래스 리뷰 -->
		<div id="myclassReview">
			<label>수강평</label>
			<button type="button" class="btn btn-outline-light"
				data-toggle="modal" data-target="#reviewModal" id="myclassReviewFrm">수강평작성</button>
			<hr style="background: #000" />

			<c:choose>
				<c:when test="${empty reviewList}">
					<div
						style="height: 100px; width: 100%; line-height: 100px; text-align: center; background-color: #eee">
						첫 번째로 리뷰를 남겨주세요 :)</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="r" items="${reviewList }">
						<ul class="reviewMoreContent">
							<li><div class="myclassStars" data-score="${r.grade }"></div></li>
							<li>${r.subject }</li>
							<li>${r.nickname }</li>
							<li>${r.writedate }</li>
							<li>${r.content }</li>
						</ul>
						<hr class="reviewMoreContent" />

					</c:forEach>
					<div>
						<button type="button" class="btn btn-outline-lignt"
							id="reviewMoreContentLoad">더보기</button>
					</div>
				</c:otherwise>
			</c:choose>

		</div>


		<!-- 클래스 문의 -->
		<div id="myclassQna">
			<label>질문&amp;답변</label>
			<div id="myclassQnaSearch">
				<input type="text" name="searchWord" />
				<button type="button" class="btn btn-outline-light btn-sm">검색</button>
				<button type="button" class="btn btn-outline-light"
					data-toggle="modal" data-target="#exampleModal" id="myclassQnaFrm">질문작성</button>
			</div>
			<hr style="background: #000" />
			<c:choose>
				<c:when test="${empty qnaList }">
				<div style="height: 100px; width: 100%; line-height: 100px; text-align: center; background-color: #eee">
						첫 번째로 질문을 남겨주세요 :)</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="qna" items="${qnaList }">
						<ul class="qnaMoreContent">
							<li><label class="badge badge-light">Q</label>${qna.subject }</li>
							<li>${qna.nickname }</li>
							<li>${qna.writedate }</li>
							<li>${qna.content }</li>
							<li>
								<hr />
								<ul>
									<li><label class="badge badge-light">A</label>${qna.writer }</li>
									<li>${qna.answer_writedate }</li>
									<li>${qna.answer }</li>
								</ul>
							</li>
						</ul>
					</c:forEach>
					<div>
						<button type="button" class="btn btn-outline-lignt"
							id="qnaMoreContentLoad">더보기</button>
					</div>
				</c:otherwise>
			</c:choose>


		</div>
	</div>
</div>
<!-- 수강평 모달 -->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog"
	aria-labelledby="reviewModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="reviewModalLabel"
					style="font-weight: bold">수강평 작성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="reviewFormOk" method="post" action="/gachi/reviewFormOk">
					<input type="hidden" value="${vo.code }" name="code" />

					<div>
						만족도 <span class="classRating"></span>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">제목</label> <input
							type="text" class="form-control" id="recipient-name"
							name="subject">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">내용</label>
						<textarea class="form-control" id="message-text" name="content"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<input type="button" class="btn btn-outline-light btn-block"
					value="등록" />
			</div>
		</div>
	</div>
</div>

<!-- Qna 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">질문작성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="qnaFormOk" method="post" action="/gachi/qnaFormOk">
					<input type="hidden" value="${vo.code }" name="code" />
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">제목</label> <input
							type="text" class="form-control" id="recipient-name"
							name="subject">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">내용</label>
						<textarea class="form-control" id="message-text" name="content"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<input type="button" class="btn btn-primary" value="등록" />
			</div>
		</div>
	</div>
</div>