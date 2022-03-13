<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="Manager.ManagerController"%>
<%@ page import="User.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>참여자 관리 페이지</title>
<style>
body {
	
}

.title-group {
	text-align: center;
}

.total-group {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.left-side {
	
}

#user-list {
	border-collapse: collapse;
}

#user-list tbody tr:hover {
	background-color: red;
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
						<td></td>
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
							out.println("</tr>");
						}
					%>
				</tbody>
			</table>
			<script>
				
			</script>
		</div>
	</div>
</body>
<footer>
	<div>
		<button onclick="location='PageMove?page=ManagerMainView'">메인으로
			이동</button>
	</div>
</footer>
</html>