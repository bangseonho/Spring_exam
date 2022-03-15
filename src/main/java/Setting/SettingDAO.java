package Setting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import Pack01.ConnectionDB;

public class SettingDAO {
	@Autowired
	ConnectionDB conn1;
	
	public ResultSet selectSetting() throws Exception {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		String sql = "select * from setting;";
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		return rs;
	}
	
	public int updateSetting(SettingDTO dto) throws Exception {
		
		String sql = "update setting set limitTime=?, questionNum=?, questionChance=?;";
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getLimitTime());
		pstmt.setInt(2, dto.getQuestionNum());
		pstmt.setInt(3, dto.getQuestionChance());
		int cnt = pstmt.executeUpdate();
		return cnt;
		
	}
	
	public Boolean closeVote() throws Exception {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		Boolean rsDrop = false;
		try {
			String sql = "delete from result ;";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rsDrop = pstmt.execute();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("drop vote result fail");
		}
		return rsDrop;
	}
	
	public Boolean openVote() throws Exception {
		@SuppressWarnings("static-access")
		Connection conn = conn1.getConnection();
		Boolean rsDrop = false;
		try {
			String sql = "CREATE TABLE result (\r\n"
					+ "  id int not null auto_increment,\r\n"
					+ "  code varchar(45) not null,\r\n"
					+ "  question int not null,\r\n"
					+ "  choice int not null,\r\n"
					+ "  PRIMARY KEY (id));";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rsDrop = pstmt.execute();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("create vote result fail");
		}
		return rsDrop;
	}
	
	/*
	 * public int selectSettingValue(String columnName) {
	 * 
	 * 
	 * 
	 * }
	 */
	
}
