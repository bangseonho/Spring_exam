<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ͺ��̽� ���� ������</title>
<style>
body {
	
}

.title-group{
	text-align: center;
}

.total-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.option-group{
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
<!-- �׽�Ʈ�� -->
<%= new Date() %>
</head>
<body>
	<div class="title-group"><label>�����ͺ��̽� ����</label></div>
	<div class="total-group">

		<div class="option-group">
			<div>
				<label>�������� �ð� : </label>
				<input type="text" value="5">
				<label> ��</label>
			</div>
			<div>
				<button>������ ��ü ����</button>
			</div>
		</div>
		<div>
			<button>�� �ʱ�ȭ</button>
			<button>����</button>
		</div>

	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerController'">�������� �̵�</button>
	</div>
</footer>
</html>