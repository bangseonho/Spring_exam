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
import Question.QuestionDTO;

@Controller
public class QuestionController implements HttpSessionBindingListener {
	@Autowired
	QuestionDAO questionDAO;


//	@RequestMapping("/getQuestion")
//	public String f1(Model model, ResultSet rs) {
//		return "QuestionFormView";
//	}

	@RequestMapping("/questionform")
	public String f2(HttpSession session) throws Exception {
		ResultSet rs = QuestionDAO.getQuestion();
		int no = 0;
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
			session.setAttribute(Integer.toString(no), lst2);
			no++;
			System.out.println(session.getAttribute(Integer.toString(no)));
		}
		int cnt = 0;
		return "QuestionFormView";
	}

}
