<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Question.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>질문 관리</title>
<style>
body {
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   background: hsl(220, 10%, 12%);
   margin: 0;
}

.container {
   /* height: 450px;
   width: 900px;
   transform: translate(-50%, -50%); */
}
/* 스크롤 모양 바꾸기 */
.form {
   width: 50%;
   height: 740px;
   text-align: center;
   background-color: #fff;
   border-radius: 10px 10px 10px 10px;
}

.form-element {
   width: 100%;
   height: calc(100% - 97px);
   overflow: auto;
}

.welcome {
   text-align: center;
   color: #fff;
   height: 50%;
   z-index: 30;
   margin: 2%;
}

.bold {
   font-family: 'Montserrat', sans-serif;
   font-weight: 700;
   font-size: 20px;
}

.b-button {
   background-color: #24a4ee;
   padding: 12px 25px;
   color: #fff;
   font-size: 14px;
   border-radius: 25px;
   margin: 5px;
}

.b2-button {
   background-color: #24a4ee;
   color: #fff;
   font-size: 14px;
   border-radius: 10px;
}

#question-list{
   width: 100%;
}
.button-group{
   margin: 2%;
}

</style>
</head>
<body>
   <div class="welcome">
      <label class="bold">질문 관리</label>
   </div>
      <div class="form">
         <div class="form-element">

            <table id="question-list">
               <thead>
                  <%
                  String[] questionColNameList
                     = (String[]) request.getAttribute("questionColNameList");
                  out.println("<tr>");
                  out.println("<td>" + "번호" + "</td>");
                  for (int i = 1; i < questionColNameList.length; i++) {
                     String name = questionColNameList[i];
                     out.println("<td>" + name + "</td>");
                  }
                  out.println("<td>" + "수정" + "</td>");
                  out.println("<td>" + "삭제" + "</td>");
                  out.println("</tr>");
                  %>
               </thead>
               <tbody>
                  <%
                  ArrayList<QuestionDTO> questionList
                     = (ArrayList<QuestionDTO>) request.getAttribute("questionList");
                  QuestionDTO dto = null;
                  for (int i = 0; i < questionList.size(); i++) {
                     dto = questionList.get(i);
                     out.println("<tr>");
                     /* out.println("<td>"+ (i + 1)       +"</td>"); */
                     out.println("<td>" + dto.getId() + "</td>");
                     out.println("<td>" + dto.getPhrase() + "</td>");
                     out.println("<td>" + dto.getOne() + "</td>");
                     out.println("<td>" + dto.getTwo() + "</td>");
                     out.println("<td>" + dto.getThree() + "</td>");
                     out.println("<td>" + dto.getFour() + "</td>");
                     out.println("<td>" + dto.getAnswer() + "</td>");
                     out.println("<td>" + dto.getWho() + "</td>");
                     out.println("<td>" + "<button class=\"b2-button\" onclick=\"location='ManagerQuestionGet?id=" + dto.getId() + "'\">수정</button>" + "</td>");
                     out.println("<td>" + "<button class=\"b2-button\" onclick=\"location='ManagerQuestionDeleteOne?id=" + dto.getId() + "'\">삭제</button>" + "</td>");
                     out.println("</tr>");
                  }
                  %>
               </tbody>
            </table>
         </div>
         <div class="button-group">
            <button class="b-button bold" 
               onclick="location='ManagerPageMove?page=ManagerQuestionCreateView'">질문추가</button>
            <button class="b-button bold" 
               onclick="location='ManagerQuestionDeleteAll'">질문전체삭제</button>
            <button class="b-button bold" 
               onclick="location='ManagerController'">메인으로 이동</button>
         </div>
      </div>

</body>
</html>