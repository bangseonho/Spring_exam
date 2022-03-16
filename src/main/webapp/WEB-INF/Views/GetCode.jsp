<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Montserrat:500,700&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap')
	;

.bold {
	font-family: 'Montserrat', sans-serif;
	font-weight: 700;
	font-size: 25px;
}

.p-button {
	animation-iteration-count: 5;
	color: white;
	padding: 12px 60px;
	color: #000000;
	font-size: 14px;
	border-radius: 25px;
	border: 1px solid #fff;
	width: 20%;
	left: 0;
	right: 0;
	margin: auto;
	top: 60%;
	text-align: center;
	cursor: pointer;
	transition: all .4s ease;
}

.p-button:hover {
	transition: all .4s ease;
	background-color: rgba(0, 0, 0, .7);
	color: white;
}

h4 {
	font-size: 22px;
}

p {
	font-size: 14px;
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
	height: 100%;
	background-color: #fff;
	border-radius: 10px 10px 10px 10px;
}

input {
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 15px;
	padding: 8px 5px;
}

.title {
	margin-top: 50px;
}

.btns {
	margin-top: 100px;
}
</style>
</head>
<body>
	<div class="form">
		<h4 class="bold title">회원코드 조회 결과</h4>
		<div class="bold">${code}</div>
		<div class="btns">
			<button class="p-button" onclick="location='PageMove?page=LoginView'">Login</button>
			<button class="p-button" onclick="location.href='index.jsp'">Home</button>
		</div>
	</div>
</body>
</html>