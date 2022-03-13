<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Question.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

#survey-list{
	border-collapse: collapse;
}

#survey-list tbody tr:hover{
	background-color: red;
}


footer{
	display: flex;
	justify-content: center;
	align-items: center;
}

</style>

</head>
<body>
	
	<div class="title-group"><label>문제 관리</label></div>
	<div class="total-group">
		<!-- survey list -->
		<table id="survey-list">
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
					out.println("<td>"+ (i + 1) 		+"</td>");
					out.println("<td>"+ dto.getPhrase() +"</td>");
					out.println("<td>"+ dto.getOne() 	+"</td>");
					out.println("<td>"+ dto.getTwo() 	+"</td>");
					out.println("<td>"+ dto.getThree() 	+"</td>");
					out.println("<td>"+ dto.getFour() 	+"</td>");
					out.println("<td>"+ dto.getAnswer() +"</td>");
					out.println("<td>"+ dto.getWho() 	+"</td>");
					out.println("<td>"+ "<button onclick=\"\">수정</button>" +"</td>");
					out.println("<td>"+ "<button onclick=\"\">삭제</button>" +"</td>");
					out.println("</tr>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>
<footer>
	<div>
		<button onclick="location='PageMove?page=ManagerMainView'">메인으로 이동</button>
	</div>
</footer>
</html>