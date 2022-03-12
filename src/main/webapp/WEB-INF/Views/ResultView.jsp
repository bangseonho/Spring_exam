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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>result view</h1>


	<% 
	   ResultSet rs = (ResultSet)request.getAttribute("rs");
	   while(rs.next()){
		   
		   String code = rs.getString("code");  // 사용자 번호
		   int id = rs.getInt("id"); // 문제 번호
		   String phrase = rs.getString("phrase");
		   String one = rs.getString("one");
		   String two = rs.getString("two");
		   String three = rs.getString("three");
		   String four = rs.getString("four");
		   int choice = rs.getInt("choice");
		   boolean correct = rs.getBoolean("correct");
		   
		   
	     
  
	 %>
	 
	 <h1><%=code%>님의 점수 결과</h1>
	 <h3><%=id%>. <%=phrase%> </h3>
	
	
	<%

	   if(correct){
		   out.println("맞았습니다.");
	   }
	   else{
		   out.println("틀렸습니다.");
	   }
	%>
	
	<h3>1. <%=one%> 2.<%=two%> 3.<%=three%> 4.<%=four%></h3>
	<h3>입력한 답 : <%=choice%></h3>
	<h3>정답 : <%=correct%></h3>
	

	<%
	   }
	%>
	
</body>
</html>