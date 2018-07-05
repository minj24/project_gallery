package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GalleryDAO {
   
   //로그인 액션
   public int login(String email, String pw) {
      int result = 0;

      Connection conn = null;
      PreparedStatement pstmt = null;

      try {
         conn = DBConn.getConnection();
         String sql = String
               .format("SELECT COUNT(*) AS count FROM MEMBER WHERE EMAIL = ? AND pw=encrypt(?,?)");
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, email);
         pstmt.setString(2, pw);
         pstmt.setString(3, email);
         ResultSet rs = pstmt.executeQuery();
         while (rs.next()) {
            result = rs.getInt("count");
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
                  .format("SELECT ART_ID,NAME,ART_NAME,ART_PICTURE,art_member_picture FROM AUCTIONVIEW ORDER BY ART_ID");
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               Gallery g = new Gallery();
               g.setArt_id(rs.getString("art_id"));
               g.setName(rs.getString("name"));
               g.setArt_name(rs.getString("art_name"));
               g.setArt_picture(rs.getString("art_picture"));
               g.setArt_member_picture(rs.getString("art_member_picture"));
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
      public ArrayList<Gallery> galleryList(String searchKey, String searchValue) {
         ArrayList<Gallery> result = new ArrayList<Gallery>();

         Connection conn = null;
         PreparedStatement pstat = null;

         try {
            conn = DBConn.getConnection();

            String sql = "SELECT ART_ID,NAME,ART_NAME,ART_PICTURE FROM AUCTIONVIEW";
            switch (searchKey) {
            case "0":
               sql += " WHERE NAME=?";
               break;
            case "1":
               sql += " WHERE ART_NAME=?";
               break;
            }
         
            sql += " ORDER BY ART_ID";
            

            pstat = conn.prepareStatement(sql);
            pstat.setString(1, searchValue);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
               Gallery g = new Gallery();
               g.setArt_id(rs.getString("art_id"));
               g.setName(rs.getString("name"));
               g.setArt_name(rs.getString("art_name"));
               g.setArt_picture(rs.getString("art_picture"));
               result.add(g);
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

      public ArrayList<Gallery> galleryList(String art_id) {
         ArrayList<Gallery> result = new ArrayList<Gallery>();

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT ART_ID,NAME,ART_NAME,ART_PICTURE FROM AUCTIONVIEW WHERE art_id=? ORDER BY ART_ID");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,art_id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               Gallery g = new Gallery();
               g.setArt_id(rs.getString("art_id"));
               g.setName(rs.getString("name"));
               g.setArt_name(rs.getString("art_name"));
               g.setArt_picture(rs.getString("art_picture"));
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
      
      public ArrayList<Notice> noticeList() {
         ArrayList<Notice> result = new ArrayList<Notice>();

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT NOTICE_ID, N_TITLE ,  DECODE(TO_CHAR(N_DATE,'YYYY-MM-DD'),TO_CHAR(SYSDATE,'YYYY-MM-DD'),TO_CHAR(N_DATE,'YYYY-MM-DD HH24:MI:SS'),TO_CHAR(N_DATE,'YYYY-MM-DD')) AS N_DATE FROM NOTICE");
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
      //
      public String name(String email) {
         String result = "";

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT NAME FROM MEMBER WHERE EMAIL =?");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               result = rs.getString("NAME");
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
      
      public ArrayList<Art> ArtList(String email) {
         ArrayList<Art> result = new ArrayList<Art>();

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT ART_NAME FROM ART_SINCHUNG WHERE  EMAIL = ? AND WITAK_AGREE = 0 AND  GALLARY_AGREE = 1");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               Art a = new Art();
               a.setArt_name(rs.getString("ART_NAME"));
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
      
      
      public int add(Bid_witak_enroll b) {
         int result = 0;

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("INSERT INTO BID_WITAK_ENROLL(ART_ID,WITAK_DATE,HOPE_PRICE)VALUES((SELECT ART_ID FROM ART_SINCHUNG WHERE ART_NAME = ?) ,TO_DATE(SYSDATE,'YYYY-MM-DD'),?)");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, b.getArt_name());
            pstmt.setInt(2, b.getHope_price());
            result = pstmt.executeUpdate();
         } catch (Exception ex) {
            ex.printStackTrace();
         } finally {
            try {
               if (pstmt != null) {
                  pstmt.close();
               }
            } catch (Exception ex) {
            }
            DBConn.close();
         }
         return result;
      }
      
      public int modify(Bid_witak_enroll b) {
         int result = 0;

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
         
            String sql = "UPDATE ART_SINCHUNG SET WITAK_AGREE = 1 WHERE art_name = ?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,b.getArt_name());
            
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
      
      public int memberadd(Member m){
            int result = 0;
            
               Connection conn = null;
               PreparedStatement pstmt = null;

               try{
                  conn = DBConn.getConnection();
                  String sql = String.format("INSERT INTO Member (EMAIL,NAME,PW,SSN,PHONE,BIRTHDAY,GRADE,MEMBER_INTRO) VALUES (?,?,ENCRYPT(?,?),ENCRYPT(?,?),?,TO_DATE(?),2,?)");      

                        
                  pstmt = conn.prepareStatement(sql);

                  pstmt.setString(1, m.getEmail());
                  pstmt.setString(2, m.getName());
                  pstmt.setString(3, m.getPw());
                  pstmt.setString(4, m.getEmail());
                  pstmt.setString(5, m.getSsn());
                  pstmt.setString(6, m.getEmail());
                  pstmt.setString(7, m.getPhone());
                  pstmt.setString(8, m.getBirthday()); 
                  pstmt.setString(9, m.getMember_intro());
                  result = pstmt.executeUpdate();



               }catch(Exception ex){
                  ex.printStackTrace();
               }finally{
                  try{
                     if(pstmt != null){
                        pstmt.close();
                     }
                  }catch(Exception ex){

                  }
                  DBConn.close();
               }
              
            return result;
         }
      //회원 수정
      public int sujang(Member m) {
         int result = 0;

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = "UPDATE MEMBER SET PW=ENCRYPT(?,?),PHONE = ?,MEMBER_INTRO=? WHERE EMAIL=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,m.getPw());
            pstmt.setString(2, m.getEmail());
            pstmt.setString(3, m.getPhone());
            pstmt.setString(4, m.getMember_intro());
            pstmt.setString(5, m.getEmail());
         
            
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
      
      public String phone(String email) {
         String result = "";

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT PHONE FROM MEMBER WHERE EMAIL =?");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               result = rs.getString("PHONE");
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
      
      public String BIRTHDAY(String email) {
         String result = "";

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT TO_CHAR(BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY FROM MEMBER WHERE EMAIL =?");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               result = rs.getString("BIRTHDAY");
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
      
      public ArrayList<BidList> bidlist(String email) {
         ArrayList<BidList> result = new ArrayList<BidList>();

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT rownum, acv.ART_NAME as art_name"
                        + ",acv.NAME as name,b.BID_DATE as BID_DATE,"
                        + "b.BID_PRICE AS BID_PRICE ,"
                        + "(SELECT CASE WHEN TO_CHAR(AUCTION_END,'YYYY-MM-DD HH24:MI:SS') <= TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') THEN '0' WHEN TO_CHAR(AUCTION_END,'YYYY-MM-DD HH24:MI:SS') >= TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') THEN '1' WHEN TO_CHAR(AUCTION_START,'YYYY-MM-DD HH24:MI:SS') <= TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') THEN '2' END FROM AUCTIONVIEW acv WHERE acv.ART_ID=b.ART_ID) AS bidbid"
                        + " FROM AUCTIONVIEW acv,bid b WHERE acv.ART_ID=b.ART_ID AND b.EMAIL=?");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               BidList b = new BidList();
               b.setRownum(rs.getString("rownum"));
               b.setArt_name(rs.getString("art_name"));
               b.setName(rs.getString("name"));
               b.setBid_date(rs.getString("bid_date"));
               b.setBid_price(rs.getString("bid_price"));
               b.setBidbid(rs.getInt("bidbid"));
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
      
      //응찰 내역
      public ArrayList<BidList> bidinsert(String email) {
         ArrayList<BidList> result = new ArrayList<BidList>();

         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            conn = DBConn.getConnection();
            String sql = String
                  .format("SELECT ROWNUM,ART_NAME,GALLERY_DATE,GALLERY_AGREE FROM ART_SINCHUNG WHERE EMAIL =?");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
               BidList b = new BidList();
               b.setRownum(rs.getString("rownum"));
               b.setArt_name(rs.getString("art_name"));
               b.setGallery_date(rs.getString("gallery_date"));
               b.setGallery_agree(rs.getInt("gallery_agree"));
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
      
   public int galleryAdd(Gallery g){
      int result = 0;
      
      Connection conn = null;
      PreparedStatement pstmt = null;

      try {
         conn = DBConn.getConnection();
         String sql = "INSERT INTO ART_SINCHUNG(ART_ID,ART_NAME,GALLERY_DATE,EMAIL,ART_PICTURE ,ART_MEMBER_PICTURE,GALLERY_AGREE,witak_agree) VALUES (art_seq.nextVAL,?,TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'),?,?,?,'2','2')";
         //ART_ID,ART_NAME,GALLERY_DATE,EMAIL,ART_PICTURE,
         //ART_MEMBER_PICTURE,GALLERY_AGREE,witak_agree
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1,g.getArt_name());
         pstmt.setString(2,g.getEmail());
         pstmt.setString(3,g.getArt_picture());
         pstmt.setString(4,g.getArt_member_picture());
         
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
   public String member_intro(String email) {
      String result = "";

      Connection conn = null;
      PreparedStatement pstmt = null;

      try {
         conn = DBConn.getConnection();
         String sql = String
               .format("SELECT MEMBER_INTRO FROM MEMBER WHERE EMAIL =?");
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, email);
         ResultSet rs = pstmt.executeQuery();
         while (rs.next()) {
            result = rs.getString("member_intro");
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