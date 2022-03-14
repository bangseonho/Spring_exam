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
}