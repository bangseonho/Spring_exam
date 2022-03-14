<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Question.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<meta charset="utf-8">
<title>질문 관리</title>
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
}

.left-side {
	width: 60%;
	text-align: center;
}

#question-list {
	font-family: 'Gamja Flower', cursive;
	border-collapse: separate;
	width: 100%;
}

#question-list thead td{
	font-family: 'Gamja Flower', cursive;
	border: 1px solid black;
	border-radius: 20px;
}

#question-list tbody tr:hover {
	background-color: #555555;
	color: white;
}

#question-list tbody td {
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
   <div class="title-group">
      <label class="bold">질문 관리</label>
   </div>
      <div class="total-group">
         <div class="left-side">

            <table id="question-list">
               <thead>
                  <%
                  String[] questionColNameList
                     = (String[]) request.getAttribute("questionColNameList");
                  out.println("<tr>");
                  out.println("<td>" + "번호" + "</td>");
                  for (int i = 1; i < questionColNameList.length; i++) {
                     String name = questionColNameList[i];
                     out.println("<td>" + name + "</td>");
                  }
                  out.println("<td>" + "수정" + "</td>");
                  out.println("<td>" + "삭제" + "</td>");
                  out.println("</tr>");
                  %>
               </thead>
               <tbody>
                  <%
                  ArrayList<QuestionDTO> questionList
                     = (ArrayList<QuestionDTO>) request.getAttribute("questionList");
                  QuestionDTO dto = null;
                  for (int i = 0; i < questionList.size(); i++) {
                     dto = questionList.get(i);
                     out.println("<tr>");
                     /* out.println("<td>"+ (i + 1)       +"</td>"); */
                     out.println("<td>" + dto.getId() + "</td>");
                     out.println("<td>" + dto.getPhrase() + "</td>");
                     out.println("<td>" + dto.getOne() + "</td>");
                     out.println("<td>" + dto.getTwo() + "</td>");
                     out.println("<td>" + dto.getThree() + "</td>");
                     out.println("<td>" + dto.getFour() + "</td>");
                     out.println("<td>" + dto.getAnswer() + "</td>");
                     out.println("<td>" + dto.getWho() + "</td>");
                     out.println("<td>" + "<button class=\"button5\" onclick=\"location='ManagerQuestionGet?id=" + dto.getId() + "'\">수정</button>" + "</td>");
                     out.println("<td>" + "<button class=\"button5\" onclick=\"location='ManagerQuestionDeleteOne?id=" + dto.getId() + "'\">삭제</button>" + "</td>");
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
		<button class="button button5" 
		   onclick="location='ManagerPageMove?page=ManagerQuestionCreateView'">질문추가</button>
		<button class="button button5" 
		   onclick="location='ManagerQuestionDeleteAll'">질문전체삭제</button>
		<button class="button button5" 
		  onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>