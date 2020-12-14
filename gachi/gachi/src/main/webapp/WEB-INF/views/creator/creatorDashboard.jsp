<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#cr_dash_board_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}
.cr_dash_board {
	border: 2px solid #437299;
	border-radius:10px;
	width: 250px;
	height: 200px;
	padding: 20px;
	margin-bottom: 50px;
	border-radius: 10px;
}
.card{
	border-radius: 0.5rem;
}
</style>

<script>

var countWaitClass = "${countWaitClass}";
var totalPayment = "${totalPayment}";
var non_Payment = "${non_Payment}"
var labelData = "${labelData}";
var dashData = "${dashData}";

var startDate = "${startDate}";
var endDate = "${endDate}";

$(function(){
	
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	
 	$("#countWaitClass").text("${countWaitClass}");
	$("#totalPayment").text("￦ " + numberWithCommas("${totalPayment}"));
	$("#non_Payment").text("￦ " + numberWithCommas("${non_Payment}"));  

	$("#frm").click(function(){
		var url = "/creatorDashboard";
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
<div class="container cr_dash_center text-center ad_font">
<h1> 크리에이터 대시보드 </h1>
	<br/>	
	<div style="height:200px;">
	<form action="adminStatStore" method="post" id="frm">
		<div class="cr_Dashboard_searchForm">
			
		<input type="date" name="startDate" id="startDate" value=""/> ~ <input type="date" name="endDate" id="endDate" value=""/>
		<input type ="submit" class="btn btn-outline-dark btn-sm" id="frm" value="조회"/>
		</div>
		<ul id="cr_dash_board_ul">
			<li><div class="cr_dash_board">
						<b>승인 대기 클래스</b><br/>
						<span style="font-size:50px;line-height:120px" id="countWaitClass">${countWaitClass } 건</span>
					</div></li>
			<li><div class="cr_dash_board">
						<b>정산 금액</b><br/>
						<span style="font-size:50px;line-height:120px" id="totalPayment">${totalPayment }</span>
					</div></li>
			<li><div class="cr_dash_board">
						<b>미정산 금액</b><br/>
						<span style="font-size:50px;line-height:120px" id="non_Payment">${non_Payment }</span>
					</div></li>							
		</ul>
		</form>
	</div>
	<canvas id="cr_dash_chart" style="margin:30px 0 ;"></canvas>
	
	<script type="text/javascript" src="resources/Chart.js"></script>
	<script type="text/javascript">
	var cr_dash_context = document.getElementById('cr_dash_chart').getContext('2d');
	var cr_dash_chart = new Chart(cr_dash_context, {
	    type: 'line',
	    data: {
	        labels: ${labelData},
	        datasets: [{
	            label: '날짜별 매출 총액',
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