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
import Result.ResultDTO;
import Setting.SettingDAO;
import User.UserDAO;
import User.UserDTO;

@Controller
public class QuestionController implements HttpSessionBindingListener {
	@Autowired
	QuestionDAO questionDAO;

	@Autowired
	ResultDAO resultDAO;
	
	@Autowired
	SettingDAO settingDAO;
	
	@Autowired
	UserDAO userDAO;

	//	@RequestMapping("/getQuestion")
	//	public String f1(Model model, ResultSet rs) {
	//		return "QuestionFormView";
	//	}
	
	@RequestMapping("/MakeQuestion")
	public String makeQuestion(HttpSession session) {
		String userCode = (String) session.getAttribute("user_code");
		int TotalQuestionNumber = 5;
		int existProblemNumber = 0;

		try {
			ResultSet rs = settingDAO.selectSetting();
			if(rs.next()){
				TotalQuestionNumber = rs.getInt("questionNum");
			}
		} catch (Exception e1) { e1.printStackTrace(); }
		
		
		// block bring question (can only bring first time)
		try {
			existProblemNumber = resultDAO.blockBringQuestion(userCode);

		} catch (Exception e) {
			e.printStackTrace();
		}

		for (int i = existProblemNumber; i < TotalQuestionNumber; i++) {
			questionDAO.makeQ(userCode); // makeQ -> Quesion2
		}

		return "redirect:QuestionGenerate";
	}
	
	@RequestMapping("/QuestionGenerate")
	public String questionGenerate(Model model, HttpSession session) throws Exception {

		String userCode = (String)session.getAttribute("user_code");
		// 문제가 중간에 삭제될 수도 있으므로 불러올 때 마다 문제 개수가 remove가 0인 경우가 5개인지 체크한다
		// 문제 푼 횟수 확인
		if(isExceedCnt(userCode)) {
			resultDAO.updateFlag(userCode); 
			return "redirect:result";
		}
		
		// 문제 생성
		ArrayList<String> question = new ArrayList<String>();
		ResultSet rs = questionDAO.bringQuestion(userCode);
		rs.next();
		question.add(rs.getString("id"));
		question.add(rs.getString("phrase"));
		question.add(rs.getString("one"));
		question.add(rs.getString("two"));
		question.add(rs.getString("three"));
		question.add(rs.getString("four"));
		question.add(rs.getString("answer")); // int
		question.add(rs.getString("who"));
		
		model.addAttribute("question", question);
		
		ResultSet rs1 = settingDAO.selectSetting();
		int limitTime = 10;
		if(rs1.next()){
			limitTime = rs1.getInt("limitTime");
		}
		model.addAttribute("limitTime", limitTime);
		
		return "QuestionFormView";
	}
	
	@RequestMapping("/QuestionResultInsert")
	public String questionResultInsert(HttpSession session, HttpServletRequest request) {
		int adminFlag = 1;
		// get admin flag
		UserDTO adminInfo = null;
		try {
			adminInfo = userDAO.findUserInfo("admin");
			adminFlag = adminInfo.getFlag();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		String userCode = (String)session.getAttribute("user_code");
		
		// 문제 푼 횟수 확인
		if(isExceedCnt(userCode)) return "redirect:result";
		
		// 사용자 선택지 저장
		String myAnswer   = request.getParameter("radio");
		String questionNo = request.getParameter("questionNo");
		String answer 	  = request.getParameter("answer");
		
		if((isNullChecker(new Object[] {userCode, myAnswer, questionNo, answer}) < 0) && (adminFlag == 0)){
		
			int correct = myAnswer.equals(answer) ? 1 : 0;
			ResultDTO dto = new ResultDTO(
					userCode, Integer.parseInt(questionNo), 
					Integer.parseInt(myAnswer), 
					correct
					);
			try {
				resultDAO.insertResult(dto);
			} catch (Exception e) { e.printStackTrace(); }
			
			return "redirect:QuestionGenerate";
			
		} else {
			return "redirect:logout";
		}
		
	}
	
	public boolean isExceedCnt(String userCode) {
		int limitCnt = 5; // default;
		int resCnt = 0;
		try {
			// 더 나은 방법 있는지 생각해보기
			ResultSet rs = settingDAO.selectSetting();
			if(rs.next()){
				limitCnt = rs.getInt("questionNum");
				resCnt 	 = questionDAO.resultAllCount(userCode);
			}
		}catch (Exception e) { e.printStackTrace(); }
		return resCnt >= limitCnt ? true : false;
	}
	
	/**
	 * Check Object array has null value. If null is exist in array, the index is return. else, return -1. 
	 * @param arr : Object array
	 * @return (1) null index, or (2) -1 if not exist.
	 */
	public int isNullChecker(Object[] arr) {
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] == null) return i;
		}
		return -1;
	}
	
	/*@RequestMapping("/submitSelected")
	public void f3(Model model) {
		System.out.println("controller로 오는지확인");
	}*/

}