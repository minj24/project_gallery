package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AuctionDAO {

	public ArrayList<Auction> auctionList() {
		ArrayList<Auction> result = new ArrayList<Auction>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT TO_CHAR(auction_start, 'YYYY-MM-DD HH24:MI') AS auction_start, TO_CHAR(auction_end, 'YYYY-MM-DD HH24:MI') AS auction_end, first_price, art_picture,name,art_name,art_id FROM AUCTIONVIEW where WITAK_AGREE=1");
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Auction a = new Auction();
				a.setAuction_start(rs.getString("auction_start"));
				a.setAuction_end(rs.getString("auction_end"));
				a.setFirst_price(rs.getString("first_price"));
				a.setArt_picture(rs.getString("art_picture"));
				a.setName(rs.getString("name"));
				a.setArt_name(rs.getString("art_name"));
				a.setArt_id(rs.getString("art_id"));
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
	
	public ArrayList<Auction> auctionList(String searchKey, String searchValue) {
		ArrayList<Auction> result = new ArrayList<Auction>();

		Connection conn = null;
		PreparedStatement pstat = null;

		try {
			conn = DBConn.getConnection();

			String sql = "SELECT auction_start, auction_end, first_price, art_picture,name,art_name,art_id FROM AUCTIONVIEW";
			switch (searchKey) {
			case "0":
				sql += " WHERE name = ?";
				break;
			case "1":
				sql += " WHERE ART_NAME =?";
				break;
			}
		
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, searchValue);
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				Auction a = new Auction();
				a.setAuction_start(rs.getString("auction_start"));
				a.setAuction_end(rs.getString("auction_end"));
				a.setFirst_price(rs.getString("first_price"));
				a.setArt_picture(rs.getString("art_picture"));
				a.setName(rs.getString("name"));
				a.setArt_name(rs.getString("art_name"));
				a.setArt_id(rs.getString("art_id"));
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
	
	//경매 추가
	  public int auctionAdd(Bid_witak_enroll bwe){
			int result = 0;
	         
	         Connection conn = null;
	         PreparedStatement pstmt =null;
	         try{
	            conn = DBConn.getConnection();
	            String sql = "INSERT INTO AUCTION(ART_ID,AUCTION_START,AUCTION_END,FIRST_PRICE) VALUES (?,SYSDATE,SYSDATE+5,?)";
	            pstmt = conn.prepareStatement(sql);
	            System.out.println(bwe.getHope_price());
	            pstmt.setString(1, bwe.getArt_id());
	            
	            //초기가 지정 필요
	            pstmt.setInt(2, (int)(bwe.getHope_price()*0.7));
	            System.out.println(bwe.getHope_price());
	            result = pstmt.executeUpdate();
	            
	            
	         }catch(Exception e){
	            e.printStackTrace();
	         }finally{
	            try{
	               if(pstmt!=null){
	                  pstmt.close();
	               }
	            }catch(Exception e){
	               e.printStackTrace();
	            }
	         }
	         DBConn.close();
	         return result;
	      }
	
	//상세보기
	public ArrayList<Auction> list(String art_id) {
		ArrayList<Auction> result = new ArrayList<Auction>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConn.getConnection();
			String sql = String
					.format("SELECT auction_start, auction_end, first_price, art_picture,name,art_name,art_id FROM AUCTIONVIEW WHERE ART_ID =?");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, art_id);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
				
				Auction a = new Auction();
				
				a.setAuction_start(rs.getString("auction_start"));
				a.setAuction_end(rs.getString("auction_end"));
				a.setFirst_price(rs.getString("first_price"));
				a.setArt_picture(rs.getString("art_picture"));
				a.setName(rs.getString("name"));
				a.setArt_name(rs.getString("art_name"));
				a.setArt_id(rs.getString("art_id"));
				
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
	//최고가격
		public int max_price(String art_id){
			int result = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = DBConn.getConnection();
				String sql = String
						.format("SELECT max(bid_price) as max from bid where art_id=?");

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, art_id);
				ResultSet rs = pstmt.executeQuery();

				while(rs.next()){

					result=rs.getInt("max");

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
	
	   public ArrayList<Nakchar> nckcharList(String email) {
		      ArrayList<Nakchar> result = new ArrayList<Nakchar>();

		      Connection conn = null;
		      PreparedStatement pstmt = null;

		      try {
		         conn = DBConn.getConnection();
		         
		         String sql =String.format("SELECT ROWNUM, acv.ART_NAME AS ART_NAME,acv.NAME AS NAME,TO_CHAR(acv.AUCTION_END,'YYYY-MM-DD HH24:MI:SS') AS AUCTION_END,nak.NAKCHAR_PRICE AS NAKCHAR_PRICE FROM AUCTIONVIEW acv, NAKCHAR nak WHERE acv.ART_ID=nak.ART_ID AND nak.EMAIL=?");
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setString(1, email);
		         

		         ResultSet rs = pstmt.executeQuery();

		         while(rs.next()){
		            
		            Nakchar n = new Nakchar();
		         
		            n.setRownum(rs.getString("rownum"));
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
		   

	   //응찰 pop
	   public int add(Bid b){
			int result = 0;
	         
	         Connection conn = null;
	         PreparedStatement pstmt =null;
	         try{
	            conn = DBConn.getConnection();
	            String sql = "INSERT INTO BID(BID_ID,EMAIL,BID_PRICE,BID_DATE,ART_ID) VALUES (BID_SEQ.NEXTVAL,?,?,TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'),?)";
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, b.getEmail());
	            pstmt.setString(2, b.getBid_price());
	            pstmt.setString(3, b.getArt_id());
	            
	            result = pstmt.executeUpdate();
	            
	            
	         }catch(Exception e){
	            e.printStackTrace();
	         }finally{
	            try{
	               if(pstmt!=null){
	                  pstmt.close();
	               }
	            }catch(Exception e){
	               e.printStackTrace();
	            }
	         }
	         DBConn.close();
	         return result;
	      }
	   
	   
	   //낙찰 추가
	   public int nakcherAdd(String art_id){
			int result = 0;
	        AdminDAO dao = new AdminDAO();
	        AuctionDAO adao = new AuctionDAO();
			Bid b = dao.bidDetailList(art_id);
			int max_price = adao.max_price(art_id);
			
	         Connection conn = null;
	         PreparedStatement pstmt =null;
	         try{
	            conn = DBConn.getConnection();
	            String sql = "INSERT INTO NAKCHAR(ART_ID,BID_ID,EMAIL,NAKCHAR_PRICE) VALUES (?,?,?,?)";
	            pstmt = conn.prepareStatement(sql);
	            //ART_ID,BID_ID,EMAIL,NAKCHAR_PRICE
	            pstmt.setString(1, b.getArt_id());
	            pstmt.setString(2, b.getBid_id());
	            pstmt.setString(3, b.getEmail());
	            pstmt.setInt(4, max_price);
	            result = pstmt.executeUpdate();
	            
	            
	         }catch(Exception e){
	            e.printStackTrace();
	         }finally{
	            try{
	               if(pstmt!=null){
	                  pstmt.close();
	               }
	            }catch(Exception e){
	               e.printStackTrace();
	            }
	         }
	         DBConn.close();
	         return result;
	      }
}



