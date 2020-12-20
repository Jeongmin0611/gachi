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
		
		//qna작성
		$("#myclassQnaFrm").click(function(){
			$("select[name=code]").parent().css("display","block");
			$("#qnaForm").css("display","block");
			$("#qnaUpdateForm").css("display","none");
		});
	  	$('#qnaForm').click(function(){
	  		if($('#qnaSubject').val()==null || $('#qnaSubject').val()==''){
	  			swal('제목을 입력해주세요');
	  			return false;	
	  		}
	  		if(CKEDITOR.instances.qnaContent.getData()==null || CKEDITOR.instances.qnaContent.getData()==''){
	  			swal('내용을 입력해주세요');
	  			return false;
	  		}
	  		
	  		$.ajax({
	  			type:"POST",
	  			url:"/gachi/qnaFormOk",
	  			data:{	  				
	  				code: $("select[name=code]").val(),
	  				subject: $('#qnaSubject').val(),
	  				content: CKEDITOR.instances.qnaContent.getData()},
	  			success:function(){
	  				swal({
		  				  title: "질문이 등록 되었습니다.",
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
	  	
		//수정
		$(".qnaUpdate").click(function(){
			$("#qnaSubject").val($(this).prev().prev().val());
			CKEDITOR.instances.qnaContent.setData($(this).prev().val());
			$("select[name=code]").parent().css("display","none");
			$("#qnaForm").css("display","none");
			$("#qnaUpdateForm").css("display","block");
			$("#numInput").val($(this).next().val());
		});	
		$("#qnaUpdateForm").click(function(){
			if($('#qnaSubject').val()==null || $('#qnaSubject').val()==''){
	  			swal('제목을 입력해주세요');
	  			return false;
	  		}
	  		if(CKEDITOR.instances.qnaContent.getData()==null || CKEDITOR.instances.qnaContent.getData()==''){
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
	  				content: CKEDITOR.instances.qnaContent.getData()},
	  			success:function(){
	  				swal({
		  				  title: "질문이 수정 되었습니다.",
		  				  icon: "success",
		  				  buttons: true
		  				}).then((result)=>{
		  					location.href = location.href;
		  				});
	  			},error:function(){
	  				swal('질문수정이 실패하였습니다.');
	  			}
	  		});
			
		});
		//삭제
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
				var num = $(this).prev().val();
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
									location.href = "/gachi/mypageStoreQna";
								});
							}
						}, error: function(){
							console.log("질문 삭제 실패");
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
			<label style="font-size:1.1em"><b>질문/답변</b></label>
			<hr class="userHr"/>
			<div style="text-align:right">
				<button type="button" id="myclassQnaFrm" class="btn btn-light" data-toggle="modal" data-target="#exampleModal">질문작성</button>
			</div>
			<c:if test="${empty list }">
				<div style="text-align:center"><img src="/gachi/img/icon_eventReply.png" style="width:10%;margin:40px 0"/>
					 <h4>아직 작성한 질문이 없습니다.</h4>
				</div>
			</c:if>
			<c:forEach var="vo" items="${list }">
				<p><b>${vo.goods_name }</b>
				<c:if test="${vo.answer ne null }"><label class="badge badge-pill badge-primary" style="margin:0 5px;font-size:0.9em">답변완료</label></c:if>
				<c:if test="${vo.answer eq null }"><label class="badge badge-pill badge-secondary" style="margin:0 5px;font-size:0.9em">미답변</label></c:if></p>
		        <div class="card" style="margin-bottom:50px">
		        	<div class="row no-gutters">
		            	<div class="col-3" style="margin:auto 0">
		                	<img src="/gachi/upload/storeImg/${vo.goods_img1 }" alt="" class="card-img"/>
		                </div>
		            	<div class="col-9">
		                	<div class="card-body">
		                  		<p class="card-text">
		                  			<div>
		                  				<div style="padding:15px;border:2px solid #71a0c8;border-radius:1em"><b>${vo.subject }</b> 
		                  				<div style="margin:10px;font-size:0.9em">${vo.content }</div>      
		                  				<div style="text-align:right"><label class="badge badge-pill badge-light">${vo.writedate }</label>
		                  				<input type="hidden" value="${vo.subject }"/>
		                  				<input type="hidden" value="${vo.content }"/>
		                  				<a href="#" class="qnaUpdate" style="font-size:0.9em;margin:0 5px" data-toggle="modal" data-target="#exampleModal">수정</a>
		                  				<input type="hidden" value="${vo.num }"/>
		                  				<a href="#" class="qnaDelete" style="font-size:0.9em;margin:0 5px">삭제</a></div></div>
				                  		<c:if test="${vo.answer ne null }">
					                  		<div style="margin-left:10%;width:90%;margin-top:3%;padding:15px;background:#e3eef6;border-radius: 1em;">
					                  			<div><b style="font-size:0.9em">${vo.nickname }</b> <label class="badge badge-pill badge-light" style="float:right">${vo.answer_writedate }</label></div>
					                  			<div style="font-size:0.9em">${vo.answer }</div>
				                  			</div>
			                  			</c:if>
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
<!-- Qna 등록모달 -->
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
				<div>
					<select name="code">
						<option value="">상품 선택</option>
						<c:forEach var="vo" items="${gList }">
							<option value="${vo.code }">${vo.goods_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="recipient-name" class="col-form-label">제목</label> 
					<input type="text" class="form-control" id="qnaSubject" name="subject" style="text-align:left">
				</div>
				<div class="form-group">
					<label for="message-text" class="col-form-label">내용</label>
					<textarea class="form-control" id="qnaContent" name="content"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type='button' class='btn btn-primary' id='qnaForm'>등록</button>
				<button type='button' class='btn btn-primary' id='qnaUpdateForm'>수정</button>
				<input type="hidden" id="numInput"/>
			</div>
		</div>
	</div>
</div>