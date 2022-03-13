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
	width: 60%;
	text-align: center;
}

#user-list {
	border-collapse: collapse;
	width: 100%;
}

#user-list tbody tr:hover {
	background-color: red;
}

#user-list tbody td {
	border: 1px solid #444444;
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

a{
	text-decoration: none;
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
						<td><button onclick="func_confirm ()">회원 전체 삭제</button></td>
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
							<a href="">문제 확인</a>
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
		<button onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>