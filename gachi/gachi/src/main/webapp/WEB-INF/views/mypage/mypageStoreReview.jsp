<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 질문,문의 */
	
</style>
<script>
	$(function(){
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
				<button type="button" class="btn btn-light btn-sm" data-toggle="modal" data-target="#myclassReviewModal">리뷰작성</button>
			</div>
			<p><b>사랑스러운 고양이 색연필 초상화</b></p>
	        <div class="card">
	        	<div class="row no-gutters">
	            	<div class="col-3" style="margin:auto 0">
	                	<img src="/gachi/img/artEx/artEx01.PNG" alt="" class="card-img" />
	                </div>
	            	<div class="col-9">
	                	<div class="card-body">
	                  		<p class="card-text">
	                  			<div>
	                  				<div style="padding:15px;border:2px solid #71a0c8;border-radius:1em"><b style="float:left;margin-right:10px">정말 마음에 들어요~</b><div class="myclassStars"></div>
	                  				<div style="margin:10px;font-size:0.9em">첫 프랑수자수 작품으로 골랐는데 매우 만족스럽습니다 꽃자수가 너무 예쁘고 파스텔톤 하늘색인 것도 마음에 듭니다!</div>
	                  				<div style="text-align:right"><label class="badge badge-pill badge-light">20/11/15</label>
	                  				<a href="#" style="font-size:0.9em;margin:0 5px">수정</a><a href="#"style="font-size:0.9em;margin:0 5px">삭제</a></div></div>
		                  		</div>
		                    </p>
	                   </div>
	                </div>
	            </div>
	        </div>
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