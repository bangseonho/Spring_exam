package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import User.UserDAO;
import User.UserDTO;

@Controller
public class SurveyController {
	
	@RequestMapping("/t10")
	public String form(Model model, UserDTO user) {
		
		UserDTO dto = new UserDTO(user.getName(), user.getBirth(), user.getCode());
		UserDAO userDAO = new UserDAO();
		try{
			userDAO.join(dto);
		}catch(Exception e){
			System.out.println("join failed _ controller");
		}
		
		try {
			model.addAttribute("dto", userDAO.findUser(dto));
		}catch(Exception e) {
			System.out.println("find failed _ controller");
		}
		return "SurveyForm";
	}
}

