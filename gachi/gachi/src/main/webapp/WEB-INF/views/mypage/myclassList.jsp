<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

	/* 내학습표 */
	
	.mypageTop{
		text-align: left;
		margin: 10px auto 0px;	 
	}
	.mypageTop>div{
		text-align:right;
	}
	.mypageContent button{
		background-color: ;
		margin:5px 0;
	}	
	.mypageContent>div{
		text-align: left;
		margin-left: 50px;
	}
	.mypageContent>div>div{
		margin:auto 0;
	}
	/*클래스썸네일*/
	.mypageContent>div>div img{
		width: 200px;
	    height: 150px;
	    object-fit: cover;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<div class="mypageTop col-md-10">
			<label style="color:gray">내 학습표 ></label>
				<label style="font-size:1.1em"><b>클래스 목록</b></label>
			<hr class="userHr"/>
		</div>
		<div class="mypageContent col-md-10">
			<c:forEach var="vo" items="${list }">
				<jsp:useBean id="toDay" class="java.util.Date"/>
					<fmt:parseDate var="enddate" value="${vo.enddate }" pattern="yyyy.MM.dd"/>
					<fmt:parseNumber value="${toDay.time/(1000*60*60*24) }" integerOnly="true" var="nowDate" scope="request"/>
					<fmt:parseNumber value="${enddate.time/(1000*60*60*24) }" integerOnly="true" var="endDate" scope="request"/>
				<div class="row">
					<div class="col-md-3" style="margin-right:30px"><a href="/gachi/myclassView?code=${vo.code }"><img src="upload/classImg/${vo.class_img }"/></a></div>
					<div class="col-md-6">
						<div><span class="badge badge-info">${vo.category }</span></div>
						<div><h5><a href="/gachi/myclassView?code=${vo.code }">${vo.class_name }</a>
							<c:if test="${vo.progress eq 100 }"><label class="badge badge-pill badge-primary" style="margin-left:10px;font-size:0.7em">수강완료</label></c:if>
							<c:if test="${endDate lt nowDate}"><label class="badge badge-pill badge-secondary" style="margin-left:10px;font-size:0.7em">기간만료</label></c:if>
							</h5></div>
						<div style="font-size:0.9em">${vo.nickname }</div>
						<div style="margin-top:20px;font-size:0.9em">${vo.startdate } ~ ${vo.enddate }</div>
						<c:if test="${vo.progress eq 0 }">
							<div class="progress" style="width:70%;height:20px"><div class="progress-bar progress-bar-striped bg-info" style="width:${vo.progress}%">${vo.progress }%</div></div>
						</c:if>
						<c:if test="${vo.progress ne 0 }">
							<div class="progress" style="width:70%;height:20px"><div class="progress-bar progress-bar-striped bg-info" style="width:${vo.progress}%"><fmt:formatNumber value="${vo.progress }" pattern=".00" />%</div></div>
						</c:if>
					</div>
					<c:if test="${endDate ge nowDate}">
						<div class="col-md-2"><button type="button" class="btn btn-light btn-sm" onclick="location.href='/gachi/myclassVideo?code=${vo.code}&video_code=${vo.first_video }'">▶ 바로재생</button></div>
					</c:if>
				</div>
				<hr/>
			</c:forEach>
		</div>
	</div>
</div>