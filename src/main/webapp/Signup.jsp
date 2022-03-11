<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>메인 페이지</title>
</head>

<body>
	<div
		style="width: 30%; height: 400px; margin-top: 40px; margin-left: 34%; text-align: center; padding-top: 5%; border-radius: 30px;">
		<p style="font-size: 30px; color: #ffffff; margin: 0px;">
			<span> 회원가입 </span>
		</p>
		<div style="padding-bottom: 50px; margin-top: 30px;">
			<form method="post" action="t10" style="text-align: -webkit-center;">
				<fieldset id="regbox" style="text-align: center; border: none;">
					<input class="input" type="name" name="name" required="true"
						maxlength="10" title="공백 제외한 10자 미만으로 작성해주세요." pattern="^[\S]+$"
						placeholder="이름을 입력해주세요" /><br />
						<input class="input"
						type="text" name="birth" pattern="^[\S]+$"
						title="지정된 양식을 지켜주세요." required="true"
						placeholder="주민번호 앞6자리+성별1자리 입력해주세요" /><br />
					<button class="inputBtn" type="submit" value="가입">가입</button>
				</fieldset>
			</form>
		</div>
	</div>

</body>
</html>
