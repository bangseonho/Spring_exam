<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<title>Sign Up</title>
</head>

<body>
   <div
      style="width: 30%; height: 400px; margin-top: 40px; margin-left: 34%; text-align: center; padding-top: 5%; border-radius: 30px;">
      <p style="font-size: 30px; color: #ffffff; margin: 0px;">
         <span> 회원가입 </span>
      </p>
      <div style="padding-bottom: 50px; margin-top: 30px;">
         <form method="post" action="t10" style="text-align: -webkit-center;">
            <fieldset id="regbox" style="text-align: center; border: none;">
               <input class="input input_id" type="text" name="id" required="true" maxlength="20" title="공백 제외한 20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="아이디를 입력해주세요." /> <br /> 
               <input class="input input_pw pass" type="password" name="pwd" required="true" maxlength="20" title="20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="비밀번호를 입력해주세요." /><br />
               <input class="input input_pwc pass" type="password" name="pwdc" required="true" maxlength="20" title="20자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="비밀번호를 한번 더 입력해주세요." /><br /> 
               <input class="input input_name" type="name" name="name" required="true" maxlength="10" title="공백 제외한 10자 미만으로 작성해주세요." pattern="^[\S]+$" placeholder="이름을 입력해주세요" /><br />
               <input class="input input_age" type="number" name="age" pattern="^[0-9]$" title="지정된 양식을 지켜주세요." required="true" placeholder="나이를 입력해주세요" /><br />
               
	            <label class="radio"><input type="radio" name="gender" value="male">Male</label>
				<label class="radio"><input type="radio" name="gender" value="female">Female</label><br/>
               <button class="inputBtn" type="submit" value="가입">가입</button>
            </fieldset>
         </form>
      </div>
   </div>
   
</body>
</html>
