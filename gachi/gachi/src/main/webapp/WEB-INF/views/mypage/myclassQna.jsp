<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/* 클래스 질문 */
	
</style>
<script>
	$(function(){
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
									location.href = "/gachi/myclassQna";
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
			<label style="color:gray">내 학습표 ></label>
			<label style="font-size:1.1em"><b>질문/답변</b></label>
			<hr class="userHr"/>
			<div style="text-align:right">
				<button type="button" class="btn btn-light btn-sm" data-toggle="modal" data-target="#myclassReviewModal">질문작성</button>
				<select>
					<option>질문최신순</option>
					<option>답변최신순</option>
				</select>
				<select>
					<option>전체</option>
					<option>답변완료</option>
					<option>미답변</option>
				</select>
			</div>
			<c:forEach var="vo" items="${list }">
				<p><b>${vo.class_name }</b>
				<c:if test="${vo.answer ne null }"><label class="badge badge-pill badge-primary" style="margin:0 5px;font-size:0.9em">답변완료</label></c:if>
				<c:if test="${vo.answer eq null }"><label class="badge badge-pill badge-secondary" style="margin:0 5px;font-size:0.9em">미답변</label></c:if></p>
		        <div class="card" style="margin-bottom:50px">
		        	<div class="row no-gutters">
		            	<div class="col-3" style="margin:auto 0">
		                	<img src="upload/classImg/${vo.class_img }" alt="" class="card-img"/>
		                </div>
		            	<div class="col-9">
		                	<div class="card-body">
		                  		<p class="card-text">
		                  			<div>
		                  				<div style="padding:15px;border:2px solid #71a0c8;border-radius:1em"><b>${vo.subject }</b> 
		                  				<div style="margin:10px;font-size:0.9em">${vo.content }</div>
		                  				<div style="text-align:right"><label class="badge badge-pill badge-light">${vo.writedate }</label>
		                  				<a href="#" style="font-size:0.9em;margin:0 5px">수정</a>
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
<!-- Modal -->
<div class="modal fade" id="myclassReviewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
      </div>
      <div class="modal-body">
        Modal 내용
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>