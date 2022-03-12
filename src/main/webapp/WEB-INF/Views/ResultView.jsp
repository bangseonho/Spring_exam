<%@page import="Result.ResultDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Result.ResultDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'Cafe24Oneprettynight';
	font-size: 16px;
}

.grid-container {
	padding: 10px;
	display: grid;
}

.grid-container div {
	padding: 10px;
	margin: 10px;
	border-radius: 10px;
	color: #fff;
	background: #AFE1AF; 
	/* background: lightcoral; */
	text-align:center;
}
</style>



<meta charset="UTF-8">
<title>result view</title>
</head>
<body>
	<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
	while (rs.next()) {

		String code = rs.getString("code"); // 사용자 번호
		int id = rs.getInt("id"); // 문제 번호
		String phrase = rs.getString("phrase");
		String one = rs.getString("one");
		String two = rs.getString("two");
		String three = rs.getString("three");
		String four = rs.getString("four");
		String answer = rs.getString("answer");
		int choice = rs.getInt("choice");
		boolean correct = rs.getBoolean("correct");
	%>
	<br>
	<h1><%=code%>님의 점수 결과</h1>
	
	
	<div class="grid-container">
		<div>
			<h3><%=id%>. <%=phrase%></h3>
			<%
			if (correct) {
				out.println("맞았습니다.");
			} else {
				out.println("틀렸습니다.");
			}
			%>
			<h3>
				1.&nbsp;&nbsp;<%=one%>&emsp;
				2.&nbsp;&nbsp;<%=two%>&emsp;
				3.&nbsp;&nbsp;<%=three%>&emsp;
				4.&nbsp;&nbsp;<%=four%>&emsp;
			</h3>
			<h3>입력한 답 :&nbsp;&nbsp;<%=choice%></h3>
			<h3>정답 :&nbsp;&nbsp;<%=answer%></h3>
	<%
	   }
	%>
		</div>
	</div>
</body>
</html>