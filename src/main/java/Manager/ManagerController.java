package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.LinkedList;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pack01.ConnectionDB;
import User.UserDTO;
import Question.QuestionDTO;

@Controller
public class ManagerController {
	@Autowired
	ManagerDAO managerDAO;
	
	@RequestMapping("/ManagerController")
	String managerController() {	
		return "ManagerMainView";
	}
	

	@RequestMapping("/ManagerUserView")
	String allUser(Model model) {
		LinkedList<UserDTO> listUser = new LinkedList<UserDTO>();

		try {
			ResultSet rs = managerDAO.getUsers();
			while(rs.next()) {
				listUser.add(new UserDTO(rs.getString("name"), rs.getString("birth"), rs.getString("code")));
			}
		} catch(Exception e) {System.out.println("errorhere");}
		
		model.addAttribute("listUser", listUser);
		return "Manager/ManagerUserView";
	}
	
	@RequestMapping("/ManagerSurvey")
	String managerSurvey(Model model) {
		
		ResultSet rs = null;
		
		try {
			// Get Data from DB
			rs = managerDAO.getQuestions();

			// Get Column Names
			String[] questionColNameList = null;
		    ResultSetMetaData rsmd = rs.getMetaData();
		    int columnCount = rsmd.getColumnCount(); 
		    questionColNameList = new String[columnCount]; 
			
		    for(int i=1; i<=columnCount; i++) {
		        // Put column name into array
		    	questionColNameList[i-1] = rsmd.getColumnName(i); 
		    }
		    model.addAttribute("questionColNameList", questionColNameList);
			
			// Get Row Field Data
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
			
			System.out.println("설문 목록 1번쨰 내용");
			System.out.println(questionList.get(0).toString());
			model.addAttribute("questionList", questionList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return rs != null? "Manager/ManagerSurveyView" : "ManagerMainView";
		
	}
}
