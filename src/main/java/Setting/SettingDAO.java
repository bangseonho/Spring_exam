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
	
}
