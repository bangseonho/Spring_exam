package Pack01;

import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Question.QuestionDAO;

public class QuestionController {
	@Autowired
	QuestionDAO questionDAO;

	@RequestMapping("/getQuestion")
	public String f1(Model model, ResultSet rs) {
		
		return "QuestionFormView";
	}

}
