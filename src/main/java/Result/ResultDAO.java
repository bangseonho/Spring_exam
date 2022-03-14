package Result;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import Pack01.ConnectionDB;

public class ResultDAO {
	
	PreparedStatement psmt;
<<<<<<< HEAD
	String userCode = "001";
	private int cnt;
=======
//	String userCode = "9904272";
	
	
	public ResultSet resultAnswer(String userCode) throws Exception {
>>>>>>> c761e074eb86aa47bd6b14822d757dcd1b642d82
	
		System.out.println(userCode);
		
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql1 = "select r.code, q.id, q.phrase, "
					+ "q.one, q.two, q.three, q.four, q.answer, r.choice, r.correct "
					+ "from question as q, result as r "
					+ "where q.id = r.question and r.code = " + userCode;		
			psmt = conn.prepareStatement(sql1);
			ResultSet rs1 = psmt.executeQuery();			
			return rs1;	
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 遺��ъ�ㅺ린 �ㅽ��");
		} 
	}	
	
	public ResultSet resultAllCount(String userCode) throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql2 = "select count(correct) as allcnt from result where code=" + userCode;		
			psmt = conn.prepareStatement(sql2);
			ResultSet rs2 = psmt.executeQuery();
			return rs2;
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 遺��ъ�ㅺ린 �ㅽ��");
		} 
	}
	
	
	public ResultSet resultCollectCount(String userCode) throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql3 = "select sum(correct) as correctcnt from result where code=" + userCode;		
			psmt = conn.prepareStatement(sql3);
			ResultSet rs3 = psmt.executeQuery();
			return rs3;	
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 遺��ъ�ㅺ린 �ㅽ��");
		} 
	}	
	
	public void insertResult(ResultDTO dto) throws Exception {
		try {
			Connection conn = ConnectionDB.getConnection();
			String sql = "insert into vote_user values(null, ?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			System.out.println("insert result");
			
			psmt.setString(1, dto.getCode());
			psmt.setInt(2, dto.getQuestion());
			psmt.setString(3, dto.getChoice());
			psmt.setInt(4, dto.getCorrect());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("insert fail");
		} 
	}
}
