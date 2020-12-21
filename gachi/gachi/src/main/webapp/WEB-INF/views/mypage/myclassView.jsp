<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	
	/* 클래스 보기 */
	
	#myclassView div{
		
	}

	/* 클래스썸네일 */
	#myclassView img{
		width:400px;
		height:300px;
		object-fit:cover;
	}
	
	/* 클래스 목차 */
	ol>li{
		list-style-type:decimal;
	}
	#myclassVideoLst label{
		font-size:1.3em;
	}
	#myclassVideoLst ul{
		overflow:auto;
		margin-bottom:50px;
	}
	#myclassVideoLst>ul>li>label{
		padding:0 20px;
		color:#fff;
		width:100%;
		background-color:#116487;
	}
	#myclassVideoLst ol>li{
		line-height:20px;
		margin:20px 0;
	}
	#myclassVideoLst ol>li:last-child{
		margin-bottom:40px;
	}
	#myclassVideoLst ol label{
		float:right;
		color:gray;
		font-size:1em;
		margin-right:20px;
	}
	
	/* 수강후기 */
	#myclassReview{
		margin-bottom:50px;
		overflow:auto;
	}
	#myclassReview ul{
		overflow:auto;
	}
	#myclassReview>label{
		font-size:1.3em;
	}	
	#myclassReview>button{
		float:right;
		background-color:#ABCEE3;
	}	
	#myclassReview li{
		float:left;
		text-align:center;
		padding:0 10px;
	}
	#myclassReview li:first-child{
		color:#F4BFA9;
	}
	#myclassReview li:nth-child(2){
		text-align:left;
		font-weight:bold;
		color:gray;
	}
	#myclassReview li:nth-child(3),
	#myclassReview li:nth-child(4){
		font-size:0.8em;
	}
	#myclassReview li:last-child{
		width:100%;
		text-align:left;
		padding:15px;
	}
	
	#myclassReviewPg a{
		color:#ABCEE3;
		margin-bottom:50px;
	}
	
	/* 질문게시판 */
	#myclassQna{
		margin-bottom:50px;
		overflow:auto;
	}
	#myclassQna>ul{
		overflow:auto;
		margin-bottom:20px;
		border:3px solid #eee;
		padding:15px;
	}
	#myclassQna>label{
		font-size:1.3em;
	}
	#myclassQnaSearch{
		float:right;
	}
	#myclassQnaSearch input{
		border:none;
		outline:none;
		border-bottom:1px solid #000;
	}
	#myclassQnaSearch button:nth-child(2){
		background-color:#eee;
		color:#000;
	}
	#myclassQnaFrm{
		background-color:#ABCEE3;
	}	
	#myclassQna li{
		float:left;
		text-align:center;
		padding:0 10px;
	}
	#myclassQna>ul>li:first-child{
		float:left;
		text-align:left;
		padding:0 15px;
		font-weight:bold;
		color:gray;
	}
	#myclassQna>ul>li:first-child>label{
		font-size:1em;
		color:#F4BFA9;
		font-weight:bold;
		margin-right:10px;
	}
	#myclassQna li:nth-child(2),
	#myclassQna li:nth-child(3){
		font-size:0.8em;
	}
	#myclassQna li:nth-child(4){
		width:100%;
		text-align:left;
		padding:0 15px;
	}
	#myclassQna>ul>li:last-child{
		padding:10px;
	}
	#myclassQna>ul>li:last-child label{
		font-size:1em;
		color:#ABCEE3;
		font-weight:bold;
		margin-right:10px;
	}
	#myclassQna li:last-child{
		width:100%;
		text-align:left;
		float:left;
		padding:0 10px;
	}
	#myclassQna>ul>li>ul>li:last-child{
		font-size:1em;
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

	//스크롤이동
	function moveToReview(){
		var locaR = document.querySelector("#myclassReview").offsetTop;
		window.scrollTo({top:locaR, behavior:'smooth'});
	}
	function moveToQna(){
		var locaQ = document.querySelector("#myclassQna").offsetTop;
		window.scrollTo({top:locaQ, behavior:'smooth'});
	}
	//ckeditor
	function CKupdate(){
		for(instance in CKEDITOR.instances){
			CKEDITOR.instances[instance].updateElement();
		}
	}
	//초를 시분초로
	function getTimeStringSeconds(seconds){
		var hour, min, sec
		hour = parseInt(seconds/3600);
		min = parseInt((seconds%3600)/60);
		sec = seconds%60;

		if (hour.toString().length==1) hour = "0" + hour;
		if (min.toString().length==1) min = "0" + min;
		if (sec.toString().length==1) sec = "0" + sec;
		
		if(hour=="00"){
			return min + ":" + sec;
		}else{
			return hour + ":" + min + ":" + sec;
		}
	}
	$(function(){
		CKEDITOR.replace('content', {
			//allowedContent:true,
			toolbar :[['Bold','Italic','-','Image','Smiley','SpecialChar']]
			//,imageUploadUrl:'/gachi/clientImgUpload',
			//extraPlugins:'uploadimage'
				
		});
		CKEDITOR.replace('content2', {
			toolbar :[['Bold','Italic','-','Image','Smiley','SpecialChar']]
		});
		//세션의 아이디 가져오기
    	var id = '<%=(String) session.getAttribute("userid")%>';
	    //평점에 별넣기 https://www.wbotelhos.com/raty 참고
		var point=5;
		$(".classRating").raty({
			score : 5,
			path : "img/starImages",
			half : true,
			width : "100%",
			space : false,
			click: function(score, evt) {
                point = score
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
	  				  title: "수강평이 등록 되었습니다.",
	  				  icon: "success"
	  				}).then((result)=>{
						location.href = location.href;
					});
	  			},error:function(){
	  				swal('수강평 등록이 실패하였습니다. ');
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
	  			url:"/gachi/reviewUpdateFormOk",
	  			data:{
	  				subject : $('#reviewSubject').val(),
	  				content:$('#reviewContent').val(),
	  				grade: point,
	  				num: $(this).next().val()
	  			},
	  			success:function(){
	  				swal({
	  				  title: "수강평이 수정 되었습니다.",
	  				  icon: "success",
	  				  buttons: true
	  				}).then((result)=>{
	  					location.reload();
	  				});
	  			},error:function(){
	  				swal('수강평 수정이 실패하였습니다. ');
	  			}
	  			
	  		});
	  	});
		//리뷰 삭제
		$(".classReviewDelete").click(function(){
			swal({
				title: "수강평 삭제",
				text: "선택하신 수강평을 삭제하시겠습니까?",
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
						url: "/gachi/classReviewDelete",
						data: "num="+num,
						type: "GET",
						success: function(result){
							if(result>0){
								swal({
									title: "완료",
									text: "삭제가 완료되었습니다!",
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
							console.log("수강평 삭제 실패");
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
	  				$('.qnaMoreContent').
	  				console.log("성공= "+result);
	  			},error:function(error){
	  				console.log("에러"+error);
	  			}
	  		})
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
		$(".video_length").each(function(){
			$(this).text(getTimeStringSeconds($(this).text()));
		});
	  	reviewMoreContent();
	  	qnaMoreContent();
	});

</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<jsp:useBean id="toDay" class="java.util.Date"/>
			<fmt:parseDate var="enddate" value="${vo.enddate }" pattern="yyyy.MM.dd"/>
			<fmt:parseNumber value="${toDay.time/(1000*60*60*24) }" integerOnly="true" var="nowDate" scope="request"/>
			<fmt:parseNumber value="${enddate.time/(1000*60*60*24) }" integerOnly="true" var="endDate" scope="request"/>
		<div class="row">
			<div class="col-md-6" style="padding:20px 50px"><img src="upload/classImg/${vo.class_img }" style="width:100%;border-radius:1em"/></div>
			<div class="col-md-6 myclassView" style="padding:20px 50px">
				<div><label class="badge badge-info" style="font-size:0.9em">${vo.category }</label><h4>${vo.class_name }
					<c:if test="${vo.progress eq 100 }"><label class="badge badge-pill badge-primary" style="margin-left:10px;font-size:0.7em">수강완료</label></c:if>
					<c:if test="${endDate lt nowDate}"><label class="badge badge-pill badge-secondary" style="margin-left:10px;font-size:0.7em">기간만료</label></c:if>
					</h4></div>
				<div>${vo.nickname }</div>
				<div><label>진도율 : <fmt:formatNumber value="${vo.progress }" pattern=".00" />%</label></div>
				<div><label>기한 : ${vo.startdate } ~ ${vo.enddate }</label></div>
				<c:if test="${vo.progress eq 0 }">
					<div class="progress" style="height:30px;margin-bottom:10px"><div class="progress-bar progress-bar-striped bg-info" style="width:${vo.progress}%">${vo.progress }%</div></div>
				</c:if>
				<c:if test="${vo.progress ne 0 }">
					<div class="progress" style="height:30px;margin-bottom:10px"><div class="progress-bar progress-bar-striped bg-info" style="width:${vo.progress}%"><fmt:formatNumber value="${vo.progress }" pattern=".00" />%</div></div>
				</c:if>
				<c:if test="${endDate ge nowDate}">
					<div><button type="button" class="btn btn-light btn-block" onclick="location.href='/gachi/myclassVideo?code=${code}&video_code=${firstVideo }'">수강하기</button></div>
				</c:if>
				<c:if test="${endDate lt nowDate}">
					<div><button type="button" class="btn btn-secondary btn-block" disabled>수강기간만료</button></div>
				</c:if>
				<div style="margin:10px 0">
					<button type="button" class="btn btn-light" style="width:50%" onclick="moveToReview()">수강후기</button>
					<button type="button" class="btn btn-light" style="width:50%;float:right" onclick="moveToQna()">질문&답변</button>
				</div>
			</div>
		</div>
		<div id="myclassVideoLst">
			<label>클래스 목차</label>
			<hr style="background:#000"/>
			<ul>
				<c:forEach var="map" items="${map}">
					<li>
						<label>${map.key }</label>
						<ol>
							<c:forEach var="list" items="${map.value }">
								<li><a href="/gachi/myclassVideo?code=${list.code }&video_code=${list.video_code }">${list.video_name }<label class="video_length">${list.video_length }</label></a></li>
							</c:forEach>
						</ol>
					</li>
				</c:forEach>
			</ul>
		</div>
		
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
		                  				<a href="#" class="classReviewDelete" style="margin:0 5px">삭제</a>		
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


		<!-- ================================= 클래스 질문답변 ================================= -->
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
									<li><label class="badge badge-light">A</label>
										${qna.writer }
									</li>
									
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
			</div>
		</div>
	</div>
</div>