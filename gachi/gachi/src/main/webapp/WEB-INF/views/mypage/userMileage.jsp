<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

	/* 마일리지 */
	
	/* 상단 */
	#userMileageTop{
		margin:50px 10px 5px;
		padding:10px;
		height:150px;
		border:2px solid #44649f;
	}
	#userMileageTop>div{
		width:33%;
		float:left;
		text-align:center;
	}
	#userMileageTop label{
		width:100%;
		line-height:50px;
	}
	#userMileageTop label:nth-child(2n){
		font-size:1.3em;
	}
	.mypageContent div{
		text-align: center;
	}
	.mypageContent input{
		border:	none;
		outline: none;
		width: 100%;
	}
	.mypageContent button{
		background-color: ;
		margin-top: 100px;
	}
	
</style>
<script>
	$(function(){
		//더보기 페이징 -> userProfile.jspf
	    moreContent();
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="color:gray">주문/결제 ></label>
			<label style="font-size:1.1em"><b>마일리지</b></label>
			<hr class="userHr"/>
			<div id="userMileageTop">
				<div>
					<label>현재 마일리지</label>
					<label><fmt:formatNumber value="${mileageAllSum }" pattern="#,###" />p</label>
					
				</div>
				<div>
					<label>총 적립 마일리지</label>
					<label><fmt:formatNumber value="${mileagePosiSum }" pattern="#,###" />p</label>
				</div>
				<div>
					<label>사용한 마일리지</label>
					<label><fmt:formatNumber value="${mileageNegaSum }" pattern="#,###" />p</label>
				</div>
			</div>
			<div style="font-size:0.8em;text-align:right">*마일리지는 적립된 달로부터 12개월 이내에 사용하셔야 합니다</div>
			<div class="row" style="margin-top:50px">
				<div class="col-md-3" style="text-align:center">날짜</div>
				<div class="col-md-6">내역</div>
				<div class="col-md-3" style="text-align:center">마일리지</div>
			</div>
			<hr class="userHr"/>
				<c:forEach var="vo" items="${list }">
					<div class="row moreContent">
						<div class="col-md-3" style="text-align:center">${vo.occurence_date }</div>
						<div class="col-md-6">${vo.breakdown }</div>
						<c:if test="${vo.mileage>0 }">
							 <div class="col-md-3"style="color:#ee3e61;text-align:center">+<fmt:formatNumber value="${vo.mileage }" pattern="#,###" /></div>
						</c:if>
						<c:if test="${vo.mileage<0 }">
							 <div class="col-md-3"style="color:#44649f;text-align:center"><fmt:formatNumber value="${vo.mileage }" pattern="#,###" /></div>
						</c:if>
					</div>
					<hr class="moreContent"/>
				</c:forEach>
			<div>
				<button type="button" class="btn btn-outline-lignt" id="moreContentLoad">더보기</button>
			</div>
		</div>
	</div>
</div>