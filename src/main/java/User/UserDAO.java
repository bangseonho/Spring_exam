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

	public boolean join(UserDTO dto) throws Exception {

		if (!isDuplicated(dto.getName(), dto.getBirth())) {
			try {
				@SuppressWarnings("static-access")
				Connection conn = conn1.getConnection();

				String sql = "insert into user values(null, ?, ?, ?);";
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
			System.out.println("이름, 생년월일 중복!!");
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

	
	
	
	
	
	
	
}