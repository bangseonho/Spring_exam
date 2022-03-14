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
import Result.ResultDAO;

@Controller
public class QuestionController implements HttpSessionBindingListener {
	@Autowired
	QuestionDAO questionDAO;

	@Autowired
	ResultDAO resultDAO;

	//	@RequestMapping("/getQuestion")
	//	public String f1(Model model, ResultSet rs) {
	//		return "QuestionFormView";
	//	}
	public String f2(Model model, HttpSession session) throws Exception {
		ResultSet rs = questionDAO.getQuestion();
		int no = 0;
		model.addAttribute("no", no);
		System.out.println("�ш린���ㅼ�댁�ㅻ��?");
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
<<<<<<< HEAD
//			model.addAttribute(Integer.toString(no), lst2);
//			session.setAttribute(Integer.toString(no), lst2);
//			no++;
//			System.out.println(session.getAttribute(Integer.toString(no)));
		}
		model.addAttribute("questionList", lst1);
//		int cnt = 0;
=======
			model.addAttribute("questionList", lst1);
			model.addAttribute("resultDAO", resultDAO);
		}

		return "QuestionFormView";
	}
	@RequestMapping("/reviewQuestion")
	public String f3() {
		
>>>>>>> b1e3192812cfd6eeb5255d45db90586745c378c0
		return "QuestionFormView";
	}
}
