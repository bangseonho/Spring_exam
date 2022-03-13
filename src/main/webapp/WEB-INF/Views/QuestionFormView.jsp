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
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
/*  */

@import url('https://fonts.googleapis.com/css?family=Lato');

/* default */
*,
*::after,
*::before {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* body */
body {
  min-height: 100vh;
  padding: 20px;
  display: flex;
/*   flex-wrap: wrap; */
  justify-content: center;
  align-items: center;
  font-family: "Lato", "Segoe Ui", -apple-system, BlinkMacSystemFont, sans-serif;
}

/* .flip-card-container */
.flip-card-container {
  --hue: 150;
  --primary: hsl(var(--hue), 50%, 50%);
  --white-1: hsl(0, 0%, 90%);
  --white-2: hsl(0, 0%, 80%);
  --dark: hsl(var(--hue), 25%, 10%);
  --grey: hsl(0, 0%, 50%);

  width: 310px;
  height: 500px;
  margin: 40px;

  perspective: 1000px;
}

/* .flip-card */
.flip-card {
  width: inherit;
  height: inherit;

  position: relative;
  transform-style: preserve-3d;
  transition: .6s .1s;
}

/* hover and focus-within states */
.flip-card-container:hover .flip-card,
.flip-card-container:focus-within .flip-card {
  transform: rotateY(180deg);
}

/* .card-... */
.card-front,
.card-back {
  width: 100%;
  height: 100%;
  border-radius: 24px;
  position: absolute;
  top: 0;
  left: 0;
  overflow: hidden;
  backface-visibility: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align:center;
}

/* .card-front */
.card-front {
  transform: rotateY(0deg);
  z-index: 2;
}

/* .card-back */
.card-back {
  transform: rotateY(180deg);
  z-index: 1;
}

/* figure */
figure {
  z-index: -1;
}

/* figure, .img-bg */
figure,
.img-bg {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;
}

/* img */
img {
  height: 100%;
  border-radius: 24px;
}

/* figcaption */
figcaption {
  display: block;

  width: auto;
  margin-top: 12%;
  padding: 8px 22px;

  font-weight: bold;
  line-height: 1.6;
  letter-spacing: 2px;
  word-spacing: 6px;
  text-align: right;
  position: absolute;
  top: 0;
  right: 12px;
  color: var(--white-1);
  background: hsla(var(--hue), 25%, 10%, .5);
}

/* .img-bg */
.img-bg {
 /*  background: hsla(var(--hue), 25%, 10%, .5); */
}

.card-front .img-bg {
  clip-path: polygon(0 20%, 100% 40%, 100% 100%, 0 100%);
}

.card-front .img-bg::before {
  content: "";

  position: absolute;
  top: 34%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(18deg);

  width: 100%;
  height: 6px;
  /* border: 1px solid var(--primary); */
  border-left-color: transparent;
  border-right-color: transparent;

  transition: .1s;
}

.card-back .img-bg {
  clip-path: polygon(0 0, 100% 0, 100% 80%, 0 60%);
}

/* hover state */
.flip-card-container:hover .card-front .img-bg::before {
  width: 6px;
  border-left-color: var(--primary);
  border-right-color: var(--primary);
}

/* ul */
ul {
  padding-top: 50%;
  margin: 0 auto;
  width: 70%;
  height: 100%;

  list-style: none;
  color: var(--white-1);

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

/* li */
li {
  width: 100%;
  margin-top: 12px;
  padding-bottom: 12px;

  font-size: 14px;
  text-align: center;

  position: relative;
}

li:nth-child(2n) {
  color: var(--white-2);
}

li:not(:last-child)::after {
  content: "";

  position: absolute;
  bottom: 0;
  left: 0;

  width: 100%;
  height: 1px;

  background: currentColor;
  opacity: .2;
}
/*  */
</style>
</head>
<body>
 <%
	ArrayList<ArrayList<String>> lst = (ArrayList<ArrayList<String>>) request.getAttribute("questionList");
	for (int i = 0; i < lst.size(); i++) {
		for (int j = 0; j < lst.get(i).size(); j++) {
			System.out.print(lst.get(i).get(j) + " ");
		}
		System.out.println();
	}
	 int no = (int)request.getAttribute("no");
	System.out.println(no);
	%>
	<form method="POST" action="reviewQuestion?no=${no+1}">
		<div>
			<span>${no}번 문제</span>
		</div>
		 <div>
			<span>About <%=lst.get(no).get(7)%></span>
		</div>D
		<br>
		<label><input type="radio" name="radio" checked value="1" />
			<span><%=lst.get(no).get(2)%></span> </label> <label><input
			type="radio" name="radio" value="2" /> <span><%=lst.get(no).get(3)%></span>
		</label> <label><input type="radio" name="radio" value="3" /> <span><%=lst.get(no).get(4)%></span>
		</label> <label><input type="radio" name="radio" value="4" /> <span><%=lst.get(no).get(5)%></span>
		</label>
		<div class="btns">
			<button class="learn-more">
				<span class="circle" aria-hidden="true"> <span
					class="icon arrow"></span>
				</span> <span class="button-text">Back</span>
			</button>
			<button class="learn-more">
				<span class="circle" aria-hidden="true"> <span
					class="icon arrow"></span>
				</span> <span class="button-text">저장하기</span>
			</button>
		</div>
	</form>
	<script type="text/javascript"> 

   </script> 
</body>
</html>