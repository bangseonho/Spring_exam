<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>조사 현황</title>
<style>
body {
	
}

.title-group{
	text-align: center;
}

.total-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.option-group{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

footer {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
<!-- 테스트용 -->
<%= new Date() %>
</head>
<body>
	<p id="time"></p>
	<div class="title-group"><label>조사현황</label></div>
	<div class="total-group">

	조사현황 넣기

	</div>
	<script>
		
		var timeDisplay = document.getElementById("time");
	
		function refreshTime() {
		  var dateString = new Date();
		  timeDisplay.innerHTML = dateString.toString();
		}
	
		setInterval(refreshTime, 1000);
		
		/* var timeDisplay = document.getElementById("time");


		function refreshTime() {
		  var dateString = new Date().toLocaleString("en-US", {timeZone: "America/Sao_Paulo"});
		  var formattedString = dateString.replace(", ", " - ");
		  timeDisplay.innerHTML = formattedString;
		}

		setInterval(refreshTime, 1000); */
	</script>
</body>
<footer>
	<div>
		<button onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>