<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="form">
		<h4 class="bold title">Login</h4>
		<form method="post" action="main" class="loginForm">
			<input type="text" name="name" required placeholder="Name"> <input
				type="text" name="code" required placeholder="Code"><br />
			<div class="buttonform">
				<button class="b-button bold btnmargin" type="submit">Login</button>
				<button class="b-button bold btnmargin" type="button">Forgot
					Code</button>
			</div>
		</form>
		<button class="b-button bold btnmargin"
			onclick="location.href='index.jsp'">Main</button>
		<br />
	</div>
</body>
</html>