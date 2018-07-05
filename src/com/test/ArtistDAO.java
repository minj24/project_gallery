package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ArtistDAO {

	public ArrayList<Artist> artistList() {
		ArrayList<Artist> result = new ArrayList<Artist>();
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT DISTINCT NAME, ART_ID, email, ART_MEMBER_PICTURE from artistview WHERE rowid in(select max(rowid) from artistview group by name)");
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Artist a = new Artist();
				a.setEmail(rs.getString("email"));
				a.setName(rs.getString("name"));				
				a.setArt_member_pictire(rs.getString("art_member_picture"));
				result.add(a);
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

		return result;
	}

	public ArrayList<Artist> artList(String searchValue) {
		ArrayList<Artist> result = new ArrayList<Artist>();

		Connection conn = null;
		PreparedStatement pstat = null;

		try {
			conn = DBConn.getConnection();

			String sql = "SELECT DISTINCT email, NAME, ART_MEMBER_PICTURE from artistview WHERE name =?";


			pstat = conn.prepareStatement(sql);
			pstat.setString(1, searchValue);
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				Artist a = new Artist();
				a.setEmail(rs.getString("email"));
				a.setName(rs.getString("name"));				
				a.setArt_member_pictire(rs.getString("art_member_picture"));
				result.add(a);
			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstat != null) {
					pstat.close();
				}
			} catch (Exception e) {
			}
			DBConn.close();
		}
		return result;
	}
	public ArrayList<Artist> artistDetailList(String email ) {

		ArrayList<Artist> result = new ArrayList<Artist>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT DISTINCT NAME, ART_MEMBER_PICTURE,TO_char(birthday,'YYYY-MM-DD') as birthday from artistview where email = ? AND ROWNUM = 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
				Artist a = new Artist();
				a.setName(rs.getString("name"));
				a.setArt_member_pictire(rs.getString("art_member_picture"));
				a.setBirthday(rs.getString("birthday"));
				result.add(a);
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

		return result;
	}


}
