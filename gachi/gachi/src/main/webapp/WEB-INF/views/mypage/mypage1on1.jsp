<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 질문,문의 */
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">내 활동 ></label>
			<label style="font-size:1.1em"><b>1:1문의</b></label>
			<hr class="userHr"/>
			<div style="text-align:right">
				<button type="button" class="btn btn-light btn-sm" data-toggle="modal" data-target="#myclassReviewModal">문의하기</button>
				<select>
					<option>분류</option>
					<option>사이트 이용</option>
					<option>주문/결제</option>
					<option>배송</option>
					<option>클래스</option>
					<option>기타</option>
				</select>
				<select>
					<option>전체</option>
					<option>답변완료</option>
					<option>미답변</option>
				</select>
			</div>
			<p><b>사이트 이용</b><label class="badge badge-pill badge-primary" style="margin:0 5px;font-size:0.9em">답변완료</label></p>
	        <div class="card" style="margin-bottom:50px">
               	<div class="card-body">
                 		<p class="card-text">
                 			<div>
                 				<div style="padding:15px;border:2px solid #71a0c8;border-radius:1em"><b>질문입니다.</b> 
                 				<div style="margin:10px;font-size:0.9em">입문자도 충분히 가능한가요?? 난이도가 어느정도인지 궁금합니다.</div>
                 				<div style="text-align:right"><label class="badge badge-pill badge-light">20/11/15</label><a href="#" style="font-size:0.9em;margin:0 5px">수정</a><a href="#"style="font-size:0.9em;margin:0 5px">삭제</a></div></div>
	                  		<div style="margin-left:10%;width:90%;margin-top:3%;padding:15px;height:100px;background:#e3eef6;border-radius: 1em;">
	                  			<div><b style="font-size:0.9em">같이가치</b> <label class="badge badge-pill badge-light" style="float:right">20/11/16</label></div>
	                  			<div style="font-size:0.9em">네, 처음 시작하시는 분들도 무리없이 따라오시는 난이도의 수업입니다 :)</div>
                  			</div>
                  		</div>
                    </p>
                  </div>
	        </div>
	        <p><b>배송</b><label class="badge badge-pill badge-secondary" style="margin:0 5px;font-size:0.9em">미답변</label></p>
	        <div class="card">
               	<div class="card-body">
                 		<p class="card-text">
                 			<div>
                 				<div style="padding:15px;border:2px solid #71a0c8;border-radius:1em"><b>질문입니다.</b> 
                 				<div style="margin:10px;font-size:0.9em">입문자도 충분히 가능한가요?? 난이도가 어느정도인지 궁금합니다.</div>
                 				<div style="text-align:right"><label class="badge badge-pill badge-light">20/11/15</label><a href="#" style="font-size:0.9em;margin:0 5px">수정</a><a href="#"style="font-size:0.9em;margin:0 5px">삭제</a></div></div>
                  		</div>
                    </p>
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