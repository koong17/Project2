package hotel.tikki.reserve.model;

import java.io.PrintWriter;
import java.sql.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
   
   
 //getListAllCount() : list.jsp 페이지에서 사용할 레코드 갯수 얻어오는 메소드
 	public int getListAllCount(String nickname) {
 		Connection conn = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		int count = 0;
 		
 		try {
 			conn = getConnection();
 			
 			//현재 board 테이블의 레코드 수 구하기
 			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM RESERVATION WHERE RSRV_NICK=?" );
 			pstmt.setString(1, nickname);
 			rs = pstmt.executeQuery();
 			
 			if( rs.next() ) count = rs.getInt(1);
 			
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
 		}	
 		return count;
 	} // getListAllCount() end
 
 	//getSelectAll(startRow, endRow) : list.jsp 에서 사용할 전체 레코드 출력 메소드
 		public List<ReserveVO> getSelectAll( String nick ) {
 			Connection conn = null;
 			PreparedStatement pstmt = null;
 			ResultSet rs = null;
 			PreparedStatement pstmt2 = null;
 			ResultSet rs2 = null;
 			List  list = null;
 			
 			try {
 				conn = getConnection();
 				String  sql = "select rsrv_num, room_num, check_in, check_out, rsrv_ppl, rsrv_status from reservation where rsrv_nick = ? order by check_in";
 				
 				pstmt = conn.prepareStatement(sql);
 				pstmt.setString(1, nick);
 				rs = pstmt.executeQuery();
 				
 				if( rs.next() ) {
 					list = new ArrayList();
 					int room_num = 0, price = 0;
 					String check_in, check_out, room_type="";
 					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					DecimalFormat df = new DecimalFormat("#,##0");
					
 					do {
 						ReserveVO vo = new ReserveVO();
 						room_num = rs.getInt(2);
 						check_in = rs.getString(3);
 						check_out = rs.getString(4);
 						vo.setRsrv_num(rs.getInt(1));
 						vo.setRoom_num(room_num);
 						vo.setCheck_in(check_in.substring(0, 10));
 						vo.setCheck_out(check_out.substring(0, 10));
 						vo.setRsrv_ppl(rs.getInt(5));
 						vo.setRsrv_status(rs.getString(6));
 						
 						switch (room_num) {
 							case 1: price = 200000; room_type="Deluxe"; break;
 							case 2: price = 300000; room_type="Grand Deluxe"; break;
 							case 3: price = 500000; room_type="Suite"; break;
						}
 						
 						int checkDate = (int)((sdf.parse(check_out).getTime()-sdf.parse(check_in).getTime())/(24*60*60*1000));
 						
 						vo.setCheck_date(Integer.toString(checkDate));
 						vo.setPrice(df.format(price * checkDate));
 						vo.setRoom_type(room_type);
					list.add(vo);
					
 					} while( rs.next() ) ;	
 				} // if end
 				
 			} catch (Exception e) {
 				e.printStackTrace();
 			} finally {
 				CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
 			}				
 			return list;
 		} // getSelectAll(startRow, endRow) end
 		
   public ArrayList<Integer> select(String checkIn, String checkOut, int peopleNum) { //고객이 검색한 정보에 상응하는 방 정보를 불러오는 기능
      Connection conn = null ;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      ArrayList<Integer> roomList = new ArrayList<Integer>();
      
      String sql = 	"SELECT R.ROOM_NUM FROM ROOMS R WHERE R.MAX_PPL>=? AND R.ROOM_NUM NOT IN" + 
      				" (SELECT B.ROOM_NUM FROM RESERVATION B WHERE NOT" + 
      				" (B.CHECK_IN>TO_DATE(?, 'YYYY-MM-DD') OR B.CHECK_OUT-1<TO_DATE(?, 'YYYY-MM-DD')))" + 
      				" ORDER BY R.ROOM_NUM";
      
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, peopleNum);
         pstmt.setString(2, checkOut);
         pstmt.setString(3, checkIn);
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

   public int insert(ReserveVO vo) { //고객이 원하는 예약 정보를 예약 DB에 저장
      Connection conn = null ;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
	  
      int rsrv_num = 0;		
	
		try {
			conn = getConnection();
			//현재 board 테이블에 레코드 유무 판단과 글 번호 지정
			pstmt = conn.prepareStatement("SELECT MAX(RSRV_NUM) FROM RESERVATION");
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				rsrv_num = rs.getInt(1) + 1;     // 1 : num , 다음 글 번호는 가장 큰 번호 + 1 
			} else {
				rsrv_num = 1;
			} // if end
		
			System.out.println("number : "+ rsrv_num);
			
			String sql = "insert into reservation values(?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?, ?, 'n')";   
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRoom_num());
			pstmt.setInt(2, rsrv_num);
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
		return rsrv_num;
   } //insert() end
   public void delete(int rsrv_num) { //고객이 원하는 예약 정보를 예약 DB에 저장
	      Connection conn = null ;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;	
		
			try {
				String sql = "DELETE FROM RESERVATION WHERE RSRV_NUM = ?";   
				
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rsrv_num);
			 
				pstmt.executeUpdate();
			 
			  } catch (Exception e) {
			     e.printStackTrace();
			  } finally {
			     CloseUtil.close(rs);         CloseUtil.close(pstmt);         CloseUtil.close(conn);
			  }
	   } //delete() end
   
   
}