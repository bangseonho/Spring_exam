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
import Setting.SettingDTO;
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
	SettingDTO settingDTO;
	
	@Autowired
	UserDAO userDAO;

	//	@RequestMapping("/getQuestion")
	//	public String f1(Model model, ResultSet rs) {
	//		return "QuestionFormView";
	//	}
	
	@RequestMapping("/MakeQuestion")
		public String makeQuestion(HttpSession session){
			String userCode = (String) session.getAttribute("user_code");
			for(int i=0; i<5; i++) {
				questionDAO.makeQ(userCode);	//makeQ -> Quesion2
			}
			
		return "redirect:QuestionGenerate";
	}
	
	@RequestMapping("/QuestionGenerate")
	public String questionGenerate(Model model, HttpSession session) throws Exception {
		System.out.println("Start Generate ===");
		// 함수 시간 측정
		long beforeTime = System.currentTimeMillis();

		String userName = (String)session.getAttribute("user_name");
		String userCode = (String)session.getAttribute("user_code");

		// 문제 푼 횟수 확인
		int curUserFlag = userDAO.flagCheck(userName, userCode);
		if(isExceedCnt(userCode, curUserFlag)) {
			// resultDAO.updateFlag(userCode); 
			resultDAO.increaseFlag(userCode); 
			return "redirect:result";
		}
		
		// 문제 생성
		ArrayList<String> question = new ArrayList<String>();
		ResultSet rs = questionDAO.getQuestion(userCode, curUserFlag);
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
		
		// 문제 제한 시간 가져오기
		// DB 방식
		// ResultSet rs1 = settingDAO.selectSetting();
		// rs1.next();
		// int limitTime = rs1.getInt("limitTime");
		
		// DTO 방식
		int limitTime = settingDTO.getLimitTime();
		model.addAttribute("limitTime", limitTime);
		
		// 함수 시간 측정
		long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
		long secDiffTime = (afterTime - beforeTime); //두 시간에 차 계산
		System.out.println("Generate 시간차이(m) : " + secDiffTime);
		
		return "QuestionFormView";
	}
	
	@RequestMapping("/QuestionResultInsert")
	public String questionResultInsert(HttpSession session, HttpServletRequest request) {
		System.out.println("Start Insert == ");
		
		// 함수 시간 측정
		long beforeTime = System.currentTimeMillis();
		        
		int adminFlag = 1;
		UserDTO adminInfo = null;
		try {
			adminInfo = userDAO.findUserInfo("admin");
			adminFlag = adminInfo.getFlag();
		} catch (Exception e) { e.printStackTrace(); }
    	
		String userName = (String)session.getAttribute("user_name");
		String userCode = (String)session.getAttribute("user_code");
		
		// 문제 푼 횟수 확인
		int curUserFlag = userDAO.flagCheck(userName, userCode);
		if(isExceedCnt(userCode, curUserFlag)) return "redirect:result";
		
		// 사용자 선택지 저장
		String myAnswer   = request.getParameter("radio");
		String questionNo = request.getParameter("questionNo");
		String answer 	  = request.getParameter("answer");
		
		if((isNullChecker(new Object[] {userCode, myAnswer, questionNo, answer}) < 0)
				&& (adminFlag == 0)) {
		
			int correct = myAnswer.equals(answer) ? 1 : 0;
			ResultDTO dto = new ResultDTO(
					userCode, 
					Integer.parseInt(questionNo), 
					Integer.parseInt(myAnswer), 
					correct,
					curUserFlag
			);
			
			try {
				resultDAO.insertResult(dto);
			} catch (Exception e) { e.printStackTrace(); }
			
			// 함수 시간 측정
			long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
			long secDiffTime = (afterTime - beforeTime); //두 시간에 차 계산
			System.out.println("Insert 시간차이(m) : "+secDiffTime);
			
			return "redirect:QuestionGenerate";
			
		} else {
			return "redirect:logout";
		}
		
	}
	
	public boolean isExceedCnt(String userCode, int flag) {
		int limitCnt = 5; // default;
		int resCnt = 0;
		try {
			// 더 나은 방법 있는지 생각해보기
			// DB 방식
			/*
			ResultSet rs = settingDAO.selectSetting();
			if(rs.next()){
				limitCnt = rs.getInt("questionNum");
				resCnt 	 = questionDAO.resultAllCount(userCode);
			}
			*/
			
			// DTO 방식
			limitCnt = settingDTO.getQuestionNum();
			System.out.println("limitCnt : " + limitCnt);
			// resCnt 	 = questionDAO.resultAllCount(userCode);
			resCnt 	 = questionDAO.getCurFlagResultCount(userCode, flag);
			
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