package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt; 
	private ResultSet rs; // 정보를 담을 객체
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3399/bbs";
			// 내 컴퓨터에 설치된 mariadb 서버의 bbs 데이터베이스에 접속
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("org.mariadb.jdbc.Driver"); // 매개체 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {e.printStackTrace();}
		
	}
		
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);	
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1;  // 로그인 성공을 의미함.
				 else 
					return 0;   // 비밀번호가 불일치함을 의미함.
				}
			return -1;   // 아이디가 없음을 의미함.
		} catch(Exception e) {e.printStackTrace();}
		return -2;   // 데이터베이스 오류를 의미함.
	}
	
	public int join(User user) {
		// INSERT 문장을 실행할 경우 반드시 0 이상의 숫자가 반환됨.
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
		
		return -1;  // 데이터 오류시 -1 반환.
	}
}
