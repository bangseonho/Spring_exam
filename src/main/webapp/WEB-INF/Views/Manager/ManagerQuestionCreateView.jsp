<%@page import="Question.QuestionDTO"%>
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
	if(sqlType == null){
		sqlType = "create";
	}
	
	Object object = request.getAttribute("questionDTO");
	String[] questionColNameList =
		(String[]) request.getAttribute("questionColNameList");
	
	QuestionDTO questionDTO = null;
	String targetController;
	String btnStr;
	if(sqlType.equals("update") && object != null){
		questionDTO = (QuestionDTO)object;
		targetController = "ManagerQuestionUpdateOne";
		btnStr = "수정";
	}
	else {
		questionDTO = new QuestionDTO("id", "질문", "보기1", "보기2", "보기3", "보기4", "답", "대상");
		targetController = "ManagerQuestionCreate";
		btnStr = "추가";
	}
	
	%>
	<div class="title-group">
		<label>질문 <%= sqlType %></label>
	</div>
	<div class="total-group">
		<form method="post" action="<%= targetController %>">
			<input type="hidden" name="id"	 	value="<%= questionDTO.getId()%>"/>
			<input type="text"   name="phrase" 	value="<%= questionDTO.getPhrase()%>"/>
			<input type="text"   name="one" 	value="<%= questionDTO.getOne()%>"/>
			<input type="text"   name="two" 	value="<%= questionDTO.getTwo()%>"/>
			<input type="text"   name="three"  	value="<%= questionDTO.getThree()%>"/>
			<input type="text"   name="four" 	value="<%= questionDTO.getFour() %>"/>
			<input type="text"   name="answer" 	value="<%= questionDTO.getAnswer()%>"/>
			<input type="text"   name="who" 	value="<%= questionDTO.getWho()%>"/>
			<input type="submit" value="<%= btnStr%>"/> 
		</form>	
	
	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerQuestion'">질문 관리로 이동</button>
	</div>
</footer>
</html>