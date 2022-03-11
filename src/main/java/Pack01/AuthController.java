package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import User.UserDAO;
import User.UserDTO;

@Controller
public class AuthController {
	@Autowired
	UserDAO userDAO;

	@RequestMapping("/signup")
	public String form(Model model, UserDTO user) {
		UserDTO dto = new UserDTO(user.getName(), user.getBirth(), user.getCode());
		try {

			if (userDAO.join(dto)) {
				return "LoginView";
			} else {
				return "SignupView";
			}
		} catch (Exception e) {
			System.out.println("join failed _ controller");
		}

		try {
			model.addAttribute("dto", userDAO.findUser(dto));
		} catch (Exception e) {
			System.out.println("find failed _ controller");
		}
		return "QuestionFormView";
	}

	@RequestMapping("/main")
	String main(Model model, UserDTO user) {
//		System.out.println(user.getName());
//		System.out.println(user.getCode());
		model.addAttribute("name", user.getName());
		model.addAttribute("code", user.getCode());
		
		Boolean a = userDAO.loginCheck(user.getName(), user.getCode());
		
		return a ? "MainView": "LoginView";
	}
	
	@RequestMapping("/PageMove")
	String pageMove(@RequestParam(value = "page") String page) {
		return page;
	}
		

}