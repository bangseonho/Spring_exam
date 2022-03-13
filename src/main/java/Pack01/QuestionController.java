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

	@RequestMapping("/questionform")
	public String f2(@RequestParam(value="no") int no, Model model, HttpSession session) throws Exception {
		ResultSet rs = questionDAO.getQuestion();
		int newNo = no+1;
		model.addAttribute("newNo", newNo);
		System.out.println("여기는들어오나?");
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
			model.addAttribute("questionList", lst1);
		}

		return "QuestionFormView";
	}
	@RequestMapping("/reviewQuestion")
	public String f3() {
		
		return "QuestionFormView";
	}
}
