<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��Ȳ ������</title>
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
<!-- �׽�Ʈ�� -->
<%= new Date() %>
</head>
<body>
	<p id="time"></p>
	<div class="title-group"><label>������Ȳ</label></div>
	<div class="total-group">

	������Ȳ �ֱ�

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
		<button onclick="location='ManagerController'">�������� �̵�</button>
	</div>
</footer>
</html>