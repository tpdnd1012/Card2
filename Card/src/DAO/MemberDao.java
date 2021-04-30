package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.MemberDto;



public class MemberDao {
	
	private Connection conn;
	private ResultSet rs; 
	
	public MemberDao() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql �뱶�씪�씠踰� �뿰寃�

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/card?serverTime=UTC", "root", "1234");
			System.out.println("db연동");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//  dao 객체 생성 
	private static MemberDao instance = new MemberDao();
	
	// dao 객체 반환 메소드 
	public static MemberDao getinstance() {
		return instance;
	}
	
	public int signup( MemberDto dto) {
		
		String SQL = "insert into member(member_id,member_password,member_name,member_resdentnum,member_sex,member_phone,member_cardcompany,member_cardbenefit,member_cardtype)"+"values(?,?,?,?,?,?,?,?,?)";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString (1, dto.getMember_id());
			pstmt.setString (2, dto.getMember_password());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setInt(4, dto.getMember_resdentnum());
			pstmt.setString(5, dto.getMember_sex());
			pstmt.setString(6, dto.getMember_phone());
			pstmt.setString(7, dto.getMember_cardcompany());
			pstmt.setString(8, dto.getMember_cardbenefit());
			pstmt.setString(9, dto.getMember_cardtype());
			
			pstmt.executeUpdate();
			
			return 1;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
}