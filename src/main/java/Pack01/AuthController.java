package Pack01;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String form(Model model, UserDTO user, HttpServletResponse response) {
		UserDTO dto = new UserDTO(user.getName(), user.getBirth(), user.getCode(), user.isFlag());
		try {
			if (userDAO.join(dto)) {
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
		            out.println("<script>alert('Signup success ! ');</script>");
		            out.flush();
				return "LoginView";
			}else {
				try {
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
		            out.println("<script>alert('중복된 회원정보입니다. '); history.go(-1);</script>");
		            out.flush();
				}catch(Exception e){ System.out.println("response error");}
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
		return null;
	}

	@RequestMapping("/main")
	String main(Model model, UserDTO user, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		if(user.getName().equals("admin") && user.getCode().equals("2")) {
			return "redirect:ManagerController";
		}
		model.addAttribute("name", user.getName());
		model.addAttribute("code", user.getCode());
		model.addAttribute("flag", userDAO.flagCheck(user.getName(), user.getCode()));
		
		Boolean a = userDAO.loginCheck(user.getName(), user.getCode());
		if (a) {
			session.setAttribute("user_name", user.getName());
			session.setAttribute("user_code", user.getCode());
			session.setMaxInactiveInterval(30 * 60);
		}else {
			try {
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	            out.flush();
			}catch(Exception e){ System.out.println("response error");}
		}
		return a ? "MainView" : "LoginView";
	}

	@RequestMapping("/PageMove")
	String pageMove(@RequestParam(value = "page") String page) {
		return page;
	}
	
	@RequestMapping("/ManagerPageMove")
	String managerPageMove(@RequestParam(value = "page") String page) {
		return "Manager/"+page;
	}

}
