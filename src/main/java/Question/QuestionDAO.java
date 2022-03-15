package Question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import Pack01.ConnectionDB;

public class QuestionDAO {
	@Autowired
	static ConnectionDB conn1;
	PreparedStatement psmt;
	int cnt;
	/*   @Autowired
	   QuestionDTO questionDTO;*/

	@SuppressWarnings("null")
	public static ResultSet getQuestion(String userCode, int flag) throws Exception {
		String sql = "SELECT * from question"
				+ " where id not in"
				+ " (select question from result where code=" + userCode +  " and flag="+ flag +")"
				+ " and remove=0 order by rand() limit 1;";
		try {
			@SuppressWarnings("static-access")
			Connection conn = conn1.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			return rs;

		} catch (Exception e) {
			throw new Exception("QuestionDAO.java occured error");
		}
	}
	public static ResultSet bringQuestion(String userCode) throws Exception {
		String sql = "select * from question where id in (select question from result where choice is null and code=" +userCode+  ") and remove=0 order by id limit 1";
		try {
			@SuppressWarnings("static-access")
			Connection conn = conn1.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			return rs;

		} catch (Exception e) {
			throw new Exception("QuestionDAO.java occured error");
		}
	}
	// 
	public int resultAllCount(String userCode) {
		Connection conn = ConnectionDB.getConnection();
		int allCnt = 0;
		try {
			String sql2 = "select count(correct) as allcnt from result where choice IS NOT NULL and code=" + userCode;
			psmt = conn.prepareStatement(sql2);
			ResultSet rs2 = psmt.executeQuery();
			while (rs2.next()) {
				allCnt = rs2.getInt("allcnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return allCnt;
	}
	
	public int getCurFlagResultCount(String userCode, int flag) throws Exception {
		Connection conn = ConnectionDB.getConnection();
	      try {
	         String sql2 = "select count(correct) as allcnt from result where code=" + userCode + " and flag=" + flag;      
	         psmt = conn.prepareStatement(sql2);
	         ResultSet rs2 = psmt.executeQuery();
	         int allCnt = 0;
	         while (rs2.next()) {
	            allCnt = rs2.getInt("allcnt");
	         }
	         return allCnt;
	      } catch (SQLException e) {
	         e.printStackTrace();
	         throw new Exception("result answer exception");
	      }
	}

	public boolean isDuplicated(String userCode, String questionNo) {
		Connection conn = ConnectionDB.getConnection();
		Boolean isCheck = null;
		try {
			String sql3 = "select exists ( select * from result where result code=" + userCode + "and question="
					+ questionNo;
			psmt = conn.prepareStatement(sql3);
			ResultSet rs3 = psmt.executeQuery();
			if (rs3.next()) {
				isCheck = rs3.getBoolean(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return isCheck;
	}
	
	@SuppressWarnings("null")
	public static int getQuestion2(String userCode) throws Exception {
		int questionNumber = 0;
		String sql = "SELECT * from question where id not in (select question from result where code=" +userCode+  ") and remove=0 order by rand() limit 1;";
		try {
			System.out.println("Question2 시작");
			@SuppressWarnings("static-access")
			Connection conn = conn1.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("query 실행후");
			if (rs.next()) {
				questionNumber = rs.getInt(1);
			}
			
			System.out.println(questionNumber);
			return questionNumber;

		} catch (Exception e) {
			throw new Exception("QuestionDAO.java occured error");
		}
	}
	
	public void makeQ(String userCode) {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		
		try {
			int questionNumber = getQuestion2(userCode);
			
			String sql = "insert into result values(null, ?, ?, null, false);";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, userCode);
			psmt.setInt(2, questionNumber);
			
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

}