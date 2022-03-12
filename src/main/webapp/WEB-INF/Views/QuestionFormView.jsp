<%@page import="java.util.Arrays"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="User.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="User.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/* // session에 문제 저장
	ResultSet rs = (ResultSet) request.getAttribute("questionsList");
	int no = 0;
	while (rs.next()) {
		ArrayList<String> lst2 = new ArrayList<String>();
		lst2.add(rs.getString("id"));
		lst2.add(rs.getString("phrase"));
		lst2.add(rs.getString("one"));
		lst2.add(rs.getString("two"));
		lst2.add(rs.getString("three"));
		lst2.add(rs.getString("four"));
		lst2.add(rs.getString("answer"));
		lst2.add(rs.getString("who"));
		session.setAttribute(Integer.toString(no), lst2);
		no++;
	}

	int cnt = 0;
	out.println(session.getAttribute(Integer.toString(cnt))); */
	%>
	<div>
		<label><input type="radio" value="1" />1 </label> <label> <input
			type="radio" value="2" />2
		</label> <label> <input type="radio" value="3" />3
		</label> <label> <input type="radio" value="4" />4
		</label>
	</div>
	<!-- <form method="GET" action="nextQuestion">
		<input type="submit" value="BACK" />
	</form>
	<form method="GET" action="nextQuestion">
		<input type="submit" value="NEXT" />
	</form> -->
</body>
</html>