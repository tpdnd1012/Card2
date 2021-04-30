package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.CardDto;

public class CardDao {
	
	// DAO : DB 접근 객체

	private Connection conn; // DB 연결 인터페이스
	private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

	public CardDao() {

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
	private static CardDao instance = new CardDao();

	// DB 객체 반환 해주는 메소드
	public static CardDao getinstance() {

		return instance;

	}
	
	// 카드 추가 메소드
	public int cardadd(CardDto dto) {
		
		String sql = "insert into card(card_name,card_company,membership_fee,images,bank_link)" + "values(?,?,?,?,?)";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getCard_name());
			pstmt.setString(2, dto.getCard_company());
			pstmt.setInt(3, dto.getMembership_fee());
			pstmt.setString(4, dto.getImages());
			pstmt.setString(5, dto.getBank_link());
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return -1;
	}
	
	// 카드 조회
	public ArrayList<CardDto> cardlist() {
		
		String sql = "select * from card";
		
		ArrayList<CardDto> list = new ArrayList<CardDto>();
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CardDto dto = new CardDto(
						rs.getString(2),
						rs.getString(3),
						rs.getInt(5),
						rs.getString(6),
						rs.getString(7)
						);
				
				list.add(dto);
				
			}
			
			return list;
			
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return list;
	}

}
