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
	$(()=>{
		$(".ad_box img").css("width","200px").css("height","200px");
		$(".ad_box>div").css("margin","20px 0px;");
		$(".ad_box>div").css("float","left");
		$("#sub_imgArea").css("height","250px");
		
		
		$("#del_btn").click(()=>{
			if(confirm("해당 클래스를 삭제하시겠습니까?")){
				location.href='/gachi/adminClassDel?code=${vo.code}';	
			}
		});
		$(function(){
			CKEDITOR.replace("class_info");
			CKEDITOR.config.height=500;
			CKEDITOR.config.readOnly = true;
			$('#ad_goods_viewForm>li:first-child').css("borderRight","1px solid gray");
		});
		$("#aaa").click(()=>{
			if(confirm("${vo.code} 클래스를 등록처리 하시겠습니까?")){
				location.href='/gachi/adminClassStateUpdate?code=${vo.code}';
			}
		})
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
			<li>원가 <fmt:formatNumber value="${vo.full_price }" pattern="#,###"/>원</li>
			<li>가격 <fmt:formatNumber value="${vo.real_price }" pattern="#,###"/>원</li>
			<li>좋아요 ${vo.good}</li>
			<li>등록일 ${vo.allow}</li>
			<li>상태 ${vo.class_state}</li>
		</ul>
	</li>
	<li>
		<ul style="margin:auto; text-align: center;">
			<li>대표이미지</li>
			<li>
			<c:forEach var="imgList" items="${vo.class_img}">
				<img src="upload/classImg/${imgList}" style="width:500px;height:300px;"/>
			</c:forEach>
			</li>
		</ul>
	</li>
</ul>
<h3>서브 이미지 목록</h3>
<div id="sub_imgArea"class="text_center ad_box">
<c:forEach var="list" items="${list}" varStatus="status">
	<div style="margin:0 15px; width:230px;height:100%;">
		<div style="text-align:center;height:24px;">이미지</div>
		<div style="text-align:center">
			<img src="<%=request.getContextPath()%>/upload/classImg/${list}"/>
		</div>
	</div>
</c:forEach>
</div>
<h3>클래스목차정보</h3>
<ul class="ad_box" id="ad_unit_box">
	<li>목차순서</li>
	<li>목차명</li>
	<c:forEach var="section" items="${sectionList}">
		<li>${section.unit}</li>
		<li>${section.unit_content}</li>
	</c:forEach>
</ul>
<h3>클래스 상세정보</h3>
<div id="ad_goods_info">
	<textarea name="class_info">${vo.class_info }</textarea>
</div>
<div class="text-center">
		<c:if test="${vo.class_state ne '판매중'}">
			<button id="aaa" class="btn">등록처리</button>
		</c:if>
		<button class="btn" onclick="location.href='/gachi/adminClassEdit?code=${vo.code}'">수정</button>
		<button class="btn" id="del_btn">삭제</button>	
		<button class="btn" onclick="location.href='/gachi/adminClass'">전체목록</button>
</div>
</div>