<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</style>
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
		<ul style="width:50%; margin-top:45px;">
			<li style="text-align: center">대표이미지</li>
			<li><img src="upload/classImg/${vo.class_img1}"/></li>
		</ul>
	</li>
</ul>
<h3>클래스 상세정보</h3>
<div id="ad_goods_info">

</div>
<h3>클래스영상정보</h3>
	<ul id="ad_video_priview" class="text-center">
		<li>동영상코드</li>
		<li>차시</li>
		<li>차시명</li>
		<li>영상제목</li>
		<li>파일명</li>
		<li>영상길이</li>
		<li>등록일</li>
		
		<li>vid10</li>
		<li>1</li>
		<li class="wordCut">바느질 기본기다지기</li>
		<li>생선가시로 바느질 마스터하기</li>
		<li>fishThorn.avi</li>
		<li>15:26</li>
		<li>2020-11-24</li>
		
		<li>vid10</li>
		<li>1</li>
		<li class="wordCut">바느질 기본기다지기</li>
		<li>생선가시로 바느질 마스터하기</li>
		<li>fishThorn.avi</li>
		<li>15:26</li>
		<li>2020-11-24</li>
		
		<li>vid10</li>
		<li>1</li>
		<li class="wordCut">바느질 기본기다지기</li>
		<li>생선가시로 바느질 마스터하기</li>
		<li>fishThorn.avi</li>
		<li>15:26</li>
		<li>2020-11-24</li>
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
		<button class="btn">등록처리</button>
		<button class="btn" onclick="location.href='/gachi/adminGoodsEdit'">수정</button>
		<button class="btn" onclick="goodsDel()">삭제</button>
</div>
</div>