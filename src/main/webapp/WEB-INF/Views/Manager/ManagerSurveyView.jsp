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

.left-side {
	margin-right: 5px;

}

#survey-list{
	border-collapse: collapse;
}

#survey-list tbody tr:hover{
	background-color: red;
}


.right-side {
	display: flex;
	flex-direction: column;
}

.content-title{
	
}

.button-group {
	display: flex;
	justify-content: right;
}

footer{
	display: flex;
	justify-content: center;
	align-items: center;
}

</style>

</head>
<body>
	<%
	ArrayList<QuestionDTO> questionList = 
		(ArrayList<QuestionDTO>)request.getAttribute("questionList");
	
	%>
	<div class="title-group"><label>문제 관리</label></div>
	<div class="total-group">
	
		<!-- 좌측. 문제 목록 -->
		<div class="left-side">
			<table id="survey-list">
				<thead>
					<tr>
						<td>번호</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>문제1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>문제2</td>
					</tr>
						<tr>
						<td>3</td>
						<td>문제3</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 우측. 문제 내용 -->
		<div class="right-side">
			<div >
				<div><label class="content-title">문제</label></div>
				<div>
					<div>
					<input type="radio" name="answer" value="1">
					<input type="text" name="option1" value="보기1">
					</div>

					<div>
					<input type="radio" name="answer" value="2">
					<input type="text" name="option2" value="보기2">
					</div>					

					<div>
					<input type="radio" name="answer" value="3">
					<input type="text" name="option3" value="보기3">
					</div>					

					<div>
					<input type="radio" name="answer" value="4">
					<input type="text" name="option4" value="보기4">
					</div>					
				</div>
			</div>
			<div class="button-group">
				<button onclick="func()">초기화</button>
				<script>
					funct(){
						
					}
				</script>
				<button>수정</button>
				<button>삭제</button>
			</div>
		</div>
		
		
	</div>
</body>
<footer>
	<div>
		<button onclick="location='PageMove?page=ManagerMainView'">메인으로 이동</button>
	</div>
</footer>
</html>