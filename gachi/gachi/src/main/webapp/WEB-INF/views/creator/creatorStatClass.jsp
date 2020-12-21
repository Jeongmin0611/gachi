<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.container{
		font-family: 'NanumBarunpen';
	}
</style>
<script type="text/javascript" src="resources/Chart.js"></script>
<style>
.ad_StatClass_Piechart {
	float: left;
	width: 50%;
	margin: 50px 0px;
	font-size: 1.5em;
}

canvas {
	width: 100%;
	margin-bottom: 20px;
}
</style>
<script>

var labelData = "${labelData}";
var dashData = "${dashData}";
var genderLabel ="${genderLabel}";
var genderData = "${genderData}";
var ageLabel ="${ageLabel}";
var ageData="${ageData}";
var startDate = "${startDate}";
var endDate = "${endDate}";


$(function(){
	
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	$("#genderPieLbl").val("${genderPieLbl}");
	$("#genderPieData").val("${genderPieData}");
	$("#agePieLbl").val("${agePieLbl}");
	$("#agePieData").val("${agePieData}");

	$("#frm").click(function(){
		var url = "/creatorStatClass";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val();
		$.ajax({
			url : url,
			data : data,
			success: function(data){

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

<div class="container cr_StatClass_center text-center ad_font">
	<h1 style="text-align:center;"> 클래스시청 회원 통계 </h1>
	<br/>
		<form action="creatorStatClass" method="post" id="frm">
		<div class="cr_Dashboard_searchForm">
			
			<input type="date" name="startDate" id="startDate" value=""/> ~ <input type="date" name="endDate" id="endDate" value=""/>
			<input type ="submit" class="btn btn-outline-dark btn-sm" id="frm" value="조회"/>
		</div>
		</form>
		<div>
			<canvas id="cr_StatClass_chart" style="margin-top:50px"></canvas>
			<script type="text/javascript" src="resources/Chart.js"></script>
			<script type="text/javascript">
			var cr_StatClass_context = document.getElementById('cr_StatClass_chart').getContext('2d');
			var cr_StatClass_chart = new Chart(cr_StatClass_context, {
			    type: 'line',
			    data: {
			        labels: ${labelData},
			        datasets: [{
			            label: '구매 회원수',
			            data: ${dashData},
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
		<canvas id="cr_StatClass_gender_chart" data-aos="fade-up"
	     data-aos-anchor-placement="top-center"></canvas>
			<script type="text/javascript">
			var cr_StatClass_gender_context = document.getElementById('cr_StatClass_gender_chart').getContext('2d');
			var cr_StatClass_gender_chart = new Chart(cr_StatClass_gender_context, {
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
		구매고객 성별
	</div>	
	<div class="ad_StatClass_Piechart cfont" >
		<canvas id="cr_StatClass_age_chart" data-aos="fade-up"
	     data-aos-anchor-placement="top-center"></canvas>
			<script type="text/javascript">
			var cr_StatClass_age_context = document.getElementById('cr_StatClass_age_chart').getContext('2d');
			var cr_StatClass_age_chart = new Chart(cr_StatClass_age_context, {
			    type: 'pie',
			    data: {
				labels : ${ageLabel},
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
		구매고객 연령별
	</div>	
	<%-- <div class="ad_StatClass_Piechart cfont" >	
		<canvas id="cr_StatClass_star_chart" data-aos="fade-up"
	     data-aos-anchor-placement="top-center"></canvas>
			<script type="text/javascript">
			var cr_StatClass_star_context = document.getElementById('cr_StatClass_star_chart').getContext('2d');
			var cr_StatClass_star_chart = new Chart(cr_StatClass_star_context, {
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
		</div>	 --%>	
</div>	
	