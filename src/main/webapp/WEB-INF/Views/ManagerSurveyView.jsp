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
	<div class="title-group"><label>���� ����</label></div>
	<div class="total-group">
	
		<!-- ����. ���� ��� -->
		<div class="left-side">
			<table id="survey-list">
				<thead>
					<tr>
						<td>��ȣ</td>
						<td>����</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>����1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>����2</td>
					</tr>
						<tr>
						<td>3</td>
						<td>����3</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- ����. ���� ���� -->
		<div class="right-side">
			<div >
				<div><label class="content-title">����</label></div>
				<div>
					<div>
					<input type="radio" name="answer" value="1">
					<input type="text" name="option1" value="����1">
					</div>

					<div>
					<input type="radio" name="answer" value="2">
					<input type="text" name="option2" value="����2">
					</div>					

					<div>
					<input type="radio" name="answer" value="3">
					<input type="text" name="option3" value="����3">
					</div>					

					<div>
					<input type="radio" name="answer" value="4">
					<input type="text" name="option4" value="����4">
					</div>					
				</div>
			</div>
			<div class="button-group">
				<button onclick="func()">�ʱ�ȭ</button>
				<script>
					funct(){
						
					}
				</script>
				<button>����</button>
				<button>����</button>
			</div>
		</div>
		
		
	</div>
</body>
<footer>
	<div>
		<button onclick="location='PageMove?page=ManagerMainView'">�������� �̵�</button>
	</div>
</footer>
</html>