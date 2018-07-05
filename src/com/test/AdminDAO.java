package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDAO {

	public ArrayList<Member> memberList() {
		ArrayList<Member> result = new ArrayList<Member>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT name, email, phone ,grade from MEMBER");
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				Member m = new Member();
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setGrade(String.valueOf(rs.getInt("grade")));	

				result.add(m);
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


	public ArrayList<Gallery> galleryList() {
		ArrayList<Gallery> result = new ArrayList<Gallery>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT name, ART_NAME, GALLERY_DATE, GALLERY_AGREE, art_id from ADMIN_GALLERYLIST_VIEW");
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {				
				Gallery g = new Gallery();		
				
				g.setName(rs.getString("name"));
				g.setArt_name(rs.getString("art_name"));
				g.setGallery_date(rs.getString("gallery_date"));
				g.setGallery_agree(rs.getString("gallery_agree"));
				g.setArt_id(rs.getString("art_id"));
				
			
				result.add(g);				
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



	public ArrayList<Bid_witak_enroll> witakList() {
		ArrayList<Bid_witak_enroll> result = new ArrayList<Bid_witak_enroll>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT name, ART_NAME, WITAK_DATE, WITAK_AGREE,hope_price, art_id  FROM ADMIN_WITAK_VIEW");
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {				

				Bid_witak_enroll bwe = new Bid_witak_enroll();

				bwe.setName(rs.getString("name"));
				bwe.setArt_name(rs.getString("art_name"));
				bwe.setWitak_date(rs.getString("witak_date"));
				bwe.setWitak_agree(rs.getString("witak_agree"));
				bwe.setHope_price(rs.getInt("hope_price"));
				bwe.setArt_id(rs.getString("art_id"));
				result.add(bwe);	

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



	public ArrayList<Bid> bidList() {
		ArrayList<Bid> result = new ArrayList<Bid>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT name, ART_NAME,art_id FROM ADMIN_BID_VIEW");
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {				

				Bid b = new Bid();

				b.setName(rs.getString("name"));
				b.setArt_name(rs.getString("art_name"));
				b.setArt_id(rs.getString("art_id"));
				result.add(b);	

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
	////////////

	public Bid bidDetailList(String art_id ) {

		Bid result = new Bid();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT to_date(BID_DATE,'YYYY-MM-DD') as bid_date, BID_PRICE,bid_id NAME from ADMIN_BIDDETAIL_VIEW where ART_ID = ? ORDER BY BID_PRICE DESC");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, art_id);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
				

				result.setBid_date(rs.getString("bid_date"));
				result.setBid_price(rs.getString("bid_price"));
				result.setName(rs.getString("name"));
				result.setBid_id(rs.getString("bid_id"));
				
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

	
	public ArrayList<Nakchar> nakcharList() {
		ArrayList<Nakchar> result = new ArrayList<Nakchar>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT ART_NAME, NAME, AUCTION_END, NAKCHAR_PRICE from ADMIN_NAKCHAR_VIEW ORDER BY AUCTION_END DESC");
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {				


				Nakchar n = new Nakchar();
				n.setArt_name(rs.getString("art_name"));
				n.setName(rs.getString("name"));
				n.setAuction_end(rs.getString("auction_end"));
				n.setNakchar_price(rs.getString("nakchar_price"));

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
	//////
	//email기준 회원 한명 정보 출력(바인딩 출력)
	public Member mList(String email) {
		Member result = null;
	

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT name, phone ,grade, email from MEMBER where email =?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {

				result = new Member();
				
				result.setName(rs.getString("name"));
				result.setPhone(rs.getString("phone"));
				result.setGrade(String.valueOf(rs.getInt("grade")) );	
				result.setEmail(rs.getString("email"));

				return result;
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
	
	
	
	//art_id기준 회원 한명 갤러리 신청 정보 출력(바인딩 출력)
	public Gallery gList(String art_id) {
		
		Gallery result = null;	

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT name, art_name, gallery_date, gallery_agree from ADMIN_GALLERYLIST_VIEW where art_id =?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,art_id);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {

				result = new Gallery();
				
				result.setName(rs.getString("name"));
				result.setArt_name(rs.getString("art_name"));
				result.setGallery_date(rs.getString("gallery_date"));
				result.setGallery_agree(rs.getString("gallery_agree"));				

				return result;
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
	
	
	//관리자- 회원 수정
	public int membermodify(Member m) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
		
			String sql = "UPDATE MEMBER SET GRADE = ? WHERE EMAIL=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,m.getGrade());
			pstmt.setString(2, m.getEmail());
			
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
	
	//관리자- 갤러리수락여부 수정
		public int galleryAgreeModify(Gallery g){
			
			int result =0;

			Connection conn = null;
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			try {
				conn = DBConn.getConnection();			
				String sql = "UPDATE art_sinchung SET gallery_agree = ? WHERE art_id=?";
				pstmt1 = conn.prepareStatement(sql);
				pstmt1.setString(1,g.getGallery_agree());				
				pstmt1.setInt(2, Integer.parseInt(g.getArt_id()));
				result = pstmt1.executeUpdate();
				if(g.getGallery_agree().equals("1")){
					String sql2 = "Insert into art (art_id) values(?)";
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, g.getArt_id());
					result = pstmt2.executeUpdate();
				}
				

			} catch (Exception e1) {
				e1.printStackTrace();
			} finally {
				try {
					if (pstmt1 != null) {
						pstmt1.close();
					}
					if (pstmt2 != null) {
						pstmt2.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				DBConn.close();
			}

			return result;
		}
		
		//art_id기준 회원 한명 경매위탁 출력(바인딩 출력)
		public Bid_witak_enroll wList(String art_id) {
			
			Bid_witak_enroll result = null;	

			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = DBConn.getConnection();
				String sql = String
						.format("SELECT name, art_name, WITAK_DATE, WITAK_AGREE,HOPE_PRICE from admin_witak_view where art_id =?");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,art_id);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {

					result = new Bid_witak_enroll();
					
					result.setName(rs.getString("name"));
					result.setArt_name(rs.getString("art_name"));
					result.setWitak_date(rs.getString("witak_date"));
					result.setWitak_agree(rs.getString("witak_agree"));
					result.setHope_price(rs.getInt("hope_price"));
					return result;
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
		
		//관리자- 위탁수락여부 수정 1-수락
				public int witakAgreeModify(Bid_witak_enroll bwe){
					
					int result =0;

					Connection conn = null;
					PreparedStatement pstmt = null;

					try {
						conn = DBConn.getConnection();			
						String sql = "UPDATE art_sinchung SET witak_agree = ? WHERE art_id=?";
						pstmt = conn.prepareStatement(sql);

						pstmt.setString(1,bwe.getWitak_agree());											
						pstmt.setInt(2, Integer.parseInt(bwe.getArt_id()));
						result = pstmt.executeUpdate();
						
						if(bwe.getWitak_agree().equals("1")){
							AuctionDAO dao = new AuctionDAO();
							dao.auctionAdd(bwe);
						}

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
