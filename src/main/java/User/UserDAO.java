package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import Pack01.ConnectionDB;

public class UserDAO {
	@Autowired
	ConnectionDB conn1;

	PreparedStatement psmt;
	int cnt;

	public void join(UserDTO dto) throws Exception {

		try {
			@SuppressWarnings("static-access")
			Connection conn = conn1.getConnection();

			String sql = "insert into user values(null, ?, ?, ?);";
			psmt = conn.prepareStatement(sql);
			System.out.println("join db success");

			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getBirth());
			psmt.setString(3, dto.getBirth());

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("join fail");
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