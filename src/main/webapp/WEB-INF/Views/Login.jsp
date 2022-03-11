<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>
<body>
<div style="width: 30%; height: 400px; margin-top: 40px; margin-left: 34%; 
	text-align: center; padding-top: 5%; border-radius: 30px;">
	<p style="font-size: 30px; color: #ffffff; margin: 0px;">
	   <span> 로그인 </span>
	</p>
	<div style="padding-bottom: 50px; margin-top: 30px;">
		<form method="post" action="main" style="text-align: -webkit-center;">
			<fieldset id="regbox" style="text-align: center; border: none;">
				<input type="text" name="name" required placeholder="이름 입력">
				<input type="text" name="code" required placeholder="수험번호 입력">
				<button class="inputBtn" type="submit" value="로그인">로그인</button>
			</fieldset>
        </form>
    </div>
</div>
</body>
</html>