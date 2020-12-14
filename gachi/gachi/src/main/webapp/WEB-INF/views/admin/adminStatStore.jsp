<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="resources/Chart.js"></script>
<style>
.ad_StatStore_Piechart {
	float: left;
	width: 50%;
	margin: 50px 0px;
	font-size: 1.5em;
}

canvas {
	width: 100%;
	margin-bottom: 20px;
}

#ad_StatStore_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}

.ad_StatStore_board {
	border: 2px solid #437299;
	border-radius:10px;	
	width: 250px;
	height: 150px;
	padding: 10px;
	margin-top: 50px;
}


</style>

<script type="text/javascript">


var dashData = "${dashData}";
var labelData = "${labelData}";

var genderLabel = "${genderLabel}";
var genderData = "${genderData}";
var ageLabel = "${ageLabel}";
var ageData = "${ageData}";

var startDate = "${startDate}";
var endDate = "${endDate}";



	$(function(){
		
		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
	
		$("#countStoreAll").text( ${countStoreAll});
		$("#countStoreN").text(${countStoreN});
		$("#countStoreY").text(${countStoreY});
		
		console.log(${countStatStoreAll});
		console.log(${countClassN});
		console.log(${countClassY});
		
		$("#frm").click(function(){
			var url = "/adminStatStore";
			var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val();
			$.ajax({
				url : url,
				data : data,
				success: function(data){
				/* 	$("#startMonth").append("${startMonth}");
					$("#endMonth").append("${endMonth}"); */
				},error:function(){
					console.log("ajax에러발생");
				}
			});
		});
	});

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>



<div class="container store_StatStore_center text-center ad_font">
	<div class="container ad_font text-center">
	<h1>스토어 통계</h1>

		<form action="adminStatStore" method="post" id="frm">
		<div class="ad_StatStore_searchForm">
			
		<input type="date" name="startDate" id="startDate" value=""/> ~ <input type="date" name="endDate" id="endDate" value=""/>
		<input type ="submit" class="btn btn-outline-dark btn-sm" id="frm" value="조회"/>
		</div>
<!--  		<div class="ad_StatStore_searchForm">
			<select id="category" name="category">
				<option value="">전체</option>
				<option value="공예/창작">공예/창작</option>
				<option value="요리">요리</option>
				<option value="미술">미술</option>
				<option value="음악">음악</option>
				<option value="라이프스타일">라이프스타일</option>
				<option value="운동">운동</option>
				<option value="사진/영상">사진/영상</option>
			</select>
			<input type="text" name="username" id="username" placeholder="크리에이터명" size="40"/>
			<input type="submit" class="btn" value="검색"/> 
		</div>
		
		<div class="text-center textSize">
			<input type="radio" name="" checked/>전체
			<input type="radio" name=""/>스토어
			<input type="radio" name=""/>크리에이터<br/>
		</div> -->
			<ul id="ad_StatStore_ul">
				<li><div class="ad_StatStore_board">
							<b>전체 상품 갯수</b><br/>
							<span style="font-size:50px;line-height:100px" id="countStoreAll"></span>
						</div></li>
				<li><div class="ad_StatStore_board">
							<b>판매대기 상품</b><br/>
							<span style="font-size:50px;line-height:120px" id="countStoreN"></span>
					</div></li>											
				<li><div class="ad_StatStore_board">
							<b>판매중 상품</b><br/>
							<span style="font-size:50px;line-height:120px" id="countStoreY"></span>
					</div></li>										
			</ul>
		</form>
	</div>
		<div>
			<canvas id="ad_store_StatStore_chart" style="margin-top:50px"></canvas>
			<script type="text/javascript" src="resources/Chart.js"></script>
			<script type="text/javascript">	
			var ad_store_StatStore_context = document.getElementById('ad_store_StatStore_chart').getContext('2d');
			var ad_store_StatStore_chart = new Chart(ad_store_StatStore_context, {
			    type: 'line',
			    data: {
			        /* labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'], */
			        labels: ${labelData},
			        datasets: [{
		            label: '월별 매출 기록',
		            data:${dashData},
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
	<div class="ad_StatStore_Piechart cfont text-center" > 
		<canvas id="ad_store_StatStore_gender_chart"></canvas>
		<script type="text/javascript">
		var ad_store_StatStore_gender_context = document.getElementById('ad_store_StatStore_gender_chart').getContext('2d');
		var ad_store_StatStore_gender_chart = new Chart(ad_store_StatStore_gender_context, {
		    type: 'pie',
		    data: {
			labels : ${genderLabel},
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff"],
			data : ${genderData}
				}]
			},
			options : {
				responsive: false
				}
			});
		
		</script>
		구매고객 성별정보
	</div>
	<div class="ad_StatStore_Piechart cfont text-center" >	
		<canvas id="ad_store_StatStore_age_chart"></canvas>
		<script type="text/javascript">
		var ad_store_StatStore_age_context = document.getElementById('ad_store_StatStore_age_chart').getContext('2d');
		var ad_store_StatStore_age_chart = new Chart(ad_store_StatStore_age_context, {
		    type: 'pie',
		    data: {
			labels :${ageLabel},
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd","pink","yellow","green","orange"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","green","orange"],
			data : ${ageData}
				}]
			},
			options : {
				responsive: false
				}
			});
		
		</script>
		구매고객 연령정보
	</div>	


</div>	
	