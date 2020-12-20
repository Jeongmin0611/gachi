<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 질문,문의 */
	
</style>
<script>
	$(function(){
		CKEDITOR.replace('content', {
			//allowedContent:true,
			toolbar :[['Bold','Italic','-','Image','Smiley','SpecialChar']]
			//,imageUploadUrl:'/gachi/clientImgUpload',
			//extraPlugins:'uploadimage'
				
		});
		
		//평점에 별넣기 https://www.wbotelhos.com/raty 참고
		$("#classRating").raty({
				score:5,
				path:"img/starImages",
				width:"100%",
				space:false
		});
		for(i=1;i<=5;i++){
			$("."+i+"").raty({
				score:i,
				path:"img/starImages",
				width:"100%",
				readOnly:true,
				space:false
			});
		}
	
		//수강평 작성
		$("#myclassReviewFrm").click(function(){
			$("select[name=code]").parent().css("display","block");
			$("#reviewForm").css("display","block");
			$("#reviewUpdateForm").css("display","none");
		});
	  	$('#reviewForm').click(function(){
	  		if($('#reviewSubject').val()==null || $('#reviewSubject').val()==''){
	  			swal('제목을 입력해주세요');
	  			return false;
	  		}
	  		if(CKEDITOR.instances.reviewContent.getData()==null || CKEDITOR.instances.reviewContent.getData()==''){
	  			swal('내용을 입력해주세요');
	  			return false;
	  		}
	  		
	  		$.ajax({
	  			type:"POST",
	  			url:"/gachi/storeReviewFormOk",
	  			data:{
	  				code: $("select[name=code]").val(),
	  				subject : $('#reviewSubject').val(),
	  				content: CKEDITOR.instances.reviewContent.getData(),
	  				grade: $('#classRating').raty('score')
	  			},
	  			success:function(){
	  				swal({
	  				  title: "상품 리뷰가 등록 되었습니다.",
	  				  icon: "success",
	  				  buttons: true
	  				}).then((result)=>{
	  					location.href = location.href;
	  				});
	  			},error:function(){
	  				swal('리뷰 등록이 실패하였습니다. ');
	  			}
	  			
	  		});
	  	});
	  	
	  	//수정
		$(".reviewUpdate").click(function(){
			$("#reviewSubject").val($(this).prev().prev().val());
			CKEDITOR.instances.reviewContent.setData($(this).prev().val());
			$("select[name=code]").parent().css("display","none");
			$("#reviewForm").css("display","none");
			$("#reviewUpdateForm").css("display","block");
			$("#numInput").val($(this).next().next().val());
			$("#classRating").raty("score",$(this).next().val());
		});
		$('#reviewUpdateForm').click(function(){
	  		if($('#reviewSubject').val()==null || $('#reviewSubject').val()==''){
	  			swal('제목을 입력해주세요');
	  			return false;
	  		}
	  		if(CKEDITOR.instances.reviewContent.getData()==null || CKEDITOR.instances.reviewContent.getData()==''){
	  			swal('내용을 입력해주세요');
	  			return false;
	  		}
	  		
	  		$.ajax({
	  			type:"POST",
	  			url:"/gachi/storeReviewUpdateFormOk",
	  			data:{
	  				subject : $('#reviewSubject').val(),
	  				content: CKEDITOR.instances.reviewContent.getData(),
	  				grade: $('#classRating').raty('score'),
	  				num: $(this).next().val()
	  			},
	  			success:function(){
	  				swal({
	  				  title: "상품 리뷰가 수정 되었습니다.",
	  				  icon: "success",
	  				  buttons: true
	  				}).then((result)=>{
	  					location.href = location.href;
	  				});
	  			},error:function(){
	  				swal('리뷰 수정이 실패하였습니다. ');
	  			}
	  			
	  		});
	  	});	  	
	  	
		//수강평 삭제
		
		$(".goodsReviewDelete").click(function(){
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
				var num = $(this).prev().val();
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
									location.href = "/gachi/mypageStoreReview";
								});
							}
						}, error: function(){
							console.log("리뷰 삭제 실패");
						}
					});
				}
			});
			
		});
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">내 활동 ></label>
			<label style="font-size:1.1em"><b>스토어 리뷰</b></label>
			<hr class="userHr"/>
			<div style="text-align:right">
				<button type="button" class="btn btn-light" data-toggle="modal" data-target="#reviewModal" id="myclassReviewFrm">리뷰작성</button>
			</div>
			<c:if test="${empty list }">
				<div style="text-align:center"><img src="/gachi/img/icon_eventReply.png" style="width:10%;margin:40px 0"/>
					 <h4>아직 작성한 리뷰가 없습니다.</h4>
				</div>
			</c:if>
			<c:forEach var="vo" items="${list }">
				<input type="hidden" value="${vo.num }"/>
				<p><b>${vo.goods_name }</b></p>
		        <div class="card" style="margin-bottom:50px">
		        	<div class="row no-gutters">
		            	<div class="col-3" style="margin:auto 0">
		                	<img src="/gachi/upload/storeImg/${vo.goods_img1 }" alt="" class="card-img" />
		                </div>
		            	<div class="col-9">
		                	<div class="card-body">
		                  		<p class="card-text">
		                  			<div>
		                  				<div style="padding:15px;border:2px solid #71a0c8;border-radius:1em"><b style="float:left">${vo.subject }</b><div class="${vo.grade }"></div>
		                  				<div style="margin:10px;font-size:0.9em">${vo.content }</div>
		                  				<div style="text-align:right"><label class="badge badge-pill badge-light">${vo.writedate }</label>
		                  				<input type="hidden" value="${vo.subject }"/>
		                  				<input type="hidden" value="${vo.content }"/>
		                  				<a href="#" class="reviewUpdate" style="font-size:0.9em;margin:0 5px" data-toggle="modal" data-target="#reviewModal">수정</a>
		                  				<input type="hidden" value="${vo.grade }"/>
		                  				<input type="hidden" value="${vo.num }"/>
		                  				<a href="#" class="goodsReviewDelete" style="font-size:0.9em;margin:0 5px">삭제</a></div></div>
			                  		</div>
			                    </p>
		                   </div>
		                </div>
		            </div>
		        </div>
		       </c:forEach>
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
				<!-- 상품코드, 제목, 내용 -->
				<div>
				<select name="code">
						<option value="">상품 선택</option>
						<c:forEach var="vo" items="${gList }">
							<option value="${vo.code }">${vo.goods_name }</option>
						</c:forEach>
					</select>
				</div>
				만족도 <span id="classRating"></span>
				<div class="form-group">
					<label for="recipient-name" class="col-form-label">제목</label> <input
						type="text" class="form-control" id="reviewSubject"
						name="subject">
				</div>
				<div class="form-group">
					<label for="message-text" class="col-form-label">내용</label>
					<textarea class="form-control" id="reviewContent" name="content"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="reviewForm">등록</button>
				<button type='button' class='btn btn-primary' id='reviewUpdateForm'>수정</button>
				<input type="hidden" id="numInput"/>
			</div>
		</div>
	</div>
</div>