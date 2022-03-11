<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<form method="post" action="" style="text-align: -webkit-center;">
			<fieldset id="regbox" style="text-align: center; border: none;">
				<input type="text" id="user_id" required="true" placeholder="이름 입력">
				<input type="text" id="user_code" required="true" placeholder="수험번호 입력">
			</fieldset>
        </form>
        <button onclick="location.href='ResultView'">ResultView</button>
    </div>
</div>
</body>
</html>