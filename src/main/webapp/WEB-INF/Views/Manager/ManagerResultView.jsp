<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
<title>조사 현황</title>
<style>
html {
	
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
</style>
</head>
<body>
	<%
		@SuppressWarnings("unchecked")
		ArrayList<String> questionWho = (ArrayList<String>)request.getAttribute("questionWho");
		@SuppressWarnings("unchecked")
		ArrayList<String> questionList = (ArrayList<String>)request.getAttribute("questionList");
		@SuppressWarnings("unchecked")
		ArrayList<String> questionSum = (ArrayList<String>)request.getAttribute("questionSum");
		@SuppressWarnings("unchecked")
		ArrayList<String> questionCorrect = (ArrayList<String>)request.getAttribute("questionCorrect");
	 %>
	<div class="title-group"><label>조사현황</label></div>
	<div class="total-group">
		<div class="left-side">
			<table id="user-list">
				<thead>
					<tr>
						<td>출제자</td>
						<td>질문</td>
						<td>응시자 수</td>
						<td>맞춘사람 수</td>
						<td>정답률</td>
					</tr>
				</thead>
				<tbody>
					<%
						for(int i = 0; i < questionList.size(); i++){
							double percent = (Integer.parseInt(questionCorrect.get(i)) * 100) / Integer.parseInt(questionSum.get(i)) * 1.0;
							out.println("<tr>");
							out.println("<td>");
							out.println(questionWho.get(i));
							out.println("</td>");															
							out.println("<td>");
							out.println(questionList.get(i));
							out.println("</td>");															
							out.println("<td>");
							out.println(questionSum.get(i));
							out.println("</td>");
							out.println("<td>");
							out.println(questionCorrect.get(i));
							out.println("</td>");
							out.println("<td>");
							out.println(percent + " %");
							out.println("</td>");
							out.println("</tr>");
						}
					%>
					
				</tbody>
			</table>
		</div>
   </div>
</body>
<footer>
	<div>
		<button class="button button5" onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>