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
				return "Login";
			} else {
				return "Signup";
			}
		} catch (Exception e) {
			System.out.println("join failed _ controller");
		}

		try {
			model.addAttribute("dto", userDAO.findUser(dto));
		} catch (Exception e) {
			System.out.println("find failed _ controller");
		}
		return "QuestionForm";
	}

	@RequestMapping("/login")
	String func01() {
<<<<<<< HEAD:src/main/java/Pack01/SurveyController.java
		System.out.println("·Î±×ÀÎ ÆäÀÌÁö·Î ÀÌµ¿");
		return "Login";
=======
		System.out.println("ï¿½Î±ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½");
		return "Login"; // TigerView.jsp ï¿½ï¿½ Ã£ï¿½Â´ï¿½
	}
	@RequestMapping("/Signup")
	String func0132123() {
		System.out.println("ï¿½Î±ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½");
		return "Signup"; // TigerView.jsp ï¿½ï¿½ Ã£ï¿½Â´ï¿½
>>>>>>> cho:src/main/java/Pack01/AuthController.java
	}
	
	@RequestMapping("/main")
	String main(Model model, UserDTO user) {
//		System.out.println(user.getName());
//		System.out.println(user.getCode());
		model.addAttribute("name", user.getName());
		model.addAttribute("code", user.getCode());
		return "Main";
	}
	
}
