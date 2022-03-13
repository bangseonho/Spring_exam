<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Question.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>문제 관리 페이지</title>
<style>

body{
}

.title-group{
	text-align: center;
}

.total-group {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#question-list{
	border-collapse: collapse;
}

#question-list tbody tr:hover{
	background-color: red;
}


footer{
	display: flex;
	justify-content: center;
	align-items: center;
}

</style>
<!-- 테스트용 -->
<%= new Date() %>
</head>
<body>
	
	<div class="title-group"><label>문제 관리</label></div>
	<div class="total-group">
		<!-- question list -->
		<table id="question-list">
			<thead>
				<%
				String[] questionColNameList =
					(String[]) request.getAttribute("questionColNameList");
				out.println("<tr>");
				out.println("<td>" + "번호" + "</td>");
				for(int i = 1; i < questionColNameList.length; i++){
					String name = questionColNameList[i];
					out.println("<td>" + name + "</td>");
				}
				out.println("<td>" + "수정" + "</td>");
				out.println("<td>" + "삭제" + "</td>");
				out.println("</tr>");
				%>
			</thead>
			<tbody>
				<%
				ArrayList<QuestionDTO> questionList = 
					(ArrayList<QuestionDTO>)request.getAttribute("questionList");
				QuestionDTO dto = null;
				for(int i = 0; i < questionList.size(); i++) {
					dto = questionList.get(i);
					out.println("<tr>");
					/* out.println("<td>"+ (i + 1) 		+"</td>"); */
					out.println("<td>"+ dto.getId() 	+"</td>");
					out.println("<td>"+ dto.getPhrase() +"</td>");
					out.println("<td>"+ dto.getOne() 	+"</td>");
					out.println("<td>"+ dto.getTwo() 	+"</td>");
					out.println("<td>"+ dto.getThree() 	+"</td>");
					out.println("<td>"+ dto.getFour() 	+"</td>");
					out.println("<td>"+ dto.getAnswer() +"</td>");
					out.println("<td>"+ dto.getWho() 	+"</td>");
					out.println("<td>"+ "<button onclick=\"location='ManagerQuestionGet?id="+ dto.getId() +"'\">수정</button>" +"</td>");
					out.println("<td>"+ "<button onclick=\"location='ManagerQuestionDeleteOne?id="+ dto.getId() +"'\">삭제</button>" +"</td>");
					out.println("</tr>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerPageMove?page=ManagerQuestionCreateView'">질문추가</button>
		<button onclick="location='ManagerQuestionDeleteAll'">질문전체삭제</button>
		<button onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>