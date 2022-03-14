<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<meta charset="utf-8">
<title>My Question</title>
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
		ArrayList<String> userquestionList = (ArrayList<String>)request.getAttribute("userquestionList");
		@SuppressWarnings("unchecked")
		ArrayList<String> userchoiceList = (ArrayList<String>)request.getAttribute("userchoiceList");
		@SuppressWarnings("unchecked")
		ArrayList<String> usercorrectList = (ArrayList<String>)request.getAttribute("usercorrectList");
		@SuppressWarnings("unchecked")
		String usercode = (String)request.getAttribute("usercode");
	 %>
	 <div class="title-group">
		<label><%= usercode %>님의 문제풀이</label>
	</div>
	<div class="total-group">
		<div class="left-side">
			<table id="user-list">
				<thead>
					<tr>
						<td>수험번호</td>
						<td>질문 번호</td>
						<td>질문 리스트</td>
						<td>정답</td>
					</tr>
				</thead>
				<tbody>
					<%
						for(int i = 0; i < userquestionList.size(); i++){
							out.println("<tr>");
							if(i == 0){%>
								<td rowspan='<%= userquestionList.size() %>'>
								<%
								out.println(usercode);
								out.println("</td>");								
							}
							out.println("<td>");
							out.println(userquestionList.get(i));
							out.println("</td>");
							out.println("<td>");
							out.println(userchoiceList.get(i));
							out.println("</td>");
							out.println("<td>");
							out.println(usercorrectList.get(i));
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
		<button class="button button5" onclick="location='ManagerUserView'">메인으로 이동</button>
	</div>
</footer>
</html>