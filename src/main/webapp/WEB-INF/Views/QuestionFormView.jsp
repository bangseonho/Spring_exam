<%@page import="java.util.Arrays"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="User.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="User.UserDTO"%>
<%@page import="Result.ResultDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random" %>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey Question</title>
<style>
*, *:after, *:before {
	box-sizing: border-box;
}

body {
	
}

form {
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
}

label {
	display: flex;
	cursor: pointer;
	font-weight: 500;
	position: relative;
	overflow: hidden;
	margin-bottom: 0.375em;
}

label input {
	position: absolute;
	left: -9999px;
}

label input:checked+span {
	background-color: #d6d6e5;
}

label input:checked+span:before {
	box-shadow: inset 0 0 0 0.4375em #00005c;
}

label span {
	display: flex;
	align-items: center;
	padding: 0.375em 0.75em 0.375em 0.375em;
	border-radius: 99em;
	transition: 0.25s ease;
}

label span:hover {
	background-color: #d6d6e5;
}

label span:before {
	display: flex;
	flex-shrink: 0;
	content: "";
	background-color: #fff;
	width: 1.5em;
	height: 1.5em;
	border-radius: 50%;
	margin-right: 0.375em;
	transition: 0.25s ease;
	box-shadow: inset 0 0 0 0.125em #00005c;
}

.container1 {
	position: relative;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
	margin-top: 100px;
}

.container2 {
	position: relative;
	width: 100%;
	justify-content: center;
	align-items: center;
	padding: 20px;
	text-align: center;
}

@import url("https://fonts.googleapis.com/css?family=Mukta:700");

* {
	box-sizing: border-box;
}

*::before, *::after {
	box-sizing: border-box;
}

body {
	font-family: "Mukta", sans-serif;
	font-size: 1rem;
	line-height: 1.5;
	align-items: center;
	justify-content: center;
	margin: 0;
	min-height: 100vh;
	background: #f3f8fa;
}

button {
	position: relative;
	display: inline-block;
	cursor: pointer;
	outline: none;
	border: 0;
	vertical-align: middle;
	text-decoration: none;
	background: transparent;
	padding: 0;
	font-size: inherit;
	font-family: inherit;
}

button.learn-more {
	width: 12rem;
	height: auto;
	margin-bottom: 10px;
}

button.learn-more .circle {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: relative;
	display: block;
	margin: 0;
	width: 3rem;
	height: 3rem;
	background: #282936;
	border-radius: 1.625rem;
}

button.learn-more .circle .icon {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	background: #fff;
}

button.learn-more .circle .icon.arrow {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	left: 0.625rem;
	width: 1.125rem;
	height: 0.125rem;
	background: none;
}

button.learn-more .circle .icon.arrow::before {
	position: absolute;
	content: "";
	top: -0.25rem;
	right: 0.0625rem;
	width: 0.625rem;
	height: 0.625rem;
	border-top: 0.125rem solid #fff;
	border-right: 0.125rem solid #fff;
	transform: rotate(45deg);
}

button.learn-more .button-text {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 0.75rem 0;
	margin: 0 0 0 1.85rem;
	color: #282936;
	font-weight: 700;
	line-height: 1.6;
	text-align: center;
	text-transform: uppercase;
}

button:hover .circle {
	width: 100%;
}

button:hover .circle .icon.arrow {
	background: #fff;
	transform: translate(1rem, 0);
}

button:hover .button-text {
	color: #fff;
}

.btns {
	margin-top: 30px;
}
</style>
</head>
<body>

	<%
	/* 데이터 : phrase; one; two; three; four; answer; who; */
	ArrayList<ArrayList<String>> lst = 
		(ArrayList<ArrayList<String>>) request.getAttribute("questionList");
	int cnt = 5; // 문제 개수
	String[] strArr = new String[cnt];
	for(int i = 0; i < cnt; i++){
		strArr[i] = "[";
		for(int j = 0; j < lst.get(0).size(); j++){
			strArr[i] += "'" + lst.get(i).get(j)+ "', ";
		}
		strArr[i] += "]";
		System.out.println(strArr[i]);
	}
	
	/* 출력 */
	for (int i = 0; i < lst.size(); i++) {
		for (int j = 0; j < lst.get(i).size(); j++) {
			System.out.print(lst.get(i).get(j) + " ");
		}
		System.out.println();
	}
	int i = 0;
	/* session.setAttribute("page", 0);
	System.out.println(session.getAttribute("page").getClass().getName()); */
	%>
	
	<div class="container1" id="questionSurvey">
		<form method="POST">
			<!-- action="submitQuestion21" -->
			<div>
				<span id="title"></span>
			</div>
			<div>
				<span id="who">About<%=lst.get(i).get(0)%></span>
			</div>
			<h2 id="iddd"></h2>
			<label><input type="radio" name="radio" value="1" checked />
				<span id="select1"><%=lst.get(i).get(2)%></span></label> <label><input
				type="radio" name="radio" value="2" /> <span id="select2"><%=lst.get(i).get(3)%></span>
			</label> <label><input type="radio" name="radio" value="3" /> <span
				id="select3"><%=lst.get(i).get(4)%></span> </label> <label><input
				type="radio" name="radio" value="4" /> <span id="select4"><%=lst.get(i).get(5)%></span>
			</label>
			<div class="btns">
				<!-- <button class="learn-more" type="button">
					<span class="circle" aria-hidden="true"> <span
						class="icon arrow"></span>
					</span> <span class="button-text">Back</span>
				</button> -->
				<button class="learn-more" type="button" onclick="showQuestion()">
					<span class="circle" aria-hidden="true"> <span
						class="icon arrow"></span>
					</span> <span class="button-text">Next</span>
				</button>
			</div>
	</div>

	<script type="text/javascript">
	var i   = 0;
	var cnt = <%=cnt%>
	var arr = [];
	arr[0]  = <%=strArr[0]%>;
	arr[1]  = <%=strArr[1]%>;
	arr[2]  = <%=strArr[2]%>;
	arr[3]  = <%=strArr[3]%>;
	arr[4]  = <%=strArr[4]%>;
	// 첫 페이지 시작 시 불러옴
	showQuestion();
	var timer;
	function showQuestion() {
		ResultDAO resultDAO = ${resultDAO};
		resultDAO.insert(null, '1',1,'1',1);
	
		if(timer){			
		clearTimeout(timer);
		console.log(11);
		}
		console.log(22);
		if(i >= cnt){
			console.log("끝");
			// 컨트롤러로 값 전달 (어떻게?)
			location.href="index.jsp"; // 일단 메인으로 가게 해놨음
			return;
		}
		
		/* document.getElementById("questionSurvey");
		const headingEl = document.querySelector("span#title");
		headingEl.textContent = "안녕하세요!"; */
		
		document.getElementById("title").innerHTML   = arr[i][1];
		document.getElementById("select1").innerHTML = arr[i][2];
		document.getElementById("select2").innerHTML = arr[i][3];
		document.getElementById("select3").innerHTML = arr[i][4];
		document.getElementById("select4").innerHTML = arr[i][5];
		document.getElementById("who").innerHTML 	 = "About " + arr[i][7];
		i++;

		timer = setTimeout(timeout, 3000);
	}
	function timeout(){
			alert("5초 경과");
	}
	
	// 나가기 경고창
	window.addEventListener("beforeunload", function (event) {
		  event.returnValue = "나가시겠습니까?"; // 익스플로러에서만 뜸
		});
	</script>
	
</body>
</html>