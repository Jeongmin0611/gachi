<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.carousel-item img {
	width: 100%;
}
/* 탭 메뉴 */
/*
#storeViewTab{
	position: fixed;
    top: 105px;
    left: 0;
    width: 100%;
    background: #FFFFFF;
}
*/
#storeViewTab{
	margin-top:10px;
	width: 100%;
}
#storeViewTab ul{
	border-bottom: 1px solid #eee;
	text-align:center;
}
#storeViewTab li{
	float:left;
	width:33%;
	margin: 0 0 -1px -1px;
    border: 1px solid #eaeaea;
    border-bottom: 1px solid #FFFFFF;
    border-top: 2px solid #3d4248;
}
#storeViewTab li>a{
	color: black;
}
/*상품소개글*/
#detail-info img{
	width: 100%;
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
#myclassQna {
	margin-bottom: 50px;
	overflow: auto;
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
$(function() {
	//textarea에 ckeditor편집기 적용. name속성값		
	var editor=CKEDITOR.replace('message-text', {
		allowedContent:true,
		toolbar :[['Bold','Italic','-','Image','Smiley','SpecialChar'],
			'/',['Styles','Format','Font','FontSize']],
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
	var id = '<%=(String)session.getAttribute("userid")%>'; 

	//모달창 띄우기(수강평)
    $("#myclassReviewFrm").click(function(){
		$("#myclassModalR").css({
           "top": (($(window).height()-$("#myclassModalR").outerHeight())/2+$(window).scrollTop())+"px",
           "left": (($(window).width()-$("#myclassModalR").outerWidth())/2+$(window).scrollLeft())+"px"
           //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
        
        });
        $("#myclassModalR").fadeIn();
    });
    $("#myclassReviewWrite, .myclassModal_layer").click(function(){
       $("#myclassModalR").fadeOut();
    });  
  //모달창 띄우기(질문)
    $("#myclassQnaFrm").click(function(){
		$("#myclassModalQ").css({
           "top": (($(window).height()-$("#myclassModalQ").outerHeight())/2+$(window).scrollTop())+"px",
           "left": (($(window).width()-$("#myclassModalQ").outerWidth())/2+$(window).scrollLeft())+"px"
           //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
        
        });
        $("#myclassModalQ").fadeIn();
    });
    $("#myclassQnaWrite, .myclassModal_layer").click(function(){
       $("#myclassModalQ").fadeOut();
    });  
    
    //평점에 별넣기 https://www.wbotelhos.com/raty 참고
    $(".classRating").raty({
    		score:5,
    		path:"img/starImages",
    		half:true,
    		width:"100%",
    		space:false
    });
    $(".myclassStars").raty({
		score:5,
		path:"img/starImages",
		half:true,
		width:"100%",
		readOnly:true,
		space:false
		});
  //좋아요 클릭이벤트
	$('i').on('click',function(){
		var id = '<%=(String)session.getAttribute("userid")%>';
		if(id==null ||id =='null'){
			swal('로그인 후 이용가능한 기능입니다.');
			return false;
		}
		if(id!=null){
			var good_choice_code;
			var atr = $(this).attr('class');
			if (atr=='far fa-heart fa-lg'){
				$(this).attr('class','fas fa-heart fa-lg');
				good_choice_code=$(this).attr('id');
				location.href="/gachi/storeView?code="+good_choice_code+"&good_add="+good_choice_code;
			}else if(atr=='fas fa-heart fa-lg'){
				$(this).attr('class','far fa-heart fa-lg');				
				good_choice_code=$(this).attr('id');
				location.href="/gachi/storeView?code="+good_choice_code+"&good_del="+good_choice_code;
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
  	});
  	reviewMoreContent();
  	qnaMoreContent();
});
	function purchase(){
		location.href="/gachi/purchase";
	};
</script>
<div class="container cfont">
	<div class="row">
		<!-- bxslide -->
		<div id="carouselExampleIndicators" class="carousel slide col-sm-6" data-interval="3000"
			data-ride="carousel" >
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/gachi/img/store/${vo.goods_img1 }" class="d-block w-100">
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
			<span class="badge badge-info" style="font-size:0.9em">${vo.category }</span><br/>
			<h3>${vo.goods_name } </h3><br/>
			재고 &nbsp; ${vo.stock }개<br/>
			가격 &nbsp; ${vo.real_price }원<br/>
			적립금 &nbsp; ${vo.stack }원 
			<i class="far fa-heart fa-lg" style="float: right; height: 15px; color: red;" id="${vo.code }"></i>
			<input type="hidden" value="${vo.code }" id="cartCode"/>
			<c:if test="${goodVo.code eq vo.code }">
				<script>
					$('#${vo.code}').attr('class','fas fa-heart fa-lg');
				</script>
			</c:if>
			<br/>
			<p><p/>
			<button id="userCart" style="height:40px; width:50%; border:1px solid lightblue; background-color:white; float: left;">장바구니 담기</button>
			<button style="height:40px; width:50%; border:1px solid lightblue; background-color: lightblue;" onclick="purchase()">구매</button>
		</div>
		<div id="storeViewTab">
			<ul>
				<li><a href="#detail-info">상품소개글</a></li>
				<li><a href="#detail-qna">문의 작성</a></li>
				<li><a href="#detail-review">상품 리뷰</a></li>
			</ul>
		</div>
		<!-- 설명글 -->
		<h4 style="margin-top:10px; padding-left:10px;">상품소개글</h4>
		<div class="col-sm-12" style="min-height: 300px; background-color: #eee; text-align: center;" id="detail-info">
			<img src="/gachi/img/store/${vo.goods_info }"/>
		</div>

		<!-- 클래스 리뷰 -->
		<div id="myclassReview">
			<label>수강평</label>
			<button type="button" class="btn btn-outline-light"
				id="myclassReviewFrm">수강평작성</button>
			<hr style="background: #000" />
			<ul class="reviewMoreContent">
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>첫 프랑수자수 작품으로 골랐는데 매우 만족스럽습니다 꽃자수가 너무 예쁘고 파스텔톤 하늘색인 것도 마음에
					듭니다!</li>
			</ul>
			<hr class="reviewMoreContent"/>
			<ul class="reviewMoreContent">
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>하루만에 완성하신 분들 진짜 존경합니다. 3일동안 매달려서 간신히 완성했네요. 나뭇잎과 테두리,글씨부터
					하고 목련꽃은 마지막에 해서 모양이 많이 이상하긴 해요. ㅠㅠ 색도 중간에 힘들어서 원하는 색으로 바꿔 작업했고,
					그라데이션은 진짜 힘들었어요.ㅠㅠ</li>
			</ul>
			<hr class="reviewMoreContent"/>
			<ul class="reviewMoreContent">
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>손이 심심해서 그 전부터 배워보고 싶었던 프랑스자수를 하게 됐어요! 일단 뭐부터 시작해야할지 몰라서 하비풀
					프랑스 자수 키트 중 젤 맘에 드는 걸로 선택해서 들었는데 너무 만족스럽습니다! 배송도 빨랐고 무엇보다 완성작이 너무
					예뻐요!! 그리고 강의를 보면서 배우니까 더 손쉽게 따라할 수 있었어요. 과연 내가 할 수 있을까 싶었는데 왕초보도 강의
					설명 보면 충분히 따라할 수 있어요! 진짜 너무너무 뿌듯하고 맘에 들어요! 완성해서 엄마께 선물 드렸는데 좋아하셨어요.
					구매 왕추천합니다! :) #뿌듯챌린지</li>
			</ul>
			<hr class="reviewMoreContent"/>
			<ul class="reviewMoreContent">
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>조금 실수한 부분도 있었지만 만들고 나니 이쁘네요~ 재밌는 프랑수자수 계속 부탁해요 : )</li>
			</ul>
			<hr class="reviewMoreContent"/>
			<ul class="reviewMoreContent">
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>원래 프랑스자수 했었는데 너어무 디자인이뻐서 구매했어요:) 스티치자체는 크게 어렵지 않지만 꼼꼼하게 해야
					예뻐요~ 완성하고 나니 예쁘고 뿌듯했어요^^ 주변에서도 예쁘다고 하더라구요. 파우치 요긴하게 잘 사용 중이에요!</li>
			</ul>
			<hr class="reviewMoreContent"/>
			<div>			
				<button type="button" class="btn btn-outline-lignt" id="reviewMoreContentLoad">더보기</button>
			</div>
		</div>

		<!-- 클래스 문의 -->
		<div id="myclassQna">
			<label>질문&amp;답변</label>
			<div id="myclassQnaSearch">
				<input type="text" name="searchWord" />
				<button type="button" class="btn btn-outline-light btn-sm">검색</button>
				<button type="button" class="btn btn-outline-light"  data-toggle="modal" data-target="#exampleModal"
					id="myclassQnaFrm">질문작성</button>
			</div>
			<hr style="background: #000" />
			<ul>
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>입문자도 충분히 가능한가요?? 난이도가 어느정도인지 궁금합니다.</li>
				<li>
					<hr />
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>네 처음 시작하시는 분들도 무리없이 따라오시는 난이도의 수업입니다 :)</li>
					</ul>
				</li>
			</ul>

			<ul>
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>안녕하세요. 해당 강의 외에 입문자용 말고 초급 중급자용 강의도 있을까요?</li>
				<li>
					<hr />
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>현재 오픈 예정인 두번째 수업을 얼리버드 신청 받고있습니다. 검색창에 프랑스자수를 검색해주세요 :)</li>
					</ul>
				</li>
			</ul>

			<ul>
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>3월 26일 오픈 예정인 수업이랑 수준이 많이 다른가요? 프랑스 자수 처음인데 둘중에 어떤걸 해야할지
					고민중이라서요... 3월 오픈 예정인 강의구성이나 완성품이 탐나긴하는데 지금 당장 신청도 하고싶고!! 고민이에요 ㅎㅎ</li>
				<li>
					<hr />
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>안녕하세요 :) 두번째 수업과는 만드는 작품과 진행하는 스티치의 개수에서 차이가 있고 두 수업 모두
							처음 시작하시는 초보자 분들도 충분히 수강이 가능합니다!</li>
					</ul>
				</li>
			</ul>
		</div>

	</div>
</div>
<div id="myclassModalR" class="cfont">
	<div class="myclassModal_content">
		<label>수강평작성</label>
		<div>만족도 : </div>
		<div class="classRating"></div>
		<input type="text" placeholder="제목"/>
		<textarea placeholder="내용을 입력해주세요."></textarea>
		<button type="button" class="btn btn-outline-light btn-block" id="myclassReviewWrite">등록</button>
	</div>
	<div class="myclassModal_layer"></div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">질문작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control" id="message-text" name="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>