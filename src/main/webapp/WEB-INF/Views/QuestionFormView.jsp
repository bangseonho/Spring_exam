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
   /* padding: 20px; */
   margin-top: 50px;
   flex-direction: column;
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

.submitbtn {
   text-align: center;
}

.submitbtn {
	text-align: center;
}
.time{
	height: 30px;
	ouline: blue;
	border-width: 10px;
	border-radius: 10px;
	border-top: none;
	/* border-left: none;
	border-right: none; */
	border-bottom: none;
	text-align: center;	
}
</style>
</head>
<body onload="realtimeClock()" oncontextmenu="return false">	<!-- 오른쪽 버튼 새로고침 막기 -->
	<%
	/* 데이터 : phrase; one; two; three; four; answer; who; */
	ArrayList<String> lst = (ArrayList<String>) request.getAttribute("question");
	int limitTime = (int) request.getAttribute("limitTime");
	%>
	<div class="container1" id="questionSurvey">
		<form name="rtcForm">
			<h5>제한 시간은 <u><%=limitTime%> 초</u>입니다. 화이팅.</h5>
			<input type="text" name="rtcInput" class="time" size="5" readonly="readonly" /><br/>
		</form>
		<!-- <form method="POST" action="questionform"> -->
		<form method="POST" action="QuestionResultInsert" id="frm" style=text-align:center;>
			<div>
				<span id="title"><%=lst.get(1)%></span>
			</div>
			<div>
				<span id="who">About <%=lst.get(7)%></span>
			</div>
			
			<h2 id="iddd"></h2>
			
			<label><input type="radio" name="radio" value="1" checked /><span id="1"><%=lst.get(2)%></span></label>
			<label><input type="radio" name="radio" value="2" /> <span id="2"><%=lst.get(3)%></span></label>
			<label><input type="radio" name="radio" value="3" /> <span id="3"><%=lst.get(4)%></span> </label>
			<label><input type="radio" name="radio" value="4" /> <span id="4"><%=lst.get(5)%></span> </label>
			
			<input type="hidden" name="questionNo" value=<%=lst.get(0)%>>
			<input type="hidden" name="answer" value=<%=lst.get(6)%>>
			
			<div class="btns">
				<button class="learn-more" type="submit">
					<span class="circle" aria-hidden="true">
						<span class="icon arrow"></span>
					</span>
					<span class="button-text">Next</span>
				</button>
				<button class="learn-more" type="button" onclick="location.href='logout'">
					<span class="circle" aria-hidden="true">
						<span class="icon arrow"></span>
					</span> 
					<span class="button-text">Logout</span>
				</button>
			</div>
		</form>
	</div>


<script type="text/javascript">
	var dt = new Date();;
	
	function realtimeClock() {
		document.rtcForm.rtcInput.value = getTimeStamp();
		setTimeout("realtimeClock()", 1);
	}
	
	function getTimeStamp() { // 24시간제
		var d = new Date();
		var ct = (d - dt) / 1000;
		
		if (ct > <%=limitTime%>){
			alert("<%=limitTime%>초 경과! 다음 문제로 넘어갑니다. ");
			dt = new Date();
			document.getElementById('frm').submit();
		}
		return ct;
	}
	
	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
		
		if (n.length < digits) {
		  for (i = 0; i < digits - n.length; i++)
		    zero += '0';
		}
		return zero + n;
	}
	
	//새로고침 막기(F5키)
	function noEvent() {
    if (event.keyCode == 116) { // function F5
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) // ctrl+N , ctrl+R
    {
        return false;
    }
	}
	document.onkeydown = noEvent;
	
	document.ontouchmove  = function (event) { 
		event.preventDefault();
	    return event.returnValue = 'Are you sure you want to exit?';
	}

</script>

	<!-- <script>
		// 나가기 경고창
		window.addEventListener("beforeunload", function(event) {
			event.returnValue = "나가시겠습니까?"; // 익스플로러에서만 뜸
		});
		
	</script> -->
</body>
</html>