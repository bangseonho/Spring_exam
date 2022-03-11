package Result;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Pack01.ConnectionDB;

public class ResultDAO {
	
	PreparedStatement psmt;
	
	public ResultSet resultAnswer() throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String userCode = "00000011";
		
			String sql = "select * from result where code = "+ userCode;		

			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			
			return rs;
			
			
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 불러오기 실패");
		} 
	}	
}
