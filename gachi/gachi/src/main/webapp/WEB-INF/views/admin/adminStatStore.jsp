<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="resources/Chart.js"></script>
<style>
	.ad_StatClass_Piechart {float:left;width:33%; margin:50px 0px; font-size:1.5em;}
	canvas {width:100%; margin-bottom:20px;}
</style>
<div class="container store_StatClass_center text-center ad_font">
	<h1 style="text-align:center;"> 스토어 통계 </h1><br/>
			<form action="adminStatStore">
			<input type="button" class="btn btn-outline-dark btn-sm" value="◀" />
			<input type="month" id="startMonth" value="" onchange="return chkPeriod();"/>
			-
			<input type="month" id="endMonth" value="" onchange="return chkPeriod();"/>
			</form>
			<input type="button" class="btn btn-outline-dark btn-sm" value="▶" />
			<input type="submit" class="btn btn-outline-dark btn-sm" value="조회"/>
			<!-- <button type="button" class="btn btn-outline-dark btn-sm">이번달</button> -->
	
<div>
			<canvas id="ad_store_StatClass_chart" style="margin-top:50px"></canvas>
			<script type="text/javascript" src="resources/Chart.js"></script>
			<script type="text/javascript">
			
			$(function(){
			    // 로딩될때
			    if($('#startMonth').val() == '' && $('#endMonth').val() == '') {
			    
					$('#startMonth').val('${startMonth}');
					$('#endMonth').val('${endMonth}');
			
					console.log($('#startMonth').val());
					console.log($('#endMonth').val());

			    }
				/* loadDash(); */
			}); 

			function chkPeriod(){
				var startMonth = $('#startMonth').val();
				var endMonth = $('#endMonth').val();
				
				if(startMonth >= endMonth) {
					alert('기간을 다시 선택해주세요.');
					return false;
				}			
			}
			function loadDash(){
				var startMonth = $('#startMonth').val();
				var endMonth = $('#endMonth').val();
				
				if(startMonth >= endMonth) {
					alert('기간을 다시 선택해주세요.');
					return false;
				} else {
					// 최초 페이지 로딩 시 호출,
					// startMonth, endMonth changeEvent 발생 시 호출 
					var dataSize;
					var startYear = startMonth.substring(0, 4);
					var endYear = endMonth.substring(0,4);
					
					var tmpMonth1 = startMonth.substring(5,7);
					var tmpMonth2 = endMonth.substring(5,7);
					console.log(tmpMonth1);
					console.log(tmpMonth2);
					dataSize = (endYear - startYear)* 12;
					dataSize -= Number(tmpMonth1);
					dataSize += (Number(tmpMonth2) + 1);
					
					console.log(dataSize);
					
					var monthNameArray = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
					var data = new Array(); // db 데이터를 담아둘 Array
				}
				
			}
			
			
			var ad_store_StatClass_context = document.getElementById('ad_store_StatClass_chart').getContext('2d');
			var ad_store_StatClass_chart = new Chart(ad_store_StatClass_context, {
			    type: 'line',
			    data: {
			        /* labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'], */
			        labels: ['${monthdate[0]}' ,'${monthdate[1]}', '3', '4'],
			        datasets: [{
			            label: '월별 매출 기록',
			           /*  data: [15, 30, 155, 20, 50, 80, 20, 30, 90, 100, 16, 55], */
			           data: [11, 22, 33, 44],
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
		<div class="ad_StatClass_Piechart cfont" >
		<canvas id="ad_store_StatClass_gender_chart"></canvas>
		<script type="text/javascript">
		var ad_store_StatClass_gender_context = document.getElementById('ad_store_StatClass_gender_chart').getContext('2d');
		var ad_store_StatClass_gender_chart = new Chart(ad_store_StatClass_gender_context, {
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
		성별
	</div>
	<div class="ad_StatClass_Piechart cfont" >	
		<canvas id="ad_store_StatClass_age_chart"></canvas>
		<script type="text/javascript">
		var ad_store_StatClass_age_context = document.getElementById('ad_store_StatClass_age_chart').getContext('2d');
		var ad_store_StatClass_age_chart = new Chart(ad_store_StatClass_age_context, {
		    type: 'pie',
		    data: {
			labels : ["유아" ,"10대" , "20대", "30대", "40대", "50대 이상"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd","pink","yellow","green","orange"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","green","orange"],
			data : [10,9,7,3,1,2]
				}]
			},
			options : {
				responsive: false
				}
			});
		
		</script>
		연령별
	</div>	
	<div class="ad_StatClass_Piechart cfont" >	
		<canvas id="ad_store_StatClass_star_chart"></canvas>
		<script type="text/javascript">
		var ad_store_StatClass_star_context = document.getElementById('ad_store_StatClass_star_chart').getContext('2d');
		var ad_store_StatClass_star_chart = new Chart(ad_store_StatClass_star_context, {
		    type: 'pie',
		    data: {
			labels : ["1점" ,"2점" , "3점", "4점", "5점"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd","pink","yellow","orange"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","orange"],
			data : [10,9,7,3,1]
				}]
			},
			options : {
				responsive: false
				}
				});	
			</script>
			평점
		</div>

</div>	
	