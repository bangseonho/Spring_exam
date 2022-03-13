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
<%@page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
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
   ArrayList<ArrayList<String>> lst = (ArrayList<ArrayList<String>>) request.getAttribute("questionList");
   String[] arr1 = new String[8];
   String[] arr2 = new String[8];
   String[] arr3 = new String[8];
   String[] arr4 = new String[8];
   String[] arr5 = new String[8];
   
   String arr1str = "[";
   for(int i = 0; i < lst.get(0).size(); i++){
      arr1[i] = lst.get(0).get(i);
      arr1str += "'" + lst.get(0).get(i)+ "', ";
      System.out.println(arr1[i] + ",,");
   }
   arr1str += "]";
   System.out.println("arr1str : " + arr1str);
   
   String arr2str = "[";
   for(int i = 0; i < lst.get(0).size(); i++){
      arr1[i] = lst.get(1).get(i);
      arr2str += "'" + lst.get(1).get(i)+ "', ";
      System.out.println(arr1[i] + ",,");
   }
   arr2str += "]";
   System.out.println("arr1str : " + arr1str);
   
   String arr3str = "[";
   for(int i = 0; i < lst.get(0).size(); i++){
      arr1[i] = lst.get(2).get(i);
      arr3str += "'" + lst.get(2).get(i)+ "', ";
      System.out.println(arr1[i] + ",,");
   }
   arr3str += "]";
   System.out.println("arr1str : " + arr1str);
   
   String arr4str = "[";
   for(int i = 0; i < lst.get(0).size(); i++){
      arr1[i] = lst.get(3).get(i);
      arr4str += "'" + lst.get(3).get(i)+ "', ";
      System.out.println(arr1[i] + ",,");
   }
   arr4str += "]";
   System.out.println("arr1str : " + arr1str);
   
   String arr5str = "[";
   for(int i = 0; i < lst.get(0).size(); i++){
      arr1[i] = lst.get(4).get(i);
      arr5str += "'" + lst.get(4).get(i)+ "', ";
      System.out.println(arr1[i] + ",,");
   }
   arr5str += "]";
   System.out.println("arr1str : " + arr1str);
   
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
   <script type="text/javascript">
   var i = 0;
   var arr = <%=arr1str%>
   var arr = [];
   arr[0]  = <%=arr1str%>
   arr[1]  = <%=arr2str%>
   arr[2]  = <%=arr3str%>
   arr[3]  = <%=arr4str%>
   arr[4]  = <%=arr5str%>
      function showQuestion(a) {
         
         console.log(i++);
         console.log(arr[i]);
         document.getElementById("questionSurvey");
         const headingEl = document.querySelector("span#title");
         headingEl.textContent = "안녕하세요!";
         
         document.getElementById("title").innerHTML = arr[i][0];
         document.getElementById("who").innerHTML = "About " + arr[i][6];
         document.getElementById("select1").innerHTML = arr[i][1];
         document.getElementById("select2").innerHTML = arr[i][2];
         document.getElementById("select3").innerHTML = arr[i][3];
         document.getElementById("select4").innerHTML = arr[i][4];
         
      }
   
   </script>
   <div class="container1" id ="questionSurvey">
         
      <form method="POST"> <!-- action="submitQuestion21" -->
         <div>    
            <span id="title"></span>
         </div>   
         <div>
            <span id="who">About<%=lst.get(i).get(0)%></span>
         </div>
         <h2 id="iddd"></h2>
         <label><input type="radio" name="radio" checked value="1" /> <span id="select1"><%=lst.get(i).get(2)%></span></label> 
         <label><input type="radio" name="radio" value="2" /> <span  id="select2"><%=lst.get(i).get(3)%></span> </label> 
         <label><input type="radio" name="radio" value="3" /> <span  id="select3"><%=lst.get(i).get(4)%></span> </label>
         <label><input type="radio" name="radio" value="4" /> <span  id="select4"><%=lst.get(i).get(5)%></span> </label>
         <div class="btns">
            <button class="learn-more" type="button">
               <span class="circle" aria-hidden="true"> <span
                  class="icon arrow"></span>
               </span> <span class="button-text">Back</span>
            </button>
            <button class="learn-more" type="button" onclick="showQuestion(<%=i%>)">
               <span class="circle" aria-hidden="true"> <span
                  class="icon arrow"></span>
               </span> <span class="button-text">Next</span>
            </button>
         </div>

   </div>
</body>
</html>