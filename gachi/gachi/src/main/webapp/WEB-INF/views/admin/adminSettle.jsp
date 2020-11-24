<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function(){
		$(".ad_settle_searchForm").css("text-align","right").css("margin","5px 0px");
	});
</script>
<div class="container">
<h1>정산관리</h1>
	<form method="post" action="">
	<div class="ad_settle_searchForm">
		<a href="#">전일</a>
		<input type="date" name="date1"/>~<input type="date" name="date2"/>
		<a href="#">다음</a>
		<button class="btn">금월</button>
		<button class="btn">전월</button>	
	</div>
	<div class="ad_settle_searchForm">
		<select>
			<option>공예/창작</option>
			<option>요리</option>
			<option>미술</option>
			<option>음악</option>
			<option>라이프스타일</option>
			<option>운동</option>
			<option>사진/영상</option>
		</select>
		<input type="text" name="" placeholder="크리에이터명" size="40"/>
		<input type="submit" class="btn" value="검색"/> 
	</div>
	</form>
	<div class="text-center textSize">
		<input type="radio" name="" checked/>전체
		<input type="radio" name=""/>스토어
		<input type="radio" name=""/>크리에이터
	</div>
	<div id="ad_settle_info" class="text-center">
		<h1>총 매출액</h1>
		<h1>154,4540원</h1>
	</div>
<div style="margin:5px 0px;text-align:right">
	<button class="btn">일괄정산</button>
</div>
	<ul id="ad_settle_lst">
		<li>크리에이터아이디</li>
		<li>크리에이터명</li>
		<li>정산예정금액</li>
		<li>지급금액</li>
		<li>지급일</li>
		<li>정산상태</li>
		
		<li>hogildong@naver.com</li>
		<li>홍길동</li>
		<li>150000</li>
		<li>0</li>
		<li>2020-11-14</li>
		<li><a href="#">정산처리</a></li>
	</ul>
<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<li class="btn"><a class="btn" href="#">Prev</a></li>
			<li><a href="#" class="paging_num">1</a></li>
			<li><a href="#" class="paging_num">2</a></li>
			<li><a href="#" class="paging_num">3</a></li>
			<li><a href="#" class="paging_num">4</a></li>
			<li><a href="#" class="paging_num">5</a></li>
			<li class="btn"><a class="btn" href="#">Next</a></li>
	</ul>
</div>
</div>