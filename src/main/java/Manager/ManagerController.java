package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pack01.ConnectionDB;
import User.UserDTO;

@Controller
public class ManagerController {
	@Autowired
	ManagerDAO managerDAO;
	
	@RequestMapping("/ManagerController")
	String managerController() {	
		return "ManagerMainView";
	}
	
	@RequestMapping("/ManagerUserView")
	String allUser(Model model) {
		LinkedList<UserDTO> listUser = new LinkedList<UserDTO>();

		try {
			ResultSet rs = managerDAO.getUsers();
			while(rs.next()) {
				listUser.add(new UserDTO(rs.getString("name"), rs.getString("birth"), rs.getString("code")));
			}
		} catch(Exception e) {System.out.println("errorhere");}
		
		model.addAttribute("listUser", listUser);
		return "Manager/ManagerUserView";
	}
}
