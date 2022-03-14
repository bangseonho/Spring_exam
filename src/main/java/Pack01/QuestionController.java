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

		String userCode = (String)session.getAttribute("user_code");

		// 문제 푼 횟수 확인
		int limitCnt = 5; // DB에서 가져오게 변경하기
		int resCnt = 0;
		try {
			resCnt = questionDAO.resultAllCount(userCode);
		}catch (Exception e) { e.printStackTrace(); }
		if(resCnt >= limitCnt) {
			System.out.println("이미 시험쳤어요~");
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
		
		System.out.println("question --");
		System.out.println(question.toString());

		model.addAttribute("question", question);
		
		return "QuestionFormView";
	}
	
	@RequestMapping("/QuestionResultInsert")
	public String questionResultInsert(HttpSession session, HttpServletRequest request) {

		String userCode = (String)session.getAttribute("user_code");
		
		// 사용자 선택지 저장
		String myAnswer = request.getParameter("radio");
		String questionNo = request.getParameter("questionNo");
		String answer = request.getParameter("answer");
		int correct = 0;
		
		// 언제 null 값 되는지?
		if (myAnswer != null) {
			if (myAnswer.equals(answer)) {
				correct = 1;
			}
			ResultDTO dto = new ResultDTO(userCode, Integer.parseInt(questionNo), Integer.parseInt(myAnswer), correct);
			try {
				resultDAO.insertResult(dto);
			} catch (Exception e) { e.printStackTrace(); }
		}
		
		return "redirect:QuestionGenerate"; 
	}
	
	/*@RequestMapping("/submitSelected")
	public void f3(Model model) {
		System.out.println("controller로 오는지확인");
	}*/
}