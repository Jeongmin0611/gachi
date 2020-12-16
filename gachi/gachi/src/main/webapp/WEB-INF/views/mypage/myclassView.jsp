<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	/* 모달 */
	#myclassModalR, 
	#myclassModalQ{
		display:none;
		position:absolute;
		width:100%;
		height:100vh;
		z-index:1;
	}
	#myclassModalR input, 
	#myclassModalR textarea, 
	#myclassModalQ input, 
	#myclassModalQ textarea{
		border:none;
		border-bottom:2px solid #ABCEE3;
		text-align:left;
		margin-top:10px;
		padding:10px;
	}
	.myclassModal_content{
		width:500px;
		height:600px;
		margin:100px auto;
		padding:20px 10px;
		background-color:#fff;
		border:3px solid #ABCEE3;
	}
	.myclassModal_content>div{
		padding:5px 10px;
	}
	.myclassModal_content>div:nth-child(2){
		float:left;
	}
	.myclassModal_content>label{
		width:100%;
		padding:10px;
		font-weight:;
		background-color:#e3eef6;
		text-align:center;
		font-size:1.3em;
	}
	.myclassModal_content input{
		width:100%;
		margin-bottom:10px;
		outline:none;
	}
	.myclassModal_content textarea{
		width:100%;
		height:300px;
		margin-bottom:30px;
		outline:none;
	}
	#myclassReviewWrite,
	#myclassQnaWrite{
		background-color:#ABCEE3;
		margin:0 auto;
		margin-top:20px;
		border:none;
	}
	#myclassQnaWrite{
		margin-top:50px;
	}
	.myclassModal_layer{
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background-color:rgba(0,0,0,0.5);
		z-index:-1;
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

	  	//질문답변 검색
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
	  	
	  	//질문답변 버튼 클릭시 로그인 확인
	  	$('#myclassQnaFrm').on('click',function(){
			  if(id == 'null'){
				swal({
					title:'로그인 후 이용가능한 기능입니다.',
					icon:"warning"});
				return false;
			  }else{
				  return true;
			  }
		  });
	  	//qna작성
	  	$('#qnaForm').click(function(){
	  		CKupdate();
	  		$.ajax({
	  			type:"POST",
	  			url:"/gachi/qnaFormOk",
	  			data:{	  				
	  				code:'${vo.code}',
	  				subject:$('#qnaSubject').val(),
	  				content:$('#qnaContent').val()},
	  			success:function(){
	  				swal('질문이 등록 되었습니다.');
	  				swal({
		  				  title: "수강평이 등록 되었습니다.",
		  				  icon: "success",
		  				  buttons: true
		  				}).then((result)=>{
							location.href = location.href;
						});
	  			},error:function(){
	  				swal('질문등록이 실패하였습니다.');
	  			}
	  		});
			
	  	});
	  	reviewMoreContent();
	  	qnaMoreContent();
	});

</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="row">
			<div class="col-md-6" style="padding:20px 50px"><img src="upload/classImg/${vo.class_img }" style="width:100%;border-radius:1em"/></div>
			<div class="col-md-6 myclassView" style="padding:20px 50px">
				<div><label class="badge badge-info" style="font-size:0.9em">${vo.category }</label><h4>${vo.class_name }</h4></div>
				<div>${vo.nickname }</div>
				<div><label>진도율 : 50%</label></div>
				<div><label>기한 : ${vo.startdate } ~ ${vo.enddate }</label></div>
				<div class="progress" style="margin:20px 0"><div class="progress-bar progress-bar-striped bg-info" style="width:50%">50%</div></div>
				<div><button type="button" class="btn btn-light btn-block" onclick="location.href='/gachi/myclassVideo'">수강하기</button></div>
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
								<li><a href="/gachi/myclassVideo?code=${list.code }&video_code=${list.video_code }">${list.video_name }<label>${list.video_length }:00</label></a></li>
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
							<script>$('#myclassStars${r.num }').raty({score : ${r.grade },
							path : "img/starImages",
							half : true,
							width : "100%",
							readOnly : true,
							space : false});</script>
							</li>
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
				<select name="searchKey" id="qnaSearchKey">
					<option value="작성자">작성자</option>
					<option value="제목">제목</option>
					<option value="내용">내용</option>
				</select> 
				<input type="text" name="searchWord" id="qnaSearchWord" />
				<button type="button" class="btn btn-outline-light btn-sm"
					id="qnaSearchBtn">검색</button>
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