<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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

.normal {
	font-family: 'Darker Grotesque', sans-serif;
	font-weight: 500;
	font-size: 17px;
}

.welcome-text {
	color: #fff;
}

.p-button {
	animation-iteration-count: 5;
	color: white;
	padding: 12px 60px;
	color: #fff;
	font-size: 14px;
	border-radius: 25px;
	border: 1px solid #fff;
	width: 40%;
	position: absolute;
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

.text {
	width: 60%;
	line-height: 20px;
	margin: 0 auto;
}

.form {
	text-align: center;
	width: 500px;
	background-color: #fff;
	border-radius: 10px 10px 10px 10px;
}

input {
	border: 0px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 15px;
	padding: 8px 5px;
	width: 60%;
}

.b-button {
	background-color: #24a4ee;
	clor: white;
	padding: 12px 60px;
	color: #fff;
	font-size: 14px;
	border-radius: 25px;
	cursor: pointer;
}

.loginForm {
	margin-top: 80px;
}

.title {
	margin-top: 50px;
}

.btnmargin {
	margin-top: 8px;
}

.button5 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
	font-family: 'Gamja Flower', cursive;
	cursor: pointer;
}

.buttonform {
	margin-top: 10px;
}
.form {
margin:0 auto;
}
</style>
</head>
<body>
	<div class="form">
		<h4 class="bold title">Get Code</h4>
		<form method="post" action="getMyCode" class="loginForm" accept-charset="utf-8">
			<input type="text" name="name" required placeholder="Name"> <input
				type="text" name="birth" required placeholder="Birth"><br />
			<div class="buttonform">
				<button class="b-button bold btnmargin" type="submit">Get</button>
			</div>
		</form>
		<button class="b-button bold btnmargin"
			onclick="location.href='index.jsp'">Main</button>
		<br />
	</div>
</body>
</html>