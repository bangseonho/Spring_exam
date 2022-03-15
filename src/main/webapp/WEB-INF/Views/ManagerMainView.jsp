<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@page import="User.UserDTO"%>
<%@page import="User.UserDAO"%>
<html>

<style>
body {
	background: hsl(220, 10%, 12%);
	margin: 0;
}

h4 {
	font-size: 22px;
}

.welcome{
  text-align:center;
  color:#fff;
  position:absolute;
  height:50%;
  width:400px;
  z-index:30;
}
.welcome-text{
  color:#fff;
  margin-top:100px;
}
.container {
	height: 450px;
	width: 900px;
	position: absolute;
	top: 50%;
	left: calc(50% - 200px);
	transform: translate(-50%, -50%);
}

.form {
	text-align: center;
	position: absolute;
	height: 100%;
	transform: translate(400px);
	width: 500px;
	background-color: #fff;
	border-radius: 10px 10px 10px 10px;
	justify-content: center;
}

.title {
	margin-top: 50px;
}

.bold {
	font-family: 'Montserrat', sans-serif;
	font-weight: 700;
	font-size: 25px;
}

.b-button {
	background-color: #24a4ee;
	padding: 12px 60px;
	color: #fff;
	font-size: 14px;
	border-radius: 25px;
	cursor:pointer;
}

.button-group {
	height: calc(100% - 177px);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding : 0px 108px 30px 108px;
}
</style>

<head>
	<title>관리자 페이지</title>
</head>

<body>
			<%
				int flag = (Integer)request.getAttribute("flag");
				System.out.println("flag: "+ flag);
				String s1 = (flag==1) ? "ManagerSurveyOpen" : "ManagerSurveyClose";
				String s2 = (flag==1) ? "투표 시작" : "투표 종료";
					
            %>
	
	<div class="container">
		<div class="form">
			<h4 class="bold title">Manager</h4>
			<div class="button-group">
				<button class="b-button bold" onclick="location='ManagerQuestion'">질문관리</button>
				<button class="b-button bold" onclick="location='ManagerUserView'">회원관리</button>
				<button class="b-button bold" onclick="location='SettingSelect'">데이터베이스관리</button>
				<button class="b-button bold" onclick="location='Ratio'">조사현황</button>
				<button class="b-button bold" onclick="location='index.jsp'">로그인화면으로 이동</button>
	
                <button class="b-button bold" onclick="location='<%=s1%>'"><%=s2%></button>
              	
               	
			</div>
		</div>
	</div>
	     
</body>	
</html>
