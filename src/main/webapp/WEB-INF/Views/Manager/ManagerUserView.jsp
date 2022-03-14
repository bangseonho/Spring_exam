<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="Manager.ManagerController"%>
<%@ page import="User.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<meta charset="utf-8">
<title>참여자 관리</title>
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
	border-collapse: separate;
	width: 100%;
}

#user-list thead td{
	font-family: 'Gamja Flower', cursive;
	border: 1px solid black;
	border-radius: 20px;
}

#user-list tbody tr:hover {
	background-color: #555555;
	color: white;
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
	<div class="title-group">
		<label>회원 관리</label>
	</div>
	<div class="total-group">
		<%
		@SuppressWarnings("unchecked")
		LinkedList<UserDTO> listUser = (LinkedList<UserDTO>)request.getAttribute("listUser");
		 %>
		<!-- 좌측. 문제 목록 -->
		<div class="left-side">
			<table id="user-list">
				<thead>
					<tr>
						<td>이름</td>
						<td>생년월일</td>
						<td>수험번호</td>
						<td>회원 정보 삭제</td>
						<td>회원 문제 확인</td>
					</tr>
				</thead>
				<tbody>
					<%
						for(int i = 0; i < listUser.size() ; i++){
							out.println("<tr>");
							out.println("<td>");
							out.println(listUser.get(i).getName());
							out.println("</td>");
							out.println("<td>");
							out.println(listUser.get(i).getBirth());
							out.println("</td>");
							out.println("<td>");
							out.println(listUser.get(i).getCode());
							out.println("</td>");
							out.println("<td>");
							%>
							<%-- out.println("<a href='/deleteUser?code=${listUser.get(i).getCode()}'> 삭제 </a>"); --%>
							<a href="deleteUser?code=<%= listUser.get(i).getCode() %>">삭제</a>
							<%
							out.println("</td>");
							out.println("<td>");
							%>
							<a href="userSolve?code=<%= listUser.get(i).getCode() %>">문제 확인</a>
							<%
							out.println("</td>");
							out.println("</tr>");
						}
					%>
				</tbody>
			</table>
			<script>
				function func_confirm () {
	        		if(confirm('회원 정보를 정말 모두 삭제 하시겠습니까? ')){
	        			alert("삭제");
	        			window.location.href = "deleteAllUser";
	        		} else {
	        			alert("취소");
	        		}
	        	}
			</script>
		</div>
	</div>
</body>
<footer>
	<div>
		<button class="button button5" onclick="location='ManagerController'">메인으로 이동</button>
		<button class="button button5" onclick="func_confirm ()">회원 전체 삭제</button>
	</div>
</footer>
</html>