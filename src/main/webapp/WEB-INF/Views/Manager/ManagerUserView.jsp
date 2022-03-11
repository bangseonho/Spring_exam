<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���� ������</title>
<style>
body {
	
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
}

#user-list {
	border-collapse: collapse;
}

#user-list tbody tr:hover {
	background-color: red;
}

.right-side {
	display: flex;
	flex-direction: column;
	overflow: auto;
}

.content-title {
	
}

.button-group {
	display: flex;
	justify-content: right;
}

.survey-group {
	
}

footer {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

</head>
<body>
	<div class="title-group"><label>ȸ�� ����</label></div>
	<div class="total-group">

		<!-- ����. ���� ��� -->
		<div class="left-side">
			<table id="user-list">
				<thead>
					<tr>
						<td>��ȣ</td>
						<td>�̸�</td>
						<td>�������</td>
						<td>����</td>
						<td>������</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>ȫ�浿</td>
						<td>929292</td>
						<td>50</td>
						<td>2022-03-11</td>
						<td><a href="">����</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>ȫ�浿</td>
						<td>929292</td>
						<td>50</td>
						<td>2022-03-11</td>
						<td><a href="">����</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td>ȫ�浿</td>
						<td>929292</td>
						<td>50</td>
						<td>2022-03-11</td>
						<td><a href="">����</a></td>
					</tr>
				</tbody>
			</table>
			<script>
			
			
			</script>
		</div>

		<!-- ����. ���� ���� -->
		<div class="right-side">
			<div class="survey-group">
				<div>
					<label class="content-title">����</label>
				</div>
				<div>
					<div>
						<input type="radio" name="answer" value="1" disabled checked>
						<label>����1</label>
					</div>

					<div>
						<input type="radio" name="answer" value="2" disabled> <label>����2</label>
					</div>

					<div>
						<input type="radio" name="answer" value="3" disabled> <label>����3</label>
					</div>

					<div>
						<input type="radio" name="answer" value="4" disabled> <label>����4</label>
					</div>
				</div>
			</div>



			<!-- ���ÿ� �ڵ� -->

			<div class="survey-group">
				<div>
					<label class="content-title">����</label>
				</div>
				<div>
					<div>
						<input type="radio" name="answer" value="1" disabled checked>
						<label>����1</label>
					</div>

					<div>
						<input type="radio" name="answer" value="2" disabled> <label>����2</label>
					</div>

					<div>
						<input type="radio" name="answer" value="3" disabled> <label>����3</label>
					</div>

					<div>
						<input type="radio" name="answer" value="4" disabled> <label>����4</label>
					</div>
				</div>
			</div>




			<div class="survey-group">
				<div>
					<label class="content-title">����</label>
				</div>
				<div>
					<div>
						<input type="radio" name="answer" value="1" disabled checked>
						<label>����1</label>
					</div>

					<div>
						<input type="radio" name="answer" value="2" disabled> <label>����2</label>
					</div>

					<div>
						<input type="radio" name="answer" value="3" disabled> <label>����3</label>
					</div>

					<div>
						<input type="radio" name="answer" value="4" disabled> <label>����4</label>
					</div>
				</div>
			</div>
			<!-- ���ÿ� �ڵ� -->



		</div>


	</div>
</body>
<footer>
	<div>
		<button onclick="location='PageMove?page=ManagerMainView'">�������� �̵�</button>
	</div>	
</footer>
</html>