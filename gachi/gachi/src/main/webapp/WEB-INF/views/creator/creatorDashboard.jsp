<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#cr_dash_board_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}

.cr_dash_board {
	border: 2px solid #4aa8d8;
	width: 250px;
	height: 200px;
	padding: 20px;
	margin-bottom: 50px;
	border-radius: 10px;
}
</style>
<div class="container cr_dash_center text-center">
<h1> 크리에이터 대시보드 </h1>
	<br/>
	<div>
		<ul id="cr_dash_board_ul">
			<li><div class="cr_dash_board"><input type="radio" name="cr_dash_User" value="전체" checked/>전체
					<input type="radio" name="cr_dash_User" value="회원"/>회원
					<input type="radio" name="cr_dash_User" value="크리에이터"/>크리에이터<br/><br/>
						<b>승인 대기 클래스</b>
					</div></li>
			<li><div class="cr_dash_board"><input type="radio" name="cr_dash_pay" value="전체" checked/>전체
					<input type="radio" name="cr_dash_pay" value="스토어"/>스토어
					<input type="radio" name="cr_dash_pay" value="클래스"/>클래스<br/><br/>
						<b>전월 총 매출</b>
					</div></li>
			<li><div class="cr_dash_board"><b>클래스 답변 대기</b><br/></div></li>							
		</ul>
	</div>
	<canvas id="cr_dash_chart" style="margin:100px 0 ;"></canvas>
	
	<script type="text/javascript" src="resources/Chart.js"></script>
	<script type="text/javascript">
	var cr_dash_context = document.getElementById('cr_dash_chart').getContext('2d');
	var cr_dash_chart = new Chart(cr_dash_context, {
	    type: 'line',
	    data: {
	        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	        datasets: [{
	            label: '월별 매출 기록',
	            data: [100, 50, 150, 100, 60, 60, 70, 30, 90, 200, 36, 88],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 120, 252, 0.2)',
	                'rgba(180, 111, 220, 0.2)',
	 
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	
	</script>
</div>