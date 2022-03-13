<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스 관리 페이지</title>
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
<!-- 테스트용 -->
<%= new Date() %>
</head>
<body>
	<div class="title-group"><label>데이터베이스 관리</label></div>
	<div class="total-group">

		<div class="option-group">
			<div>
				<label>설문조사 시간 : </label>
				<input type="text" value="5">
				<label> 분</label>
			</div>
			<div>
				<button>참여자 전체 삭제</button>
			</div>
		</div>
		<div>
			<button>값 초기화</button>
			<button>적용</button>
		</div>

	</div>
</body>
<footer>
	<div>
		<button onclick="location='ManagerController'">메인으로 이동</button>
	</div>
</footer>
</html>