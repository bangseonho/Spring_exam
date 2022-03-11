<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>참여자 관리 페이지</title>
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
	<div class="title-group"><label>회원 관리</label></div>
	<div class="total-group">

		<!-- 좌측. 문제 목록 -->
		<div class="left-side">
			<table id="user-list">
				<thead>
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>점수</td>
						<td>참여일</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>홍길동</td>
						<td>929292</td>
						<td>50</td>
						<td>2022-03-11</td>
						<td><a href="">삭제</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>홍길동</td>
						<td>929292</td>
						<td>50</td>
						<td>2022-03-11</td>
						<td><a href="">삭제</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td>홍길동</td>
						<td>929292</td>
						<td>50</td>
						<td>2022-03-11</td>
						<td><a href="">삭제</a></td>
					</tr>
				</tbody>
			</table>
			<script>
			
			
			</script>
		</div>

		<!-- 우측. 문제 내용 -->
		<div class="right-side">
			<div class="survey-group">
				<div>
					<label class="content-title">문제</label>
				</div>
				<div>
					<div>
						<input type="radio" name="answer" value="1" disabled checked>
						<label>보기1</label>
					</div>

					<div>
						<input type="radio" name="answer" value="2" disabled> <label>보기2</label>
					</div>

					<div>
						<input type="radio" name="answer" value="3" disabled> <label>보기3</label>
					</div>

					<div>
						<input type="radio" name="answer" value="4" disabled> <label>보기4</label>
					</div>
				</div>
			</div>



			<!-- 예시용 코드 -->

			<div class="survey-group">
				<div>
					<label class="content-title">문제</label>
				</div>
				<div>
					<div>
						<input type="radio" name="answer" value="1" disabled checked>
						<label>보기1</label>
					</div>

					<div>
						<input type="radio" name="answer" value="2" disabled> <label>보기2</label>
					</div>

					<div>
						<input type="radio" name="answer" value="3" disabled> <label>보기3</label>
					</div>

					<div>
						<input type="radio" name="answer" value="4" disabled> <label>보기4</label>
					</div>
				</div>
			</div>




			<div class="survey-group">
				<div>
					<label class="content-title">문제</label>
				</div>
				<div>
					<div>
						<input type="radio" name="answer" value="1" disabled checked>
						<label>보기1</label>
					</div>

					<div>
						<input type="radio" name="answer" value="2" disabled> <label>보기2</label>
					</div>

					<div>
						<input type="radio" name="answer" value="3" disabled> <label>보기3</label>
					</div>

					<div>
						<input type="radio" name="answer" value="4" disabled> <label>보기4</label>
					</div>
				</div>
			</div>
			<!-- 예시용 코드 -->



		</div>


	</div>
</body>
<footer>
	<div>
		<button onclick="location='PageMove?page=ManagerMainView'">메인으로 이동</button>
	</div>	
</footer>
</html>