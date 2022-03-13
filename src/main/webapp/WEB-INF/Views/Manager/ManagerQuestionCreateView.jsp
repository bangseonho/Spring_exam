<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>질문 추가/수정 페이지</title>
<style>
body {
	
}

.title-group {
	text-align: center;
}

.total-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.option-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

footer {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
<!-- 테스트용 -->
<%= new Date() %>
</head>
<body>
	<%
	String sqlType = (String)request.getAttribute("sqlType");
	%>
	<div class="title-group">
		<label>질문 <%= sqlType %></label>
	</div>
	<div class="total-group">
		<form method="post" action="ManagerQuestionCreate">
			<!-- DB에서 칼럼 가져오는 식으로 바꾸기 -->
			<input type="text" name="phrase" value="질문 insert Test"/>
			<input type="text" name="one" value="보기1"/>
			<input type="text" name="two" value="보기2"/>
			<input type="text" name="three" value="보기3"/>
			<input type="text" name="four" value="보기4"/>
			<input type="text" name="answer" value="답"/>
			<input type="text" name="who" value="대상"/>
			<input type="submit" value="추가"/>
		</form>	
	
	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerQuestion'">질문 관리로 이동</button>
	</div>
</footer>
</html>