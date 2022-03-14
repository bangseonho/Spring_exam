package User;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;

import Pack01.ConnectionDB;

public class UserDAO {
	@Autowired
	ConnectionDB conn1;

	PreparedStatement psmt;
	int cnt;

	public Boolean isDuplicated(String name, String birth) {
		Boolean isCheck = null;
		String sql = "SELECT exists (select * from user where name=? and birth=?) as isMember;";
		try {
			@SuppressWarnings("static-access")
			Connection conn = conn1.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				isCheck = rs.getBoolean(1);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return isCheck;
	}
	
	public Boolean loginCheck(String name, String code) {
		Boolean existName = null;
		String sql = "select exists (select * from user where name=? and code=?);";
		try {
			@SuppressWarnings("static-access")
			Connection conn = conn1.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, code);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				existName = rs.getBoolean(1);
			}
		} catch(Exception e) {System.out.println("error");}
		return existName;
	}
	
	
	public Boolean flagCheck(String name, String code) {
		Boolean flag = null;
		String sql = "select flag from user where name=? and code=?";
		try {
			@SuppressWarnings("static-access")
			Connection conn = conn1.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, code);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = rs.getBoolean("flag");
			}
		} catch(Exception e) {System.out.println("error");}
		return flag;
	}

	public boolean join(UserDTO dto) throws Exception {

		if (!isDuplicated(dto.getName(), dto.getBirth())) {
			try {
				@SuppressWarnings("static-access")
				Connection conn = conn1.getConnection();

				String sql = "insert into user values(null, ?, ?, ?,false);";
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, dto.getName());
				psmt.setString(2, dto.getBirth());
				psmt.setString(3, dto.getBirth());

				cnt = psmt.executeUpdate();

				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new Exception("join fail");
			}
		} else {
			System.out.println("�씠由�, �깮�뀈�썡�씪 以묐났!!");
			return false;
		}

	}

	public ResultSet findUser(UserDTO dto) throws Exception {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		try {
			String sql = "select * from user";
			psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();

			return rs;
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("find user failed");
		}
	}

	public void allUser() {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		
		try {
			String sql = "select * from user;";
			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				
			}
		} catch(Exception e) {System.out.println("error");}
		
	
	}
	
		
	
}