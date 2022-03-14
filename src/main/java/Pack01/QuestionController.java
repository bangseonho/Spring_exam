package Pack01;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Question.QuestionDAO;
import Result.ResultDAO;

@Controller
public class QuestionController implements HttpSessionBindingListener {
   @Autowired
   QuestionDAO questionDAO;

   @Autowired
   ResultDAO resultDAO;


   @RequestMapping("/questionform")
   public String f2(Model model, HttpSession session, HttpServletRequest request) throws Exception {
      ResultSet rs = questionDAO.getQuestion();
      ArrayList<String> question = new ArrayList<String>();
      //      유저코드
            String userCode = (String) session.getAttribute("user_code");
      //      내가고른값 번호
            String myAnswer = request.getParameter("radio");
      //      문제번호
            String questionNo = request.getParameter("questionNo");
      //      정답 - 한글
            String answer = request.getParameter("answer");
            System.out.println(answer);
      //      
            //String[] value = request.getParameterValues("radio");
            //String temp="";
            
      while (rs.next()) {
         question.add(rs.getString("id"));
         question.add(rs.getString("phrase"));
         question.add(rs.getString("one"));
         question.add(rs.getString("two"));
         question.add(rs.getString("three"));
         question.add(rs.getString("four"));
         question.add(rs.getString("answer"));
         question.add(rs.getString("who"));
         model.addAttribute("question", question);
      }
      return "QuestionFormView";
   }
   /*@RequestMapping("/submitSelected")
   public void f3(Model model) {
      System.out.println("controller로 오는지확인");
   }*/
}