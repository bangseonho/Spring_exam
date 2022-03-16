package Result;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import Pack01.ConnectionDB;

public class ResultDAO {
	PreparedStatement psmt;
	private int cnt;

	public ResultSet resultAnswer(String userCode) throws Exception {
				Connection conn = ConnectionDB.getConnection();
		try {
			String sql1 = "select r.code, q.phrase, "
					+ "q.one, q.two, q.three, q.four, q.answer, r.choice, r.correct, q.who "
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
//			e.printStackTrace();
			throw new Exception("result answer 실패");
		} 
	}
	
	

	public int resultCollectCount(String userCode) throws Exception {
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql3 = "select sum(correct) as correctcnt from result where code=" + userCode;		
			psmt = conn.prepareStatement(sql3);
			ResultSet rs3 = psmt.executeQuery();
			int CorrectCnt = 0;
			while (rs3.next()) {
				CorrectCnt = rs3.getInt("correctcnt");
			}
			return CorrectCnt;
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("result answer 실패");
		} 
	}	
	
	public int insertResult(ResultDTO dto) throws Exception {
			System.out.println("insert result");

			Connection conn = ConnectionDB.getConnection();
			//String sql = "insert into result values(null, ?,?,?,?);";
			String sql = "update result set choice=?, correct=? where code=? and question=? and choice is NULL";
			psmt = conn.prepareStatement(sql);
			psmt.setString(3, dto.getCode());
			psmt.setInt(4, dto.getQuestion());
			psmt.setInt(1, dto.getChoice());
			psmt.setInt(2, dto.getCorrect());
			int num = psmt.executeUpdate();
			
			return num;
	}
	
	
	

	public void updateFlag(String userCode) throws Exception {
		/*	@SuppressWarnings("static-access")*/
		Connection conn = ConnectionDB.getConnection();
		try {
			String sql4 = "UPDATE user SET flag=1 WHERE CODE='" + userCode + "'";
			System.out.println(sql4);
//			psmt.setString(1, userCode);
			psmt = conn.prepareStatement(sql4);
			System.out.println("실행시키기전");
			
			int rs4 = psmt.executeUpdate();	
			System.out.println(rs4);
			System.out.println("실행시키기전");
			System.out.println("변경된 row : " + rs4);
		} catch (SQLException e) {
			//	e.printStackTrace();
			throw new Exception("result answer 遺��ъ�ㅺ린 �ㅽ��");
		} 
	}	
	
	
	public int blockBringQuestion(String userCode) throws Exception {
	      /*   @SuppressWarnings("static-access")*/
	      Connection conn = ConnectionDB.getConnection();
	      int allCnt = 0;
	      try {
	         String sql5 = "SELECT COUNT(*) as allcnt FROM result WHERE CODE = " + userCode;
	         psmt = conn.prepareStatement(sql5);
	         ResultSet rs5 = psmt.executeQuery();
	         while (rs5.next()) {
	               allCnt = rs5.getInt("allcnt");
	            }
	      } catch (SQLException e) {
	         //   e.printStackTrace();
	         throw new Exception("blockBringQuestion error");
	      } 
	      return allCnt;
	   }
	
	
	public void getCorrectCnt() {
		
	}

}
