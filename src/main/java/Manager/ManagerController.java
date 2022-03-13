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
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/ManagerQuestion")
	String managerQuestion(Model model) {
		
		ResultSet rs = null;
		
		try {
			// Get Data from DB
			rs = managerDAO.getQuestions();

			// Get Column Names
			String[] questionColNameList = getColNames(rs);
		    model.addAttribute("questionColNameList", questionColNameList);
			
			// Get Row Field Data
		    ArrayList<QuestionDTO> questionList = getQuestionList(rs);
			
			System.out.println("설문 목록 1번쨰 내용");
			System.out.println(questionList.get(0).toString());
			model.addAttribute("questionList", questionList);

		} catch (Exception e) { e.printStackTrace(); }

		return rs != null? "Manager/ManagerQuestionView" : "ManagerMainView?pageMove=fail";
		
	}
	
	@RequestMapping("/ManagerQuestionCreate")
	String managerQuestionCreate(Model model) {
		System.out.println("ManagerQuestionCreateView로 이동");
		
		model.addAttribute("sqlType", "create");
		return "Manager/ManagerQuestionCreateView";
	}
	
	@RequestMapping("/ManagerQuestionUpdateOne")
	String managerQuestionUpdate(Model model, @RequestParam(value = "id") String id) {
		
		int cnt = 0;
		try {
			cnt = managerDAO.updateQuestion(id);
		} catch (Exception e) { e.printStackTrace(); }

		model.addAttribute("sqlType", "update");
		return "Manager/ManagerQuestionCreateView";
	}
	
	@RequestMapping("/ManagerQuestionDeleteOne")
	String managerQuestionDeleteOne(Model model, @RequestParam(value = "id") String id) {
		
		int cnt = 0;
		try {
			cnt = managerDAO.deleteQuestion(id);
		} catch (Exception e) { e.printStackTrace(); }
		
		return "redirect:/ManagerQuestion";
	}
	
	@RequestMapping("/ManagerQuestionDeleteAll")
	String managerQuestionDeleteAll(Model model) {
		
		/*
		int cnt = 0;
		try {
			cnt = managerDAO.deleteAllQuestions();
		} catch (Exception e) { e.printStackTrace(); }
		*/
		System.out.println("문제 전체 삭제");

		return "redirect:/ManagerQuestion";
	}

	/**
	 * Get column names except first field.
	 * @param rs
	 * @return String[]
	 * @throws Exception
	 */
	String[] getColNames(ResultSet rs) throws Exception{
		String[] questionColNameList = null;
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount(); 
		questionColNameList = new String[columnCount]; 
		for(int i=1; i<=columnCount; i++) {
			questionColNameList[i-1] = rsmd.getColumnName(i); 
		}
		return questionColNameList;
	}
	
	/**
	 * Get question list.
	 * @param rs
	 * @return
	 * @throws Exception
	 */
	ArrayList<QuestionDTO> getQuestionList(ResultSet rs) throws Exception{
    	ArrayList<QuestionDTO> questionList = new ArrayList<QuestionDTO>();
    	while(rs.next()) {
    		questionList.add(
				new QuestionDTO(
					rs.getString("id"),
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
    	return questionList;
    }
}
