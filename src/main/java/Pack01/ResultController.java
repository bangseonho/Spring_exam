package Pack01;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Result.ResultDAO;
import Result.ResultDTO;
import User.UserDAO;
import User.UserDTO;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ResultController {
	@Autowired
	ResultDAO resultDAO;
	
	@RequestMapping("/result")
	public String form(HttpSession session, Model model) {		
		String userCode = (String)session.getAttribute("user_code");
		String userName = (String)session.getAttribute("user_name");

		System.out.println("/result userCode : " + userCode + ", userName : " + userName);
		try {			
			model.addAttribute("rs2", resultDAO.resultAllCount(userCode));
			model.addAttribute("rs3", resultDAO.resultCollectCount(userCode));
			model.addAttribute("rs1", resultDAO.resultAnswer(userCode));
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("result controller exception");
		}
		return "ResultView";
	}
}
