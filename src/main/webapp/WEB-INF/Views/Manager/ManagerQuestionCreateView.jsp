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
<!-- 테스트용 -->
<%= new Date() %>
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
		questionDTO = new QuestionDTO("id", "질문", "보기1", "보기2", "보기3", "보기4", "답", "대상");
		targetController = "ManagerQuestionCreate";
		btnStr = "추가";
	}
	
	%>
	<div class="title-group">
		<label>질문 <%= sqlType %></label>
	</div>
	<div class="total-group">
		<form method="post" action="<%= targetController %>">
			<input type="hidden" name="id"	 	value="<%= questionDTO.getId()%>"/>
			
			<div>
				<label>질문</label>
				<input type="text"   name="phrase" 	value="<%= questionDTO.getPhrase()%>"/>
			</div>			

			<div>
				<label>보기1</label>
				<input type="text"   name="one" 	value="<%= questionDTO.getOne()%>"/>
			</div>		
			
			<div>
				<label>보기2</label>
				<input type="text"   name="two" 	value="<%= questionDTO.getTwo()%>"/>
			</div>	

			<div>
				<label>보기3</label>
				<input type="text"   name="three"  	value="<%= questionDTO.getThree()%>"/>
			</div>			
			<div>
				<label>보기4</label>
				<input type="text"   name="four" 	value="<%= questionDTO.getFour() %>"/>
			</div>
			<div>
				<label>답</label>
				<input type="text"   name="answer" 	value="<%= questionDTO.getAnswer()%>"/>
			</div>
			<div>
				<label>대상</label>
				<input type="text"   name="who" 	value="<%= questionDTO.getWho()%>"/>
			</div>
			<div>
				<input type="reset"  value="초기화"/> 
				<input type="submit" value="<%= btnStr%>"/> 
			</div>
		</form>	
	
	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerQuestion'">질문 관리로 이동</button>
	</div>
</footer>
</html>