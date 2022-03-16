package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import User.UserDTO;

public class ConnectionDB {

	public static Connection getConnection() {
		Connection conn = null;
		ResultSet rs;
		UserDTO user = null;

		String driver = "com.mysql.cj.jdbc.Driver";
		//String db_url = "jdbc:mysql://13.125.97.130:3307/db01";
		String db_url = "jdbc:mysql://13.125.97.130:3307/dbTest";
		String db_id = "lion";
		String db_pw = "1234";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			System.out.println("db connected");
		} catch (Exception e){
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public static void close(ResultSet rs, Statement psmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			System.out.println("connection close");
		} catch (SQLException e) {
			//e.printStackTrace();
			System.out.println("close");;
		}

	}

}
