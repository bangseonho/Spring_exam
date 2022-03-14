<%@page import="Setting.SettingDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<meta charset="utf-8">
<title>데이터베이스 관리</title>
<style>
html {
	font-family: 'Gamja Flower', cursive;
}
body {
	
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	font-family: 'Gamja Flower', cursive;
}

.button5 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
}

.button5:hover {
	background-color: #555555;
	color: white;
}

.title-group {
	font-family: 'Gamja Flower', cursive;
	text-align: center;
	font-size: 40px;
	padding-bottom: 20px;
}

.total-group {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.left-side {
	width: 60%;
	text-align: center;
}

#user-list {
	border-collapse: separate;
	width: 100%;
}

#user-list thead td{
	font-family: 'Gamja Flower', cursive;
	border: 1px solid black;
	border-radius: 20px;
}

#user-list tbody td {
	font-family: 'Gamja Flower', cursive;
	letter-spacing: 2px;
	padding: 10px;
}

.right-side {
	display: flex;
	flex-direction: column;
	overflow: auto;
}

.content-title {
	
}

.button-group {
	display: flex;
	justify-content: right;
}

.survey-group {
	
}

footer {
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 30px;
}

a{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%
	SettingDTO settingDTO = (SettingDTO)request.getAttribute("settingDTO");
	System.out.println(settingDTO.toString());
	%>

	<div class="title-group"><label>데이터베이스 관리</label></div>
	<div class="total-group">

		<form method="post" action="SettingUpdate">
			<div class="option-group">
				<div>
					<label>설문조사 시간 : </label>
					<input type="text" name="limitTime" value="<%=settingDTO.getLimitTime()%>">
					<label> 분</label>
				</div>
				<div>
					<label>설문조사당 문제 수 : </label>
					<input type="text" name="questionNum" value="<%=settingDTO.getQuestionNum()%>">
					<label> 개</label>
				</div>
				<div>
					<label>응시가능 횟수 : </label>
					<input type="text" name="questionChance" value="<%=settingDTO.getQuestionChance()%>">
					<label> 회</label>
				</div>
			</div>
			<div>
				<input class="button button5" type="reset" value="초기화"></input>
				<input class="button button5" type="submit" value="적용"></input>
			</div>
		</form>

	</div>
</body>
<footer>
	<div>
		<button class="button button5" onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>