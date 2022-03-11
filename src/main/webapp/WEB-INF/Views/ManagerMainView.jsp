<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>

<html>

<head>
	<title>관리자 페이지</title>
</head>

<body>
	<button onclick="location='PageMove?page=ManagerSurveyView'">문제관리			</button>
	<button onclick="location='PageMove?page=ManagerUserView'"	>회원관리			</button>
	<button onclick="location='PageMove?page=ManagerDBView'"	>데이터베이스관리	</button>
	<button onclick="location='PageMove?page=ManagerResultView'">조사현황			</button>
	<!-- 첫 화면으로 가는 법 찾기 -->
	<button onclick="location='index.jsp'">로그인화면으로 이동</button>          
</body>	
</html>
