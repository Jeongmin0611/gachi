<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.carousel-item img {
	width: 100%;
}
/*상품소개글*/
#detail-info img{
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
	CKEDITOR.replace('content', {
			//allowedContent:true,
			toolbar :[['Bold','Italic','-','Smiley','SpecialChar']]
			//,imageUploadUrl:'/gachi/clientImgUpload',
			//extraPlugins:'uploadimage'				
		});
	
	//세션의 아이디 가져오기
	var id = '<%=(String)session.getAttribute("userid")%>'; 
	var point=5;
    //평점에 별넣기 https://www.wbotelhos.com/raty 참고
    $(".classRating").raty({
    		score:5,
    		path:"img/starImages",
    		width:"100%",
    		space:false,
    		click: function(score, evt) {
                point = score
            }
    });
   
  //좋아요 클릭이벤트
	$('i').on('click',function(){
		var id = '<%=(String) session.getAttribute("userid")%>';
		if (id == null || id == 'null') {
			swal({
				title:'로그인 후 이용가능한 기능입니다.',
				icon:"warning"});
			return false;
		}
		
		var good_choice_code;
		var atr = $(this).attr('class');
		if (id != null) {
			if (atr == 'far fa-heart fa-lg') {
				$(this).attr('class', 'fas fa-heart fa-lg');
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
				
			} else if (atr == 'fas fa-heart fa-lg') {
				$(this).attr('class', 'far fa-heart fa-lg');
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
  
	//장바구니 담기
  	$('#userCart').on('click',function(){
  		if(id == 'null'){
  			swal({
				title:'로그인 후 이용가능한 기능입니다.',
				icon:"warning"});
			return false;
		  }
  		else{var code = $("#cartCode").val();
  		$.ajax({
  			url: "/gachi/userCartInsert",
  			data: "code="+code+"&amount=1",
  			type: "GET",
  			success: function(result){ //0: 장바구니 중복, 1: 클래스 주문 중복, 2: insert 성공
  				if(result==0){
  					swal({
	  					title: "확인",
	  					text: "이미 장바구니에 담겨있는 상품입니다. \n장바구니로 이동하시겠습니까?",
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
	  					text: "해당 상품을 장바구니에 담았습니다. \n장바구니로 이동하시겠습니까?",
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
  				}
  			}, error: function(){
  				console.log("장바구니담기 에러");
  			}
  		});
  		}
  	});
	//===================================================== 리뷰 버튼 클릭시 로그인 확인, 구매여부 확인
  	$('#myclassReviewFrm').on('click',function(){
  		if(id == 'null'){
  			swal({
				title:'로그인 후 이용가능한 기능입니다.',
				icon:"warning"});
			return false;
		  }else if(${orderCheck}<1){
	  			swal({
					title:'구매 후 이용가능한 기능입니다.',
					icon:"warning"});
	  			return false;
		  }else{
			//버튼
				$("#reviewForm").css("display","block");
				$("#reviewUpdateForm").css("display","none");
				//수정이후 수강평 등록 눌렀을 시 내용 지우기
				$("#reviewSubject").val(""); 
				CKEDITOR.instances.reviewContent.setData(""); 
				$("#numInput").val("");
				$(".classRating").raty("score",5);
			  return true;
		  }
  	});
  	//리뷰 작성
  	$('#reviewForm').click(function(){
  		CKupdate();
  		if($('#reviewSubject').val()==null || $('#reviewSubject').val()==''){
  			swal('제목을 입력해주세요');
  			return false;
  		}
  		if($('#reviewContent').val()==null||$('#reviewContent').val()==''){
  			swal('내용을 입력해주세요');
  			return false;
  		}
  		
  		$.ajax({
  			type:"POST",
  			url:"/gachi/reviewFormOk",
  			data:{
  				code:'${vo.code}',
  				subject : $('#reviewSubject').val(),
  				content: $('#reviewContent').val(),
  				grade:point
  			},
  			success:function(){
  				swal({
  				  title: "상품 리뷰가 등록 되었습니다.",
  				  icon: "success"
 				}).then((result)=>{
					location.reload();
  				});
  			},error:function(){
  				swal('리뷰 등록이 실패하였습니다. ');
  			}
  			
  		});
  	});
  //리뷰 수정
	$(".reviewUpdate").click(function(){
		$("#reviewSubject").val($(this).parent().prev().prev().html());
		CKEDITOR.instances.reviewContent.setData($(this).parent().next().html()); 
		$("#reviewForm").css("display","none");
		$("#reviewUpdateForm").css("display","block");
		$("#numInput").val($(this).parent().prev().prev().prev().find('div').attr('data-num'));
		$(".classRating").raty("score",$(this).parent().prev().prev().prev().find('div').attr('data-score'));
	});
	$('#reviewUpdateForm').click(function(){
  		CKupdate();
  		if($('#reviewSubject').val()==null || $('#reviewSubject').val()==''){
  			swal('제목을 입력해주세요');
  			return false;
  		}
  		if($('#reviewContent').val()==null||$('#reviewContent').val()==''){
  			swal('내용을 입력해주세요');
  			return false;
  		}
  		
  		$.ajax({
  			type:"POST",
  			url:"/gachi/storeReviewUpdateFormOk",
  			data:{
  				subject : $('#reviewSubject').val(),
  				content:$('#reviewContent').val(),
  				grade: point,
  				num: $(this).next().val()
  			},
  			success:function(){
  				swal({
  				  title: "상품 리뷰가 수정 되었습니다.",
  				  icon: "success",
  				  buttons: true
  				}).then((result)=>{
  					location.reload();
  				});
  			},error:function(){
  				swal('리뷰 수정이 실패하였습니다. ');
  			}
  			
  		});
  	});
	//리뷰 삭제
	$(".storeReviewDelete").click(function(){
		swal({
			title: "상품리뷰 삭제",
			text: "선택하신 리뷰를 삭제하시겠습니까?",
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
			var num = $(this).parent().prev().prev().prev().find('div').attr('data-num');
			if(result){
				$.ajax({
					url: "/gachi/goodsReviewDelete",
					data: "num="+num,
					type: "GET",
					success: function(result){
						if(result>0){
							swal({
								title: "완료",
								text: "리뷰 삭제가 완료되었습니다!",
								icon: "success",
								closeOnClickOutside: false,
								buttons: {
									confirm : {
										text: "확인",
										value: true,
										className: "btn btn-outline-light"
									}
								}
							}).then((result)=>{
								location.reload();
							});
						}
					}, error: function(){
						console.log("리뷰 삭제 실패");
					}
				});
			}
		});
		
	});
	//===================================================== qna 검색
  	$('#qnaSearchBtn').on('click',function(){
  		$.ajax({
  			type:"GET",
  			url:"/gachi/qnaSearch",
  			data:{
  				code:'${vo.code}',
  				searchKey:$('#qnaSearchKey').val(),
  				searchWord:$('#qnaSearchWord').val()
  			},
  			success:function(result){
  				console.log("성공= "+result);
  			},error:function(error){
  				console.log("에러"+error);
  			}
  		})
  	});
  	
  	//qna 버튼 클릭시 로그인 확인
  	$('#myclassQnaFrm').on('click',function(){
		  if(id == 'null'){
			swal({
				title:'로그인 후 이용가능한 기능입니다.',
				icon:"warning"});
			return false;
		  }else{
			  $("#qnaForm").css("display","block");
				$("#qnaUpdateForm").css("display","none");
				//수정이후 수강평 등록 눌렀을 시 내용 지우기
				$("#qnaSubject").val(""); 
				$("#numInputQna").val("");	
			  return true;
		  }
	  });
  	//qna작성
  	$('#qnaForm').click(function(){
  		$.ajax({
  			type:"POST",
  			url:"/gachi/qnaFormOk",
  			data:{	  				
  				code:'${vo.code}',
  				subject:$('#qnaSubject').val(),
  				content:$('#qnaContent').val()},
  			success:function(){
  				swal({
	  				  title: "질문이 등록 되었습니다.",
	  				  icon: "success",
	  				  buttons: true
  					}).then((result)=>{
						location.reload();
	  				});
  			},error:function(){
  				swal('질문등록이 실패하였습니다.');
  			}
  		});
		
  	});
  //qna수정
	$(".qnaUpdate").click(function(){
		$("#qnaSubject").val( $(this).parent().prev().prev().find("span").html()); 
		$('#qnaContent').val( $(this).parent().next().html());
		$("#qnaForm").css("display","none");
		$("#qnaUpdateForm").css("display","block");
		$("#numInputQna").val($(this).next().next().val()); 
	});	
	$("#qnaUpdateForm").click(function(){
		if($('#qnaSubject').val()==null || $('#qnaSubject').val()==''){
  			swal('제목을 입력해주세요');
  			return false;
  		}
  		if($('#qnaContent').val()==null || $('#qnaContent').val()==''){
  			swal('내용을 입력해주세요');
  			return false;
  		}
  		//var num = $(this).next().val();
		$.ajax({
  			type:"POST",
  			url:"/gachi/qnaUpdateFormOk",
  			data:{	  				
  				num: $(this).next().val(),
  				subject: $('#qnaSubject').val(),
  				content: $('#qnaContent').val()},
  			success:function(){
  				swal({
	  				  title: "질문이 수정 되었습니다.",
	  				  icon: "success",
	  				  buttons: true
	  				}).then((result)=>{
						location.reload();
	  				});
  			},error:function(){
  				swal('질문수정이 실패하였습니다.');
  			}
  		});
		
	});
	//qna삭제
	$(".qnaDelete").click(function(){
		swal({
			title: "질문/답변 삭제",
			text: "선택하신 질문을 삭제하시겠습니까?",
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
			var num = $(this).next().val();
			if(result){
				$.ajax({
					url: "/gachi/qnaDelete",
					data: "num="+num,
					type: "GET",
					success: function(result){
						if(result>0){
							swal({
								title: "완료",
								text: "질문삭제가 완료되었습니다!",
								icon: "success",
								closeOnClickOutside: false,
								buttons: {
									confirm : {
										text: "확인",
										value: true,
										className: "btn btn-outline-light"
									}
								}
							}).then((result)=>{
								location.reload();
							});
						}
					}, error: function(){
						console.log("질문 삭제 실패");
					}
				});
			}
		});			
	});	  	
  	reviewMoreContent();
  	qnaMoreContent();
});
//ckeditor
function CKupdate(){
	for(instance in CKEDITOR.instances){
		CKEDITOR.instances[instance].updateElement();
	}
}
</script>
<div class="container cfont">
	<div class="row">
		<!-- bxslide -->
		<div id="carouselExampleIndicators" class="carousel slide col-sm-6" data-interval="3000"
			data-ride="carousel" >
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
					
				<c:if test="${ bxImg !=null and bxImg !=''}">
				<c:set var="ii" value="0"/>		
					<c:forEach var="img" items="${bxImg }">			
							<c:set var="ii" value="${ii+1 }"/>						
							<li data-target="#carouselExampleIndicators" data-slide-to="${ii}"></li>
					</c:forEach>
				</c:if>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/gachi/upload/storeImg/${vo.goods_img1 }" class="d-block w-100">
				</div>
				<c:forEach var="img" items="${bxImg }">
					<div class="carousel-item">
						<img src="/gachi/upload/storeImg/${img }" class="d-block w-100">
					</div>
				</c:forEach>				
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
			<span class="badge badge-info" style="font-size:0.9em;  margin-bottom: 10px;">${vo.category }</span><br/>
			<h3>${vo.goods_name } </h3><br/>
			<p style=" margin-bottom: 10px;">재고 &nbsp; ${vo.stock }개</p><br/>
			<p style="font-size: 1.2em; margin-bottom: 10px;">가격 &nbsp; 
			<fmt:formatNumber value="${vo.real_price }" pattern="#,###"/>원</p><br/>
			<hr/>
			<span>적립금 &nbsp; ${vo.stack }원 
			<i class="far fa-heart fa-lg" style="float: right; height: 15px; color: red;" data-name="${vo.code }">${vo.good }</i>
			</span>
			<input type="hidden" value="${vo.code }" id="cartCode"/>
			<c:if test="${goodVo.code eq vo.code }">
				<script>
				$('i[data-name=${vo.code }]').attr('class', 'fas fa-heart fa-lg');
				</script>
			</c:if>
			<br/>
			<p><p/>
			<div>
				<button id="userCart" class="btn btn-outline-light" style="height:60px; width:100%; border:1px solid lightblue; background-color:lightblue; font-size: 18px; float: left;">장바구니 담기</button>
			</div>
		</div>
		<!-- 설명글 -->
		<h4 style="margin-top:10px; padding-left:10px;">상품소개글</h4>
		<div class="col-sm-12" style="min-height: 300px; background-color: #eee; text-align: center;" id="detail-info">
			<img src="/gachi/upload/storeImg/${vo.goods_info }"/>
		</div>

		<!-- 스토어 리뷰 -->
		<div id="myclassReview">
			<label>후기</label>
			<button type="button" class="btn btn-outline-light"
				data-toggle="modal" data-target="#reviewModal" id="myclassReviewFrm">후기작성</button>
			<hr style="background: #000" />
			<c:choose>
				<c:when test="${empty reviewList}">
					<div
						style="height: 100px; width: 100%; line-height: 100px; text-align: center; background-color: #eee">
						첫 번째로 후기를 남겨주세요 :)</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="r" items="${reviewList }">
						<ul class="reviewMoreContent">
							<li>
							<div id="myclassStars${r.num }" data-score="${r.grade }" data-num="${r.num }"  data-score-name="teacher[teacher_categories][0][value]"></div>
							<script>
							$('#myclassStars${r.num }').raty({
								score : ${r.grade },
								path : "img/starImages",
								width : "100%",
								readOnly : true,
								space : false});
							</script>
							</li>
							<li>${r.subject }</li>
							<li>${r.nickname }</li>
							<li>${r.writedate }
							<!-- 수정 삭제 -->
								<c:choose>
									<c:when test="${sessionScope.userid eq r.userid }">
										<a href="#" class="reviewUpdate" style="margin:0 5px" data-toggle="modal" data-target="#reviewModal" data-num="${r.num }">수정	</a>
		                  				<a href="#" class="storeReviewDelete" style="margin:0 5px">삭제</a>		
									</c:when>
								</c:choose>							
							</li>
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

		<!-- ================================= 스토어 질문답변 ================================= -->
		<div id="myclassQna">
			<label>질문&amp;답변</label>
			<div id="myclassQnaSearch">
				<button type="button" class="btn btn-outline-light"
					data-toggle="modal" data-target="#exampleModal" id="myclassQnaFrm">질문작성</button>
			</div>
			<hr style="background: #000" />
			<c:choose>
				<c:when test="${empty qnaList }">
					<div
						style="height: 100px; width: 100%; line-height: 100px; text-align: center; background-color: #eee">
						첫 번째로 질문을 남겨주세요 :)</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="qna" items="${qnaList }">
						<ul class="qnaMoreContent">
							<li><label class="badge badge-light">Q</label><span>${qna.subject }</span></li>
							<li>${qna.nickname }</li>
							<li>${qna.writedate }
							<!-- 수정 삭제 -->
								<c:choose>
									<c:when test="${sessionScope.userid eq qna.userid }">
										<a href="#" class="qnaUpdate" style="margin:0 5px" data-toggle="modal" data-target="#exampleModal" data-num="${r.num }">수정	</a>
		                  				<a href="#" class="qnaDelete" style="margin:0 5px">삭제</a>
		                  				<input type="hidden" value="${qna.num }"/>	
									</c:when>
								</c:choose>
							</li>
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
					<!-- 클래스코드, 제목, 내용 -->
					<input type="hidden" value="${vo.code }" name="code" />
					<div>
						만족도 <span class="classRating"></span>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">제목</label> <input
							type="text" class="form-control" id="reviewSubject"
							name="subject">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">내용</label>
						<textarea class="form-control" id="reviewContent" name="content"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="reviewForm">등록</button>
				<button type='button' class='btn btn-primary' id='reviewUpdateForm'>수정</button>
				<input type="hidden" id="numInput"/>
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
							type="text" class="form-control" id="qnaSubject" name="subject">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">내용</label>
						<textarea class="form-control" id="qnaContent" name="content2"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="qnaForm">등록</button>
				<button type='button' class='btn btn-primary' id='qnaUpdateForm' >수정</button>
				<input type="hidden" id="numInputQna"/>
			</div>
		</div>
	</div>
</div>