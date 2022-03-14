<%@page import="Question.QuestionDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>질문 추가/수정 페이지</title>
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
  font-size: 13px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 15px;
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
	font-size: 20px;
}

.left-side {
	width: 60%;
	text-align: center;
}

#user-list {
	border-collapse: collapse;
	width: 100%;
}

#user-list thead td{
	font-family: 'Gamja Flower', cursive;
}

#user-list tbody tr:hover {
	background-color: #555555;
	color: white;
}

#user-list tbody td {
	font-family: 'Gamja Flower', cursive;
	letter-spacing: 2px;
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

table tr td {
	padding : 10px;
}
table {
	margin: 10px;
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
.form-style{
	text-align: center;
}
</style>
</head>
<body>
	<%
	String sqlType = (String)request.getAttribute("sqlType");
	if(sqlType == null){
		sqlType = "create";
	}
	
	Object object = request.getAttribute("questionDTO");
	String[] questionColNameList =
		(String[]) request.getAttribute("questionColNameList");
	
	QuestionDTO questionDTO = null;
	String targetController;
	String btnStr;
	if(sqlType.equals("update") && object != null){
		questionDTO = (QuestionDTO)object;
		targetController = "ManagerQuestionUpdateOne";
		btnStr = "수정";
	}
	else {
		questionDTO = new QuestionDTO("id", "질문", "보기1", "보기2", "보기3", "보기4", 1, "대상");
		targetController = "ManagerQuestionCreate";
		btnStr = "추가";
	}
	
	%>
	<div class="title-group">
		<label class="bold">질문 <%= sqlType %></label>
	</div>
	<div class="total-group">
		<form class="form-style" method="post" action="<%= targetController %>">
			<input type="hidden" name="id" value="<%= questionDTO.getId()%>"/>
			
			<table>
			<thead>
			</thead>
			<tbody>
				<tr>
				<td> <label>질문</label> </td>
				<td> <input type="text"   name="phrase" 	value="<%= questionDTO.getPhrase()%>"/> </td>
				</tr>
				<tr>
				<td> <label>보기1</label> </td>
				<td> <input type="text"   name="one" 	value="<%= questionDTO.getOne()%>"/> </td>
				</tr>
				<tr>
				<td> <label>보기2</label> </td>
				<td> <input type="text"   name="two" 	value="<%= questionDTO.getTwo()%>"/> </td>
				</tr>
				<tr>
				<td> <label>보기3</label> </td>
				<td> <input type="text"   name="three"  	value="<%= questionDTO.getThree()%>"/> </td>
				</tr>
				<tr>
				<td> <label>보기4</label> </td>
				<td> <input type="text"   name="four" 	value="<%= questionDTO.getFour() %>"/> </td>
				</tr>
				<tr>
				<td> <label>답</label> </td>
				<td> <input type="text"   name="answer" 	value="<%= questionDTO.getAnswer()%>"/> </td>
				</tr>
				<tr>
				<td> <label>대상</label> </td>
				<td> <input type="text"   name="who" 	value="<%= questionDTO.getWho()%>"/> </td>
				</tr>
			</tbody>
			</table>
			<div>
				<input class="button button5" type="reset"  value="초기화"/> 
				<input class="button button5" type="submit" value="<%= btnStr%>"/> 
			</div>
		</form>	
	
	</div>
</body>
<footer>
	<div>
		<button class="button button5" onclick="location='ManagerQuestion'">질문 관리로 이동</button>
	</div>
</footer>
</html>