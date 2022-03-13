package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pack01.ConnectionDB;
import User.UserDTO;

public class ManagerDAO {
	@Autowired
	ConnectionDB conn1;
	PreparedStatement psmt;
	
	public ResultSet getUsers() throws Exception {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		
		String sql = "select * from user;";
		psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		return rs;
	}

	/**
	 * Get all question table's row
	 * @return ResultSet
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	public ResultSet getQuestions() throws Exception {
		String sql = "SELECT * from question;";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}

	/**
	 * Update row from question table.
	 * @param  pk : id field
	 * @return success count
	 * @throws Exception
	 */
	public int updateQuestion(String pk) throws Exception {
		String sql = "update question set phrase=?, one=?, two=?, three=?, four=?, answer=?, who=? where id=?";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pk);
		pstmt.setString(2, pk);
		pstmt.setString(3, pk);
		pstmt.setString(4, pk);
		pstmt.setString(5, pk);
		pstmt.setString(6, pk);
		pstmt.setString(7, pk);
		pstmt.setString(8, pk);
		int cnt = pstmt.executeUpdate();
		return cnt;
	}
	
	/**
	 * Delete row from question table.
	 * @param  pk : id field
	 * @return success count
	 * @throws Exception
	 */
	public int deleteQuestion(String pk) throws Exception {
		String sql = "delete from question where id=?;";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pk);
		int cnt = pstmt.executeUpdate();
		return cnt;
	}

	/**
	 * Delete all rows from question table.
	 * @return success count
	 * @throws Exception
	 */
	public int deleteAllQuestions() throws Exception {
		String sql = "delete from question;";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int cnt = pstmt.executeUpdate();
		return cnt;
	}

}
