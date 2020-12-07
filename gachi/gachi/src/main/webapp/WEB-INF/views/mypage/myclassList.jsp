<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 내학습표 */
	
	.mypageTop{
		text-align: left;
		margin: 10px auto 0px;	 
	}
	.mypageTop>div{
		text-align:right;
	}
	.mypageTop button,
	.mypageContent button{
		background-color: #abcee3;
		margin:5px 0;
	}	
	.mypageContent div{
		text-align: center;
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
		<div class="mypageTop col-lg-8 col-md-10">
			<label style="color:gray">내 학습표 ></label>
				<label style="font-size:1.1em"><b>클래스 목록</b></label>
			<hr class="userHr"/>
			<div>
				<select>
					<option value="최근순">최근순</option>
					<option value="제목순">제목순</option>
				</select>
				<select>
					<option value="전체">전체</option>
					<option value="수강중" selected>수강중</option>
					<option value="수강완료">수강완료</option>
				</select>
			</div>
		</div>
		<div class="mypageContent col-lg-8 col-md-10">
			<c:forEach var="vo" items="${list }">
				<div class="row">
					<div class="col-md-3"><a href="/gachi/myclassView?code=${vo.code }"><img src="/gachi/img/${vo.class_img }"/></a></div>
					<div class="col-md-6">
						<div><span class="badge badge-info">${vo.category }</span></div>
						<div><a href="/gachi/myclassView?code=${vo.code }">${vo.class_name }</a></div>
						<div><a href="#">${vo.username }</a></div>
						<div>진도율 : 0.00%</div>
						<div>기한 : 20.11.01 ~ 21.01.31</div>
						<div><progress value="50" max="100"></progress></div>
					</div>
					<div class="col-md-3"><button type="button" class="btn btn-outline-light btn-sm" onclick="location.href='/gachi/myclassVideo'">▶ 이어서보기</button></div>
				</div>
				<hr/>
			</c:forEach>
		</div>
	</div>
</div>