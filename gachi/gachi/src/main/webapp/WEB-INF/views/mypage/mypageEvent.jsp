<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 질문,문의 */
	
</style>
<script>
	$(function(){
		$(".eventReplyDelete").click(function(){
			swal({
				title: "댓글 삭제",
				text: "선택하신 댓글을 삭제하시겠습니까?",
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
				var reply_num = $(this).prev().val();
				if(result){
					$.ajax({
						url: "/gachi/eventReplyDelete",
						data: "reply_num="+reply_num,
						type: "GET",
						success: function(result){
							if(result>0){
								swal({
									title: "완료",
									text: "댓글 삭제가 완료되었습니다!",
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
									location.href = location.href;
								});
							}
						}, error: function(){
							console.log("댓글 삭제 실패");
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
			<label style="font-size:1.1em"><b>이벤트</b></label>
			<hr class="userHr"/>
			<c:forEach var="vo" items="${list }">
				<input type="hidden" value="${vo.reply_num }"/>
				<p><a href="/gachi/eventBoard"><b>${vo.subject }</b></a></p>
		        <div class="card" style="margin-bottom:50px">
		        	<div class="row no-gutters">
		            	<div class="col-3" style="margin:auto 0">
		                	<a href="/gachi/eventBoard"><img src="/gachi/img/board/${vo.event_img }" style="object-fit: cover;height:150px" alt="" class="card-img" /></a>
		                </div>
		            	<div class="col-9">
		                	<div class="card-body">
		                  		<p class="card-text">
		                  			<div>
		                  				<div style="padding:15px;border:2px solid #71a0c8;border-radius:1em">
		                  				<div style="margin:10px;font-size:0.9em">${vo.content }</div>
		                  				<div style="text-align:right"><label class="badge badge-pill badge-light">${vo.writedate }</label>
		                  				<input type="hidden" value="${vo.reply_num }"/>
		                  				<a href="#" class="eventReplyDelete" style="font-size:0.9em;margin:0 5px">삭제</a></div></div>
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