package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
	
	//�α��� �׼�
	public Member login(String email, String pw) {
		Member result = null;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT email, name, phone, grade FROM MEMBER WHERE EMAIL = ? AND pw=encrypt(?,?)");
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				result = new Member();
				result.setEmail(rs.getString("email"));
				result.setName(rs.getString("name"));
				result.setPhone(rs.getString("phone"));
				result.setGrade(rs.getString("grade"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
			}
			DBConn.close();
		}
		return result; // ����� null�̸� �α��� ����, ��ü�̸� �α��� ����
	}
	
	
	
	
}


