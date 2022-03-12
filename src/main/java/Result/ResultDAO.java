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
			String userCode = "001";
		
			// String sql = "select * from result2 where code = "+ userCode;	
			// String sql = "select id from question q";	 // id 1~8
			String sql = "select r.code, q.id, q.phrase, q.one, q.two, q.three, q.four, r.choice, r.correct from question as q, result2 as r where q.id = r.question";		
				

			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			
			return rs;
			
			
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 불러오기 실패");
		} 
	}	
}
