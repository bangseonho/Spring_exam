package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;

import Pack01.ConnectionDB;

public class ManagerDAO {
	
	@Autowired
	ConnectionDB conn1;

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
