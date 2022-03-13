<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스 관리 페이지</title>
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
	<div class="title-group"><label>데이터베이스 관리</label></div>
	<div class="total-group">

		<form method="post" action="">
			<div class="option-group">
				<div>
					<label>설문조사 시간 : </label>
					<input type="text" value="5">
					<label> 분</label>
				</div>
				<div>
					<label>설문조사당 문제 수 : </label>
					<input type="text" value="5">
					<label> 개</label>
				</div>
				<div>
					<label>응시가능 횟수 : </label>
					<input type="text" value="1">
					<label> 회</label>
				</div>
			</div>
			<div>
				<input type="reset" value="초기화"></input>
				<input type="submit" value="적용"></input>
			</div>
		</form>

	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>