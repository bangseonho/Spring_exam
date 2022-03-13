package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pack01.ConnectionDB;
import Question.QuestionDTO;
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
	 * Get one question
	 * @return ResultSet
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	public ResultSet getQuestion(String id) throws Exception {
		String sql = "SELECT * from question where id=?;";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
	/**

	 * Get all question rows
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
	
	public int deleteUsers(String code) throws Exception{
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		
		String sql = "delete from user where code = ?;";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, code);
		int rs = psmt.executeUpdate();
		return rs;
	}

	/**
	 * 
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int insertQuestion(String phrase, String one, String two, String three, String four, String answer, String who) throws Exception {

		String sql = "insert into question(phrase, one, two, three, four, answer, who) " 
					+ "values( ?,?,?,?,?,?,?)";
		int cnt = 0;
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, phrase);
		pstmt.setString(2, one);
		pstmt.setString(3, two);
		pstmt.setString(4, three);
		pstmt.setString(5, four);
		pstmt.setString(6, answer);
		pstmt.setString(7, who);

		cnt = pstmt.executeUpdate();

		return cnt;

	}
	
	/**
	 * Update row from question table.
	 * @param  pk : id field
	 * @return success count
	 * @throws Exception
	 */
	public int updateQuestion(QuestionDTO dto) throws Exception {
		String sql = "update question set phrase=?, one=?, two=?, three=?, four=?, answer=?, who=? where id=?";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getPhrase());
		pstmt.setString(2, dto.getOne());
		pstmt.setString(3, dto.getTwo());
		pstmt.setString(4, dto.getThree());
		pstmt.setString(5, dto.getFour());
		pstmt.setString(6, dto.getAnswer());
		pstmt.setString(7, dto.getWho());
		pstmt.setString(8, dto.getId());
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
