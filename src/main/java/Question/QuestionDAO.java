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
	/*   @Autowired
	   QuestionDTO questionDTO;*/

	@SuppressWarnings("null")
	public static ResultSet getQuestion() throws Exception {
		String sql = "SELECT * from question order by rand() limit 1;";
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
	// 유저가 푼 문항수 가져오가ㅣ
	public int resultAllCount(String userCode) throws Exception {
		Connection conn = ConnectionDB.getConnection();
	      try {
	         String sql2 = "select count(correct) as allcnt from result where code=" + userCode;      
	         psmt = conn.prepareStatement(sql2);
	         ResultSet rs2 = psmt.executeQuery();
	         int allCnt = 0;
	         while (rs2.next()) {
	            allCnt = rs2.getInt("allcnt");
	         }
	         return allCnt;
	      } catch (SQLException e) {
//	         e.printStackTrace();
	         throw new Exception("result answer 遺  ъ ㅺ린  ㅽ  ");
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

}