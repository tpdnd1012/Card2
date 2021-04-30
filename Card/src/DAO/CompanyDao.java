package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.CompanyDto;

public class CompanyDao {
	
	// DAO : DB 접근 객체

	private Connection conn; // DB 연결 인터페이스
	private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

	public CompanyDao() {

			try {

				Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/card?serverTime=UTC", "root", "1234");
				
				System.out.println("연동성공");
			} catch (Exception e) {
				e.getMessage();
				e.getStackTrace();
			}
		}

	// 다른 클래스에서 DB 사용하기 위한 객체 선언
	private static CompanyDao instance = new CompanyDao();

	// DB 객체 반환 해주는 메소드
	public static CompanyDao getinstance() {

		return instance;

	}
	
	// 카드사 등록 메소드
	public int companyadd(CompanyDto dto) {
		
		String sql = "insert into card_company values(?,?,?)";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getCard_company());
			pstmt.setString(2, dto.getCard_name());
			pstmt.setInt(3, dto.getCard_category());
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return -1;
	}

}
