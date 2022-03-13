<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>

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
	left: 50%;
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
	
	<div class="container">
		<div class="welcome">
			<h4 class="bold welcome-text">관리자 페이지</h4>
			<p>설문조사 관련된 환경을 관리할 수 있습니다.</p>
		</div>
		<div class="form">
			<h4 class="bold title">Manager</h4>
			<div class="button-group">
				<button class="b-button bold" onclick="location='ManagerQuestion'">문제관리</button>
				<button class="b-button bold" onclick="location='ManagerUserView'">회원관리</button>
				<button class="b-button bold" onclick="location='ManagerPageMove?page=ManagerDBView'">데이터베이스관리</button>
				<button class="b-button bold" onclick="location='ManagerPageMove?page=ManagerResultView'">조사현황</button>
				<button class="b-button bold" onclick="location='index.jsp'">로그인화면으로 이동</button>     
			</div>
		</div>
	</div>
	     
</body>	
</html>
