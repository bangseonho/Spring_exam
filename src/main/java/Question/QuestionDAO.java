package Question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import Pack01.ConnectionDB;

public class QuestionDAO {
<<<<<<< HEAD
	@Autowired
	static
	ConnectionDB conn1;

	@Autowired
	QuestionDTO questionDTO;

	@SuppressWarnings("null")
	public static ResultSet getQuestion() throws Exception {
		String sql = "SELECT * from question order by rand() limit 5;";
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
}
=======
   @Autowired
   static
   ConnectionDB conn1;

	/*   @Autowired
	   QuestionDTO questionDTO;*/


   @SuppressWarnings("null")
   public static ResultSet getQuestion() throws Exception {
      String sql = "SELECT * from question order by rand() limit 5;";
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
}
>>>>>>> develop
