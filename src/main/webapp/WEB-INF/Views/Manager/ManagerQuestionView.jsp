<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Question.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ������</title>
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
<!-- �׽�Ʈ�� -->
<%= new Date() %>
</head>
<body>
	
	<div class="title-group"><label>���� ����</label></div>
	<div class="total-group">
		<!-- question list -->
		<table id="question-list">
			<thead>
				<%
				String[] questionColNameList =
					(String[]) request.getAttribute("questionColNameList");
				out.println("<tr>");
				out.println("<td>" + "��ȣ" + "</td>");
				for(int i = 1; i < questionColNameList.length; i++){
					String name = questionColNameList[i];
					out.println("<td>" + name + "</td>");
				}
				out.println("<td>" + "����" + "</td>");
				out.println("<td>" + "����" + "</td>");
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
					out.println("<td>"+ "<button onclick=\"location='ManagerQuestionUpdateOne?id="+ dto.getId() +"'\">����</button>" +"</td>");
					out.println("<td>"+ "<button onclick=\"location='ManagerQuestionDeleteOne?id="+ dto.getId() +"'\">����</button>" +"</td>");
					out.println("</tr>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerQuestionCreate'">�����߰�</button>
		<button onclick="location='ManagerQuestionDeleteAll'">������ü����</button>
		<button onclick="location='ManagerController'">�������� �̵�</button>
	</div>
</footer>
</html>