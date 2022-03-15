<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>조사 현황</title>
<style>
body {
	
}

.title-group{
	text-align: center;
}

.total-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-size: 20px;
}

.option-group{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

footer {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
<!-- 테스트용 -->
<%= new Date() %>
</head>
<body>
	<p id="time"></p>
	<div class="title-group"><label>조사현황</label></div>
	<div class="total-group">	
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
				String code;
				int sum_correct;
				int user_rank;
				ResultSet rs1 = (ResultSet) request.getAttribute("rs1");
				while (rs1.next()) {
					code = rs1.getString("code"); // 사용자 번호
					sum_correct = rs1.getInt("sum_correct");
					user_rank = rs1.getInt("user_rank");
					%>
					<tr>
					<td><%=code %></td>
					<td><%=sum_correct %></td>
					<td><%=user_rank %> 등</td>
					</tr>
				<% 
				}				
				%>
			</tbody>
		</table>
	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>