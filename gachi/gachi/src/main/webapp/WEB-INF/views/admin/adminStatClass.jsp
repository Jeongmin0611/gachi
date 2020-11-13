<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	canvas {float:left; height:180px;}
</style>

<div class="container ad_StatClass_center">
<div>
	<h1 style="text-align:center;"> 클래스 통계 </h1>
<canvas id="ad_StatClass_chart" style="margin-top:50px"></canvas>
	<script type="text/javascript" src="resources/Chart.js"></script>
	<script type="text/javascript">
	var ad_StatClass_context = document.getElementById('ad_StatClass_chart').getContext('2d');
	var ad_StatClass_chart = new Chart(ad_StatClass_context, {
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
		<div class="ad_StatClass_pie">
		<canvas id="ad_StatClass_gender_chart" style="margin:50px 0 ;"></canvas>
		<script type="text/javascript" src="resources/Chart.js"></script>
		<script type="text/javascript">
		var ad_StatClass_gender_context = document.getElementById('ad_StatClass_gender_chart').getContext('2d');
		var ad_StatClass_gender_chart = new Chart(ad_StatClass_gender_context, {
		    type: 'pie',
		    data: {
			labels : ["Man" , "Woman"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff"],
			data : [10,9]
				}]
			},
			options : {
				responsive: false
				}
			});
		
		</script>
		</div>
		<div class="ad_StatClass_pie">
		<canvas id="ad_StatClass_age_chart" style="margin:50px 0 ;"></canvas>
		<script type="text/javascript" src="resources/Chart.js"></script>
		<script type="text/javascript">
		var ad_StatClass_age_context = document.getElementById('ad_StatClass_age_chart').getContext('2d');
		var ad_StatClass_age_chart = new Chart(ad_StatClass_age_context, {
		    type: 'pie',
		    data: {
			labels : ["유아" ,"10대" , "20대", "30대", "40대", "50대 이상"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd","pink","yellow","red","blue"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","red","blue"],
			data : [10,9,7,3,1,2]
				}]
			},
			options : {
				responsive: false
				}
			});
		
		</script>
		</div>
		
		<div class="ad_StatClass_pie">
		<canvas id="ad_StatClass_star_chart" style="margin:50px 0 ;"></canvas>
		<script type="text/javascript" src="resources/Chart.js"></script>
		<script type="text/javascript">
		var ad_StatClass_star_context = document.getElementById('ad_StatClass_star_chart').getContext('2d');
		var ad_StatClass_star_chart = new Chart(ad_StatClass_star_context, {
		    type: 'pie',
		    data: {
			labels : ["1점" ,"2점" , "3점", "4점", "5점"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd","pink","yellow","red"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","red"],
			data : [10,9,7,3,1]
				}]
			},
			options : {
				responsive: false
				}
				});
			
			</script>
		</div>
</div>	
	