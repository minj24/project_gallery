package com.test;

import java.sql.*;
import java.util.*;

public class NoticeDAO {

	public ArrayList<Notice> NoticeList() {
        ArrayList<Notice> result = new ArrayList<Notice>();

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
           conn = DBConn.getConnection();
           String sql = String
                 .format("SELECT NOTICE_ID, N_TITLE , DECODE(TO_CHAR(N_DATE,'YYYY-MM-DD'),TO_CHAR(SYSDATE,'YYYY-MM-DD'),TO_CHAR(N_DATE,'YYYY-MM-DD HH24:MI:SS'),TO_CHAR(N_DATE,'YYYY-MM-DD')) AS N_DATE FROM NOTICE order by NOTICE_ID DESC");
           pstmt = conn.prepareStatement(sql);
           ResultSet rs = pstmt.executeQuery();
           while (rs.next()) {
        	   
              Notice n = new Notice();
              n.setNotice_id(rs.getInt("Notice_id"));
              n.setN_title(rs.getString("n_title"));
              n.setN_date(rs.getString("n_date"));
              result.add(n);
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
	
	
	public Notice List(String notice_id) {
        Notice result = new Notice();

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
           conn = DBConn.getConnection();
           String sql = String
                 .format("SELECT NOTICE_ID, N_TITLE , DECODE(TO_CHAR(N_DATE,'YYYY-MM-DD'),"
                 		+ "TO_CHAR(SYSDATE,'YYYY-MM-DD'),TO_CHAR(N_DATE,'YYYY-MM-DD HH24:MI:SS'),"
                 		+ "TO_CHAR(N_DATE,'YYYY-MM-DD')) AS N_DATE,N_CONTENTS "
                 		+ "FROM NOTICE WHERE NOTICE_ID = ?");
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, notice_id);
           ResultSet rs = pstmt.executeQuery();
           while (rs.next()) {
        	   
              
              result.setNotice_id(rs.getInt("notice_id"));
              result.setN_title(rs.getString("n_title"));
              result.setN_date(rs.getString("n_date"));
              result.setN_contents(rs.getString("n_contents"));
              
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
	
	
	public int noticeInsert(Notice n) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("INSERT INTO NOTICE(NOTICE_ID,N_TITLE,N_CONTENTS,N_DATE) VALUES "
							+ "(NOTICE_SEQ.NextVAL,?,?,SYSDATE)");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_contents());
			result = pstmt.executeUpdate();
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
	
	
	public int modify(Notice n,String Notice_id) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
		
			String sql = "UPDATE Notice SET N_TITLE=?,N_CONTENTS=?,N_DATE=SYSDATE WHERE NOTICE_ID=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,n.getN_title());
			pstmt.setString(2,n.getN_contents());
			pstmt.setString(3,Notice_id);
			
			result = pstmt.executeUpdate();

		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			DBConn.close();
		}

		return result;
	}
	
	
	
	
	
	
	
	
}
