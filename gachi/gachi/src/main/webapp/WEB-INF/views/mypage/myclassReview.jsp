<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 질문,문의 */
	
	/* 내용 */
	#myqnaContent>label{
		margin:10px 30px;
		padding:5px;
		background-color:#fde9e2;
	}
	#myqnaContent a:hover{
		font-weight:bold;
	}
	/* 클래스 질문답변 */
	#myqnaClass{
		overflow:auto;
		margin-bottom:100px;
		border:3px solid #eee;
		padding:15px;
	}
	#myqnaClass li{
		float:left;
		text-align:center;
		padding:0 10px;
	}
	#myqnaClass>li:first-child{
		float:left;
		text-align:left;
		padding:0 15px;
		font-weight:bold;
		color:gray;
	}
	#myqnaClass>li:first-child>label{
		font-size:1em;
		color:#F4BFA9;
		font-weight:bold;
		margin-right:10px;
	}
	#myqnaClass li:nth-child(2),
	#myqnaClass>li:nth-child(3),
	#myqnaClass>li:nth-child(4),
	#myqnaClass>li:nth-child(5){
		font-size:0.8em;
	}
	#myqnaClass>li:nth-child(4) a{
		color:#1b3da7;
	}
	#myqnaClass>li:nth-child(5) a{
		color:#aaa;
	}
	#myqnaClass li:nth-child(6){
		float:right;
		color:#ABCEE3;
		font-weight:bold;
		font-size:1.5em;
	}
	#myqnaClass li:nth-child(7){
		width:100%;
		text-align:left;
		padding:0 15px;
	}
	#myqnaClass>li:last-child{
		padding:10px;
	}
	#myqnaClass>li:last-child label{
		font-size:1em;
		color:#ABCEE3;
		font-weight:bold;
		margin-right:10px;
	}
	#myqnaClass li:last-child{
		width:100%;
		text-align:left;
		float:left;
		padding:0 10px;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">내 학습표 ></label>
			<label style="font-size:1.1em"><b>수강평</b></label>
			<hr class="userHr"/>
			<div style="text-align:right">
				<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#myclassReviewModal">수강평작성</button>
				<select>
					<option>클래스명</option>
					<option>카모마일 프랑스 자수</option>
				</select>
			</div>
			<label><a href="/gachi/myclassView">카모마일 프랑스 자수</a></label>
			<ul id="myqnaClass">
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
				<li>답변완료</li>
				<li>입문자도 충분히 가능한가요?? 난이도가 어느정도인지 궁금합니다.</li>
				<li>
				<hr/>
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>네 처음 시작하시는 분들도 무리없이 따라오시는 난이도의 수업입니다 :)</li>
					</ul>
				</li>
			</ul>
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