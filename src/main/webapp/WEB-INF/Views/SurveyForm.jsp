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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- push test -->
	<%-- <%
	   ResultSet rs = (ResultSet)request.getAttribute("dto");
	   while(rs.next()){
		   out.println(rs.getString("id"));
		   out.println(rs.getString("password"));
		   out.println(rs.getString("name"));
		   out.println(rs.getString("age"));
		   out.println(rs.getString("sex") + "<br/>");
	   }
	   
	%> --%>
</body>
</html>