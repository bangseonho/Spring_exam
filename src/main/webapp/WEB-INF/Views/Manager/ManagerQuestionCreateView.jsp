<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �߰� ������</title>
<style>
body {
	
}

.title-group {
	text-align: center;
}

.total-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.option-group {
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
	<%
	String sqlType = (String)request.getAttribute("sqlType");
	%>
	<div class="title-group">
		<label>���� <%= sqlType %></label>
	</div>
	<div class="total-group">���� <%= sqlType %></div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerQuestion'">���������� �̵�</button>
	</div>
</footer>
</html>