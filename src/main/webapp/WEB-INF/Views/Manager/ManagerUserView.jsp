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
						<td>번호</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>수험번호</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><% out.println(listUser.get(1).getName()); %></td>
						<td><% out.println(listUser.get(1).getBirth()); %></td>
						<td><% out.println(listUser.get(1).getCode()); %></td>
						<td><a href="">삭제</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>홍길동</td>
						<td>929292</td>
						<td>50</td>
						<td><a href="">삭제</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td>홍길동</td>
						<td>929292</td>
						<td>50</td>
						<td><a href="">삭제</a></td>
					</tr>
				</tbody>
			</table>
			<script>
				
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