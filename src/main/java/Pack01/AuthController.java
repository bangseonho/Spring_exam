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
		UserDTO dto = new UserDTO(user.getName(), user.getBirth(), user.getCode(), user.getFlag());
		try {
			if (userDAO.join(dto)) {
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
		            out.println("<script>alert('"+"회원님의 코드번호는"+dto.getCode()+" 입니다 ');</script>");
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
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response) {
//		session.invalidate();
		session.removeAttribute("user_name");
		session.removeAttribute("user_code");
		System.out.print(session.getAttribute("user_name"));

		return "redirect:/";
	}

	// @SuppressWarnings("unused")
	@RequestMapping("/main")
	String main(Model model, UserDTO user, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		String name = "";
		String code = "";
		if(user.getName() == null || user.getCode() == null) {
			name = (String)session.getAttribute("user_name");
			code = (String)session.getAttribute("user_code");
		}else {
			name = user.getName();
			code = user.getCode();
		}
		if(name.equals("admin") && code.equals("2")) {
			session.setAttribute("user_name", name);
			session.setAttribute("user_code", code);
			return "redirect:ManagerController";
		}
		
		Boolean a = userDAO.loginCheck(name, code);
		if (a) {

			session.setAttribute("user_name", name);
			session.setAttribute("user_code", code);
			session.setMaxInactiveInterval(30 * 60);
		}else {
			try {
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 정보를 확인해주세요.');</script>");
	            out.flush();
			}catch(Exception e){ System.out.println("response error");}
		}

		model.addAttribute("name", name);
		model.addAttribute("code", code);
		model.addAttribute("flag", userDAO.flagCheck(name, code));
		
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
	@RequestMapping("/getMyCode")
	String getMyCode() {
		return null;
	}

}
