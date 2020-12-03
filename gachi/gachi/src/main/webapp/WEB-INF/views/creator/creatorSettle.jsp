<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cr_settle_info{
		margin-top:20px;
		border:3px solid #437299;
		border-radius:10px;
		padding:20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".cr_settle_searchDate").css("text-align","right");		
	});
</script>
<div class="container ad_font">
<h1>정산관리</h1>
	<form method="post" action="">
	<div class="cr_settle_searchDate">
		<a href="#">전일</a>
		<input type="date" name="date1"/>~<input type="date" name="date2"/>
		<a href="#">다음</a>
		<button class="btn">금월</button>
		<button class="btn">전월</button>	
	</div>
	</form>

	<div id="cr_settle_info" class="text-center">
		<h1>총 매출액</h1>
		<h1>544,540원</h1>
	</div>
<div>
	<ul id="cr_settle_lst" >
		<li>크리에이터아이디</li>
		<li>카테고리</li>
		<li>크리에이터명</li>
		<li>클래스명</li>
		<li>정산예정금액</li>
		<li>지급금액</li>
		<li>지급일</li>
		<li>정산상태</li>
		
		<li>hogildong@naver.com</li>
		<li>미술</li>
		<li>홍카소</li>
		<li>쉬운미술공부</li>
		<li>150000</li>
		<li>0</li>
		<li>2020-11-10</li>
		<li>정산완료</li>
		
		<li>hogildong@naver.com</li>
		<li>미술</li>
		<li>홍카소</li>
		<li>쉬운미술공부</li>
		<li>150000</li>
		<li>0</li>
		<li>2020-11-14</li>
		<li>미정산</li>
	</ul>
</div>
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