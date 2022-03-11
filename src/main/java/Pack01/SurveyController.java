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

@Controller
public class SurveyController {
	
	@RequestMapping("/t10")
	public String form(Model model, UserDTO user) {
		System.out.println(user.getId());
		System.out.println(user.getPwd());
		System.out.println(user.getName());
		System.out.println(user.getAge());
		System.out.println(user.getGender());
		
		UserDTO dto = new UserDTO(user.getId(), user.getPwd(), user.getPwdc(), user.getName(), user.getAge(), user.getGender());
		UserDAO userDAO = new UserDAO();
		try{
			userDAO.join(dto);
		}catch(Exception e){
			System.out.println("ȸ������ ����");
		}
		
		try {
			model.addAttribute("dto", userDAO.findUser(dto));
		}catch(Exception e) {
			System.out.println("���� �������� ����!!");
		}
		return "SurveyForm";
	}
}

