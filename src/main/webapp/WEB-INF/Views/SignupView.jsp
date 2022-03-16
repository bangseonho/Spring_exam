<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메인 페이지</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
	<meta charset="UTF-8">
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:500,700&display=swap');
@import url('https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap');

body{
	font-family: 'Gamja Flower', cursive;
  	background: hsl(220, 10%, 12%);
  	margin:0;
}

.bold{
  font-family: 'Montserrat', sans-serif;
  font-weight:700;
  font-size:25px;
}

.normal{
  font-family: 'Darker Grotesque', sans-serif;
  font-weight:500;
  font-size:17px;
}

.welcome-text{
  color:#fff;
}

.welcome{
  text-align:center;
  color:#fff;
  position:absolute;
  height:100%;
  width:400px;
  z-index:30;
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: column;
}

.hello{
  text-align:center;
  color:#fff;
  position:absolute;
  height:50%;
  right:0;
  width:400px;
  z-index:30;
  display:none;
}

.welcome-text{
  margin-top:100px;
}

.move{
  height:100%;
  position:absolute;
  width:400px;
  text-align:center;
  z-index:20;
  background-color:#2ecc71;
  background-image:url("http://www.pixmy.tech/Projects/Codepen/SlideForm/bg.jpg");
  background-size:cover;
  background-position:left;
  transition:all .4s ease;
  border-radius: 10px 0px 0px 10px;
}

.start{
  animation: start .4s linear forwards;
  transition:all .4s ease-out;
}

.startForm{
  animation: startForm .4s linear forwards;
  transition:all .4s ease-out;
}

.p-button{
   animation-iteration-count:5;
  color:white;
  padding:12px 60px;
  color:#fff;
  font-size:14px;
  border-radius:25px;
  border:1px solid #fff;
  width:40%;
  position:absolute;
  left:0;
  right:0;
  margin: auto;
  top:60%;
  text-align:center;
  cursor:pointer;
  transition:all .4s ease;
}

.p-button:hover{
  transition:all .4s ease;
  background-color:rgba(0,0,0,.7);
}

h4{
  font-size:22px;
}

p{
  font-size:14px;
}

.container{
  height:450px;
  width:900px;
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%, -50%);
}

.text{
  width:60%;
  line-height:20px;
  margin:0 auto;
}

.form{
  text-align:center;
  position:absolute;
  height:100%;
  transform:translate(400px);
  width:500px;
  background-color:#fff;
  border-radius:10px 10px 10px 10px;
}

input{
  border:0px;
  border-bottom:1px solid lightgray;
  margin-bottom:15px;
  padding: 8px 5px;
  width:60%;
}

.b-button{
  background-color:#24a4ee;
  clor:white;
  padding:12px 60px;
  color:#fff;
  font-size:14px;
  border-radius:25px;
  cursor:pointer;
}
.signupForm{
	margin-top:80px;
}
.title{
	margin-top:50px;
}
.btnmargin{
	margin-top:8px;
}
</style>

</head>

<body>
	<div class="container">
		<div class="welcome">
			<h1>아무도 물어보지 않은 TMI</h1>
			<h1>가입해줘유 냉큼 !</h1>
		</div>
		<div class="form">
			<h4 class="bold title">Create Account</h4>
			<form method="post" action="signup" class="signupForm">
				<input type="text" placeholder="Name (Korean, English)" class="normal name" name="name" required pattern="^[가-힣a-zA-Z]+$">
				<input type="text" placeholder="Birth (YYMMDD)" class="normal" name="birth" required pattern="^[0-9]{6}"> <br />
				<button class="b-button bold btnmargin" type="submit">SIGN UP</button>
				<br>
				<button class="b-button bold btnmargin" type="button" onclick="location.href='index.jsp'">Main</button>
			</form>
		</div>
	</div>
</body>
</html>
