<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	h3{
	 	margin:15px 0px;
	 	width:20%;
	}
	.more{
		width:80%;
		text-align: right;
	}
	#ad_goods_viewForm>li{
		height:100%;
	}
	#ad_unit_box li{
		border-bottom:1px solid gray;
		float:left;
		height:40px;
		line-height: 40px;
	}
	#ad_unit_box li:nth-child(2n+1){
		width:10%;
		text-align:center;
	}
	#ad_unit_box li:nth-child(2n){
		width:90%;
	}
</style>
<script type="text/javascript">
	function classDel(){
		if(confirm("해당 클래스를 삭제하시겠습니까?")){
			location.href='/gachi/adminClassDel?code=${vo.code}';	
		}
	}
	function updateClassState(){
		if(confirm("${vo.code} 클래스를 등록처리 하시겠습니까?")){
			location.href='/gachi/adminClassStateUpdate?code=${vo.code}';
		}
	}
	$(function(){
		CKEDITOR.replace("class_info");
		CKEDITOR.config.height=500;
		CKEDITOR.config.readOnly = true;
		$('#ad_goods_viewForm>li:first-child').css("borderRight","1px solid gray");
	});
</script>
<div class="container ad_font">
	<h1>클래스 조회</h1>
<ul id="ad_goods_viewForm">
	<li class="text-center">
		<ul>
			<li>클래스코드 ${vo.code}</li>
			<li>카테고리 ${vo.category}</li>
			<li>클래스명 ${vo.class_name}</li>
			<li>난이도 ${vo.stage}</li>
			<li>원가 ${vo.full_price}</li>
			<li>가격 ${vo.real_price}</li>
			<li>좋아요 ${vo.good}</li>
			<li>등록일 ${vo.allow}</li>
			<li>상태 ${vo.class_state}</li>
		</ul>
	</li>
	<li>
		<ul style="margin:auto; text-align: center;">
			<li>대표이미지</li>
			<li>
			<c:forEach var="imgList" items="${vo.imgList}">
				<img src="upload/classImg/${imgList}" style="width:150px;height:150px;"/>
			</c:forEach>
			</li>
		</ul>
	</li>
</ul>
<h3>클래스 상세정보</h3>
<div id="ad_goods_info">
	<textarea name="class_info">${vo.class_info }</textarea>
</div>
<h3>클래스정보</h3>
<ul class="ad_box" id="ad_unit_box">
	<c:forEach var="section" items="${sectionList}">
		<li>${section.unit}</li>
		<li>${section.unit_content}</li>
	</c:forEach>
</ul>
<h3>클래스영상정보</h3>
	<ul id="ad_video_priview" class="text-center">
		<li>동영상코드</li>
		<li>차시</li>
		<li>차시명</li>
		<li>영상제목</li>
		<li>파일명</li>
		<li>영상길이</li>
		<li>등록일</li>
		<c:forEach var="vList" items="${vList}">
			<li>${vList.video_code}</li>
			<li>${vList.unit}</li>
			<li class="wordCut">${vList.unit_content}</li>
			<li>${vList.video_name}</li>
			<li>${vList.video_filename}</li>
			<li>${vList.video_length}</li>
			<li>${vList.enroll_date}</li>	
		</c:forEach>
	</ul>
<h3>질문답변</h3>
	<ul id="ad_goods_inquiry" class="text-center">
		<li>선택</li>
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<li>답변여부</li>
		
		<li><input type="checkbox"/></li>
		<li>10</li>
		<li>난이도는 어느정도인가요?</li>
		<li>홍길동</li>
		<li>2020-10-29</li>
		<li>224</li>
		<li><a href="#">답변하기</a></li>
	</ul>
	<div style="height:50px;text-align:right;">	
		<button class="ad_right_align btn" onclick="goodsInquiryDel()">삭제</button>
	</div>
<h3>수강리뷰</h3>
	<ul id="ad_goods_review" class="text-center">
		<li>선택</li>
		<li>번호</li>
		<li>제목</li>
		<li>평점</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<li>답변여부</li>
		
		<li><input type="checkbox"/></li>
		<li>10</li>
		<li>재입고는 언제쯤인가요?</li>
		<li>★★★★</li>
		<li>홍길동</li>
		<li>2020-10-29</li>
		<li>224</li>
		<li><a href="#">답변하기</a></li>
	
	</ul>	
	<div style="height:50px;text-align:right;">
		<button class="btn" onclick="goodsInquiryDel()">삭제</button>
	</div>
<div class="text-center">
		<c:if test="${vo.class_state ne '등록승인'}">
			<button class="btn" onclick="updateClassState()">등록처리</button>
		</c:if>
		<button class="btn" onclick="location.href='/gachi/adminClassEdit?code=${vo.code}'">수정</button>
		<button class="btn" onclick="classDel()">삭제</button>
</div>
</div>