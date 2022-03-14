<%@page import="java.io.PrintWriter"%>
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
	font-size: 20px;
}

.grid-container {
	padding: 10px;
	display: grid;
}

.grid-container div {
	padding: 10px;
	margin: 10px;
	border-radius: 10px;
	background: #AFE1AF;
	/* background: lightcoral; */
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>result view</title>
</head>
<body>
	<%	
	String userCode = (String) session.getAttribute("user_code");
	String userName = (String) session.getAttribute("user_name");
	if(userCode == null || userName == null){
		response.sendRedirect("PageMove?page=LoginView");
		return;
	}
	%>
	<h1>
		수험번호:<%=userCode%><br>
	</h1>	

	
	<%
	int allCnt = 0;
	int CorrectCnt = 0;
	int like = 0;	
	allCnt = (int)request.getAttribute("rs2");
	CorrectCnt = (int)request.getAttribute("rs3");
	%>

	<h1><%=userName%>님의 점수 결과 : <%=allCnt%> 개 중에 <%=CorrectCnt%> 개 맞았습니다!</h1><br/>
	<h1>
		<%
		like = (CorrectCnt*100)/allCnt;		

		if (like <= 25) {
			out.println("우리 조원과 밥 먹으러 가자고 하고 싶지만 아직은 머뭇거리는 사이!  ʕ ᵒ̌ ‸ ᵒ̌ ʔ  ");
		} else if (like <= 50) {
			out.println("막상 우리 조원과 밥 먹으러 가니 입으로 들어가는지 코로 들어가는지 모르겠는 조금은 불편한 사이! 우리 친하게 지내자~ ");
		} else if (like <= 75) {
			out.println("이제 우리 조원과 꽤나 친해져서 술 한 잔 함께 할 수 있는 사이~! 오늘 끝나고 콜?");
		} else {
			out.println("⎝﻿⍢﻿⎠  짝짝짝~ 축하드려요!! 우리 조원과 더벤티의 신메뉴인 자바칩파르페를 먹기 위해 지난주부터 약속할 수 있는 사이! (~ᵒ̌▾ᵒ̌)~♫•*¨*•.¸¸♪");
		}
		%>
	</h1>


	<%
	ResultSet rs1 = (ResultSet) request.getAttribute("rs1");
	while (rs1.next()) {
		String code = rs1.getString("code"); // 사용자 번호
		String phrase = rs1.getString("phrase");
		String one = rs1.getString("one");
		String two = rs1.getString("two");
		String three = rs1.getString("three");
		String four = rs1.getString("four");
		String answer = rs1.getString("answer");
		String choice = rs1.getString("choice");
		boolean correct = rs1.getBoolean("correct");
	%>
	<br>
	<div class="grid-container">
		<div>
			<h3><%=phrase%></h3>
			<%
			if (correct) {
				out.println("맞은 문제");
			} else {
				out.println("틀린 문제");
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
		</div>	
	</div>
	<%
			}
	   // 뒤로가기 시 새 페이지로 불러오기 위함
	   response.setHeader("Cache-Control", "no-cache");
	   response.addHeader("Cache-Control", "no-store");
	   response.setHeader("Pragma", "no-cache");
	   response.setDateHeader("Expires", 1L);
	%>
	<div style=align:center>
<!-- 	<button onclick="location='PageMove?page=MainView'">메인으로 가기</button> -->
	<button onclick="location.href='logout'">로그아웃하기</button>
	</div>
	
</body>
</html>