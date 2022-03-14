package Pack01;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Question.QuestionDAO;

@Controller
public class QuestionController implements HttpSessionBindingListener {
	@Autowired
	QuestionDAO questionDAO;

	//	@RequestMapping("/getQuestion")
	//	public String f1(Model model, ResultSet rs) {
	//		return "QuestionFormView";
	//	}

	// 臾몄젣 遺덈윭�삤�뒗以�
	@RequestMapping("/questionform")
	   public String f2(Model model, HttpSession session) throws Exception {
	      ResultSet rs = questionDAO.getQuestion();
	      ArrayList<ArrayList<String>> lst1 = new ArrayList<ArrayList<String>>();
	      while (rs.next()) {
	         ArrayList<String> lst2 = new ArrayList<String>();
	         lst2.add(rs.getString("id"));
	         lst2.add(rs.getString("phrase"));
	         lst2.add(rs.getString("one"));
	         lst2.add(rs.getString("two"));
	         lst2.add(rs.getString("three"));
	         lst2.add(rs.getString("four"));
	         lst2.add(rs.getString("answer"));
	         lst2.add(rs.getString("who"));
	         lst1.add(lst2);
	      }
	      model.addAttribute("questionList", lst1);
	      System.out.println(lst1.toString());
	      return "QuestionFormView";
	   }
	@RequestMapping(value="/nextQuestion", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String f3(Model model, HttpServletRequest request, @RequestBody ArrayList<ArrayList<String>> lst) {
		model.addAttribute("questionList", lst);
	      System.out.println(lst.toString());
	      System.out.println("�뿬湲곌퉴吏��삤�뒗媛�");
		return "QuestionFormView";
	}
}
