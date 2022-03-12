package Manager;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Question.QuestionDTO;

@Controller
public class ManagerController {
	@Autowired
	ManagerDAO managerDAO;
	
	@RequestMapping("/ManagerController")
	String managerController() {
		
		return "ManagerMainView";
	}
	
	@RequestMapping("/ManagerSurvey")
	String managerSurvey(Model model) {
		
		ResultSet rs = null;
		
		try {
			// Get Data from DB
			rs = managerDAO.getQuestions();
			
			// Create Array
			ArrayList<QuestionDTO> questionList = new ArrayList<QuestionDTO>();
			while(rs.next()) {
				questionList.add(
					new QuestionDTO(
							rs.getString("phrase"), 
							rs.getString("one"), 
							rs.getString("two"), 
							rs.getString("three"), 
							rs.getString("four"), 
							rs.getString("answer"), 
							rs.getString("who")
						)
				);
			}
			System.out.println(questionList.get(0).toString());
			model.addAttribute("questionList", questionList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return rs != null? "Manager/ManagerSurveyView" : "ManagerMainView";
		
	}
}
