<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="User.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	System.out.println("asdfasdfasdf");
	if(!(session.getAttribute("user_name").equals("admin"))){
		response.sendRedirect("ManagerMainView.jsp");
	}
	else{
		UserDAO userDAO = new UserDAO();
		try{
			int cnt = userDAO.adminClose();
		}catch(Exception e){
			throw new Exception("close 실패");
		}
		response.sendRedirect("ManagerMainView.jsp");
	}
	%>
</body>
</html>