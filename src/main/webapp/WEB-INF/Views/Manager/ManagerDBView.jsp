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
<script type="text/javascript">
</script>
<style>
html 
{
	font-family: 'Gamja Flower', cursive;
}
body {
	
}

.title-group {
	font-family: 'Gamja Flower', cursive;
	text-align: center;
	font-size: 40px;
	padding-bottom: 20px;
}


.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
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

.title-group{
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
	border-radius: 15px;
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
	width: 100%;
}

.total-group {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	font-size: 20px;
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

.button-group{
	text-align: center;
	margin: 10px;
}

#setting-table{
	text-align: right;
}

</style>
</head>
<body>
	<%-- <%=new Date()%> --%>
	<%
	SettingDTO settingDTO = (SettingDTO)request.getAttribute("settingDTO");
	System.out.println(settingDTO.toString());
	%>
	<p>진행시간</p>
	<form name="rtcForm">
		<input type="text" name="rtcInput" size="20" readonly="readonly" />
	</form>
	<div class="title-group">
		<label class="bold">데이터베이스 관리</label></div>
	<div class="total-group">

		<form method="post" action="SettingUpdate">
			<div class="option-group">
				<table id="setting-table">
					<tr>
						<td><label>설문조사 시간 : </label></td>
						<td><input type="text" name="limitTime"
							value="<%=settingDTO.getLimitTime()%>"> <label> 초</label>
						</td>
					</tr>
					<tr>
						<td><label>설문조사당 문제 수 : </label></td>
						<td><input type="text" name="questionNum"
							value="<%=settingDTO.getQuestionNum()%>"> <label>
								개</label></td>
					</tr>
					<tr>
						<td><label>응시가능 횟수 : </label></td>
						<td><input type="text" name="questionChance"
							value="<%=settingDTO.getQuestionChance()%>"> <label>
								회</label></td>
					</tr>
				</table>
			</div>

			<div class="button-group">
				<input type="reset"  class="button button5" value="초기화"></input>
				<input type="submit" class="button button5" value="적용"></input>
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