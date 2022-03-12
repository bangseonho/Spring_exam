package Result;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Pack01.ConnectionDB;

public class ResultDAO {
	
	PreparedStatement psmt;
	String userCode = "001";
	
	public ResultSet resultAnswer() throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql1 = "select r.code, q.id, q.phrase, "
					+ "q.one, q.two, q.three, q.four, q.answer, r.choice, r.correct "
					+ "from question as q, result2 as r "
					+ "where q.id = r.question and r.code=" + userCode;		
			psmt = conn.prepareStatement(sql1);
			ResultSet rs1 = psmt.executeQuery();			
			return rs1;	
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 불러오기 실패");
		} 
	}	
	
	public ResultSet resultAllCount() throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql2 = "select count(correct) as allcnt from result2 where code=" + userCode;		
			psmt = conn.prepareStatement(sql2);
			ResultSet rs2 = psmt.executeQuery();
			return rs2;
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 불러오기 실패");
		} 
	}
	
	
	public ResultSet resultCollectCount() throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql3 = "select sum(correct) as correctcnt from result2 where code=" + userCode;		
			psmt = conn.prepareStatement(sql3);
			ResultSet rs3 = psmt.executeQuery();
			return rs3;	
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 불러오기 실패");
		} 
	}	
}
