package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AuctionPopDAO {
   public Auction AuctionList(String ART_ID) {
     Auction result = new Auction();

      Connection conn = null;
      PreparedStatement pstmt = null;

      try {
         conn = DBConn.getConnection();
         String sql = String
               .format("SELECT m.name AS name, price FROM bid b, "
                     + "member m, (select max(bid_price) as price from bid bb where bb.ART_ID=?) "
                     + "where b.EMAIL = m.EMAIL and b.BID_PRICE = price");
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, ART_ID);
         ResultSet rs = pstmt.executeQuery();
         while (rs.next()) {
            
            result.setPrice(rs.getString("price"));
            result.setName(rs.getString("name"));
            
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