package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs; // 정보를 담을 객체
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3399/bbs";
			// 내 컴퓨터에 설치된 mariadb 서버의 bbs 데이터베이스에 접속
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("org.mariadb.jdbc.Driver"); // 매개체 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {e.printStackTrace();}
		
	}
	
	public String getDate() {
		// 현재 시간을 가져올 함수
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);  // 현재의 날짜를 반환함.
			}
		}catch(Exception e) {e.printStackTrace();}
		return "";  // 빈 문자열 리턴으로 데이터 베이스 오류를 알려줌.
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;  // 1을 더해서 다음 게시글이 보일 수 있도록 함.
			}
			return 1;  // 현재가 첫 게시물인 경우
			
			
		}catch(Exception e) {e.printStackTrace();}
		return -1;  // 데이터 베이스 오류를 알려줌.
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO bbs VALUES(?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());  // 다음에 쓰여야 할 게시글 번호
			pstmt.setString(2, bbsTitle); 
			pstmt.setString(3, userID);  
			pstmt.setString(4, getDate()); 
			pstmt.setString(5, bbsContent); 
			pstmt.setInt(6, 1); 		

			return pstmt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}
		return -1;  // 데이터 베이스 오류를 알려줌.
	}
}
