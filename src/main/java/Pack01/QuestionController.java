package Pack01;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Question.QuestionDAO;

@Controller
public class QuestionController implements HttpSessionBindingListener {
	@Autowired
	QuestionDAO questionDAO;

	//	@RequestMapping("/getQuestion")
	//	public String f1(Model model, ResultSet rs) {
	//		return "QuestionFormView";
	//	}

	@RequestMapping("/questionform")
	public String f2(Model model, HttpSession session) throws Exception {
		ResultSet rs = questionDAO.getQuestion();
		int no = 0;
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
//			model.addAttribute(Integer.toString(no), lst2);
//			session.setAttribute(Integer.toString(no), lst2);
//			no++;
//			System.out.println(session.getAttribute(Integer.toString(no)));
		}
		model.addAttribute("questionList", lst1);
//		int cnt = 0;
		return "QuestionFormView";
	}

}
