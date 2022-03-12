<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>
	<h3>메인 페이지</h3>
	<h3>${ name }의 수험 번호 ${ code }</h3>
	<button onclick="location.href='questionform'">QuestionForm</button>
	<%
		String a = (String)session.getAttribute("user_code");
		String b = (String)session.getAttribute("user_name");
		out.println(a);
		out.println(b);
	%>
</body>
</html>