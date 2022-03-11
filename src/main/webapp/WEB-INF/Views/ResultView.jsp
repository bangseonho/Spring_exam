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
<h1>00님의 점수 결과</h1>

	<% 
	   ResultSet rs = (ResultSet)request.getAttribute("rs");
	   while(rs.next()){
		   out.println(rs.getString("id"));
		   out.println(rs.getString("code")+ "<br/>");
		   out.println(rs.getString("answered")+ "<br/>");		   
	   }   
  
	 %>
	<%-- <%
		String s = (String)request.getAttribute("dto");
	   	System.out.println(s);
	
	%> --%>
</body>
</html>