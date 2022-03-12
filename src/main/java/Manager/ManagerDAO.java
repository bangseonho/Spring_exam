package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pack01.ConnectionDB;
import User.UserDTO;

public class ManagerDAO {
	@Autowired
	ConnectionDB conn1;
	PreparedStatement psmt;
	
	public ResultSet getUsers() throws Exception {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		
		String sql = "select * from user;";
		psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		return rs;
	}

	@SuppressWarnings("null")
	public ResultSet getQuestions() throws Exception {
		String sql = "SELECT * from question;";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}

}
