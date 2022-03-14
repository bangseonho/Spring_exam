<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="User.UserDAO" %>
<%@page import="Setting.SettingDAO" %>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(!(session.getAttribute("user_name").equals("admin"))){
		response.sendRedirect("ManagerMainView.jsp");
	}
	else{
		UserDAO userDAO = new UserDAO();
		
		try{
			int cnt = userDAO.adminOpen(); 
			
		}catch(Exception e){
			throw new Exception("admin open 실패");
		}
	
		SettingDAO settingDAO = new SettingDAO();
		
		try{
			settingDAO.closeVote();
			settingDAO.openVote();
		}catch(Exception e){
			throw new Exception("리셋 실패");
		}
		response.sendRedirect("ManagerMainView.jsp");
	
	}
	%>
</body>
</html>