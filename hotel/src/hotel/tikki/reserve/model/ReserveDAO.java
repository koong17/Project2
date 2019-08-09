package hotel.tikki.reserve.model;

import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class ReserveDAO {
   private static ReserveDAO instance = new ReserveDAO();   
   
   public static ReserveDAO getInstance(){
      return instance;
   }// getInstance()
   
   // ������
   public ReserveDAO(){}  
      
   // DB����
   public Connection getConnection() throws Exception{
      Context ctx = new InitialContext();
      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:HotelDB");   
      DriverManager.setLogWriter(new PrintWriter(System.out));
      
      return ds.getConnection();
   }// getConnection();
   
   
   
   public ArrayList<Integer> select(String checkIn, String checkOut) { //고객이 검색한 정보에 상응하는 방 정보를 불러오는 기능
      Connection conn = null ;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      ArrayList<Integer> roomList = new ArrayList<Integer>();
      
      String sql = "SELECT R.ROOM_NUM FROM ROOMS R WHERE r.room_num NOT IN" + 
      		" (SELECT B.ROOM_NUM FROM RESERVATION B WHERE NOT" + 
      		" (B.CHECK_IN>TO_DATE(?, 'YYYY-MM-DD') OR B.CHECK_OUT-1<TO_DATE(?, 'YYYY-MM-DD')))" + 
      		" ORDER BY R.ROOM_num" ;
      
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, checkOut);
         pstmt.setString(2, checkIn);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
        	 roomList.add(rs.getInt(1));
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseUtil.close(rs);         CloseUtil.close(pstmt);         CloseUtil.close(conn);
      }
      return roomList;
   } //select() end
   
   public int search(ReserveVO vo) { //고객이 선택한 방에 대한 정보를 가져오는 구문
      Connection conn = null ;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select * from rooms where room_num=1" ;
      
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, vo.getRoom_num());
         pstmt.setInt(2, vo.getRsrv_num());
         pstmt.setString(3, vo.getCheck_in());
         pstmt.setString(4, vo.getCheck_out());
         pstmt.setInt(5, vo.getRsrv_ppl());
         pstmt.setString(6, vo.getRsrv_nick());
         pstmt.setString(7, vo.getRsrv_status());
         
         pstmt.executeUpdate();
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseUtil.close(rs);         CloseUtil.close(pstmt);         CloseUtil.close(conn);
      }
      return 0;
   } //search() end

   public void insert(ReserveVO vo) { //고객이 원하는 예약 정보를 예약 DB에 저장
      Connection conn = null ;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
	  
      int number = 0;		
	
		try {
			conn = getConnection();
			//현재 board 테이블에 레코드 유무 판단과 글 번호 지정
			pstmt = conn.prepareStatement("SELECT MAX(RSRV_NUM) FROM RESERVATION");
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				number = rs.getInt(1) + 1;     // 1 : num , 다음 글 번호는 가장 큰 번호 + 1 
			} else {
				number = 1;
			} // if end
		
			System.out.println("number : "+ number);
			
			String sql = "insert into reservation values(?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?, ?, 'n')";   
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRoom_num());
			pstmt.setInt(2, number);
			pstmt.setString(3, vo.getCheck_in());
			pstmt.setString(4, vo.getCheck_out());
			pstmt.setInt(5, vo.getRsrv_ppl());
			pstmt.setString(6, vo.getRsrv_nick());
		 
			pstmt.executeUpdate();
		 
		  } catch (Exception e) {
		     e.printStackTrace();
		  } finally {
		     CloseUtil.close(rs);         CloseUtil.close(pstmt);         CloseUtil.close(conn);
		  }
   } //insert() end

}