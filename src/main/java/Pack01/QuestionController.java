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
	@RequestMapping("/questionform")
	public String f2(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		// 이 회원이 문제를 얼마나 풀었는지 확인하기
		//		유저코드
		String userCode = (String) session.getAttribute("user_code");
		Thread.sleep(1000);
		// DB에서 개수 가져오기
		int cnt = 5; // sql로 가져오기
		if(questionDAO.resultAllCount(userCode)>cnt) {
			System.out.println("이미 시험쳤어요~");
			System.out.println(cnt);
			resultDAO.updateFlag(userCode); 
			return "redirect:result";
//			return "MainView";

		}
		else {
		System.out.println(questionDAO.resultAllCount(userCode)+"123a");
		ResultSet rs = questionDAO.getQuestion(userCode);
		ArrayList<String> question = new ArrayList<String>();
		//		내가고른값 번호
				String myAnswer = request.getParameter("radio");
		//		문제번호
				String questionNo = request.getParameter("questionNo");
		//		정답
				String answer = request.getParameter("answer");
				int correct=0;
				
				if(questionNo!=null) {
					if(myAnswer.equals(answer)) {
						correct=1;
					}
					System.out.println(Integer.parseInt(myAnswer));
					ResultDTO dto = new ResultDTO(userCode, Integer.parseInt(questionNo), Integer.parseInt(myAnswer), correct);
					resultDAO.insertResult(dto);
				}
				
		while (rs.next()) {
			question.add(rs.getString("id"));
			if(questionDAO.isDuplicated(userCode,rs.getString("id"))==true) {
				return "QuestionFormView";
			}
			question.add(rs.getString("phrase"));
			question.add(rs.getString("one"));
			question.add(rs.getString("two"));
			question.add(rs.getString("three"));
			question.add(rs.getString("four"));
			question.add(rs.getString("answer"));
			question.add(rs.getString("who"));
			model.addAttribute("question", question);
		}
		return "QuestionFormView";
		}
	}
	
	@RequestMapping("/QuestionGenerate")
	public String questionGenerate(Model model, HttpSession session) throws Exception {

		String userName = (String)session.getAttribute("user_name");
		String userCode = (String)session.getAttribute("user_code");

		// 문제 푼 횟수 확인
		if(isExceedCnt(userName, userCode)) {
			resultDAO.increaseFlag(userCode); 
			return "redirect:result";
		}
		
		// 문제 생성
		ArrayList<String> question = new ArrayList<String>();
		ResultSet rs = questionDAO.getQuestion(userCode);
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
		
		return "QuestionFormView";
	}
	
	@RequestMapping("/QuestionResultInsert")
	public String questionResultInsert(HttpSession session, HttpServletRequest request) {
		
		// 관리자 상태 확인
		int 	adminFlag = 1;
		UserDTO adminInfo = null;
		try {
			adminInfo = userDAO.findUserInfo("admin");
			adminFlag = adminInfo.getFlag();
		} catch (Exception e) { e.printStackTrace(); }
    	
		String userName = (String)session.getAttribute("user_name");
		String userCode = (String)session.getAttribute("user_code");
		
		// 문제 푼 횟수 확인
		if(isExceedCnt(userName, userCode)) return "redirect:result";
		
		// 사용자 선택지 저장
		String myAnswer   = request.getParameter("radio");
		String questionNo = request.getParameter("questionNo");
		String answer 	  = request.getParameter("answer");
		int userFlag   	  = userDAO.flagCheck(userName, userCode);
		if((isNullChecker(new Object[] {userCode, myAnswer, questionNo, answer, userFlag}) < 0) && (adminFlag == 0)){
		
			int correct = myAnswer.equals(answer) ? 1 : 0;
			ResultDTO dto = new ResultDTO(
					userCode, Integer.parseInt(questionNo), 
					Integer.parseInt(myAnswer), 
					correct,
					userFlag
					);
			try {
				resultDAO.insertResult(dto);
			} catch (Exception e) { e.printStackTrace(); }
			
			return "redirect:QuestionGenerate";
			
		} else {
			return "redirect:logout";
		}
		
	}
	
	public boolean isExceedCnt(String userName, String userCode) {
		int limitCnt = 5; // default;
		int resCnt = 0;
		try {
			// 더 나은 방법 있는지 생각해보기
			ResultSet rs = settingDAO.selectSetting();
			rs.next();
			limitCnt = rs.getInt("questionNum");
			int flag = userDAO.flagCheck(userName, userCode);
			System.out.println("flag12 : " + flag);
			resCnt 	 = questionDAO.resulResultFlagCount(userCode, flag);
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