package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;


public class UserDAO {
//	@Autowired
//	ConnectionDB conn;

	PreparedStatement psmt;
	int cnt;
	
	public void join(UserDTO dto) throws Exception {
		
		try {
			Connection conn = ConnectionDB.getConnection();
			
			String sql = "insert into vote_user values(?,?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			System.out.println("join db 시작");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setInt(4, dto.getAge());
			psmt.setString(5, dto.getGender());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("join 실패임 ㅇㅇ");
		}

	}

	public ResultSet findUser(UserDTO dto) throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql = "select * from vote_user";
			psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();
			
			return rs;
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("find user 실패임 ㅇㅇ");
		} 
	}	
}